ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER userdba IDENTIFIED BY "123";
GRANT dba TO userdba;
GRANT CONNECT TO userdba;
GRANT SELECT ANY DICTIONARY TO userdba;
GRANT ALL PRIVILEGES TO userdba;

--DROP TABLE PROJECT_NHANSU cascade constraints;
--DROP TABLE PROJECT_SINHVIEN cascade constraints;
--DROP TABLE PROJECT_DONVI cascade constraints;
--DROP TABLE PROJECT_HOCPHAN cascade constraints;
--DROP TABLE PROJECT_KHMO cascade constraints;
--DROP TABLE PROJECT_PHANCONG cascade constraints;
--DROP TABLE PROJECT_DANGKY cascade constraints;

--------------------------------------------------------------------------------
-- Create table
CREATE TABLE PROJECT_NHANSU (
    MANV VARCHAR2(10) PRIMARY KEY,
    HOTEN VARCHAR2(100),
    PHAI VARCHAR2(5),
    NGSINH DATE,
    PHUCAP NUMBER,
    DT VARCHAR2(20),
    VAITRO VARCHAR2(50),
    MADV VARCHAR2(10)
);

CREATE TABLE PROJECT_SINHVIEN (
    MASV VARCHAR2(10) PRIMARY KEY,
    HOTEN VARCHAR2(100),
    PHAI VARCHAR2(5),
    NGSINH DATE,
    DCHI VARCHAR2(200),
    DT VARCHAR2(20),
    MACT VARCHAR2(10),
    MANGANH VARCHAR2(10),
    SOTCTL NUMBER,
    DTBTL NUMBER
);

CREATE TABLE PROJECT_DONVI (
    MADV VARCHAR2(10) PRIMARY KEY,
    TENDV VARCHAR2(100),
    TRGDV VARCHAR2(10)
);

CREATE TABLE PROJECT_HOCPHAN (
    MAHP VARCHAR2(10) PRIMARY KEY,
    TENHP VARCHAR2(100),
    SOTC NUMBER,
    STLT NUMBER,
    STTH NUMBER,
    SOSVTD NUMBER,
    MADV VARCHAR2(10)
);

CREATE TABLE PROJECT_KHMO (
    MAHP VARCHAR2(10),
    HK NUMBER,
    NAM NUMBER,
    MACT VARCHAR2(10),
    PRIMARY KEY (MAHP, HK, NAM, MACT)
);

CREATE TABLE PROJECT_PHANCONG (
    MAGV VARCHAR2(10),
    MAHP VARCHAR2(10),
    HK NUMBER,
    NAM NUMBER,
    MACT VARCHAR2(10),
    PRIMARY KEY (MAGV, MAHP, HK, NAM, MACT)
);

CREATE TABLE PROJECT_DANGKY (
    MASV VARCHAR2(10),
    MAGV VARCHAR2(10),
    MAHP VARCHAR2(10),
    HK NUMBER,
    NAM NUMBER,
    MACT VARCHAR2(10),
    DIEMTH NUMBER,
    DIEMQT NUMBER,
    DIEMCK NUMBER,
    DIEMTK NUMBER,
    PRIMARY KEY (MASV, MAGV, MAHP, HK, NAM, MACT)
);

--------------------------------------------------------------------------------
-- Them khoa ngoai
ALTER TABLE PROJECT_NHANSU
ADD CONSTRAINT FK_NHANSU_DONVI FOREIGN KEY (MADV) REFERENCES PROJECT_DONVI(MADV);

ALTER TABLE PROJECT_DONVI
ADD CONSTRAINT FK_DONVI_NHANSU FOREIGN KEY (TRGDV) REFERENCES PROJECT_NHANSU(MANV);

ALTER TABLE PROJECT_HOCPHAN
ADD CONSTRAINT FK_HOCPHAN_DONVI FOREIGN KEY (MADV) REFERENCES PROJECT_DONVI(MADV);

ALTER TABLE PROJECT_KHMO
ADD CONSTRAINT FK_KHMO_HOCPHAN FOREIGN KEY (MAHP) REFERENCES PROJECT_HOCPHAN(MAHP);

ALTER TABLE PROJECT_PHANCONG
ADD CONSTRAINT FK_PHANCONG_NHANSU FOREIGN KEY (MAGV) REFERENCES PROJECT_NHANSU(MANV);
ALTER TABLE PROJECT_PHANCONG
ADD CONSTRAINT FK_PHANCONG_KHMO FOREIGN KEY (MAHP, HK, NAM, MACT) REFERENCES PROJECT_KHMO(MAHP, HK, NAM, MACT);

