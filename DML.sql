/*====================================================================================================
		SQL PROJECT: Non-Profit Organisation & Blood Donation Management System  
======================================================================================================
					
								Trainee Name : Shamsul Arefin
							 	  Trainee ID : 1294499
									Batch ID : WADA/PNTL-M/69/01 

------------------------------------------------------------------------------------------------------
                                          DOCUMENT STRUCTURE: DML                         
------------------------------------------------------------------------------------------------------

                          => SECTION 01: INSERT DATA INTO TABLES										
                          => SECTION 02: RETRIEVE DATA USING VIEW
                          => SECTION 03: INSERT DATA THROUGH SP
                          => SECTION 04: RETRIEVE DATA USING FUNCTIONS										
                          => SECTION 05: USING INDEX		
                          => SECTION 06: SQL DML QUERIES FROM TPRMS PROJECT						
                          - Coverage:
                	      :: All types of JOIN						
                	      :: ALL, DISTINCT, TOP, PERCENT, WITH TIES
                	      :: String Expressions, Concatenate			
                	      :: GROUP BY, HAVING
				          :: Arithmetic Expressions							  
				          :: ROLLUP, CUBE, GROUPING SETS
				          :: Logical Operator (AND, OR, NOT)							
				          :: Comparison Operator, BETWEEN
				          :: Range of Selected Rows (OFFSET FETCH)		  
				          :: Compound Join
				          :: UNION, UNION ALL, EXCEPT, INTERSECT   
				          :: GROUP BY, HAVING
				          :: Subqueries											   
				          :: CTE, Recursive CTE
    			          :: CAST, CONVERT, TRY_CONVERT
				          :: Other Data Conversion Functions				   
				          :: Numeric Functions
				          :: Date Functions										   
				          :: COALESCE, ISNULL, CASE
				          :: IIF, CHOOSE										   
				          :: Temporary Tables, Table Variables
				          :: Ranking Functions								  	   
				          :: System Stored Procedures						   
				          :: TRY-CATCH block to handle errors			   
------------------------------------------------------------------------------------------------------




==========================================  SECTION 01  ==============================================
										INSERT DATA INTO TABLES	
=====================================================================================================*/
USE NPOBDMS
GO

INSERT INTO Organization VALUES 
('Baro Baisha Village Development Society', '2022-03-02', 'Shamsul Arefin', 'Barisal', 50, 10000000.00)
GO

INSERT INTO Country VALUES ('Bangladesh'), ('India'), ('Pakistan')
GO

INSERT INTO Religion VALUES ('Islam'), ('Hinduism'), ('Buddhism'), ('Christianity')
GO

INSERT INTO BloodGroup VALUES ('A+'), ('A-'), ('B+'), ('B-'), ('O+'), ('O-'), ('AB+'), ('AB-')
GO

INSERT INTO Designation VALUES ('Manager'), ('Coordinator'), ('Field Worker'), ('Admin')
GO

INSERT INTO Education VALUES ('SSC','2002'),('SSC','2003'), ('SSC','2018'),
('HSC','2009'), ('SSC','2022'), ('HSC','2016'),('SSC','2016'), ('SSC','2024')
GO

INSERT INTO Institute VALUES
('Barisal Polytechnic Institute', 'Barisal-8200'),
('Galachipa Govt. College', 'Galachioa, Patuakhali'),
('Barisal Govt. College', 'Barisal-8200'),
('Rangabali Govt. College', 'Kachiabunia-8630'),
('Patuakhali Govt. College', 'Patuakhali-8600'),
('Dhaka College','Dhaka-1205'),
('Govt. BM College', 'Barisal-8200'),
('Dhaka University', 'Dhaka-1000')

GO

INSERT INTO Company VALUES 
('Tech Corp', 'Dhaka'), ('Green Ltd', 'Chittagong'),
('Pepole N Tech', 'Rangpur'), ('Green It', 'Khulna'),
('Mridha Group', 'Barisal'), ('Blue Sky', 'Rajshahi'),
('Sobuj Group', 'Sylhet'), ('Green Ltd', 'Mymensingh')
GO

INSERT INTO City VALUES ('Dhaka', 1), ('Chittagong', 1), ('Sylhet', 1), ('Barisal', 1), ('Khulna', 1), ('Rajshahi', 1), ('Rangpur', 1), ('Mymensingh', 1)
GO



INSERT INTO [Event] VALUES
('Free Blood Grouping','2023-05-16','BaroBaishdia A Hakim High School', 'Medical Camp', 1);

INSERT INTO [Event] VALUES
('Free Blood Donation','2022-02-01','Taktabunia, BaroBaishdia', 'Medical Camp', 1);
GO
INSERT INTO [Event] VALUES
('Free Medical Camp','2024-12-16','Tungibaria High School','Medical Camp', 1);
GO
INSERT INTO [Event] VALUES
('1 Day Fund','2023-03-02','BaroBaishdia Union', 'Fundraising', 1);
GO

INSERT INTO [Event] VALUES
('Matir Bank','2025-03-02','BaroBaishdia Union', 'Fundraising', 1);
GO
INSERT INTO [Event] VALUES
('No Plastic','2023-05-16','BaroBaishdia A Hakim High School', 'Training', 1);
GO
INSERT INTO [Event] VALUES
('Quize - 2025','2025-02-21','Gabbunia Junio High School', 'Awareness', 1);
GO
INSERT INTO [Event] VALUES
('How to growth Rice ptant ','2024-03-02','Chor Gonga High School', 'Training', 1);
GO



