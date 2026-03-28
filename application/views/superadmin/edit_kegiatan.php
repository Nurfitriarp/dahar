<div id="content-wrapper" class="d-flex flex-column">
    <div id="content">
        <div class="container-fluid">
            <h4 class="mt-4 mb-4 text-gray-800 font-weight-bold">Edit Kegiatan</h4>

            <div class="card shadow mb-4">
                <div class="card-body">
                    <form action="<?= base_url('superadmin/update') ?>" method="post">
                        <input type="hidden" name="ID_KEGIATAN" value="<?= $kegiatan->ID_KEGIATAN ?>">

                        <div class="form-group">
                            <label>Nama Kegiatan</label>
                            <input type="text" name="NAMA" class="form-control" value="<?= $kegiatan->NAMA ?>" required>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Tempat</label>
                                <input type="text" name="TEMPAT" class="form-control" value="<?= $kegiatan->TEMPAT ?>">
                            </div>
                            <div class="form-group col-md-3">
                                <label>Tanggal</label>
                                <input type="date" name="TANGGAL" class="form-control" value="<?= $kegiatan->TANGGAL ?>">
                            </div>
                            <div class="form-group col-md-3">
                                <label>Jam</label>
                                <input type="text" name="JAM" class="form-control" value="<?= $kegiatan->JAM ?>">
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Penyelenggara Kegiatan</label>
                            <input type="text" name="SKPD_PENYELENGGARA" class="form-control" value="<?= $kegiatan->SKPD_PENYELENGGARA ?>">
                        </div>

                        <div class="form-group">
                            <label>Pimpinan Rapat</label>
                            <input type="text" name="PIMPINAN_RAPAT" class="form-control" value="<?= $kegiatan->PIMPINAN_RAPAT ?>">
                        </div>

                        <?php 
                            // LOGIKA MEMCAH DATA ID_OPD (Format: 1:10,2:15)
                            $saved_ids = [];
                            $saved_jml = [];
                            if(!empty($kegiatan->ID_OPD)){
                                $pairs = explode(',', $kegiatan->ID_OPD);
                                foreach($pairs as $p){
                                    $part = explode(':', $p);
                                    if(count($part) == 2){
                                        $saved_ids[] = $part[0];
                                        $saved_jml[] = $part[1];
                                    } else {
                                        // Antisipasi jika data lama masih format ID murni
                                        $saved_ids[] = $p;
                                        $saved_jml[] = 0;
                                    }
                                }
                            }
                            $string_jml = implode(',', $saved_jml);
                        ?>

                        <div class="form-row">
                            <div class="form-group col-md-8">
                                <label class="font-weight-bold text-primary">Perangkat Daerah / Jenis</label>
                                <select class="form-control select2-multiple" name="ID_OPD[]" id="ID_OPD" multiple="multiple" style="width: 100%;" required>
                                    
                                    <optgroup label="PILIH BERDASARKAN JENIS (KOLEKTIF)">
                                        <?php if(!empty($jenis_opd)): foreach ($jenis_opd as $j): ?>
                                            <option value="JENIS_<?= $j->{'ID_J-OPD'} ?>" data-type="group">
                                                [SEMUA] <?= $j->NAMA_OPD ?>
                                            </option>
                                        <?php endforeach; endif; ?>
                                    </optgroup>

                                    <optgroup label="PILIH PERANGKAT DAERAH (INDIVIDU)">
                                        <?php if(!empty($opd)): foreach ($opd as $o): ?>
                                            <option value="<?= $o->ID_OPD ?>" 
                                                    data-jenis="JENIS_<?= $o->{'ID_OPD'} ?>" 
                                                    data-type="individual"
                                                    <?= in_array($o->ID_OPD, $saved_ids) ? 'selected' : '' ?>>
                                                <?= $o->NAMA_OPD ?>
                                            </option>
                                        <?php endforeach; endif; ?>
                                    </optgroup>
                                </select>
                                <div id="urutan-helper" class="mt-2 small text-muted">
                                    Urutan Input: <span id="list-urutan" class="font-weight-bold text-dark"></span>
                                </div>
                            </div>

                            <div class="form-group col-md-4">
                                <label class="font-weight-bold text-dark">Jumlah Peserta (Pisahkan koma)</label>
                                <input type="text" name="JML_PESERTA" id="jml_peserta_input" class="form-control" 
                                    value="<?= $string_jml ?>" placeholder="Contoh: 12,14,18">
                                <small class="text-danger" id="error-koma" style="display:none;">* Jumlah angka tidak sesuai!</small>
                            </div>
                        </div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script>
$(document).ready(function() {
    // Inisialisasi Select2
    var $select = $('#ID_OPD').select2({
        placeholder: " Pilih instansi...",
        allowClear: true,
        width: '100%'
    });

    // Fungsi Update Tampilan Urutan
    function updateHelper() {
        var selectedData = $select.select2('data');
        var names = [];
        selectedData.forEach(function(item) {
            // Hanya ambil teks yang bukan grup kolektif
            if (item.element && $(item.element).data('type') === 'individual') {
                names.push(item.text);
            }
        });
        $('#list-urutan').text(names.length > 0 ? names.join(' → ') : '-');
    }

    // Jalankan pertama kali saat load
    updateHelper();

    // Event ketika ada pilihan baru (Logika Kolektif)
    $select.on('select2:select', function (e) {
        var data = e.params.data;
        var $element = $(data.element);
        
        if ($element.data('type') === 'group') {
            var jenisId = data.id; 
            var currentValues = $select.val() || [];

            // Pilih semua individu yang jenisnya sama
            $(`#ID_OPD option[data-type="individual"][data-jenis='${jenisId}']`).each(function() {
                var val = $(this).val();
                if (currentValues.indexOf(val) === -1) {
                    currentValues.push(val);
                }
            });

            // Hapus ID "JENIS_X" agar tidak tersimpan ke DB
            currentValues = currentValues.filter(id => id !== jenisId);
            
            $select.val(currentValues).trigger('change');
        }
        updateHelper();
    });

    $select.on('change', function() {
        updateHelper();
    });
});
</script>

                        <hr>
                        <a href="<?= base_url('superadmin/kegiatan') ?>" class="btn btn-secondary shadow-sm">Batal</a>
                        <button type="submit" class="btn btn-warning font-weight-bold shadow-sm">
                            <i class="fas fa-save fa-sm"></i> Simpan Perubahan
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
                                    </div>
</div>

<script>
    $select.on('select2:select', function (e) {
    var data = e.params.data;
    var $element = $(data.element);
    
    // Jika yang diklik adalah tipe 'group' (Kolektif)
    if ($element.data('type') === 'group') {
        var jenisId = data.id; // Ini akan berisi "JENIS_1", "JENIS_2", dst
        var currentValues = $select.val() || [];

        // Cari semua opsi individual yang memiliki data-jenis sama dengan ID yang diklik
        $(`#ID_OPD option[data-type="individual"][data-jenis='${jenisId}']`).each(function() {
            var val = $(this).val();
            if (currentValues.indexOf(val) === -1) {
                currentValues.push(val);
            }
        });

        // Update Select2 dengan nilai baru
        $select.val(currentValues).trigger('change');
        
        // Hapus pilihan "[SEMUA]" agar tidak ikut tersimpan sebagai ID di database
        setTimeout(function() {
            currentValues = currentValues.filter(id => id !== jenisId);
            $select.val(currentValues).trigger('change');
        }, 100);
    }
});
</script>