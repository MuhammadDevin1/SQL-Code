
-- Anggota Kelompok
-- Alvis Jaunata Hadi			(2502091752)	
-- Muhammad Devin Ardiansyah	(2502137431)
-- Mutiah Munawar				(2501989475)
-- Thresia Avilia Ni Putu Sekar (2502001372)

-- 
select *from Staff
insert into Staff values('STF001','Diana Lala','Female','China','081296479801','25000000.00','lala228@gmail.com' ),
						('STF002','Dina Lily','Female','Arab','081296479123','30000000.00','lili227@gmail.org' ),
						('STF003','Ahmand Lulu','Male','China','0812964783871','40000000.00','lulu229@gmail.com' ),
						('STF004','Yanuar Lele','Male','France','081296478365','90000000.00','lele230@gmail.com' ),
						('STF005','Aditya Bari','Male','Japan','081390913314','70000000.00','bari001@gmail.com' ),
						('STF006','Anwar Satria','Male','Nepal','081596478365','80000000.00','satria002@gmail.com' ),
						('STF007','Sofian Arif','Male','Laos','081396478164','40000000.00','arif003@gmail.com' ),
						('STF008','Rahma Sitomorang','Female','Indonesia','081396478145','60000000.00','rahma23@gmail.com' ),
						('STF009','Hana Nasution','Female','Arab','081396471467','40000000.00','hana26@gmail.com' ),
						('STF010','Peter Parker','Female','Thailand','081196479080','35000000.00','peter22@gmail.com' ),
						('STF011','Samuel Julias','Female','Indonesia','081592478565','25000000.00','samuel21@gmail.com' )


--
select *from Vendor
insert into Vendor values('VEN001','Muhammad Yusuf','Male','yusuf1@hotmail.com','Sweden','081979034561'),
						 ('VEN002','Asep Halim','Male','halim2@hotmail.com','France','08212347891'),
						 ('VEN003','Ahmad Hamka','Male','hamka3@gmail.com','China','0835678901'),
						 ('VEN004','Juna Pala','Male','pala4@gmail.com','China','08389013456'),
						 ('VEN005','Kevin Hart','Male','kevin5@hotmail.com','Turkey','081903278543'),
						 ('VEN006','Paul De Santiano','Male','paul6@yahoo.com','Indonesia','085890123451'),
						 ('VEN007','Alvin Kusuma','Male','alvin7@yahoo.com','Indonesia','085901456789'),
						 ('VEN008','Dina Maharini','Female','dina8@yahoo.com','Japan','08312908784'),
						 ('VEN009','Lila Jubaedah','Female','lila9@hotmail.com','South Korea','082159087612'),
						 ('VEN010','Yani Sitomorang','Female','yani10@gmail.com','Sweden','08203245671')

--
select *from Keyboard
insert into	Keyboard values	('KBD001','Steelseries','1500000.00','STP001'),
							('KBD002','Razer','2500000.00','STP002'),
							('KBD003','Corsair','3500000.00','STP003'),
							('KBD004','Aula','4500000.00','STP004'),
							('KBD005','Sades','5000000.00','STP005'),
							('KBD006','Zowie','2000000.00','STP006'),
							('KBD007','HP','3200000.00','STP007'),
							('KBD008','Rexus','1000000.00','STP008'),
							('KBD009','MSI','2250000.00','STP009'),
							('KBD010','Imperion','5000000.00','STP001')
			
--
select *from Customer
insert into Customer values ('CST001','Tessalonica Bachdim','Female','tessa1@hotmail.org','China','0817893471'),
						    ('CST002','Vania Setiawan','Female','vania2@gmail.com','China','08388932414'),
							('CST003','Lamar Ahmad','Male','lamar3@yahoo.com','China','08578392142'),
							('CST004','Sofian Jonathan','Male','sofian4gmail.com','China','0878341934'),
							('CST005','Adi Munawar','Male','adi5gmail.com','Arab','08167832492'),
							('CST006','Andava Lubis','Male','andava6@yahoo.com','Malaysia','0826423178'),
							('CST007','Dyondra','Male','dyondra7@hotmail.com','Thailand','081783416'),
							('CST008','Daffa Yoseph','Male','daffa8@yahoo.com','Singapore','0857134347'),
							('CST009','Achmad Putra','Male','rama9@gmail.com','India','08167234678'),
							('CST010','Putra Achmad','Male','ghifari90@gmail.com','Laos','0812137123')
