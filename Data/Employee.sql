-- Employee Table
INSERT INTO `M.A.M.A.M_Project`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Sex`, `Bdate`, `Address`, `Phone`, `Super_SSN`) VALUES ('27907261434106', 'Mostafa', 'M', 'Mkawy', 'M', '1979-07-26', 'Al-Mataria', '01212345678', NULL);
INSERT INTO `M.A.M.A.M_Project`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Sex`, `Bdate`, `Address`, `Phone`, `Super_SSN`) VALUES ('28212174634675', 'Mariam', 'O', 'Mohamed', 'F', '1982-12-17', 'Wust-Elbalad', '01219856478', '27907261434106');
INSERT INTO `M.A.M.A.M_Project`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Sex`, `Bdate`, `Address`, `Phone`, `Super_SSN`) VALUES ('28903040949648', 'Zainab', 'A', 'Sulaiman', 'F', '1989-03-04', 'EL-Abbasiya', '01519367845', '28212174634675');
INSERT INTO `M.A.M.A.M_Project`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Sex`, `Bdate`, `Address`, `Phone`, `Super_SSN`) VALUES ('29101011527808', 'Aisha', 'M', 'Abdullah', 'F', '1991-01-01', 'Elwaili', '01287654321', '28212174634675');
INSERT INTO `M.A.M.A.M_Project`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Sex`, `Bdate`, `Address`, `Phone`, `Super_SSN`) VALUES ('29405253698896', 'Mohamed', 'F', 'Said', 'M', '1994-05-25', 'Impapa', '01594157836', '27907261434106');
INSERT INTO `M.A.M.A.M_Project`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Sex`, `Bdate`, `Address`, `Phone`, `Super_SSN`) VALUES ('29508291498963', 'Ali', 'M', 'Ramadan', 'M', '1995-08-29', 'Al-Amiria', '01112345678', '27907261434106');
INSERT INTO `M.A.M.A.M_Project`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Sex`, `Bdate`, `Address`, `Phone`, `Super_SSN`) VALUES ('29611090225987', 'Ziad', 'A', 'Khaled', 'M', '1996-11-09', 'Ezbet-El-Nakhl', '01037956485', '27907261434106');
INSERT INTO `M.A.M.A.M_Project`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Sex`, `Bdate`, `Address`, `Phone`, `Super_SSN`) VALUES ('29909051100359', 'Ahmed', 'H', 'salem', 'M', '1999-09-05', 'Al-Salam', '01012345678', '29508291498963');
INSERT INTO `M.A.M.A.M_Project`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Sex`, `Bdate`, `Address`, `Phone`, `Super_SSN`) VALUES ('30010151175813', 'Mazen', 'M', 'Mamdoh', 'M', '2000-10-15', 'El-Obour', '01087654321', '29508291498963');
INSERT INTO `M.A.M.A.M_Project`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Sex`, `Bdate`, `Address`, `Phone`, `Super_SSN`) VALUES ('30102210232512', 'Hafsa', 'K', 'Morsi', 'F', '2001-02-21', 'Helmiet-el-zeitoun', '01587654321', '28903040949648');
INSERT INTO `M.A.M.A.M_Project`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Sex`, `Bdate`, `Address`, `Phone`, `Super_SSN`) VALUES ('30306281044924', 'Khadija', 'A', 'Mahmoud', 'F', '2003-06-28', 'El-Sayida-Zainab', '01187654321', '29101011527808');
INSERT INTO `M.A.M.A.M_Project`.`Employee` (`SSN`, `Fname`, `Minit`, `Lname`, `Sex`, `Bdate`, `Address`, `Phone`, `Super_SSN`) VALUES ('30504130836681', 'Mohab', 'W', 'Galal', 'M', '2005-04-13', 'Al-Marg', '01512345678', '29909051100359');


-- Pharmacier Table
INSERT INTO `M.A.M.A.M_Project`.`Pharmacier` (`Employee_SSN`, `Experience_Years`) VALUES ('28903040949648', 10);
INSERT INTO `M.A.M.A.M_Project`.`Pharmacier` (`Employee_SSN`, `Experience_Years`) VALUES ('29101011527808', 7);
INSERT INTO `M.A.M.A.M_Project`.`Pharmacier` (`Employee_SSN`, `Experience_Years`) VALUES ('29508291498963', 6);
INSERT INTO `M.A.M.A.M_Project`.`Pharmacier` (`Employee_SSN`, `Experience_Years`) VALUES ('29909051100359', 1);

-- Trainee Table
INSERT INTO `M.A.M.A.M_Project`.`Trainee` (`Employee_SSN`, `Academic_Degree`, `Training_Months`) VALUES ('30010151175813', 'Graduate of the Faculty of Pharmacy, Cairo University', 38);
INSERT INTO `M.A.M.A.M_Project`.`Trainee` (`Employee_SSN`, `Academic_Degree`, `Training_Months`) VALUES ('30102210232512', 'Graduate of the Faculty of Pharmacy, Ain Shams University', 32);
INSERT INTO `M.A.M.A.M_Project`.`Trainee` (`Employee_SSN`, `Academic_Degree`, `Training_Months`) VALUES ('30306281044924', 'Student at the College of Science', 10);
INSERT INTO `M.A.M.A.M_Project`.`Trainee` (`Employee_SSN`, `Academic_Degree`, `Training_Months`) VALUES ('30504130836681', 'Student at the College of Pharmacy', 7);

-- Hourly Salary Table
INSERT INTO `M.A.M.A.M_Project`.`Hourly_Salary` (`Employee_SSN`, `Price_of_Hour`) VALUES ('29405253698896', 35);
INSERT INTO `M.A.M.A.M_Project`.`Hourly_Salary` (`Employee_SSN`, `Price_of_Hour`) VALUES ('29611090225987', 30);
INSERT INTO `M.A.M.A.M_Project`.`Hourly_Salary` (`Employee_SSN`, `Price_of_Hour`) VALUES ('30010151175813', 20);
INSERT INTO `M.A.M.A.M_Project`.`Hourly_Salary` (`Employee_SSN`, `Price_of_Hour`) VALUES ('30102210232512', 18);
INSERT INTO `M.A.M.A.M_Project`.`Hourly_Salary` (`Employee_SSN`, `Price_of_Hour`) VALUES ('30306281044924', 15);
INSERT INTO `M.A.M.A.M_Project`.`Hourly_Salary` (`Employee_SSN`, `Price_of_Hour`) VALUES ('30504130836681', 13);

-- Start Time Table Of Hourly Salary Table
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('29405253698896', '2024-02-04 08:00:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('29405253698896', '2024-04-08 08:30:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('29405253698896', '2024-06-16 08:03:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('29405253698896', '2024-11-23 08:04:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('29611090225987', '2024-02-19 20:05:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('29611090225987', '2024-03-04 20:30:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('29611090225987', '2024-07-21 20:30:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('29611090225987', '2024-12-11 21:09:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('30010151175813', '2024-04-25 21:06:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('30010151175813', '2024-07-12 23:02:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('30010151175813', '2024-09-05 20:00:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('30010151175813', '2024-12-17 20:10:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('30102210232512', '2024-01-15 08:08:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('30102210232512', '2024-03-13 08:12:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('30102210232512', '2024-08-18 08:00:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('30102210232512', '2024-10-28 08:02:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('30306281044924', '2024-01-06 16:00:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('30306281044924', '2024-05-02 16:05:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('30306281044924', '2024-11-09 16:08:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('30306281044924', '2024-12-31 16:15:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('30504130836681', '2024-03-25 21:00:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('30504130836681', '2024-05-24 22:07:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('30504130836681', '2024-08-30 20:00:00');
INSERT INTO `M.A.M.A.M_Project`.`Start_Time` (`Employee_SSN`, `Start_Time`) VALUES ('30504130836681', '2024-09-01 21:15:00');

-- Leave Time Table Of Hourly Salary Table
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('29405253698896', '2024-02-04 20:00:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('29405253698896', '2024-04-08 20:30:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('29405253698896', '2024-06-16 20:03:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('29405253698896', '2024-11-23 20:04:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('29611090225987', '2024-02-20 08:05:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('29611090225987', '2024-03-05 08:30:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('29611090225987', '2024-07-22 08:30:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('29611090225987', '2024-12-12 09:09:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('30010151175813', '2024-04-26 09:06:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('30010151175813', '2024-07-13 11:02:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('30010151175813', '2024-09-06 08:00:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('30010151175813', '2024-12-18 08:10:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('30102210232512', '2024-01-15 20:08:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('30102210232512', '2024-03-13 20:12:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('30102210232512', '2024-08-18 20:00:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('30102210232512', '2024-10-28 20:02:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('30306281044924', '2024-01-06 22:00:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('30306281044924', '2024-05-02 21:05:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('30306281044924', '2024-11-09 22:08:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('30306281044924', '2024-12-31 21:15:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('30504130836681', '2024-03-26 02:00:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('30504130836681', '2024-05-25 02:07:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('30504130836681', '2024-08-31 02:00:00');
INSERT INTO `M.A.M.A.M_Project`.`Leave_Time` (`Employee_SSN`, `Leave_Time`) VALUES ('30504130836681', '2024-09-02 03:15:00');

-- Monthly Salary Table
INSERT INTO `M.A.M.A.M_Project`.`Monthly_Salary` (`Employee_SSN`, `Salary`) VALUES ('27907261434106', 15000);
INSERT INTO `M.A.M.A.M_Project`.`Monthly_Salary` (`Employee_SSN`, `Salary`) VALUES ('28212174634675', 13000);
INSERT INTO `M.A.M.A.M_Project`.`Monthly_Salary` (`Employee_SSN`, `Salary`) VALUES ('28903040949648', 12000);
INSERT INTO `M.A.M.A.M_Project`.`Monthly_Salary` (`Employee_SSN`, `Salary`) VALUES ('29101011527808', 10000);
INSERT INTO `M.A.M.A.M_Project`.`Monthly_Salary` (`Employee_SSN`, `Salary`) VALUES ('29508291498963', 9500);
INSERT INTO `M.A.M.A.M_Project`.`Monthly_Salary` (`Employee_SSN`, `Salary`) VALUES ('29909051100359', 9000);
