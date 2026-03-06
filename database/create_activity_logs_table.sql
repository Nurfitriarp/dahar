-- Buat tabel activity_logs jika belum ada
CREATE TABLE IF NOT EXISTS `tbl_activity_logs` (
  `ID` INT AUTO_INCREMENT PRIMARY KEY,
  `user_id` INT UNSIGNED NOT NULL,
  `activity_type` VARCHAR(50) NOT NULL COMMENT 'LOGIN, ADD, EDIT, DELETE, PRINT, LOGOUT, etc',
  `description` TEXT NOT NULL,
  `ip_address` VARCHAR(45),
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `tbl_user`(`ID`) ON DELETE CASCADE,
  INDEX `idx_user_id` (`user_id`),
  INDEX `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
