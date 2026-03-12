<div id="content-wrapper" class="d-flex flex-column">
    <div id="content">
        <div class="container-fluid mt-4">
            
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Tambah Perangkat Daerah</h1>
                <a href="<?= base_url('superadmin/perda'); ?>" class="btn btn-sm btn-secondary shadow-sm">
                    <i class="fas fa-arrow-left fa-sm text-white-50"></i> Kembali
                </a>
            </div>

            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <form action="<?= base_url('superadmin/simpan_opd'); ?>" method="POST">
                                
                                <input type="hidden" name="<?= $this->security->get_csrf_token_name(); ?>" value="<?= $this->security->get_csrf_hash(); ?>">

                                <div class="form-group mb-4">
                                    <label class="font-weight-bold text-dark">Nama Perangkat Daerah</label>
                                    <input type="text" name="NAMA_OPD" class="form-control" placeholder="Contoh: Dinas Komunikasi dan Informatika" required autofocus>
                                </div>

                                <div class="form-group mb-4">
                                    <label class="font-weight-bold text-dark">Jenis Perangkat Daerah</label>
                                    <select name="ID_J-OPD" class="form-control" required>
                                        <option value="">-- Pilih Jenis OPD --</option>
                                        <?php foreach($jenis_opd as $j): ?>
                                            <option value="<?= $j->{'ID_J-OPD'}; ?>">
                                                <?= $j->NAMA_OPD; ?>
                                            </option>
                                        <?php endforeach; ?>
                                    </select>
                                    <small class="text-muted">Pilih kategori instansi (Dinas, Badan, Bagian, dll)</small>
                                </div>

                                <hr class="my-4">

                                <div class="text-right">
                                    <button type="reset" class="btn btn-light shadow-sm px-4">Batal</button>
                                    <button type="submit" class="btn btn-primary shadow-sm px-4 ml-2">
                                        <i class="fas fa-save mr-1"></i> Simpan
                                    </button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>