INSERT INTO Project VALUES
('Save Planet', 50000.00,'2025-01-01','2025-11-30','Barobaishdia', 1),
('Iftard Packet', 100000.00,'2023-02-22','2025-01-01','Barobaishdia', 1),
('Child Marriage', 250000.00,'2022-03-12','2025-01-01','Barobaishdia', 1),
('Plam Tree Plantation', 30000.00,'2023-06-12','2025-01-01','Barobaishdia', 1),
('Ultra Poor Family', 300000.00,'2024-03-02','2025-01-01','Barobaishdia', 1),
('Poor Student Scholarship', 150000.00,'2024-01-15','2025-01-31','Barobaishdia', 1),
('Clean Baro Baishdia', 75000.00,'2025-02-21','2025-12-31','Barobaishdia', 1),
('Drug-free Barabaishdia', 55000.00,'2022-06-01','2025-12-31','Barobaishdia', 1)
GO


INSERT INTO Supporter VALUES
('Mridha', 'Julhas','Md Shah Alom Mridha', 'Shefali Begum', 'julhasdc2009@gmail.com','01712504107', '42/1, Pilkhana Road, Dhaka-1205', 'Vill: Katakhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1989-12-31', 'Male','Single','9135085059','Bangladeshi','8640','www.facebook.com',1,4,1,5),

('Most', 'Tania','Md Shah Alom', 'Shefali Begum', 'taniaani.ato@gmail.com','01710960964', '2 No. Word, Ratondi, Galachipa Sador, Galachipa', 'Vill: Katakhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1982-12-16', 'Female','Married','9135085058','Bangladeshi','8640','www.facebook.com',1,1,1,4),

('Al', 'Mamun','Khalek Sorder', 'Sokina Begum', 'almamun@gmail.com','01711255601', 'Chunkuthiya, South Keraniganj, Dhaka', 'Vill: Gabbunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali', '1979-12-11', 'Male','Married','9135085057','Bangladeshi','8640','www.facebook.com',1,2,1,2),

('Md Shanto', 'Mahamud','Md Kabir Howlader', 'Sukhi Begum', 'shantohowlader@gmail.com','01842430303', 'Vill: Felabunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali', 'Vill: Felabunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1989-11-05', 'Male','Married','9135085056','Bangladeshi','8640','www.facebook.com',1,3,1,8),

('Hossen', 'Talikder','Nijam', 'Sukhi Parbin', 'htalukder@gmail.com','01842430304', 'Italy', 'Vill: Taktabunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1981-09-30', 'Male','Married','9135085055','Bangladeshi','8640','www.facebook.com',1,3,1,7),

('Md Nahid', 'Hassan','Sabir Howlader', 'Lima Begum', 'nahidh@gmail.com','01842435303', 'Arambag, Galachipa Sador, Galachipa', 'Vill: Felabunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1975-12-31', 'Male','Married','9135085054','Bangladeshi','8640','www.facebook.com',1,3,1,6),

('Md Sijan', 'Howlader','Babu Howlader', 'Poly Begum', 'sijanalvi@gmail.com','01742435303', 'Austrilia', 'Vill: Felabunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali', '1999-12-05', 'Male','Divorced','9135085053','Bangladeshi','8640','www.facebook.com',1,4,1,3),

('Md Tahsan', 'Islam','Jabir Howlader', 'Sonia Begum', 'jabirbd@gmail.com','01712435303', 'Kalkini, Madaripur Sador, Madaripur', 'Vill: Halimchor;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1999-12-05', 'Male','Divorced','9135085052','Bangladeshi','8640','www.facebook.com',1,4,1,4)
GO


INSERT INTO Volunteer VALUES
('Md Lazim', 'Imran', 'Shahin Howlader','Nargis Begum','lazimimran@gmail.com','01841421281','Vill: Katakhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Katakhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1999-05-31', 'Male', 'Single', '9135085011','Bangladeshi','8640','www.facebook.com','2022-03-02','Part-Time', 1,7, 1, 7, 4, 3),

('Md Mizan', 'Fokir', 'Jabbar Fokir','Chokina Begum','mizanfokir@gmail.com','01841421282','Vill: Gabbunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Gabbunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1998-06-02', 'Male', 'Single', '9135085012','Bangladeshi','8640','www.facebook.com','2022-03-05','Part-Time', 1,6, 1, 6, 2, 4),

('Md Shakil', 'Boyati', 'Kuddus Boyati','Khushi Begum','boyatishakil@gmail.com','01841421299','Vill: Katakhali_1;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Katakhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1999-05-01', 'Male', 'Single', '9135085013','Bangladeshi','8640','www.facebook.com','2022-03-02','Part-Time', 1,4, 1, 4, 3, 3),

('Md Anayet', 'Korim', 'Kaoser Howlader','Poly Begum','anayetkorimbd@gmail.com','01841421681','Vill: Katakhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Katakhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1999-05-31', 'Male', 'Single', '9135085014','Bangladeshi','8640','www.facebook.com','2022-03-02','Full-Time', 1,7, 1, 7, 4, 3),

('Msot', 'Tamanna', 'Helal Dofader','Nasrin Begum','tamannabd@gmail.com','01841429604','Vill: Tungibaria;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Tungibaria;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2002-05-31', 'Female', 'Single', '9135085015','Bangladeshi','8640','www.facebook.com','2024-03-02','Occasional', 1,8, 1, 8, 4, 2),

