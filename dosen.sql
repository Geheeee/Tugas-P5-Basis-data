SELECT * FROM akademik.dosen;

SELECT * FROM Dosen 
WHERE Nip IN ('0429038801', '0429038818');

INSERT INTO Dosen(Nip, Nama_Dosen) 
VALUES ('0429038801', 'Mariana, S.Kom., MMSI.'), 
       ('0429038818', 'Gehee, S.Kom., MMSI.');
       
UPDATE Dosen SET Nama_Dosen = 'Geheeee, S.king., MMSI.' WHERE Nip = '0429038818';

DELETE FROM Dosen 
WHERE Nip = '0429038801';	

-- INSERT --
DELIMITER $$
CREATE PROCEDURE SP_Tambah_Dosen(IN p_Nip CHAR(10), IN p_Nama_Dosen VARCHAR(100))
BEGIN
    INSERT INTO Dosen(Nip, Nama_Dosen) 
    VALUES (p_Nip, p_Nama_Dosen);
END $$
DELIMITER ;

-- SELECT --
DELIMITER $$
CREATE PROCEDURE SP_Query_Dosen(IN p_Nip CHAR(10))
BEGIN
    SELECT * FROM Dosen WHERE Nip = p_Nip;
END $$
DELIMITER ;

-- UPDATE --
DELIMITER $$
CREATE PROCEDURE SP_Update_Dosen(IN p_Nip CHAR(10), IN p_Nama_Dosen VARCHAR(100))
BEGIN
    UPDATE Dosen SET Nama_Dosen = p_Nama_Dosen WHERE Nip = p_Nip;
END $$
DELIMITER ;

-- DELETE --
DELIMITER $$
CREATE PROCEDURE SP_Delete_Dosen(IN p_Nip CHAR(10))
BEGIN
    DELETE FROM Dosen WHERE Nip = p_Nip;
END $$
DELIMITER ;





       