ALTER TABLE PROJECT_DANGKY
ADD CONSTRAINT FK_DANGKY_SINHVIEN FOREIGN KEY (MASV) REFERENCES PROJECT_SINHVIEN(MASV);
ALTER TABLE PROJECT_DANGKY
ADD CONSTRAINT FK_DANGKY_PHANCONG FOREIGN KEY (MAGV, MAHP, HK, NAM, MACT) REFERENCES PROJECT_PHANCONG(MAGV, MAHP, HK, NAM, MACT);

--------------------------------------------------------------------------------
-- Insert data
----DONVI----
INSERT INTO PROJECT_DONVI (MADV, TENDV, TRGDV) VALUES('DV001', 'Văn phòng khoa', NULL);
INSERT INTO PROJECT_DONVI (MADV, TENDV, TRGDV) VALUES('DV002', 'Bộ môn HTTT', NULL);
INSERT INTO PROJECT_DONVI (MADV, TENDV, TRGDV) VALUES('DV003', 'Bộ môn CNPM', NULL);
INSERT INTO PROJECT_DONVI (MADV, TENDV, TRGDV) VALUES('DV004', 'Bộ môn KHMT', NULL);
INSERT INTO PROJECT_DONVI (MADV, TENDV, TRGDV) VALUES('DV005', 'Bộ môn CNTT', NULL);
INSERT INTO PROJECT_DONVI (MADV, TENDV, TRGDV) VALUES('DV006', 'Bộ môn TGMT', NULL);    
INSERT INTO PROJECT_DONVI (MADV, TENDV, TRGDV) VALUES('DV007', 'Bộ môn MMT và Viễn thông', NULL);

----NHANSU----
INSERT INTO PROJECT_NHANSU VALUES('NV001', 'Nguyễn Văn A', 'Nam', TO_DATE('1990-05-20', 'YYYY-MM-DD'), 3000000, '0123456789', 'Nhân viên cơ bản', 'DV001');
INSERT INTO PROJECT_NHANSU VALUES('NV002', 'Trần Thị B', 'Nữ', TO_DATE('1992-10-15', 'YYYY-MM-DD'), 2500000, '0987654321', 'Nhân viên cơ bản', 'DV001');
INSERT INTO PROJECT_NHANSU VALUES('NV003', 'Phạm Văn C', 'Nam', TO_DATE('1985-12-08', 'YYYY-MM-DD'), 3500000, '0369852147', 'Nhân viên cơ bản', 'DV002');
INSERT INTO PROJECT_NHANSU VALUES('NV004', 'Hoàng Thị D', 'Nữ', TO_DATE('1988-03-25', 'YYYY-MM-DD'), 3200000, '0587412369', 'Nhân viên cơ bản', 'DV003');
INSERT INTO PROJECT_NHANSU VALUES('NV005', 'Lê Văn E', 'Nam', TO_DATE('1975-08-12', 'YYYY-MM-DD'), 4000000, '0236589741', 'Nhân viên cơ bản', 'DV001');
INSERT INTO PROJECT_NHANSU VALUES('NV006', 'Nguyễn Thu F', 'Nữ', TO_DATE('1980-06-30', 'YYYY-MM-DD'), 3000000, '0987456321', 'Nhân viên cơ bản', 'DV002');
INSERT INTO PROJECT_NHANSU VALUES('NV007', 'Trần Văn G', 'Nam', TO_DATE('1970-02-14', 'YYYY-MM-DD'), 4500000, '0368741592', 'Nhân viên cơ bản', 'DV003');
INSERT INTO PROJECT_NHANSU VALUES('NV008', 'Lê Thị H', 'Nữ', TO_DATE('1978-11-18', 'YYYY-MM-DD'), 3800000, '0246853719', 'Nhân viên cơ bản', 'DV002');
INSERT INTO PROJECT_NHANSU VALUES('NV009', 'Phan Văn I', 'Nam', TO_DATE('1995-09-05', 'YYYY-MM-DD'), 2800000, '0975316842', 'Nhân viên cơ bản', 'DV003');
INSERT INTO PROJECT_NHANSU VALUES('NV010', 'Nguyễn Thi K', 'Nữ', TO_DATE('1998-04-03', 'YYYY-MM-DD'), 2600000, '0315478963', 'Nhân viên cơ bản', 'DV002');

