<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library('session');
    }

    public function index() {
        // Jika sudah ada session, langsung ke dashboard
        if ($this->session->userdata('admin_id')) {
            if ($this->session->userdata('role') === 'super_admin') {
                redirect('superadmin/dashboard');
            } else {
                redirect('admin/dashboard');
            }
        }
        $this->load->view('auth/login');
    }

    public function login_process() {
    $username = $this->input->post('username');
    $password = $this->input->post('password');

    $user = $this->db->get_where('tbl_user', ['USERNAME' => $username])->row();

    if ($user) {
        if (password_verify($password, $user->PASSWORD) || $password == $user->PASSWORD) {
            
            $session_data = [
                'admin_id' => $user->ID,
                'username' => $user->USERNAME,
                'nama'     => $user->NAMA,
                'role'     => $user->ROLE,
                'foto'     => $user->GAMBAR
            ];
            $this->session->set_userdata($session_data);

            // --- PERBAIKAN: CATAT LOG DAHULU SEBELUM REDIRECT ---
            // Gunakan helper yang sudah kita buat
            $role_name = ($user->ROLE === 'super_admin') ? 'Super Admin' : 'Admin';
            log_activity('LOGIN', "User login sebagai $role_name");

            // --- BARU LAKUKAN REDIRECT ---
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
    // Catat log sebelum session dihancurkan
    log_activity('LOGOUT', 'User keluar dari sistem');
    
    $this->session->sess_destroy();
    redirect('auth');
}
}