('Msot Lima', 'Akter', 'Jafor Dalal','Nasrin Jahan','limadalal@gmail.com','01841429504','Vill: West Gabbunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: West Gabbunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2001-04-12', 'Female', 'Single', '9135085016','Bangladeshi','8640','www.facebook.com','2025-03-02','Occasional', 1,6, 1, 8, 4, 1),

('Msot Asha', 'Moni', 'Anowar Mekar','Panna Akter','ashamoni@gmail.com','01841429004','Vill: Modhukhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Modhukhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2001-04-12', 'Female', 'Single', '9135085017','Bangladeshi','8640','www.facebook.com','2023-06-12','Full-Time', 1,3, 1, 8, 4, 4),

('Md Hasan', 'Mridha', 'Anowar Mridha','Laiju Akter','mridhahasan@gmail.com','01841421004','Vill: Digree;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Digree;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2001-04-12', 'Female', 'Single', '9135085018','Bangladeshi','8640','www.facebook.com','2025-06-19','Full-Time', 1,5, 1, 6, 4, 1)
GO



INSERT INTO Donor VALUES
('Md Lazim', 'Imran', 'Shahin Howlader','Nargis Begum','lazimimran@gmail.com','01841421281','Vill: KatakhaliPost: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Katakhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1999-05-31', 'Male', 'Single', '9135085011','Bangladeshi','8640', 1, 4, 1),

('Md Mizan', 'Fokir', 'Jabbar Fokir','Chokina Begum','mizanfokir@gmail.com','01841421282','Vill: Gabbunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Gabbunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1998-06-02', 'Male', 'Single', '9135085012','Bangladeshi','8640', 1, 5, 1),

('Md Shakil', 'Boyati', 'Kuddus Boyati','Khushi Begum','boyatishakil@gmail.com','01841421299','Vill: Katakhali_1;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Katakhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1999-05-01', 'Male', 'Single', '9135085013','Bangladeshi','8640', 1, 6, 1),

('Md Anayet', 'Korim', 'Kaoser Howlader','Poly Begum','anayetkorimbd@gmail.com','01841421681','Vill: Katakhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Katakhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1999-05-31', 'Male', 'Single', '9135085014','Bangladeshi','8640', 1, 7, 1),

('Msot', 'Tamanna', 'Helal Dofader','Nasrin Begum','tamannabd@gmail.com','01841429604','Vill: Tungibaria;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Tungibaria;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2002-05-31', 'Female', 'Single', '9135085015','Bangladeshi','8640', 1, 8, 1),
('Msot Lima', 'Akter', 'Jafor Dalal','Nasrin Jahan','limadalal@gmail.com','01841429504','Vill: West Gabbunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: West Gabbunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2001-04-12', 'Female', 'Single', '9135085016','Bangladeshi','8640', 1, 2, 1),
('Msot Asha', 'Moni', 'Anowar Mekar','Panna Akter','ashamoni@gmail.com','01841429004','Vill: Modhukhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Modhukhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2001-04-12', 'Female', 'Single', '9135085017','Bangladeshi','8640', 1, 1, 1),

('Md Hasan', 'Mridha', 'Anowar Mridha','Laiju Akter','mridhahasan@gmail.com','01841421004','Vill: Digree;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Digree;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2001-04-12', 'Female', 'Single', '9135085018','Bangladeshi','8640', 1, 3, 1)
GO



INSERT INTO Beneficiary VALUES
('Md shofiq', 'Islam', 'Mijan Howlader','Alo Begum','shofiqbd@gmail.com','01912345678','Vill: Halimchor;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Halimchor;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1979-01-21', 'Male', 'Married', '9135082611', 'Bangladeshi','8640', 1, 4, 1),

('Md Rabbi', 'Chokider', 'Musa Chokider','Tiya Begum','rabbichokider@gmail.com','01912345679','Vill: Samchad;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Samchad;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2002-06-02', 'Male', 'Single', '9135082612','Bangladeshi','8640', 1, 4, 1),

('Aleya', 'Begum', 'Rahman Chokider','Setara Begum','aleya@gmail.com','01912345670','Vill: Sorderkhal;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Sorderkhal;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1969-04-19', 'Female', 'Married', '9135082613','Bangladeshi','8640', 1, 4, 1),

('Nuruddin', 'Hazi', 'Kaoser Fokir','Najma Begum','nurjahanbibi@gmail.com','01912345671','Vill: Mollarchor;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Mollarchor;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1999-05-31', 'Male', 'Single', '9135082614','Bangladeshi','8640', 1, 4, 1),

('Msot', 'lamia', 'Litu Dofader','Rehena Begum','lamiaass@gmail.com','01912345672','Vill: Tungibaria;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Tungibaria;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2002-05-31', 'Female', 'Single', '9135082615','Bangladeshi','8640', 1, 4, 1),
('Msot Mila', 'Akter', 'Montu Chokide','Nipa Akter','Milabd@gmail.com','01912345673','Vill: West Gabbunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: West Gabbunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2002-04-12', 'Female', 'Single', '9135085016','Bangladeshi','8640', 1, 4, 1),
('Msot Dina', 'Moni', 'Nurjamal','Rahima Begum','dinasumi@gmail.com','01912345674','Vill: Modhukhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Modhukhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2000-04-12', 'Female', 'Single', '9135082617','Bangladeshi','8640', 1, 4, 1),

('Md Emran', 'Mridha', 'Mojnu Mridha','Laizu Akter','mridhaemran@gmail.com','01912345675','Vill: Digree;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Digree;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2003-04-12', 'Female', 'Single', '9135082618','Bangladeshi','8640', 1, 4, 1)
GO



