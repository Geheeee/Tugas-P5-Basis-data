SELECT * FROM akademik.perkuliahan;

INSERT INTO perkuliahan(NIM, Kode_MK, Kehadiran, Nilai_Bobot, Nilai_Angka, Poin) 
VALUES ('202307010', 'B505', '90.00', NULL, '83.59', NULL),
 ('202307010', 'B508', '65.00', NULL, '75.18', NULL),
 ('202307020', 'B505', '75.00', NULL, '55.59', NULL),
('202307020', 'B508', '70.00', NULL, '85.18', NULL);


ALTER TABLE perkuliahan MODIFY COLUMN Nilai_Bobot VARCHAR(2);

UPDATE perkuliahan
SET Nilai_Bobot = CASE
    WHEN Nilai_Angka BETWEEN 91 AND 100 THEN 'A'
    WHEN Nilai_Angka BETWEEN 81 AND 90 THEN 'B'
    WHEN Nilai_Angka BETWEEN 71 AND 80 THEN 'C'
    WHEN Nilai_Angka BETWEEN 61 AND 70 THEN 'D'
    ELSE 'E'
END;

UPDATE perkuliahan
SET Poin = CASE
    WHEN Nilai_Bobot = 'A' THEN 4
    WHEN Nilai_Bobot = 'B' THEN 3
    WHEN Nilai_Bobot = 'C' THEN 2
    WHEN Nilai_Bobot = 'D' THEN 1
    ELSE 0
END;

UPDATE perkuliahan
SET Nilai_Angka = Nilai_Angka * 0.65
WHERE Kehadiran < 75;

use akademik;
ALTER TABLE perkuliahan
ADD COLUMN Kriteria char(10) DEFAULT NULL;

ALTER TABLE perkuliahan MODIFY COLUMN Kriteria VARCHAR(20);

UPDATE perkuliahan
SET Kriteria = CASE
    WHEN Poin = 4 THEN 'Istimewa'
    WHEN Poin = 3 THEN 'Baik'
    WHEN Poin = 2 THEN 'Cukup'
    WHEN Poin = 1 THEN 'Kurang'
    ELSE 'Tidak Lulus'
END;

-- INSERT --
DELIMITER $$
CREATE PROCEDURE SP_Tambah_Perkuliahan(IN p_NIM CHAR(10), IN p_Kode_MK CHAR(10), IN p_Kehadiran DECIMAL(5,2), IN p_Nilai_Bobot CHAR(2), IN p_Nilai_Angka DECIMAL(5,2), IN p_Poin INT)
BEGIN
    INSERT INTO perkuliahan(NIM, Kode_MK, Kehadiran, Nilai_Bobot, Nilai_Angka, Poin)
    VALUES (p_NIM, p_Kode_MK, p_Kehadiran, p_Nilai_Bobot, p_Nilai_Angka, p_Poin);
END $$
DELIMITER ;

-- SELECT --
DELIMITER $$
CREATE PROCEDURE SP_Query_Perkuliahan(IN p_NIM CHAR(10), IN p_Kode_MK CHAR(10))
BEGIN
    SELECT * FROM perkuliahan WHERE NIM = p_NIM AND Kode_MK = p_Kode_MK;
END $$
DELIMITER ;

-- UPDATE --
DELIMITER $$
CREATE PROCEDURE SP_Update_Perkuliahan(IN p_NIM CHAR(10), IN p_Kode_MK CHAR(10), IN p_Nilai_Angka DECIMAL(5,2), IN p_Nilai_Bobot CHAR(2))
BEGIN
    UPDATE perkuliahan 
    SET Nilai_Angka = p_Nilai_Angka, Nilai_Bobot = p_Nilai_Bobot
    WHERE NIM = p_NIM AND Kode_MK = p_Kode_MK;
END $$
DELIMITER ;

-- DELETE --
DELIMITER $$
CREATE PROCEDURE SP_Delete_Perkuliahan(IN p_NIM CHAR(10), IN p_Kode_MK CHAR(10))
BEGIN
    DELETE FROM perkuliahan WHERE NIM = p_NIM AND Kode_MK = p_Kode_MK;
END $$
DELIMITER ;