INSERT INTO PROJECT_NHANSU VALUES ('NV011', 'Nguyễn Văn A', 'Nam', TO_DATE('1980-01-01', 'YYYY-MM-DD'), 6600000, '0123456789', 'Giảng viên', 'DV002');
INSERT INTO PROJECT_NHANSU VALUES ('NV012', 'Trần Thị B', 'Nữ', TO_DATE('1981-02-02', 'YYYY-MM-DD'), 8300000, '0123456789', 'Giảng viên', 'DV002');
INSERT INTO PROJECT_NHANSU VALUES ('NV013', 'Phạm Văn C', 'Nam', TO_DATE('1982-03-03', 'YYYY-MM-DD'), 4600000, '0123456789', 'Giảng viên', 'DV002');
INSERT INTO PROJECT_NHANSU VALUES ('NV014', 'Hoàng Thị D', 'Nữ', TO_DATE('1983-04-04', 'YYYY-MM-DD'), 8700000, '0123456789', 'Giảng viên', 'DV002');
INSERT INTO PROJECT_NHANSU VALUES ('NV015', 'Lê Văn E', 'Nam', TO_DATE('1984-05-05', 'YYYY-MM-DD'), 7800000, '0123456789', 'Giảng viên', 'DV002');
INSERT INTO PROJECT_NHANSU VALUES ('NV016', 'Nguyễn Thị F', 'Nữ', TO_DATE('1985-06-06', 'YYYY-MM-DD'), 4500000, '0123456789', 'Giảng viên', 'DV002');
INSERT INTO PROJECT_NHANSU VALUES ('NV017', 'Trần Văn G', 'Nam', TO_DATE('1986-07-07', 'YYYY-MM-DD'), 6400000, '0123456789', 'Giảng viên', 'DV002');
INSERT INTO PROJECT_NHANSU VALUES ('NV018', 'Phạm Thị H', 'Nữ', TO_DATE('1987-08-08', 'YYYY-MM-DD'), 4300000, '0123456789', 'Giảng viên', 'DV002');
INSERT INTO PROJECT_NHANSU VALUES ('NV019', 'Hoàng Văn I', 'Nam', TO_DATE('1988-09-09', 'YYYY-MM-DD'), 6500000, '0123456789', 'Giảng viên', 'DV002');
INSERT INTO PROJECT_NHANSU VALUES ('NV020', 'Lê Thị K', 'Nữ', TO_DATE('1989-10-10', 'YYYY-MM-DD'), 7500000, '0123456789', 'Giảng viên', 'DV002');

INSERT INTO PROJECT_NHANSU VALUES ('NV021', 'Nguyễn Văn L', 'Nam', TO_DATE('1970-11-11', 'YYYY-MM-DD'), 7500000, '0987654321', 'Giáo vụ', 'DV001');
INSERT INTO PROJECT_NHANSU VALUES ('NV022', 'Trần Thị M', 'Nữ', TO_DATE('1971-12-12', 'YYYY-MM-DD'), 4800000, '0987654321', 'Giáo vụ', 'DV001');
INSERT INTO PROJECT_NHANSU VALUES ('NV023', 'Phạm Văn N', 'Nam', TO_DATE('1972-01-01', 'YYYY-MM-DD'), 5400000, '0987654321', 'Giáo vụ', 'DV001');
INSERT INTO PROJECT_NHANSU VALUES ('NV024', 'Hoàng Thị O', 'Nữ', TO_DATE('1973-02-02', 'YYYY-MM-DD'), 3400000, '0987654321', 'Giáo vụ', 'DV001');
INSERT INTO PROJECT_NHANSU VALUES ('NV025', 'Lê Văn P', 'Nam', TO_DATE('1974-03-03', 'YYYY-MM-DD'), 7600000, '0987654321', 'Giáo vụ', 'DV001');
INSERT INTO VNHANSU VALUES ('NV026', 'Nguyễn Thị Q', 'Nữ', TO_DATE('1975-04-04', 'YYYY-MM-DD'), 3500000, '0987654321', 'Giáo vụ', 'DV001');
INSERT INTO PROJECT_NHANSU VALUES ('NV027', 'Trần Văn R', 'Nam', TO_DATE('1976-05-05', 'YYYY-MM-DD'), 7500000, '0987654321', 'Giáo vụ', 'DV001');
INSERT INTO PROJECT_NHANSU VALUES ('NV028', 'Phạm Thị S', 'Nữ', TO_DATE('1977-06-06', 'YYYY-MM-DD'), 3400000, '0987654321', 'Giáo vụ', 'DV001');
INSERT INTO PROJECT_NHANSU VALUES ('NV029', 'Hoàng Văn T', 'Nam', TO_DATE('1978-07-07', 'YYYY-MM-DD'), 4400000, '0987654321', 'Giáo vụ', 'DV001');
INSERT INTO PROJECT_NHANSU VALUES ('NV030', 'Lê Thị U', 'Nữ', TO_DATE('1979-08-08', 'YYYY-MM-DD'), 4700000, '0987654321', 'Giáo vụ', 'DV001');

