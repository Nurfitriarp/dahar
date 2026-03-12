<div id="content-wrapper" class="d-flex flex-column">
    <div id="content">
        <div class="container-fluid mt-4">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Edit Jenis Perangkat Daerah</h1>
                <a href="<?= base_url('superadmin/jenispd'); ?>" class="btn btn-sm btn-secondary shadow-sm">
                    <i class="fas fa-arrow-left fa-sm text-white-50"></i> Kembali
                </a>
            </div>

            <div class="row justify-content-center">
                <div class="class card-body">
                        <form action="<?= base_url('superadmin/update_jenispd'); ?>" method="POST" enctype="multipart/form-data">

                            <input type="hidden" name="<?= $this->security->get_csrf_token_name(); ?>" value="<?= $this->security->get_csrf_hash(); ?>">

                                <div class="form-group">
                                    <label >ID Jenis OPD (Kode)</label>
                                    <input type="text" name="ID_J-OPD" class="form-control" value="<?= $jenispd->{'ID_J-OPD'}; ?>" readonly required>
                                </div>

                                <div class="form-group">
                                    <label >Nama Jenis Perangkat Daerah</label>
                                    <input type="text" name="NAMA_OPD" class="form-control" value="<?= $jenispd->{'NAMA_OPD'}; ?>"required>
                                </div>
                                
                            <button type="submit" class="btn btn-primary">Simpan</button>
                            <a href="<?= base_url('superadmin/jenispd') ?>" class="btn btn-secondary">Batal</a>
                            </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>