--
select *from SwitchType
insert into SwitchType values ('STP001','CherryXM Red'),
							  ('STP002','CherryXM Blue'),
							  ('STP003','CherryXM Brown'),
							  ('STP004','Okka Pink'),
							  ('STP005','Okka Orange'),
							  ('STP006','Getaron Red'),
							  ('STP007','Getaron Blue'),
							  ('STP008','Getaron Brown'),
							  ('STP009','Rezar Purple'),
							  ('STP010','Rezar Green')

--
select*from SalesTransaction
insert into SalesTransaction values('STH001','STF001','CST001','KBD001','2023-01-19','2','18'),
								   ('STH002','STF002','CST002','KBD002','2023-01-19','2','18'),
								   ('STH003','STF003','CST003','KBD003','2021-09-05','1','23'),
								   ('STH004','STF004','CST004','KBD004','2021-10-22','1','23'),
								   ('STH005','STF005','CST005','KBD005','2019-11-23','2','31'),
								   ('STH006','STF006','CST006','KBD006','2019-11-23','3','31'),
								   ('STH007','STF007','CST007','KBD007','2020-12-24','2','10'),
								   ('STH008','STF008','CST008','KBD008','2023-06-30','2','10'),
								   ('STH009','STF009','CST009','KBD009','2022-07-12','4','25'),
								   ('STH010','STF010','CST010','KBD010','2019-08-14','4','25'),
								   ('STH011','STF002','CST001','KBD002','2020-10-19','3','13'),
								   ('STH012','STF003','CST002','KBD003','2020-12-24','3','13'),
								   ('STH013','STF004','CST003','KBD004','2019-10-25','1','1'),
								   ('STH014','STF005','CST004','KBD005','2020-01-26','1','11'),
								   ('STH015','STF006','CST004','KBD006','2020-02-27','2','11'),
								   ('STH016','STF007','CST001','KBD007','2022-04-29','2','12'),
								   ('STH017','STF008','CST002','KBD008','2023-06-30','1','14'),
								   ('STH018','STF009','CST005','KBD009','2020-05-30','1','23'),
								   ('STH019','STF001','CST006','KBD001','2020-10-16','5','23'),
								   ('STH020','STF010','CST007','KBD010','2019-08-14','5','50'),
								   ('STH021','STF003','CST008','KBD003','2022-07-12','5','50'),
								   ('STH022','STF004','CST009','KBD004','2021-03-18','2','14'),
								   ('STH023','STF005','CST010','KBD005','2020-02-27','2','12'),
								   ('STH024','STF006','CST001','KBD006','2020-01-26','2','1'),
								   ('STH025','STF007','CST001','KBD007','2022-02-25','2','1')


				
select *from PurchaseTransaction
insert into PurchaseTransaction values('PTH001','STF001','VEN001','KBD001','2023-01-15','2','18'),
									  ('PTH002','STF002','VEN002','KBD002','2021-09-5','2','23'),
									  ('PTH003','STF003','VEN003','KBD003','2021-10-22','1','31'),
									  ('PTH004','STF004','VEN004','KBD004','2019-11-10','3','10'),
									  ('PTH005','STF005','VEN005','KBD005','2020-12-24','2','25'),
									  ('PTH006','STF006','VEN006','KBD006','2019-10-5','1','13'),
									  ('PTH007','STF007','VEN007','KBD007','2020-01-26','1','1'),
									  ('PTH008','STF008','VEN008','KBD008','2020-02-27','2','11'),
									  ('PTH009','STF009','VEN009','KBD009','2021-08-28','2','10'),
									  ('PTH010','STF010','VEN010','KBD010','2022-04-20','1','12'),
									  ('PTH011','STF001','VEN001','KBD001','2023-05-20','2','14'),
									  ('PTH012','STF002','VEN002','KBD002','2020-06-20','1','12'),
									  ('PTH013','STF003','VEN003','KBD003','2022-05-12','2','23'),
									  ('PTH014','STF004','VEN004','KBD004','2022-03-22','3','24'),
									  ('PTH015','STF005','VEN005','KBD005','2020-06-16','2','50'),
									  ('PTH016','STF011','VEN005','KBD005','2020-06-16','2','50')