INSERT INTO PROJECT_NHANSU VALUES ('NV031', 'Nguyễn Văn X', 'Nam', TO_DATE('1960-01-01', 'YYYY-MM-DD'), 9900000, '0369852147', 'Trưởng đơn vị', 'DV002');
INSERT INTO PROJECT_NHANSU VALUES ('NV032', 'Trần Thị Y', 'Nữ', TO_DATE('1961-02-02', 'YYYY-MM-DD'), 7800000, '0369852147', 'Trưởng đơn vị', 'DV003');
INSERT INTO PROJECT_NHANSU VALUES ('NV033', 'Phạm Văn Z', 'Nam', TO_DATE('1962-03-03', 'YYYY-MM-DD'), 8900000, '0369852147', 'Trưởng đơn vị', 'DV004');
INSERT INTO PROJECT_NHANSU VALUES ('NV034', 'Hoàng Thị A', 'Nữ', TO_DATE('1963-04-04', 'YYYY-MM-DD'), 8700000, '0369852147', 'Trưởng đơn vị', 'DV005');
INSERT INTO PROJECT_NHANSU VALUES ('NV035', 'Lê Văn B', 'Nam', TO_DATE('1964-05-05', 'YYYY-MM-DD'), 7800000, '0369852147', 'Trưởng đơn vị', 'DV006');
INSERT INTO PROJECT_NHANSU VALUES ('NV036', 'Nguyễn Thị C', 'Nữ', TO_DATE('1965-06-06', 'YYYY-MM-DD'), 9700000, '0369852147', 'Trưởng đơn vị', 'DV007');

INSERT INTO PROJECT_NHANSU VALUES ('NV037', 'Trần Văn Dũng', 'Nam', TO_DATE('1955-01-01', 'YYYY-MM-DD'), 10000000, '0987456321', 'Trưởng khoa', 'DV001');

----ALTER DONVI----
UPDATE PROJECT_DONVI SET TRGDV = 'NV037' WHERE MADV = 'DV001';
UPDATE PROJECT_DONVI SET TRGDV = 'NV031' WHERE MADV = 'DV002';
UPDATE PROJECT_DONVI SET TRGDV = 'NV032' WHERE MADV = 'DV003';
UPDATE PROJECT_DONVI SET TRGDV = 'NV033' WHERE MADV = 'DV004';
UPDATE PROJECT_DONVI SET TRGDV = 'NV034' WHERE MADV = 'DV005';
UPDATE PROJECT_DONVI SET TRGDV = 'NV035' WHERE MADV = 'DV006';
UPDATE PROJECT_DONVI SET TRGDV = 'NV036' WHERE MADV = 'DV007';

----SINHVIEN----
INSERT INTO PROJECT_SINHVIEN VALUES ('SV001', 'Trần Văn A', 'Nam', TO_DATE('1999-01-01', 'YYYY-MM-DD'), '123  ?ư ?ng ABC, Quận XYZ, Thành phố HCM', '0123456789', 'CTTT', 'KHMT', 90, 8.5);
INSERT INTO PROJECT_SINHVIEN VALUES ('SV002', 'Nguyễn Thị B', 'Nữ', TO_DATE('1998-02-02', 'YYYY-MM-DD'), '456  ?ư ?ng DEF, Quận UVW, Thành phố HCM', '0987654321', 'CQ', 'CNSH', 85, 8.7);
INSERT INTO PROJECT_SINHVIEN VALUES ('SV003', 'Lê Văn C', 'Nam', TO_DATE('1999-03-03', 'YYYY-MM-DD'), '789  ?ư ?ng GHI, Quận MNO, Thành phố HCM', '0369852147', 'CTTT', 'MMT', 88, 8.3);
INSERT INTO PROJECT_SINHVIEN VALUES ('SV004', 'Phạm Thị D', 'Nữ', TO_DATE('1997-04-04', 'YYYY-MM-DD'), '012  ?ư ?ng JKL, Quận PQR, Thành phố HCM', '0587412369', 'CLC', 'VLYK', 92, 9.0);
INSERT INTO PROJECT_SINHVIEN VALUES ('SV005', 'Hoàng Văn E', 'Nam', TO_DATE('1998-05-05', 'YYYY-MM-DD'), '345  ?ư ?ng STU, Quận XYZ, Thành phố HCM', '0236589741', 'CTTT', 'HTTT', 86, 8.6);
INSERT INTO PROJECT_SINHVIEN VALUES ('SV006', 'Trần Thị F', 'Nữ', TO_DATE('1999-06-06', 'YYYY-MM-DD'), '678  ?ư ?ng VWX, Quận DEF, Thành phố HCM', '0987456321', 'CQ', 'ATTT', 89, 8.9);
INSERT INTO PROJECT_SINHVIEN VALUES ('SV007', 'Lê Văn G', 'Nam', TO_DATE('1997-07-07', 'YYYY-MM-DD'), '901  ?ư ?ng YZ, Quận ABC, Thành phố HCM', '0368741592', 'CLC', 'CNTT', 91, 8.8);
INSERT INTO PROJECT_SINHVIEN VALUES ('SV008', 'Nguyễn Thị H', 'Nữ', TO_DATE('1999-08-08', 'YYYY-MM-DD'), '234  ?ư ?ng KLM, Quận MNO, Thành phố HCM', '0246853719', 'CQ', 'CNPM', 87, 8.4);
INSERT INTO PROJECT_SINHVIEN VALUES ('SV009', 'Phan Văn I', 'Nam', TO_DATE('1998-09-09', 'YYYY-MM-DD'), '567  ?ư ?ng NOP, Quận PQR, Thành phố HCM', '0975316842', 'CTTT', 'HHC', 93, 8.2);
INSERT INTO PROJECT_SINHVIEN VALUES ('SV010', 'Nguyễn Thị K', 'Nữ', TO_DATE('1999-10-10', 'YYYY-MM-DD'), '890  ?ư ?ng QRS, Quận TUV, Thành phố HCM', '0315478963', 'CLC', 'MMT', 94, 9.1);

