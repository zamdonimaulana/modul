-- Nama : M. ZAMDONI MAULANA
-- NIM : 22241077
-- UAS

-- menggabungkan  database
use undikma_mart;


-- NO 1
SELECT nama_produk,
		SUM(qty*(harga - (diskon_persen / 100) * harga)) AS pendapatan
FROM tr_penjualan_dqlab
Group by nama_produk
order by pendapatan DESC
limit 5;
    
-- NO 2
  SELECT np.kategori_produk,
		SUM(tp.qty * (tp.harga * (tp.diskon_persen / 100) * tp.harga)) AS pendapatan,
	CASE
		WHEN SUM(tp.qty * (tp.harga - (tp.diskon_persen / 100) * tp.harga)) >= 900000 THEN 'Target Achieved'
		WHEN SUM(tp.qty * (tp.harga - (tp.diskon_persen / 100) * tp.harga)) < 500000 THEN 'Lase Performance'
	END AS status
FROM tr_penjualan_dqlab AS tp
JOIN ms_produk_dqlab np
ON tp.kode_produk = np.kode_produk 
group by np.kategori_produk
HAVING status = 'follow up'
Limit 3;
    

-- NO 3
SELECT
	np.nama_pelanggan,
    np.alamat
FROM
    tr_penjualan_dqlab AS tp
RIGHT JOIN
	ms_pelanggan_dqlab AS np
    ON np.kode_pelanggan = tp.kode_pelanggan
WHERE tp.qty IS NULL;