INSERT INTO Patient VALUES
('Md Rifat', 'Hosnem', 'Jahid Shikder','Monoyara Begum','rifatbd@gmail.com','01612345678','Vill: Tulatoli;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Tulatoli;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1979-01-11', 'Male', 'Married', '4135082611', 'Bangladeshi','8640', 1, 4, 1),

('Md Dadon','Gazi', 'Faku Chokider','Rina Begum','dadongazi@gmail.com','01612345679','Vill: Samchad;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Samchad;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1982-06-02', 'Male', 'Single', '4135082612','Bangladeshi','8640', 1, 4, 1),

('Amena', 'Begum', 'Sona Chokider','Rima Begum','amenabibi@gmail.com','01612345670','Vill: Sorderkhal;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Sorderkhal;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1959-08-19', 'Female', 'Married', '4135082613','Bangladeshi','8640', 1, 4, 1),

('Chan Mia', 'Dofader', 'Kalu Dofader','Joytara Begum','chanmia@gmail.com','01612345671','Vill: Mollarchor;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Mollarchor;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1951-05-31', 'Male', 'Married', '4135082614','Bangladeshi','8640', 1, 4, 1),

('Msot', 'lamin', 'Atik Dofader','Remena Begum','laminjj@gmail.com','01612345672','Vill: Chatianpara;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Chatianpara;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2002-05-31', 'Female', 'Single', '4135082615','Bangladeshi','8640', 1, 4, 1),
('Msot Sila', 'Akter', 'Mintu Chokide','Nila Akter','Silabd@gmail.com','01612345673','Vill: Felabunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Felabinia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2002-04-12', 'Female', 'Single', '4135085016','Bangladeshi','8640', 1, 4, 1),
('Msot Mina', 'Moni', 'Jamal','Rahela Begum','minasumi@gmail.com','01612345674','Vill: Telipara;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Telipara;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2000-04-12', 'Female', 'Single', '4135082617','Bangladeshi','8640', 1, 4, 1),

('Md Tamim', 'Mridha', 'Harun Mridha','Sukta Akter','tamimbd@gmail.com','01612345675','Vill: Kalachanpara;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: kalachanpara;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2003-04-12', 'Female', 'Single', '4135082618','Bangladeshi','8640', 1, 4, 1)
GO



INSERT INTO Employee VALUES
('Md Sijan', 'Islam', 'Shahin Alom','Piyara Begum','Sijan99@gmail.com','01341421281','Vill: Felabunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Felabunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1999-05-31', 'Male', 'Single', '1135085011','Bangladeshi','8640','www.facebook.com','2022-03-02','Permanent', 1,7, 1, 7, 4, 3),

('Md Shoyeb', 'Hossen', 'Jabbir Chowdury','Minara Begum','shoyeb@gmail.com','01341421282','Vill: bailabunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: bailabunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1998-06-02', 'Male', 'Single', '1135085012','Bangladeshi','8640','www.facebook.com','2022-03-05','Contractual', 1, 6,1, 6, 2, 4),

('Md Ratul', 'Munshi', 'Iqbal Munshi','Sharmin Begum','ratulmunshi@gmail.com','01341421299','Vill: Majerdeowan;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Majerdeowan;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1999-05-01', 'Male', 'Single', '1135085013','Bangladeshi','8640','www.facebook.com','2022-03-02','Permanent', 1, 5,1, 4, 3, 3),

('Md Poros', 'Mia', 'Mijanur Matobbor','Akhi Begum','porosmia@gmail.com','01341421681','Vill: Chorkhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Chorkhali;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','1999-05-31', 'Male', 'Single', '1135085014','Bangladeshi','8640','www.facebook.com','2022-03-02','Probation', 1, 4,1, 7, 4, 3),

('Msot', 'Suchi', 'Nijam Forazi','Dalia Begum','suchibd@gmail.com','01341429604','Vill: Tungibaria;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Tungibaria;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2002-05-31', 'Female', 'Single', '1135085015','Bangladeshi','8640','www.facebook.com','2024-03-02','Contractual', 1,3, 1, 8, 4, 2),

('Msot Hafsa', 'Akter', 'Jalal Dalal','Nusrat Jahan','hafsamoon@gmail.com','01341429504','Vill: West Gabbunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: West Gabbunia;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2001-04-12', 'Female', 'Single', '1135085016','Bangladeshi','8640','www.facebook.com','2025-03-02','Probation', 1, 2,1, 8, 4, 1),

('Mst Tonni', 'Akter', 'Anowar Jomadder','Tohmina Akter','tonniakter@gmail.com','01341429004','Vill: Chorimanson;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Chorimanson;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2001-04-12', 'Female', 'Single', '1135085017','Bangladeshi','8640','www.facebook.com','2023-06-12','Contractual', 1,7, 1, 8, 4, 4),

('Hasan', 'Sikder', ' Saiful Sikder','Noyontara','hasan@gmail.com','01341421004','Vill: Sorderpara;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','Vill: Sorderpara;Post: Tungibari;Upzilla: Rangabali;District: Patuakhali','2001-04-12', 'Male', 'Single', '1135085018','Bangladeshi','8640','www.facebook.com','2025-06-19','Permanent', 1, 1,1, 6, 4, 1)
GO



