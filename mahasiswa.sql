SELECT * FROM akademik.mahasiswa;

INSERT INTO mahasiswa(NIM, Nama_Mhs, Tgl_Lahir, Alamat, Jenis_Kelamin, IPK) 
VALUES ('202307010', 'Gardavi nabhan gussasy', '2005-08-11', 'Isekai', 'Laki-Laki', '4.0'),
		('202307020', 'Geheeee', '2004-07-11', 'Isekai', 'Laki-Laki', '3.6');
        
UPDATE Mahasiswa set IPK = '4.0'
WHERE NIM = '202307020';

DELETE FROM Mahasiswa
WHERE NIM = “202307010”;

USE akademik;

ALTER TABLE mahasiswa
ADD COLUMN Lulus char(15) DEFAULT NULL;

SET SQL_SAFE_UPDATES = 0;


UPDATE mahasiswa
SET Lulus = CASE
    WHEN IPK BETWEEN 3.51 AND 4.00 THEN 'Sangat bagus'
    WHEN IPK BETWEEN 3.01 AND 3.50 THEN 'Bagus'
    WHEN IPK BETWEEN 2.01 AND 3.00 THEN 'Lumayan'
    ELSE 'LULUS'
END;

-- INSERT --
DELIMITER $$
CREATE PROCEDURE SP_Tambah_Mahasiswa(IN p_NIM CHAR(10), IN p_Nama_Mhs VARCHAR(100), IN p_Tgl_Lahir DATE, IN p_Alamat VARCHAR(255), IN p_Jenis_Kelamin CHAR(10), IN p_IPK DECIMAL(3,2))
BEGIN
    INSERT INTO mahasiswa(NIM, Nama_Mhs, Tgl_Lahir, Alamat, Jenis_Kelamin, IPK)
    VALUES (p_NIM, p_Nama_Mhs, p_Tgl_Lahir, p_Alamat, p_Jenis_Kelamin, p_IPK);
END $$
DELIMITER ;

-- SELECT --
DELIMITER $$
CREATE PROCEDURE SP_Query_Mahasiswa(IN p_Nim CHAR(10))
BEGIN
    SELECT * FROM mahasiswa WHERE NIM = p_Nim;
END $$
DELIMITER ;

-- UPDATE --
DELIMITER $$
CREATE PROCEDURE SP_Update_Mahasiswa(IN p_Nim CHAR(10), IN p_IPK DECIMAL(3,2))
BEGIN
    UPDATE mahasiswa SET IPK = p_IPK WHERE NIM = p_Nim;
END $$
DELIMITER ;

-- DELETE --
DELIMITER $$
CREATE PROCEDURE SP_Delete_Mahasiswa(IN p_Nim CHAR(10))
BEGIN
    DELETE FROM mahasiswa WHERE Nim = p_Nim;
END $$
DELIMITER ;





