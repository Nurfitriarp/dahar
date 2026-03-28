<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Presensi extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
        date_default_timezone_set('Asia/Jakarta');
    }

    public function isi($token, $identifier = '') {
        $kegiatan = $this->db->get_where('tbl_kegiatan', ['qr_token' => $token])->row();
        if (!$kegiatan) {
            show_error("Link Presensi Tidak Valid atau Telah Kedaluwarsa.", 404, "Akses Ditolak");
        }
        $data['kegiatan']  = $kegiatan;
        $data['opd']       = $this->db->get('tbl_opd')->result();
        $data['jenis_opd'] = $this->db->get('tbl_jenis_opd')->result(); 
        $this->load->view('publik/form_presensi', $data);
    }

    public function kirim() {
        $input = $this->input->post();
        $opd = $this->db->get_where('tbl_opd', ['ID_OPD' => $input['ID_OPD']])->row();
        $nama_skpd = ($opd) ? $opd->NAMA_OPD : '-';

        $data_simpan = [
            'ID_KEGIATAN' => $input['ID_KEGIATAN'],
            'NAMA'        => strtoupper($input['NAMA']),
            'JEN_KEL'     => $input['JEN_KEL'],
            'SKPD'        => $nama_skpd,
            'JABATAN'     => $input['JABATAN'],
            'NO_HP'       => $input['NO_HP'],
            'EMAIL'       => $input['EMAIL'],
            'TTD'         => $input['TTD'],
            'DATE_TIME'   => date('Y-m-d H:i:s'),
            'STS'         => 1,
            'URUT_CETAK'  => 0
        ];

        $this->db->insert('tbl_presensi', $data_simpan);
        $simpan_kedua = $this->db->insert('tbl_tanda_tangan', $data_simpan);

        if($simpan_kedua) {
            $this->session->set_flashdata('sukses_presensi', 'Data Anda telah berhasil tersimpan.');
            redirect('presensi/sukses');
        } else {
            $this->session->set_flashdata('error', 'Gagal menyimpan data.');
            redirect($_SERVER['HTTP_REFERER']);
        }
    }

    // NAMA FUNGSI DISESUAIKAN UNTUK AJAX
    public function get_saran_nama() {
    $term = $this->input->get('term', TRUE);
    if (empty($term)) {
        echo json_encode([]);
        return;
    }

    $this->db->select('NAMA, JEN_KEL, SKPD, JABATAN, NO_HP, EMAIL');
    $this->db->from('tbl_tanda_tangan');
    // Gunakan group_start untuk pencarian yang lebih fleksibel
    $this->db->group_start();
        $this->db->like('LOWER(NAMA)', strtolower($term));
    $this->db->group_end();
    $this->db->group_by('NAMA'); 
    $this->db->order_by('DATE_TIME', 'DESC');
    $this->db->limit(5);
    $query = $this->db->get()->result();

    $this->output
         ->set_content_type('application/json')
         ->set_output(json_encode($query));
}

    public function sukses() {
        $this->load->view('publik/sukses_presensi');
    }
}