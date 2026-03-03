<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @property M_admin $M_admin
 */
class Admin extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        // Gunakan alias jika Anda ingin memanggil dengan huruf kapital 'M_admin'
        $this->load->model('M_admin', 'M_admin');
    }

    public function dashboard()
    {
        // Pastikan nama model di sini sama dengan alias di atas
        // ambil data kegiatan dari model
        $data['kegiatan'] = $this->M_admin->get_data();
        
        $this->load->view('admin/header');
        $this->load->view('admin/sidebar');
        $this->load->view('admin/dashboard', $data);
        $this->load->view('admin/footer');
    }
    
    public function detail($id)
    {
        $data['detail'] = $this->M_admin->get_detail($id);
        $data['peserta'] = $this->M_admin->get_peserta($id);
        
        $this->load->view('admin/header');
        $this->load->view('admin/sidebar');
        $this->load->view('admin/rekap_detail', $data);
        $this->load->view('admin/footer');
    }
}