INSERT INTO Donation VALUES
(1,500000.00, '2025-05-20', 'Cheque'),
(1,200000.00, '2022-04-05', 'Cheque'),
(1,300000.00, '2024-06-09', 'Bank'),
(1,100000.00, '2023-07-20', 'Cheque'),
(1,50000.00, '2023-08-22', 'Cheque'),
(1,150000.00, '2025-02-20', 'Cheque'),
(1,25000.00, '2025-08-22', 'Mobile Banking'),
(1,40000.00, '2025-09-20', 'Card')
GO


INSERT INTO BloodRequest VALUES
('A+',1,1,'2025-09-21','Fulfilled',1),
('B+',1,3,'2025-02-11','Cancelled',1),
('A-',1,2,'2025-03-15','Cancelled',1),
('B-',1,4,'2025-10-07','Fulfilled',1),
('AB+',1,7,'2025-01-09','Fulfilled',1),
('AB-',1,8,'2025-03-10','Cancelled',1),
('O+',1,5,'2025-07-12','Fulfilled',1),
('O-',1,6,'2025-11-21','Cancelled',1)
GO


INSERT INTO BloodDonation VALUES
(1, 8, 1, '2025-01-12', 1),
(2, 7, 2, '2025-02-12', 1),
(3, 5, 3, '2025-03-12', 1),
(4, 6, 4, '2025-04-12', 2),
(5, 4, 5, '2025-05-12', 3),
(6, 3, 6, '2025-06-12', 1),
(7, 1, 7, '2025-07-12', 1),
(8, 2, 8, '2025-08-12', 1)
GO






-- ==========================================
-- SECTION 02: RETRIEVE DATA USING VIEW
-- ==========================================

SELECT * FROM vDonorDetails
GO

SELECT * FROM vBloodDonationSummary
GO

SELECT * FROM vDonationReport
WHERE DonationYear = 2025
GO

SELECT * FROM vDonorDetails
WHERE City = 'Barisal'
GO

-- ==========================================
-- SECTION 03: INSERT DATA THROUGH SP
-- ==========================================

EXEC spInsertDonor 
    @FirstName = 'Karim', 
    @LastName = 'Rahman',
    @Phone = '01811111111',
    @Email = 'karim@gmail.com',
    @DateOfBirth = '1995-05-15',
    @Gender = 'Male',
    @ReligionId = 1,
    @CityId = 1,
    @CountryId = 1
GO

EXEC spGetDonorsByCity @CityId = 4
GO


 DECLARE @Count INT
 EXEC spGetDonorCount @CityId = 1, @TotalCount = @Count OUTPUT
 SELECT @Count AS TotalDonors
GO


 DECLARE @Result INT
 EXEC @Result = spCheckDonorExists '01712345678'
 SELECT @Result AS DonorExists
GO

--SP with output parameter
DECLARE @TotalCount INT
EXEC spGetDonorCount @CityId = 1, @TotalCount = @TotalCount OUTPUT
SELECT @TotalCount AS TotalDonors
GO



-- ==========================================
-- SECTION 04: RETRIEVE DATA USING FUNCTIONS
-- ==========================================

SELECT dbo.fnGetTotalDonation(1) AS 'Total Donation by Donor 1'
GO

SELECT * FROM dbo.fnGetDonorsByBloodGroup(1)
GO

-- Multi-Statement Function
SELECT * FROM dbo.fnGetDonationSummary(2025)
GO

-- ==========================================
-- SECTION 05: USING INDEX
-- ==========================================

SELECT * FROM Donor WHERE Phone = '01741421281'
GO

-- INDEX PERFORMANCE CHECK
SET STATISTICS IO ON
SELECT * FROM Supporter WHERE Email = 'julhasdc2009@gmail.com'
SET STATISTICS IO OFF
GO

-- ==========================================
-- SECTION 06: SQL DML QUERIES FROM TPRMS PROJECT						
-- ==========================================

-- 1. INNER JOIN
SELECT 
    CONCAT(d.FirstName, ' ', d.LastName) AS DonorName,
    don.Amount,
    don.DonationDate
FROM Donor d
INNER JOIN Donation don ON d.DonorId = don.DonorId
GO

-- 2. LEFT JOIN
SELECT 
    CONCAT(d.FirstName, ' ', d.LastName) AS DonorName,
    don.Amount
FROM Donor d
LEFT JOIN Donation don ON d.DonorId = don.DonorId
GO

-- 3. RIGHT JOIN
SELECT 
    CONCAT(d.FirstName, ' ', d.LastName) AS DonorName,
    don.Amount
FROM Donation don
RIGHT JOIN Donor d ON don.DonorId = d.DonorId
GO

-- 4. FULL OUTER JOIN
SELECT 
    CONCAT(d.FirstName, ' ', d.LastName) AS DonorName,
    don.Amount
FROM Donor d
FULL OUTER JOIN Donation don ON d.DonorId = don.DonorId
GO

-- 5. CROSS JOIN
SELECT 
    d.FirstName,
    bg.Name AS BloodGroup
FROM Donor d
CROSS JOIN BloodGroup bg
GO

-- 6. SELF JOIN
SELECT 
    e1.FirstName + ' ' + e1.LastName AS Employee1,
    e2.FirstName + ' ' + e2.LastName AS Employee2
FROM Employee e1
INNER JOIN Employee e2 ON e1.CityId = e2.CityId
WHERE e1.EmployeeId <> e2.EmployeeId
GO


-- ALL 
SELECT ALL FirstName FROM Donor
GO


-- TOP 
SELECT TOP 5 * FROM Donation ORDER BY Amount DESC
GO