----HOCPHAN----
INSERT INTO PROJECT_HOCPHAN VALUES ('HP001', 'Lập trình C', 3, 30, 15, 50, 'DV002');
INSERT INTO PROJECT_HOCPHAN VALUES ('HP002', 'Toán cao cấp', 4, 40, 20, 60, 'DV003');
INSERT INTO PROJECT_HOCPHAN VALUES ('HP003', 'Cấu trúc dữ liệu và giải thuật', 3, 30, 15, 50, 'DV004');
INSERT INTO PROJECT_HOCPHAN VALUES ('HP004', 'Mạng máy tính', 3, 30, 15, 50, 'DV005');
INSERT INTO PROJECT_HOCPHAN VALUES ('HP005', 'Hệ đi ?u hành', 3, 30, 15, 50, 'DV006');
INSERT INTO PROJECT_HOCPHAN VALUES ('HP006', 'Cơ sở dữ liệu', 3, 30, 15, 50, 'DV007');
INSERT INTO PROJECT_HOCPHAN VALUES ('HP007', 'Trí tuệ nhân tạo', 3, 30, 15, 50, 'DV002');
INSERT INTO PROJECT_HOCPHAN VALUES ('HP008', 'Xử lý ngôn ngữ tự nhiên', 3, 30, 15, 50, 'DV003');
INSERT INTO PROJECT_HOCPHAN VALUES ('HP009', 'An toàn và bảo mật thông tin', 3, 30, 15, 50, 'DV004');
INSERT INTO PROJECT_HOCPHAN VALUES ('HP010', ' ?ồ án tốt nghiệp', 6, 60, 0, 30, 'DV005');

----KHMO----
INSERT INTO PROJECT_KHMO VALUES ('HP001', 1, 2024, 'CQ');
INSERT INTO PROJECT_KHMO VALUES ('HP002', 1, 2024, 'CLC');
INSERT INTO PROJECT_KHMO VALUES ('HP003', 1, 2024, 'CQ');
INSERT INTO PROJECT_KHMO VALUES ('HP004', 1, 2024, 'CTTT');
INSERT INTO PROJECT_KHMO VALUES ('HP005', 1, 2024, 'CQ');
INSERT INTO PROJECT_KHMO VALUES ('HP006', 1, 2024, 'CLC');
INSERT INTO PROJECT_KHMO VALUES ('HP007', 1, 2024, 'CTTT');
INSERT INTO PROJECT_KHMO VALUES ('HP008', 1, 2024, 'CQ');
INSERT INTO PROJECT_KHMO VALUES ('HP009', 1, 2024, 'CLC');
INSERT INTO PROJECT_KHMO VALUES ('HP010', 1, 2024, 'CQ');

----PHANCONG----
INSERT INTO PROJECT_PHANCONG VALUES ('NV001', 'HP001', 1, 2024, 'CQ');
INSERT INTO PROJECT_PHANCONG VALUES ('NV002', 'HP002', 1, 2024, 'CLC');
INSERT INTO PROJECT_PHANCONG VALUES ('NV003', 'HP003', 1, 2024, 'CQ');
INSERT INTO PROJECT_PHANCONG VALUES ('NV004', 'HP004', 1, 2024, 'CTTT');
INSERT INTO PROJECT_PHANCONG VALUES ('NV005', 'HP005', 1, 2024, 'CQ');
INSERT INTO PROJECT_PHANCONG VALUES ('NV006', 'HP006', 1, 2024, 'CLC');
INSERT INTO PROJECT_PHANCONG VALUES ('NV007', 'HP007', 1, 2024, 'CTTT');
INSERT INTO PROJECT_PHANCONG VALUES ('NV008', 'HP008', 1, 2024, 'CQ');
INSERT INTO PROJECT_PHANCONG VALUES ('NV009', 'HP009', 1, 2024, 'CLC');
INSERT INTO PROJECT_PHANCONG VALUES ('NV010', 'HP010', 1, 2024, 'CQ');

