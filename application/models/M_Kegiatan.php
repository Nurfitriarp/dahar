<?php
class M_Kegiatan extends CI_Model {
    public function get_all_kegiatan() {
        // Mengambil semua data dari tabel 'tbl_kegiatan'
        return $this->db->get('tbl_kegiatan')->result();
    }
}