-- TOP PERCENT 
SELECT TOP 10 PERCENT * FROM Donor
GO

-- TOP WITH TIES
SELECT TOP 3 WITH TIES Amount, DonationDate 
FROM Donation 
ORDER BY Amount DESC
GO

-- ==========================================
-- STRING OPERATIONS
-- ==========================================

-- String Concatenation
SELECT 
    CONCAT(FirstName, ' ', LastName) AS FullName,
    FirstName + ' ' + LastName AS FullName2
FROM Donor
GO

-- String Functions
SELECT 
    UPPER(FirstName) AS UpperCase,
    LOWER(LastName) AS LowerCase,
    LEN(FirstName) AS NameLength,
    LEFT(FirstName, 3) AS First3Chars,
    RIGHT(LastName, 3) AS Last3Chars,
    SUBSTRING(Email, 1, 5) AS EmailPrefix
FROM Donor
GO

-- ==========================================
-- GROUP BY & HAVING
-- ==========================================

-- GROUP BY
SELECT 
    CityId,
    COUNT(*) AS TotalDonors
FROM Donor
GROUP BY CityId
GO

-- GROUP BY with HAVING
SELECT 
    DonorId,
    SUM(Amount) AS TotalDonation
FROM Donation
GROUP BY DonorId
HAVING SUM(Amount) > 200000
GO

-- Multiple Columns GROUP BY
SELECT 
    YEAR(DonationDate) AS Year,
    MONTH(DonationDate) AS Month,
    COUNT(*) AS DonationCount,
    SUM(Amount) AS TotalAmount
FROM Donation
GROUP BY YEAR(DonationDate), MONTH(DonationDate)
ORDER BY Year, Month
GO

-- ==========================================
-- ARITHMETIC EXPRESSIONS
-- ==========================================

SELECT 
    Amount,
    Amount * 1.10 AS AmountWith10PercentTax,
    Amount / 2 AS HalfAmount,
    Amount + 1000 AS BonusAmount,
    Amount - 500 AS AfterDeduction,
    Amount % 100 AS Remainder
FROM Donation
GO

-- ==========================================
--  ROLLUP, CUBE, GROUPING SETS
-- ==========================================

-- ROLLUP (hierarchical subtotals)
SELECT 
    YEAR(DonationDate) AS Year,
    PaymentMethod,
    SUM(Amount) AS Total
FROM Donation
GROUP BY ROLLUP(YEAR(DonationDate), PaymentMethod)
GO

-- CUBE (all combinations)
SELECT 
    YEAR(DonationDate) AS Year,
    PaymentMethod,
    SUM(Amount) AS Total
FROM Donation
GROUP BY CUBE(YEAR(DonationDate), PaymentMethod)
GO

-- GROUPING SETS (specific groups)
SELECT 
    CityId,
    ReligionId,
    COUNT(*) AS Total
FROM Donor
GROUP BY GROUPING SETS ((CityId), (ReligionId), ())
GO

-- ==========================================
-- LOGICAL OPERATORS
-- ==========================================

-- AND
SELECT * FROM Donor
WHERE Gender = 'Male' AND CityId = 4
GO

-- OR
SELECT * FROM Donor
WHERE CityId = 1 OR CityId = 4
GO

-- NOT
SELECT * FROM Donor
WHERE NOT Gender = 'Female'
GO

-- Combined
SELECT * FROM Donation
WHERE (Amount > 100000 AND PaymentMethod = 'Cheque')
   OR (Amount > 50000 AND PaymentMethod = 'Bank')
GO

-- ==========================================
-- COMPARISON & BETWEEN
-- ==========================================

-- Comparison Operators
SELECT * FROM Donation WHERE Amount > 200000
GO

SELECT * FROM Donation WHERE Amount >= 200000
GO

SELECT * FROM Donation WHERE Amount <> 100000
GO

-- BETWEEN
SELECT * FROM Donation
WHERE Amount BETWEEN 100000 AND 300000
GO

SELECT * FROM Donation
WHERE DonationDate BETWEEN '2024-01-01' AND '2025-12-31'
GO

-- IN
SELECT * FROM Donor
WHERE CityId IN (1, 4, 7)
GO

-- LIKE
SELECT * FROM Donor
WHERE FirstName LIKE 'M%'
GO

SELECT * FROM Donor
WHERE Email LIKE '%gmail.com'
GO

-- ==========================================
-- OFFSET FETCH (Pagination)
-- ==========================================

-- Skip first 2 rows, get next 5 rows
SELECT * FROM Donor
ORDER BY DonorId
OFFSET 2 ROWS
FETCH NEXT 5 ROWS ONLY
GO

-- Page 2 with 3 items per page
SELECT * FROM Donation
ORDER BY DonationDate DESC
OFFSET 3 ROWS
FETCH NEXT 3 ROWS ONLY
GO

-- ==========================================
-- UNION, INTERSECT, EXCEPT
-- ==========================================

-- UNION (unique values from both)
SELECT FirstName, LastName FROM Donor
UNION
SELECT FirstName, LastName FROM Volunteer
GO

-- UNION ALL (all values, including duplicates)
SELECT FirstName FROM Donor
UNION ALL
SELECT FirstName FROM Employee
GO

-- INTERSECT (common values)
SELECT CityId FROM Donor
INTERSECT
SELECT CityId FROM Supporter
GO

-- EXCEPT (values in first but not in second)
SELECT CityId FROM Donor
EXCEPT
SELECT CityId FROM Patient
GO