----DANGKY----
INSERT INTO PROJECT_DANGKY VALUES ('SV001', 'NV001', 'HP001', 1, 2024, 'CQ', 8.5, 8.7, 9.0, 8.7);
INSERT INTO PROJECT_DANGKY VALUES ('SV002', 'NV002', 'HP002', 1, 2024, 'CLC', 8.7, 8.9, 9.2, 8.9);
INSERT INTO PROJECT_DANGKY VALUES ('SV003', 'NV003', 'HP003', 1, 2024, 'CQ', 8.3, 8.5, 8.8, 8.5);
INSERT INTO PROJECT_DANGKY VALUES ('SV004', 'NV004', 'HP004', 1, 2024, 'CTTT', 9.0, 9.2, 9.5, 9.2);
INSERT INTO PROJECT_DANGKY VALUES ('SV005', 'NV005', 'HP005', 1, 2024, 'CQ', 8.6, 8.8, 9.1, 8.8);
INSERT INTO PROJECT_DANGKY VALUES ('SV006', 'NV006', 'HP006', 1, 2024, 'CLC', 8.9, 9.1, 9.4, 9.1);
INSERT INTO PROJECT_DANGKY VALUES ('SV007', 'NV007', 'HP007', 1, 2024, 'CTTT', 8.8, 9.0, 9.3, 9.0);
INSERT INTO PROJECT_DANGKY VALUES ('SV008', 'NV008', 'HP008', 1, 2024, 'CQ', 8.4, 8.6, 8.9, 8.6);
INSERT INTO PROJECT_DANGKY VALUES ('SV009', 'NV009', 'HP009', 1, 2024, 'CLC', 8.2, 8.4, 8.7, 8.4);
INSERT INTO PROJECT_DANGKY VALUES ('SV010', 'NV010', 'HP010', 1, 2024, 'CQ', 9.1, 9.3, 9.6, 9.3);

--------------------------------------------------------------------------------
-- XEM DANH SACH CAC USERS
SELECT username FROM dba_users;

--------------------------------------------------------------------------------
-- XEM DANH SACH CAC ROLES
SELECT role FROM dba_roles;

--------------------------------------------------------------------------------
--- XEM ROLE CUA USER
CREATE OR REPLACE PROCEDURE check_role (
     p_username VARCHAR2,
     sys_rc out SYS_REFCURSOR)
IS 
BEGIN
    OPEN sys_rc FOR
        SELECT GRANTEE AS USERNAME, ROLE 
        FROM DBA_ROLES R
        LEFT JOIN DBA_ROLE_PRIVS RP ON R.ROLE = RP.GRANTED_ROLE
        WHERE GRANTEE = UPPER(p_username);
END;
/

--------------------------------------------------------------------------------
-- XEM QUYEN USER
CREATE OR REPLACE VIEW user_privileges AS (
    SELECT grantee AS username,
           granted_role AS privilege,
           '--' AS owner,
           '--' AS table_name,
           '--' AS column_name,
           admin_option AS admin_option,
           'ROLE' AS access_type
    FROM dba_role_privs RP
    JOIN dba_roles R ON RP.granted_role = R.role
    WHERE grantee IN (SELECT username FROM dba_users)

    UNION ALL

    SELECT grantee AS username,
           privilege AS privilege,
           '--' AS owner,
           '--' AS table_name,
           '--' AS column_name,
           admin_option AS admin_option,
           'SYSTEM' AS access_type
    FROM dba_sys_privs
    WHERE grantee IN (SELECT username FROM dba_users)

    UNION ALL

    SELECT grantee AS username,
           privilege AS privilege,
           owner AS owner,
           table_name AS table_name,
           '--' AS column_name,
           grantable AS admin_option,
           'TABLE' AS access_type
    FROM dba_tab_privs
    WHERE grantee IN (SELECT username FROM dba_users)

    UNION ALL

    SELECT DP.grantee AS username,
           privilege AS privilege,
           owner AS owner,
           table_name AS table_name,
           column_name AS column_name,
           '--' AS admin_option,
           'ROLE' AS access_type
    FROM role_tab_privs RP
    JOIN dba_role_privs DP ON RP.role = DP.granted_role
    WHERE DP.grantee IN (SELECT username FROM dba_users)

    UNION ALL

    SELECT grantee AS username,
           privilege AS privilege,
            owner AS owner,
           table_name AS table_name,
           column_name AS column_name,
           grantable AS grant_option,
           'COLUMN' AS access_type
    FROM dba_col_privs
    WHERE grantee IN (SELECT username FROM dba_users)
);
/
  
CREATE OR REPLACE PROCEDURE check_privilege (
     p_username VARCHAR2,
     sys_rc out SYS_REFCURSOR)
IS 
BEGIN
    OPEN sys_rc FOR
        SELECT *
        FROM user_privileges
        WHERE USERNAME = p_username or USERNAME = UPPER(p_username);
END;
/

--------------------------------------------------------------------------------
-- XEM QUYEN ROLE

