CREATE DATABASE Nilai_Semester_Devin
use Nilai_Semester_Devin


create table Demograpic_Mahasiswa(
ID_Binusian varchar (20) check(ID_Binusian like 'BN[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
NIM_Mahasiswa varchar (20) primary key check(NIM_Mahasiswa like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
nama_panjang varchar(50),
jenis_kelamin varchar(15) check(jenis_kelamin = 'Male' or jenis_kelamin = 'Female')
)

create table Nilai_Semester_2(
NIM_Mahasiswa varchar(20) foreign key references Demograpic_Mahasiswa on update cascade,
Kode_Matkul varchar(15) primary key check(Kode_Matkul like '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
Nama_Matkul varchar(30),
Kode_Kelas varchar(10) check(Kode_Kelas like 'L[A-Z][0-9][0-9]'),
Nilai int
)

create table Nilai_Semester_3(
NIM_Mahasiswa varchar(20) foreign key references Demograpic_Mahasiswa on update cascade,
Kode_Matkul varchar(15) primary key check(Kode_Matkul like '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
Nama_Matkul varchar(30),
Kode_Kelas varchar(10) check(Kode_Kelas like 'L[A-Z][0-9][0-9]'),
Nilai int
)

create table Nilai_Semester_4(
NIM_Mahasiswa varchar(20) foreign key references Demograpic_Mahasiswa on update cascade,
Kode_Matkul varchar(15) primary key check(Kode_Matkul like '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
Nama_Matkul varchar(30),
Kode_Kelas varchar(10) check(Kode_Kelas like 'L[A-Z][0-9][0-9]'),
Nilai int
)

Insert into Demograpic_Mahasiswa (ID_Binusian,NIM_Mahasiswa,nama_panjang,jenis_kelamin)
values('BN123585741','2502137431','Muhammad Devin Ardiansyah','Male')

insert into Nilai_Semester_2 (NIM_Mahasiswa,Kode_Matkul,Nama_Matkul,Kode_Kelas,Nilai)
values('2502137431','COMM8006005','Business Communication','LC21','65'),
('2502137431','ECON6099005','Business Economics','LC21','71'),
('2502137431','ISYS6181003','Management Information Systems for Leader','LA21','90'),
('2502137431','MATH6176005','Business Mathematics','LA21','80'),
('2502137431','MGMT6011003','Introduction to Management and Business
','LA16','66'),
('2502137431','MGMT6012005','Human Resources Management','LG28','75'),
('2502137431','MKGT8005005','Marketing Management','LC24','77')

insert into Nilai_Semester_3 (NIM_Mahasiswa,Kode_Matkul,Nama_Matkul,Kode_Kelas,Nilai)
values('2502137431','ACCT6351005','Accounting For Business','LB21','85'),
('2502137431','BUSS6066005','Business Ethics','LA30','80'),
('2502137431','FINC6001005','Financial Management','LB21','75'),
('2502137431','LAWS6159005','Legal Aspect in Business','LB21','83'),
('2502137431','MGMT6297005','Operation Management','LB30','61'),
('2502137431','MGMT6357005','Multinational Corporation Management','LB21','75'),
('2502137431','STAT8067005','Business Statistic 1','LB30','82')

insert into Nilai_Semester_4 (NIM_Mahasiswa,Kode_Matkul,Nama_Matkul,Kode_Kelas,Nilai)
values('2502137431','ENTR6510005','Entrepreneurship: Prototyping','LC30','88'),
('2502137431','ISYS6079005','E-Business Systems','LA21','90'),
('2502137431','ISYS6084005','Database','LA21','75'),
('2502137431','MGMT6358005','Managing Business Information','LB21','73'),
('2502137431','MGMT6374005','Analysis on E-Business Investment','LA21','61')


--Menentukan Grade berdasarkan Nilai menggunakan case statement
select NIM_Mahasiswa, Nama_Matkul, Nilai,
	CASE 
		WHEN Nilai between 90 and 100 THEN 'A'
		WHEN Nilai between 85 and 89 THEN 'A-'
		WHEN Nilai between 80 and 84 THEN 'B+'
		WHEN Nilai between 75 and 79 THEN 'B'
		WHEN Nilai between 70 and 74 THEN 'B-'
		WHEN Nilai between 65 and 69 THEN 'C'
		WHEN Nilai between 50 and 64 THEN 'D'
		WHEN Nilai between 0 and 49 THEN 'E'
		ELSE 'F'
		END AS Grade
from Nilai_Semester_2
order by Grade 

select NIM_Mahasiswa, Nama_Matkul, Nilai,
	CASE 
		WHEN Nilai between 90 and 100 THEN 'A'
		WHEN Nilai between 85 and 89 THEN 'A-'
		WHEN Nilai between 80 and 84 THEN 'B+'
		WHEN Nilai between 75 and 79 THEN 'B'
		WHEN Nilai between 70 and 74 THEN 'B-'
		WHEN Nilai between 65 and 69 THEN 'C'
		WHEN Nilai between 50 and 64 THEN 'D'
		WHEN Nilai between 0 and 49 THEN 'E'
		ELSE 'F'
		END AS Grade
from Nilai_Semester_3
order by Grade

select Nilai_Semester_4.NIM_Mahasiswa, Nilai,
	CASE 
		WHEN Nilai between 90 and 100 THEN 'A'
		WHEN Nilai between 85 and 89 THEN 'A-'
		WHEN Nilai between 80 and 84 THEN 'B+'
		WHEN Nilai between 75 and 79 THEN 'B'
		WHEN Nilai between 70 and 74 THEN 'B-'
		WHEN Nilai between 65 and 69 THEN 'C'
		WHEN Nilai between 50 and 64 THEN 'D'
		WHEN Nilai between 0 and 49 THEN 'E'
		ELSE 'F'
		END AS Grade 
from Nilai_Semester_4

/* Melakukan Pencarian nilai jelek. Karena di semester 4 tidak ada nilai yang <= 65 maka outputnya tidak muncul */ 
Select Nilai_Semester_2.NIM_Mahasiswa,nama_panjang,Nama_Matkul,Nilai as Nilai_Jelek
FROM Nilai_Semester_2
join Demograpic_Mahasiswa on Nilai_Semester_2.NIM_Mahasiswa = Demograpic_Mahasiswa.NIM_Mahasiswa
GROUP By Nilai_Semester_2.NIM_Mahasiswa,nama_panjang,Nama_Matkul,Nilai
Having Nilai <= 65
order by Nilai desc

Select Nilai_Semester_3.NIM_Mahasiswa,nama_panjang,Nama_Matkul,Nilai as Nilai_Jelek
FROM Nilai_Semester_3
join Demograpic_Mahasiswa on Nilai_Semester_3.NIM_Mahasiswa = Demograpic_Mahasiswa.NIM_Mahasiswa
GROUP By Nilai_Semester_3.NIM_Mahasiswa,nama_panjang,Nama_Matkul,Nilai
Having Nilai <= 65
order by Nilai desc

Select Nilai_Semester_4.NIM_Mahasiswa,nama_panjang,Nama_Matkul,Nilai as Nilai_Jelek
FROM Nilai_Semester_4
join Demograpic_Mahasiswa on Nilai_Semester_4.NIM_Mahasiswa = Demograpic_Mahasiswa.NIM_Mahasiswa
GROUP By Nilai_Semester_4.NIM_Mahasiswa,nama_panjang,Nama_Matkul,Nilai
Having Nilai <= 65
order by Nilai desc




/*Mengubah panjang data yang awalnya 30 menjadi 50. Agar nama matakuliah bisa masuk semua
alter table Nilai_Semester_2,3,4
alter column Nama_Matkul varchar(50)*/

/* Melakukan perubahan karena pemasukan data yang salah yang awal 7 menjadi 77  dan 61 menjadi 79
update Nilai_Semester_2
set Nilai = 77
where Kode_Matkul = 'MKGT8005005' 

update Nilai_Semester_4
set Nilai = 79
where Nama_Matkul = 'Analysis on E-Business Investment'*/


select *from Demograpic_Mahasiswa
select *from Nilai_Semester_2
select *from Nilai_Semester_3
select *from Nilai_Semester_4 

