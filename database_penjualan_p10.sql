
-- DATABASE PENJUALAN P10
-- Nama: Dira Rohmaeni
-- NIM: 312410465

-- 1. Membuat database
CREATE DATABASE penjualan_p10;

USE penjualan_p10;

-- 2. Membuat tabel pelanggan
CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL,
    alamat TEXT
) ENGINE=InnoDB;

-- 3. Membuat tabel produk
CREATE TABLE produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(100) NOT NULL,
    harga DECIMAL(10,2) NOT NULL,
    stok INT NOT NULL
) ENGINE=InnoDB;

-- 4. Membuat tabel penjualan
CREATE TABLE penjualan (
    id_penjualan INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT NOT NULL,
    id_produk INT NOT NULL,
    tanggal_penjualan DATE NOT NULL,
    jumlah INT NOT NULL
) ENGINE=InnoDB;

-- 5. Menambahkan relasi Foreign Key pelanggan
ALTER TABLE penjualan
ADD CONSTRAINT fk_penjualan_pelanggan
FOREIGN KEY (id_pelanggan)
REFERENCES pelanggan(id_pelanggan);

-- 6. Menambahkan relasi Foreign Key produk
ALTER TABLE penjualan
ADD CONSTRAINT fk_penjualan_produk
FOREIGN KEY (id_produk)
REFERENCES produk(id_produk);

-- 7. Mengisi data pelanggan
INSERT INTO pelanggan (nama_pelanggan, alamat) VALUES
('Dira Rohmaeni', 'Cikarang'),
('Andi Saputra', 'Bekasi'),
('Siti Amelia', 'Karawang');

-- 8. Mengisi data produk
INSERT INTO produk (nama_produk, harga, stok) VALUES
('Laptop ASUS', 7500000, 10),
('Mouse Logitech', 150000, 25),
('Keyboard Mechanical', 350000, 15),
('Headset JBL', 450000, 20);

-- 9. Mengisi data penjualan
INSERT INTO penjualan
(id_pelanggan, id_produk, tanggal_penjualan, jumlah) VALUES
(1, 1, '2026-11-18', 1),
(2, 2, '2026-11-18', 2),
(3, 3, '2026-11-18', 1),
(1, 4, '2026-11-18', 2),
(2, 1, '2026-11-18', 1);

-- 10. Menampilkan daftar tabel
SHOW TABLES;

-- 11. Menampilkan struktur tabel penjualan
SHOW CREATE TABLE penjualan;

-- 12. Menampilkan hasil JOIN
SELECT
    penjualan.tanggal_penjualan AS tanggal,
    pelanggan.nama_pelanggan AS pelanggan,
    produk.nama_produk AS produk,
    penjualan.jumlah,
    produk.harga,
    (penjualan.jumlah * produk.harga) AS total
FROM penjualan
JOIN pelanggan
    ON penjualan.id_pelanggan = pelanggan.id_pelanggan
JOIN produk
    ON penjualan.id_produk = produk.id_produk;

-- 13. Pengujian Foreign Key (dijalankan terpisah)
-- INSERT INTO penjualan
-- (id_pelanggan, id_produk, tanggal_penjualan, jumlah)
-- VALUES (99, 1, '2026-11-18', 1);