CREATE OR REPLACE VIEW role_privileges AS (
    SELECT grantee AS role,
           granted_role AS privilege,
           '--' AS owner,
           '--' AS table_name,
           '--' AS column_name,
           admin_option AS admin_option,
           'ROLE' AS access_type
    FROM dba_role_privs RP
    INNER JOIN dba_roles R ON UPPER(RP.granted_role) = UPPER(R.role)
    WHERE grantee IN (SELECT role FROM dba_roles)

    UNION ALL

    SELECT grantee AS role,
           privilege AS privilege,
           '--' AS owner,
           '--' AS table_name,
           '--' AS column_name,
           admin_option AS admin_option,
           'SYSTEM' AS access_type
    FROM dba_sys_privs
    WHERE grantee IN (SELECT role FROM dba_roles)

    UNION ALL

    SELECT grantee AS role,
           privilege AS privilege,
           owner AS owner,
           table_name AS table_name,
           '--' AS column_name,
           grantable AS admin_option,
           'TABLE' AS access_type
    FROM dba_tab_privs
    WHERE grantee IN (SELECT role FROM dba_roles)

    UNION ALL

    SELECT DP.grantee AS role,
           privilege AS privilege,
           owner AS owner,
           table_name AS table_name,
           column_name AS column_name,
           '--' AS admin_option,
           'ROLE' AS access_type
    FROM role_tab_privs RP
    JOIN dba_role_privs DP ON RP.role = DP.granted_role
    WHERE DP.grantee IN (SELECT role FROM dba_roles)

    UNION ALL

    SELECT grantee AS role,
           privilege AS privilege,
           owner AS owner,
           table_name AS table_name,
           column_name AS column_name,
           grantable AS grant_option,
           'COLUMN' AS access_type
    FROM dba_col_privs
    WHERE grantee IN (SELECT role FROM dba_roles)
);
/

--- XEM QUYEN CUA ROLE
CREATE OR REPLACE PROCEDURE check_privilege_role (
     p_role VARCHAR2,
     sys_rc out SYS_REFCURSOR)
IS 
BEGIN
    OPEN sys_rc FOR
        SELECT *
        FROM role_privileges
        WHERE ROLE = UPPER(p_role);
END;
/

--------------------------------------------------------------------------------
----Tao user----
CREATE OR REPLACE PROCEDURE create_user (
    p_username VARCHAR2,
    p_password VARCHAR2
) IS
BEGIN
    EXECUTE IMMEDIATE 'ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE'; 
    EXECUTE IMMEDIATE 'CREATE  USER ' || p_username || ' IDENTIFIED BY ' || p_password;
    EXECUTE IMMEDIATE 'GRANT CONNECT TO ' || p_username;
    EXECUTE IMMEDIATE 'ALTER SESSION SET "_ORACLE_SCRIPT" = FALSE'; 
END;
/
EXEC sys.create_user ('user1', '111');

--------------------------------------------------------------------------------
----Xoa user----
CREATE OR REPLACE PROCEDURE drop_user (
    p_username VARCHAR2
) IS
BEGIN
    -- Xóa user
    EXECUTE IMMEDIATE 'ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE'; 
    EXECUTE IMMEDIATE 'DROP USER ' || p_username || ' CASCADE';
    EXECUTE IMMEDIATE 'ALTER SESSION SET "_ORACLE_SCRIPT" = FALSE'; 
END;
/
EXEC drop_user ('user3');

--------------------------------------------------------------------------------
----Tao role----
CREATE OR REPLACE PROCEDURE create_role (
    p_rolename VARCHAR2
    --p_password VARCHAR2 DEFAULT NULL
) IS
BEGIN
    -- Tạo mới role
    EXECUTE IMMEDIATE 'ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE'; 
    --IF(p_password = ' ') THEN
        EXECUTE IMMEDIATE 'CREATE  ROLE ' || p_rolename;
    --ELSE
      --  EXECUTE IMMEDIATE 'CREATE  ROLE ' || p_rolename || ' IDENTIFIED BY ' || p_password;
    --END IF;
    EXECUTE IMMEDIATE 'ALTER SESSION SET "_ORACLE_SCRIPT" = FALSE'; 
END;
/
EXEC create_role('sinhvien');

--------------------------------------------------------------------------------
----Xoa role----
CREATE OR REPLACE PROCEDURE drop_role (
    p_rolename VARCHAR2
) IS
BEGIN
    -- Xoa role
    EXECUTE IMMEDIATE 'ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE'; 
    EXECUTE IMMEDIATE 'DROP ROLE ' || p_rolename;
    EXECUTE IMMEDIATE 'ALTER SESSION SET "_ORACLE_SCRIPT" = FALSE'; 
END;
/
EXEC drop_role ('sinhvien');

