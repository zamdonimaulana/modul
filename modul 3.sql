-- Nama : MUHAMMAD ZAMDONI MAULANA
-- Nim  :22241077
-- MODUL 3

-- menggunakan database
use undikma_mart;

-- ORDER BY  
-- mengambil kolom nanma produk dan qty dari penjualan utama berdasarkan kty
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY qty;

-- mengambil kolom nanma produk dan qty dari penjualan utama berdasarkan kty dan nama produk
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY qty, nama_produk;



-- latihan 1
-- 01 mengambil semua data penjualan berdasarkan qty dan tanggal transaksi
SELECT * FROM tr_penjualan_dqlab ORDER BY qty, tanggal_transaksi;
-- 02mengambil semua ms pelanggan berdasarkan nama peanggan
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan;
-- 03 mengambil semua ms pelanggan berdasarkan alamat
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat;

-- mengambil kolom nanma produk dan qty dari penjualan utama berdasarkan qty dari besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY QTY DESC;

-- mengambil kolom nanma produk dan qty dari penjualan utama berdasarkan kty dan nama produk DARI BESAR KE KECIL
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY qty, nama_produk DESC;


-- LATIHAN MANDIRI LAAGGGII 2

-- 01 mengambil semua data penjualan berdasarkan qty dan tanggal transaksi
SELECT * FROM tr_penjualan_dqlab ORDER BY qty, tanggal_transaksi DESC;
-- 02mengambil semua ms pelanggan berdasarkan nama peanggan
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan DESC;
-- 03 mengambil semua ms pelanggan berdasarkan alamat
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat DESC;


-- mengambi nama produk, qty, harga, dan total bayar urutkan berdasarkan total bayar besar kek kecil
SELECT nama_produk, qty, harga, qty*harga AS total_bayar FROM tr_penjualan_dqlab ORDER BY total_bayar DESC;

-- latihan mandiri 3
SELECT nama_produk, qty, harga,
diskon_persen, (diskon_persen/100)*harga AS diskon,
qty*(harga-(diskon_persen/100)*harga) AS total_bayar
FROM tr_penjualan_dqlab
ORDER BY total_bayar DESC, diskon DESC;



-- ATIHAN MANDIRI 4
-- NO 1
SELECT * FROM tr_penjualan_dqlab WHERE diskon_persen > 0 ORDER BY harga DESC;
-- No 2
SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab WHERE harga >= 100000 ORDER BY harga DESC;
-- No 3
SELECT nama_produk, qty, harga 
FROM tr_penjualan_dqlab WHERE harga >= 100000 OR nama_produk like't%' 
ORDER BY diskon_persen DESC;

-- FUNGSI AGREGASI
-- contoh
SELECT count(distinct harga) FROM tr_penjualan_dqlab;
SELECT max(harga) FROM tr_penjualan_dqlab;

-- hitung total qty dari table penjualan
SELECT sum(qty) FROM tr_penjualan_dqlab;

-- hitung seluruh row dari table penjualan
select count(*) FROM tr_penjualan_dqlab;

-- hitung jumlah qty dan jumah row dar table penjualan
SELECT sum(qty) AS total_qty, count(*) AS total_row From tr_penjualan_dqlab;

-- hitung nilai rata-rata, nilai maximum, nilai minimum dari qty table penjualan
Select AVG(qty), max(qty), min(qty)
FROM tr_penjualan_dqlab;

-- HITUNG JUMLAH NILAI UNIK DARI NAMA PRODUK DI TABEL PENJUALAN
SELECT count(distinct nama_produk) FROM tr_penjualan_dqlab;

-- MENAMPILKAN JUMLAH SELURUH ROW DAN JUMLAH UNIK DARI NAMA PRODUK DI TABEL PENJUALAN
SELECT count(*), count(distinct nama_produk) FROM tr_penjualan_dqlab;
SELECT count(*), count(distinct nama_produk), nama_produk FROM tr_penjualan_dqlab;

-- GROUP BY
-- KLOMPOK NILAI DARI NAMA PRODUK DITABEL PENJUALAN 
SELECT nama_produk FROM tr_penjualan_dqlab group by nama_produk;

-- KELOMPOK NILAI DARI NAMA PRODUK DARI QTY TABEL PENJUALAN
SELECT nama_produk, qty FROM tr_penjualan_dqlab group by nama_produk, qty;

-- GROUP BY + FUNGSI AGREGESI
-- AMBIL JUMLAH QTY DARI HASILPENGELOMPOKAN NAMA_PRODUK DITABEL PENJUALAN
SELECT nama_produk, count(qty) FROM tr_penjualan_dqlab group by nama_produk
order by sum(qty) DESC; 

-- HEVING
-- MENGAMBIL JUMLAH QTY > 2 DARI PENGELOMPOKAN NAMA PRODUK
SELECT nama_prduk, sum(qty) FROM tr_penjualan_dqlab group by nama_produk having sum(qty) > 2 ORDER BY 

