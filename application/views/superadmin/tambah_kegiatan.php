<div id="content-wrapper" class="d-flex flex-column">

    <div id="content">

        <div class="container-fluid">
            <h4 class="mt-4 mb-4">Tambah Kegiatan</h4>

            <?php $CI =& get_instance(); ?>
            <?php if ($CI->session->flashdata('success')): ?>
                <div class="alert alert-success alert-dismissible fade show msg-auto-hide" role="alert">
                    <?= $CI->session->flashdata('success') ?>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            <?php endif; ?>

            <?php if ($CI->session->flashdata('error')): ?>
                <div class="alert alert-danger alert-dismissible fade show msg-auto-hide" role="alert">
                    <?= $CI->session->flashdata('error') ?>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            <?php endif; ?>

            <div class="card shadow mb-4">
                <div class="card-body">
                    <form action="<?= base_url('superadmin/simpan') ?>" method="post">
                        <div class="form-group">
                            <label class="font-weight-bold text-dark">Nama Kegiatan</label>
                            <input type="text" name="NAMA" class="form-control" placeholder="Masukkan nama kegiatan" required>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="font-weight-bold text-dark">Tempat</label>
                                <input type="text" name="TEMPAT" class="form-control" placeholder="Lokasi kegiatan">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="font-weight-bold text-dark">Jam</label>
                                <input type="text" name="JAM" class="form-control" placeholder="Contoh : 09.00 - 12.00">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="font-weight-bold text-dark">Tanggal</label>
                                <input type="date" name="TANGGAL" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                        <label class="font-weight-bold text-primary">Penyelenggara Kegiatan</label>
                        <input type="text" name="SKPD_PENYELENGGARA" class="form-control bg-light font-weight-bold" 
                            value="<?= isset($admin->PERANGKAT_DAERAH) ? $admin->PERANGKAT_DAERAH : ''; ?>" 
                            readonly>
                        <small class="text-info">* Instansi Anda terdeteksi otomatis.</small>
                    </div>

                    <div class="form-group">
                        <label class="font-weight-bold text-dark">Pimpinan Rapat</label>
                        <input type="text" name="PIMPINAN_RAPAT" class="form-control" placeholder="Nama pimpinan rapat">
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-8">
                        <label class="font-weight-bold text-primary">Perangkat Daerah</label>
                        <select class="form-control" name="ID_OPD" required>
                            <option value="">-- Pilih Perangkat Daerah --</option>
                            <?php if (!empty($opd)): ?>
                                <?php foreach ($opd as $o): ?>
                                    <option value="<?= $o->ID_OPD ?>" 
                                        <?= (isset($admin->PERANGKAT_DAERAH) && $admin->PERANGKAT_DAERAH == $o->NAMA_OPD) ? 'selected' : ''; ?>>
                                        <?= $o->NAMA_OPD ?>
                                    </option>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        </select>
                    </div>
                        <div class="form-group col-md-4">
                            <label class="font-weight-bold text-dark">Jumlah Peserta</label>
                            <input type="number" name="JML_PESERTA" class="form-control" placeholder="0">
                        </div>
                    </div>

                        <div class="mt-4 text-right">
                            <hr>
                            <a href="<?= base_url('superadmin/kegiatan') ?>" class="btn btn-secondary shadow-sm mr-2">
                                <i class="fas fa-arrow-left fa-sm"></i> Batal
                            </a>
                            <button type="submit" class="btn btn-primary shadow-sm">
                                <i class="fas fa-save fa-sm"></i> Simpan Kegiatan
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
                                </div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Alert Notifikasi tetap hilang otomatis (success/error)
        const autoHideAlerts = document.querySelectorAll('.msg-auto-hide');
        autoHideAlerts.forEach(function(alert) {
            setTimeout(function() {
                alert.style.transition = 'opacity 0.5s ease-out';
                alert.style.opacity = '0';
                setTimeout(function() {
                    alert.remove();
                }, 500);
            }, 3000);
        });
    });
</script>