# 🛒 Database Penjualan P10

![MariaDB](https://img.shields.io/badge/Database-MariaDB-blue?logo=mariadb)
![MySQL](https://img.shields.io/badge/SQL-MySQL-orange?logo=mysql)
![Status](https://img.shields.io/badge/Status-Completed-success)

Database Penjualan P10 merupakan proyek praktikum Manajemen Basis Data yang bertujuan untuk membangun database relasional menggunakan MariaDB melalui XAMPP.

Proyek ini mencakup pembuatan database, perancangan tabel, penerapan Primary Key dan Foreign Key, pengisian data, pengujian relasi, serta penggunaan query JOIN untuk menampilkan informasi transaksi penjualan.

---

## 👩‍💻 Informasi Mahasiswa

| Keterangan | Detail |
|---|---|
| Nama | Dira Rohmaeni |
| NIM | 312410465 |
| Program Studi | Teknik Informatika |
| Mata Kuliah | Manajemen Basis Data |
| Nama Database | `penjualan_p10` |

---

## 🎯 Tujuan Praktikum

1. Membuat database menggunakan MariaDB.
2. Membuat tiga tabel yang saling berhubungan.
3. Menentukan Primary Key dan Foreign Key.
4. Memasukkan data pelanggan, produk, dan penjualan.
5. Menampilkan data menggunakan query JOIN.
6. Menguji fungsi Foreign Key.
7. Membuat diagram relasi menggunakan phpMyAdmin Designer.

---

## 🗄️ Struktur Database

Database `penjualan_p10` terdiri dari tiga tabel utama.

### 1. Tabel Pelanggan (`pelanggan`)

Menyimpan informasi pelanggan.

| Field | Tipe Data | Keterangan |
|---|---|---|
| id_pelanggan | INT | Primary Key |
| nama_pelanggan | VARCHAR(100) | Nama pelanggan |
| alamat | TEXT | Alamat pelanggan |

### 2. Tabel Produk (`produk`)

Menyimpan informasi produk yang dijual.

| Field | Tipe Data | Keterangan |
|---|---|---|
| id_produk | INT | Primary Key |
| nama_produk | VARCHAR(100) | Nama produk |
| harga | DECIMAL(10,2) | Harga produk |
| stok | INT | Jumlah stok |

### 3. Tabel Penjualan (`penjualan`)

Menyimpan informasi transaksi penjualan.

| Field | Tipe Data | Keterangan |
|---|---|---|
| id_penjualan | INT | Primary Key |
| id_pelanggan | INT | Foreign Key |
| id_produk | INT | Foreign Key |
| tanggal_penjualan | DATE | Tanggal transaksi |
| jumlah | INT | Jumlah pembelian |

---

## 🔗 Relasi Antar Tabel

Database menggunakan dua relasi One-to-Many (1:N).

- `pelanggan` → `penjualan`: Satu pelanggan dapat melakukan banyak transaksi.
- `produk` → `penjualan`: Satu produk dapat muncul dalam banyak transaksi.

Foreign Key yang digunakan:

- `fk_penjualan_pelanggan`
- `fk_penjualan_produk`

Seluruh tabel menggunakan storage engine InnoDB.

### Diagram Relasi

Tambahkan screenshot diagram Designer di sini.

![Diagram Relasi](screenshots/06-designer.png)

---

## 📊 Data Contoh

### Data Pelanggan

| ID | Nama Pelanggan | Alamat |
|---|---|---|
| 1 | Dira Rohmaeni | Cikarang |
| 2 | Andi Saputra | Bekasi |
| 3 | Siti Amelia | Karawang |

### Data Produk

| ID | Nama Produk | Harga | Stok |
|---|---|---:|---:|
| 1 | Laptop ASUS | Rp7.500.000 | 10 |
| 2 | Mouse Logitech | Rp150.000 | 25 |
| 3 | Keyboard Mechanical | Rp350.000 | 15 |
| 4 | Headset JBL | Rp450.000 | 20 |

### Data Penjualan

| ID | Pelanggan | Produk | Jumlah |
|---|---|---|---:|
| 1 | Dira Rohmaeni | Laptop ASUS | 1 |
| 2 | Andi Saputra | Mouse Logitech | 2 |
| 3 | Siti Amelia | Keyboard Mechanical | 1 |
| 4 | Dira Rohmaeni | Headset JBL | 2 |
| 5 | Andi Saputra | Laptop ASUS | 1 |

---

## 💻 Query JOIN

Query JOIN digunakan untuk menggabungkan informasi dari ketiga tabel.

```sql
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
```

### Hasil Query JOIN

Query berhasil menampilkan lima transaksi dengan informasi tanggal, nama pelanggan, nama produk, jumlah pembelian, harga produk, dan total harga.

![Hasil Query JOIN](screenshots/04-join.png)

---

## 🧪 Pengujian Foreign Key

Pengujian dilakukan dengan mencoba memasukkan transaksi menggunakan `id_pelanggan = 99`, sedangkan ID tersebut tidak tersedia dalam tabel pelanggan.

```sql
INSERT INTO penjualan
(id_pelanggan, id_produk, tanggal_penjualan, jumlah)
VALUES (99, 1, '2026-11-18', 1);
```

### Hasil Pengujian

Database menolak transaksi dan menghasilkan error Foreign Key Constraint (`#1452`).

Hal ini membuktikan bahwa relasi Foreign Key berjalan dengan baik dan mencegah penggunaan ID pelanggan yang tidak terdaftar.

![Pengujian Foreign Key](screenshots/05-pengujian-fk.png)

---

## 📸 Dokumentasi Praktikum

Dokumentasi pengerjaan database:

| No. | Dokumentasi |
|---|---|
| 1 | Pembuatan database |
| 2 | Pembuatan tiga tabel |
| 3 | Pembuatan relasi Foreign Key |
| 4 | Hasil query JOIN |
| 5 | Pengujian Foreign Key |
| 6 | Diagram relasi Designer |

Simpan screenshot sesuai nama file yang digunakan pada dokumentasi di atas.

---

## 📝 Kesimpulan

Berdasarkan praktikum yang telah dilakukan, database `penjualan_p10` berhasil dibuat menggunakan MariaDB melalui XAMPP.

Database terdiri dari tiga tabel, yaitu pelanggan, produk, dan penjualan, yang saling terhubung menggunakan Primary Key dan Foreign Key.

Penggunaan query JOIN berhasil menampilkan informasi transaksi dari ketiga tabel. Pengujian Foreign Key juga menunjukkan bahwa database mampu menolak transaksi dengan ID pelanggan yang tidak terdaftar.

Dengan demikian, praktikum ini memberikan pemahaman mengenai pembuatan database relasional, pengelolaan tabel, penerapan relasi, dan pengolahan data menggunakan SQL.

---

**© 2026 Dira Rohmaeni | Teknik Informatika**
