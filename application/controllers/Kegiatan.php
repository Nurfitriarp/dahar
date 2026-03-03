<?php
class Kegiatan extends CI_Controller {
    public function __construct() {
        parent::__construct();
        // Load model agar bisa digunakan
        $this->load->model('M_Kegiatan');
    }

    public function index() {
        // Ambil data dari model
        $data['kegiatan'] = $this->M_Kegiatan->get_all_kegiatan();
        
        // Kirim data ke view (misal nama filenya rekap_view.php)
        $this->load->view('dashboard', $data);
    }
}