-- ==========================================
-- SUBQUERIES
-- ==========================================

-- Subquery in WHERE
SELECT * FROM Donation
WHERE DonorId IN (SELECT DonorId FROM Donor WHERE CityId = 4)
GO

-- Subquery in SELECT
SELECT 
    DonorId,
    FirstName,
    (SELECT SUM(Amount) FROM Donation WHERE DonorId = d.DonorId) AS TotalDonation
FROM Donor d
GO

-- Subquery in FROM
SELECT AVG(TotalAmount) AS AvgDonationPerDonor
FROM (
    SELECT DonorId, SUM(Amount) AS TotalAmount
    FROM Donation
    GROUP BY DonorId
) AS DonorSummary
GO

-- Correlated Subquery
SELECT d.FirstName, d.LastName,
    (SELECT COUNT(*) FROM Donation don WHERE don.DonorId = d.DonorId) AS DonationCount
FROM Donor d
GO

-- EXISTS
SELECT * FROM Donor d
WHERE EXISTS (
    SELECT 1 FROM Donation don 
    WHERE don.DonorId = d.DonorId AND don.Amount > 200000
)
GO

-- ==========================================
-- CTE (Common Table Expression)
-- ==========================================

-- Simple CTE
WITH DonorCTE AS (
    SELECT 
        DonorId,
        CONCAT(FirstName, ' ', LastName) AS FullName
    FROM Donor
)
SELECT * FROM DonorCTE
GO

-- Multiple CTEs
WITH 
DonorInfo AS (
    SELECT DonorId, CONCAT(FirstName, ' ', LastName) AS FullName
    FROM Donor
),
DonationInfo AS (
    SELECT DonorId, SUM(Amount) AS TotalAmount
    FROM Donation
    GROUP BY DonorId
)
SELECT 
    di.FullName,
    dn.TotalAmount
FROM DonorInfo di
INNER JOIN DonationInfo dn ON di.DonorId = dn.DonorId
GO

-- Recursive CTE (Number Series)
WITH NumberSeries AS (
    SELECT 1 AS Num
    UNION ALL
    SELECT Num + 1
    FROM NumberSeries
    WHERE Num < 10
)
SELECT * FROM NumberSeries
GO

-- ==========================================
-- CONVERSION FUNCTIONS
-- ==========================================

-- CAST
SELECT 
    DonationId,
    CAST(Amount AS INT) AS AmountInt,
    CAST(DonationDate AS VARCHAR(20)) AS DateString
FROM Donation
GO

-- CONVERT
SELECT 
    CONVERT(VARCHAR(20), Amount) AS AmountString,
    CONVERT(VARCHAR(20), DonationDate, 103) AS DateUK,
    CONVERT(VARCHAR(20), DonationDate, 101) AS DateUS
FROM Donation
GO

-- TRY_CONVERT (returns NULL if fails)
SELECT 
    TRY_CONVERT(INT, Amount) AS ValidInt,
    TRY_CONVERT(INT, 'ABC') AS InvalidInt
FROM Donation
GO

-- Other Conversion Functions
SELECT 
    STR(Amount, 15, 2) AS StringAmount,
    FORMAT(Amount, 'C', 'en-US') AS CurrencyFormat,
    FORMAT(DonationDate, 'dd-MMM-yyyy') AS FormattedDate
FROM Donation
GO

-- ==========================================
-- NUMERIC FUNCTIONS
-- ==========================================

SELECT 
    Amount,
    ROUND(Amount, -3) AS RoundedAmount,
    CEILING(Amount / 1000) AS CeilingValue,
    FLOOR(Amount / 1000) AS FloorValue,
    RAND() AS RandomNumber
FROM Donation
GO

-- ==========================================
-- DATE FUNCTIONS
-- ==========================================

SELECT 
    GETDATE() AS CurrentDateTime,
    DATEADD(DAY, 7, DonationDate) AS Plus7Days,
    DATEDIFF(DAY, DonationDate, GETDATE()) AS DaysSince,
    DATEPART(YEAR, DonationDate) AS Year,
    DATEPART(MONTH, DonationDate) AS Month,
    DATENAME(MONTH, DonationDate) AS MonthName,
    YEAR(DonationDate) AS YearShort,
    MONTH(DonationDate) AS MonthShort,
    DAY(DonationDate) AS DayShort
FROM Donation
GO

-- ==========================================
-- COALESCE, ISNULL, CASE
-- ==========================================

-- ISNULL (replace NULL with value)
SELECT 
    FirstName,
    ISNULL(Email, 'No Email') AS Email
FROM Donor
GO

-- COALESCE (first non-NULL value)
SELECT 
    FirstName,
    COALESCE(Email, Phone, 'No Contact') AS ContactInfo
FROM Donor
GO

-- CASE Expression
SELECT 
    FirstName,
    Amount,
    CASE 
        WHEN Amount > 300000 THEN 'High Donor'
        WHEN Amount > 100000 THEN 'Medium Donor'
        ELSE 'Low Donor'
    END AS DonorCategory
FROM Donor d
LEFT JOIN Donation don ON d.DonorId = don.DonorId
GO

-- Searched CASE
SELECT 
    DonorId,
    CASE Gender
        WHEN 'Male' THEN 'Mr.'
        WHEN 'Female' THEN 'Ms.'
        ELSE 'Mx.'
    END AS Title
FROM Donor
GO

-- ==========================================
--IIF & CHOOSE
-- ==========================================

