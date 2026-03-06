# 📋 Panduan Konfigurasi Activity Log

Saya telah membuat sistem activity log yang lengkap. Berikut langkah-langkah setupnya:

## 1️⃣ Buat Tabel Database

Jalankan SQL query berikut di phpMyAdmin atau terminal MySQL:

```sql
CREATE TABLE IF NOT EXISTS `tbl_activity_logs` (
  `ID` INT AUTO_INCREMENT PRIMARY KEY,
  `user_id` INT NOT NULL,
  `activity_type` VARCHAR(50) NOT NULL,
  `description` TEXT NOT NULL,
  `ip_address` VARCHAR(45),
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `tbl_user`(`ID`) ON DELETE CASCADE,
  INDEX `idx_user_id` (`user_id`),
  INDEX `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

## 2️⃣ File-File yang Sudah Dibuat

### ✅ Activity Helper
**File**: `application/helpers/activity_helper.php`
- **Function**: `log_activity($activity_type, $description, $user_id)`
- **Digunakan untuk**: Mencatat aktivitas ke database
- **Contoh penggunaan**:
```php
log_activity('LOGIN', 'Logged in to admin panel');
log_activity('ADD', 'Added new kegiatan: ' . $kegiatan_name);
log_activity('EDIT', 'Edited kegiatan: ' . $kegiatan_name);
log_activity('DELETE', 'Deleted kegiatan: ' . $kegiatan_name);
log_activity('PRINT', 'Printed activity report');
```

### ✅ M_admin Model Update
**Method**: `get_activity_logs($user_id = null, $limit = 10)`
- **Fungsi**: Mengambil activity logs dari database
- **Parameter**:
  - `$user_id` (opsional): Filter logs berdasarkan user
  - `$limit`: Jumlah record yang ditampilkan (default: 10)

### ✅ Admin Controller Update
- Activity helper sudah di-load di constructor
- Dashboard sudah menerima `$data['activity_logs']`

## 3️⃣ Update Authentication - Log Login/Logout

**File**: `application/controllers/auth.php`

Tambahkan di method `login_process()` setelah `set_userdata`:
```php
log_activity('LOGIN', 'Logged in to admin panel');
redirect('admin/dashboard');
```

Tambahkan di method `logout()`:
```php
log_activity('LOGOUT', 'Logged out from admin panel');
```

## 4️⃣ Update CRUD Operations - Log Aktivitas

Di **Admin Controller** (`admin.php`):

**Method `simpan()` - Setelah insert berhasil**:
```php
if ($insert_id) {
    log_activity('ADD', 'Added new kegiatan: ' . $input['NAMA']);
    $this->session->set_flashdata('success', 'Kegiatan berhasil ditambahkan.');
}
```

**Method `update()` - Setelah update berhasil**:
```php
if ($this->db->update('tbl_kegiatan', $data)) {
    log_activity('EDIT', 'Edited kegiatan: ' . $data['NAMA']);
    $this->session->set_flashdata('success', 'Kegiatan berhasil diperbarui.');
}
```

**Method `hapus()` - Setelah delete berhasil**:
```php
if ($ok) {
    log_activity('DELETE', 'Deleted kegiatan with ID: ' . $id);
    $this->session->set_flashdata('success', 'Kegiatan berhasil dihapus.');
}
```

**Method `print_rekap()` - Saat cetak**:
```php
log_activity('PRINT', 'Printed attendance list for: ' . $data['detail']->NAMA);
```

## 5️⃣ Update Dashboard View

**File**: `application/views/admin/dashboard.php` dan `application/views/superadmin/dashboard.php`

Ganti bagian Activity Log table dengan:

```php
<div class="col-lg-12 mb-4">
    <div class="card shadow">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Activity Log</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Activity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if(isset($activity_logs) && count($activity_logs) > 0): ?>
                            <?php foreach($activity_logs as $log): ?>
                            <tr>
                                <td><?= date('Y-m-d H:i', strtotime($log->created_at)) ?></td>
                                <td>
                                    <span class="badge badge-<?= get_badge_color($log->activity_type) ?>">
                                        <?= $log->activity_type ?>
                                    </span>
                                    <?= $log->description ?>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                        <?php else: ?>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <em>Belum ada activity log</em>
                                </td>
                            </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
```

## 6️⃣ Update Superadmin Dashboard

**File**: `application/controllers/superadmin.php`

Di method `dashboard()`, tambahkan:
```php
$data['activity_logs'] = $this->M_admin->get_activity_logs(null, 10);
```

Pastikan superadmin controller load activity helper di constructor (sama seperti admin).

## 🎨 Activity Type dan Badge Color

| Type | Badge Color | Waktu Digunakan |
|------|------------|-----------------|
| LOGIN | success (hijau) | Saat login |
| LOGOUT | warning (kuning) | Saat logout |
| ADD | info (biru) | Tambah kegiatan |
| EDIT | warning (kuning) | Edit kegiatan |
| DELETE | danger (merah) | Hapus kegiatan |
| PRINT | primary (biru) | Print daftar hadir |
| UPDATE | warning (kuning) | Update data lain |

## ✨ Hasil Akhir

Setelah semua konfigurasi selesai:
- ✅ Activity log tercatat otomatis di database
- ✅ Dashboard menampilkan 10 activity terakhir
- ✅ Badge warna berbeda untuk setiap tipe aktivitas
- ✅ Timestamp otomatis
- ✅ Tracking user yang melakukan aktivitas

---

**Note**: Jika ingin hasil yang lebih bagus, Anda juga dapat menambahkan pagination pada activity log atau membuat halaman terpisah untuk melihat semua activity dengan filter by date, user, atau type.