--------------------------------------------------------------------------------
--Only INSERT, UPDATE, and REFERENCES privileges can be granted at the column level.
--When granting INSERT at the column level, you must include all the not null columns in the row.
----Cap quyen cho role
CREATE OR REPLACE PROCEDURE grant_permission_role (
    p_privilege VARCHAR2,
    p_tablename VARCHAR2,
    p_grantee VARCHAR2
  
) IS
BEGIN
    -- Cấp quy ?n
    IF (p_tablename = ' ') THEN
        EXECUTE IMMEDIATE 'GRANT ' || p_privilege || ' TO ' || p_grantee;
    ELSE
        EXECUTE IMMEDIATE 'GRANT ' || p_privilege || ' ON ' || p_tablename || ' TO ' || p_grantee;
    END IF;
END;
/
EXEC grant_permission_role('RESOURCE',' ','sinhvien');
EXEC grant_permission_role('sinhvien','INSERT (TENHP)','PROJECT_HOCPHAN');

--------------------------------------------------------------------------------
----Cap quyen cho user
CREATE OR REPLACE PROCEDURE grant_permission_user (
    p_privilege VARCHAR2,
    p_tablename VARCHAR2,
    p_grantee VARCHAR2,
    p_with_grant_option CHAR
) IS
BEGIN
    -- Cấp quy ?n
    EXECUTE IMMEDIATE 'ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE'; 
    IF (p_with_grant_option = '0') THEN
        IF (p_tablename = ' ') THEN
            EXECUTE IMMEDIATE 'GRANT ' || p_privilege || ' TO ' || p_grantee;
        ELSE
            EXECUTE IMMEDIATE 'GRANT ' || p_privilege || ' ON ' || p_tablename || ' TO ' || p_grantee;
        END IF;
    ELSE
        IF (p_tablename = ' ') THEN
            EXECUTE IMMEDIATE 'GRANT ' || p_privilege || ' TO ' || p_grantee || ' WITH GRANT OPTION';
        ELSE
            EXECUTE IMMEDIATE 'GRANT ' || p_privilege || ' ON ' || p_tablename || ' TO ' || p_grantee || ' WITH GRANT OPTION';
        END IF;
    END IF;
END;
/
EXEC grant_permission_user('sinhvien','test',' ', '0');
EXEC grant_permission_user('INSERT (TENHP)','test','PROJECT_HOCPHAN', 1);

--------------------------------------------------------------------------------
--Oracle does not allow revoking permissions from a specific column.
--You must revoke permissions from the entire table instead of individual columns.
----Thu hoi quyen role/user
CREATE OR REPLACE PROCEDURE revoke_permission (
    p_privilege VARCHAR2,
    p_tablename VARCHAR2,
    p_grantee VARCHAR2
) IS
BEGIN
    -- Thu hồi quy ?n hạn
    IF (p_tablename = ' ') THEN
        EXECUTE IMMEDIATE 'REVOKE ' || p_privilege || ' FROM ' || p_grantee;
    ELSE
        EXECUTE IMMEDIATE 'REVOKE ' || p_privilege || ' ON ' || p_tablename || ' FROM ' || p_grantee;
    END IF;
END;
/
EXEC revoke_permission ('SINHVIEN',' ','test');

--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE alter_role (
    p_rolename VARCHAR2,
    p_password VARCHAR2
) IS
BEGIN
    IF (p_password = ' ') THEN
        EXECUTE IMMEDIATE 'ALTER ROLE '|| p_rolename|| ' NOT IDENTIFIED';
    ELSE
        EXECUTE IMMEDIATE 'ALTER ROLE '|| p_rolename|| ' IDENTIFIED BY '|| p_password;
    END IF;
END;
/
EXEC alter_role ('sinhvien', ' ');

--------------------------------------------------------------------------------
----chinh sua user----
CREATE OR REPLACE PROCEDURE alter_user (
    p_username VARCHAR2,
    p_newpassword VARCHAR2
) IS
BEGIN
        EXECUTE IMMEDIATE 'ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE'; 
        EXECUTE IMMEDIATE 'ALTER USER '|| p_username|| ' IDENTIFIED BY '|| p_newpassword;
END;
/
EXEC alter_role ('sinhvien', '123');


CREATE OR REPLACE PROCEDURE grant_role_for_user (
    p_role VARCHAR2,
    p_user VARCHAR2
) IS
BEGIN
        EXECUTE IMMEDIATE 'GRANT ' || p_role || ' TO ' || p_user;
END;
/
EXEC grant_role_for_user ('sinhvien', 'test');


CREATE OR REPLACE PROCEDURE revoke_role_from_user (
    p_role VARCHAR2,
    p_user VARCHAR2
) IS
BEGIN
        EXECUTE IMMEDIATE 'REVOKE ' || p_role || ' FROM ' || p_user;
END;
/
EXEC revoke_role_from_user ('sinhvien','test');


