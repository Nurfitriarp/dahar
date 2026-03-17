<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        // Load helper captcha di sini
        $this->load->helper('captcha');
    }

    public function index() {
        error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_STRICT);
        if ($this->session->userdata('admin_id')) {
            if ($this->session->userdata('role') === 'super_admin') {
                redirect('superadmin/dashboard');
            } else {
                redirect('admin/dashboard');
            }
        }

        // --- KONFIGURASI CAPTCHA BARU ---
                $config = array(
            'img_path'      => './captcha/',
            'img_url'       => base_url('captcha/'),
            'img_width'     => 150,  // Pastikan angka bulat, tanpa tanda kutip
            'img_height'    => 40,   // Pastikan angka bulat, tanpa tanda kutip
            'expiration'    => 7200,
            'word_length'   => 4,
            'font_size'     => 16,   // Coba turunkan atau naikkan sedikit jika masih error
            'pool'          => '0123456789',
            'colors'        => array(
                'background' => array(255, 255, 255),
                'border'     => array(255, 255, 255),
                'text'       => array(0, 0, 0),
                'grid'       => array(230, 230, 230)
            )
        );

        $cap = create_captcha($config);
        $this->session->set_userdata('captcha_word', $cap['word']);
        $data['captcha_img'] = $cap['image'];

        $this->load->view('auth/login', $data);
    }

    public function login_process() {
        // 1. Ambil input captcha dan session captcha
        $input_captcha = $this->input->post('captcha_code');
        $sess_captcha  = $this->session->userdata('captcha_word');

        // 2. Cek apakah captcha benar
        if ($input_captcha !== $sess_captcha) {
            $this->session->set_flashdata('error', 'Kode Captcha salah!');
            redirect('auth');
            return; // Berhenti di sini jika salah
        }

        $username = $this->input->post('username');
        $password = $this->input->post('password');

        $user = $this->db->get_where('tbl_user', ['USERNAME' => $username])->row();

        if ($user) {
            // Password verify (mendukung hash atau plain text sesuai kode Anda sebelumnya)
            if (password_verify($password, $user->PASSWORD) || $password == $user->PASSWORD) {
                
                // Hapus session captcha jika berhasil login
                $this->session->unset_userdata('captcha_word');

                $session_data = [
                    'admin_id' => $user->ID,
                    'username' => $user->USERNAME,
                    'nama'     => $user->NAMA,
                    'role'     => $user->ROLE,
                    'foto'     => $user->GAMBAR
                ];
                $this->session->set_userdata($session_data);

                $role_name = ($user->ROLE === 'super_admin') ? 'Super Admin' : 'Admin';
                log_activity('LOGIN', "User login sebagai $role_name");

                if ($user->ROLE === 'super_admin') {
                    redirect('superadmin/dashboard');
                } else {
                    redirect('admin/dashboard');
                }

            } else {
                $this->session->set_flashdata('error', 'Password salah.');
                redirect('auth');
            }
        } else {
            $this->session->set_flashdata('error', 'Username tidak terdaftar.');
            redirect('auth');
        }
    }

    public function logout() {
        log_activity('LOGOUT', 'User keluar dari sistem');
        $this->session->sess_destroy();
        redirect('auth');
    }
}