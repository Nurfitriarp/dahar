<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_admin extends CI_Model {

    public function get_data() {
        // Ganti 'nama_tabel' dengan nama tabel asli di phpMyAdmin Anda
        return $this->db->get('tbl_kegiatan')->result();
    }
    
    public function get_detail($id) {
        // Ambil detail kegiatan berdasarkan ID
        return $this->db->where('ID_KEGIATAN', $id)->get('tbl_kegiatan')->row();
    }
    
    public function get_peserta($id_kegiatan) {
        // Ambil list peserta berdasarkan ID_KEGIATAN
        return $this->db->where('ID_KEGIATAN', $id_kegiatan)->get('tbl_login')->result();
    }
}