-- IIF (inline if)
SELECT 
    FirstName,
    Amount,
    IIF(Amount > 200000, 'High', 'Low') AS Category
FROM Donor d
LEFT JOIN Donation don ON d.DonorId = don.DonorId
GO

-- CHOOSE (pick value by index)
SELECT 
    FirstName,
    CHOOSE(MONTH(DateOfBirth), 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
           'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec') AS BirthMonth
FROM Donor
WHERE DateOfBirth IS NOT NULL
GO

-- ==========================================
-- TEMPORARY TABLES & TABLE VARIABLES
-- ==========================================

-- Temporary Table
CREATE TABLE #TempDonors (
    DonorId INT,
    FullName VARCHAR(100),
    TotalDonation DECIMAL(18,2)
)

INSERT INTO #TempDonors
SELECT 
    d.DonorId,
    CONCAT(d.FirstName, ' ', d.LastName),
    SUM(don.Amount)
FROM Donor d
LEFT JOIN Donation don ON d.DonorId = don.DonorId
GROUP BY d.DonorId, d.FirstName, d.LastName

SELECT * FROM #TempDonors

DROP TABLE #TempDonors
GO

-- Table Variable
DECLARE @DonorSummary TABLE (
    DonorId INT,
    FullName VARCHAR(100),
    DonationCount INT
)

INSERT INTO @DonorSummary
SELECT 
    d.DonorId,
    CONCAT(d.FirstName, ' ', d.LastName),
    COUNT(don.DonationId)
FROM Donor d
LEFT JOIN Donation don ON d.DonorId = don.DonorId
GROUP BY d.DonorId, d.FirstName, d.LastName

SELECT * FROM @DonorSummary
GO

-- ==========================================
-- RANKING FUNCTIONS
-- ==========================================

-- ROW_NUMBER (unique sequential number)
SELECT 
    ROW_NUMBER() OVER (ORDER BY Amount DESC) AS RowNum,
    DonorId,
    Amount,
    DonationDate
FROM Donation
GO

-- RANK (same values get same rank, gaps in sequence)
SELECT 
    RANK() OVER (ORDER BY Amount DESC) AS Rank,
    DonorId,
    Amount
FROM Donation
GO

-- DENSE_RANK (same values get same rank, no gaps)
SELECT 
    DENSE_RANK() OVER (ORDER BY Amount DESC) AS DenseRank,
    DonorId,
    Amount
FROM Donation
GO

-- NTILE (divide into N groups)
SELECT 
    NTILE(3) OVER (ORDER BY Amount DESC) AS Quartile,
    DonorId,
    Amount
FROM Donation
GO

-- Ranking with PARTITION BY
SELECT 
    DonorId,
    Amount,
    DonationDate,
    ROW_NUMBER() OVER (PARTITION BY DonorId ORDER BY DonationDate) AS DonationSequence
FROM Donation
GO

-- ==========================================
-- SYSTEM STORED PROCEDURES
-- ==========================================

-- Database Info
EXEC sp_helpdb 'NPOBDMS'
GO

-- Table Info
EXEC sp_help 'Donor'
GO

-- Column Info
EXEC sp_columns 'Donation'
GO

-- Index Info
EXEC sp_helpindex 'Donor'
GO

-- Constraint Info
EXEC sp_helpconstraint 'Donor'
GO

-- Show all tables
EXEC sp_tables
GO


-- ==========================================
-- TRY-CATCH ERROR HANDLING
-- ==========================================

-- Basic TRY-CATCH
BEGIN TRY
    -- This will cause error (duplicate phone)
    INSERT INTO Donor (FirstName, LastName, Phone, ReligionId, CityId, CountryId)
    VALUES ('Test', 'User', '01741421281', 1, 1, 1)
END TRY
BEGIN CATCH
    PRINT 'Error occurred!'
    PRINT 'Error Message: ' + ERROR_MESSAGE()
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR)
    PRINT 'Error Line: ' + CAST(ERROR_LINE() AS VARCHAR)
END CATCH
GO

-- TRY-CATCH with Transaction
BEGIN TRY
    BEGIN TRANSACTION
    
    -- Insert Donor
    INSERT INTO Donor (FirstName, LastName, Phone, ReligionId, CityId, CountryId)
    VALUES ('New', 'Donor', '01999999999', 1, 1, 1)
    
    -- Insert Donation
    DECLARE @NewDonorId INT = SCOPE_IDENTITY()
    INSERT INTO Donation (DonorId, Amount, PaymentMethod)
    VALUES (@NewDonorId, 50000, 'Cash')
    
    COMMIT TRANSACTION
    PRINT 'Transaction completed successfully!'
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    PRINT 'Transaction rolled back due to error!'
    PRINT ERROR_MESSAGE()
END CATCH
GO

-- Custom Error with RAISERROR
BEGIN TRY
    DECLARE @Amount DECIMAL(18,2) = -1000
    
    IF @Amount < 0
    BEGIN
        RAISERROR('Donation amount cannot be negative!', 16, 1)
    END
END TRY
BEGIN CATCH
    PRINT 'Caught Error: ' + ERROR_MESSAGE()
END CATCH
GO

-- TRY-CATCH with THROW
BEGIN TRY
    DECLARE @TestAmount DECIMAL(18,2) = 0
    
    IF @TestAmount = 0
    BEGIN
        THROW 50001, 'Amount cannot be zero!', 1
    END
END TRY
BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine
END CATCH
GO

PRINT 'All DML queries completed successfully!'
PRINT 'Total Sections Covered: 26'
GO