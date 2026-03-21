USE QL_CUU_TRO;
-- cau1
DELETE FROM DON_VI_UNG_HO
WHERE TenNganHang = 'DongA';

-- cau2
UPDATE HINH_THUC_UH
SET TenHinhThucUngHo = 'Mi an lien'
WHERE TenHinhThucUngHo = 'Mi tom';

-- cau3
SELECT HoTenChuHo
FROM HO_DAN
WHERE HoTenChuHo LIKE 'Ph%'
AND LENGTH(HoTenChuHo) <= 30;

-- cau 4
SELECT *
FROM DOT_NHAN_UNG_HO
WHERE YEAR(NgayNhanUngHo) = 2015
AND MaHoDan LIKE '%1';

-- cau 5 
SELECT 
    dv.MaDVUH, dv.HoTenNguoiDaiDien, du.MaDotUngHo, du.NgayUngHo
FROM
    DON_VI_UNG_HO dv
        JOIN
    DOT_UNG_HO du ON dv.MaDVUH = du.MaDVUH
WHERE
    du.NgayUngHo < '2016-04-30'
ORDER BY du.NgayUngHo DESC , dv.HoTenNguoiDaiDien ASC;

-- cau 6
SELECT *
FROM HO_DAN hd
WHERE hd.LaHoNgheo = 'Dung'
AND NOT EXISTS (
    SELECT 1
    FROM DOT_NHAN_UNG_HO dn
    WHERE dn.MaHoDan = hd.MaHoDan
);

-- cau 7
	-- cach 1
SELECT DISTINCT HoTenChuHo
FROM HO_DAN;
	-- cach 2
SELECT HoTenChuHo
FROM HO_DAN
GROUP BY HoTenChuHo;

-- cau 8
SELECT hd.MaHoDan, hd.HoTenChuHo, hd.ToDanPho, hd.KhoiHoacThon,
       dn.MaDotNhanUngHo, dn.NgayNhanUngHo,
       ct.MaHinhThucUH, ct.SoLuongNhanUngHo, ct.DonViTinh
FROM HO_DAN hd
LEFT JOIN DOT_NHAN_UNG_HO dn ON hd.MaHoDan = dn.MaHoDan
LEFT JOIN CHI_TIET_NHAN_UNG_HO ct ON dn.MaDotNhanUngHo = ct.MaDotNhanUngHo;

-- cau 9
SELECT dv.MaDVUH
FROM DON_VI_UNG_HO dv
JOIN DOT_UNG_HO du ON dv.MaDVUH = du.MaDVUH
JOIN CHI_TIET_UNG_HO ct ON du.MaDotUngHo = ct.MaDotUngHo
JOIN HINH_THUC_UH ht ON ct.MaHinhThucUH = ht.MaHinhThucUH
WHERE dv.TenNganHang = 'DongA'
AND ht.TenHinhThucUngHo = 'Mi an lien'
AND YEAR(du.NgayUngHo) = 2016
GROUP BY dv.MaDVUH
HAVING COUNT(*) >= 5;

-- cau 10 

SELECT DISTINCT hd.MaHoDan
FROM HO_DAN hd
JOIN DOT_NHAN_UNG_HO dn ON hd.MaHoDan = dn.MaHoDan
JOIN CHI_TIET_NHAN_UNG_HO ct ON dn.MaDotNhanUngHo = ct.MaDotNhanUngHo
JOIN HINH_THUC_UH ht ON ct.MaHinhThucUH = ht.MaHinhThucUH
WHERE ht.TenHinhThucUngHo = 'Mi an lien'
AND hd.MaHoDan NOT IN (
    SELECT dn.MaHoDan
    FROM DOT_NHAN_UNG_HO dn
    JOIN CHI_TIET_NHAN_UNG_HO ct ON dn.MaDotNhanUngHo = ct.MaDotNhanUngHo
    JOIN HINH_THUC_UH ht ON ct.MaHinhThucUH = ht.MaHinhThucUH
    WHERE ht.TenHinhThucUngHo = 'Gao'
);




