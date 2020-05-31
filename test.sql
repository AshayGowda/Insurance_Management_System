SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
 
CREATE TABLE `agent` (
  `Agent_code` varchar(10) NOT NULL,
  `Agent_name` varchar(150) NOT NULL,
  `DOB` date NOT NULL,
  `Address` varchar(80) NOT NULL,
  `Pincode` int(6) NOT NULL,
  `Branch` varchar(50) NOT NULL,
  `Contact_Num` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`Agent_code`, `Agent_name`, `DOB`, `Address`, `Pincode`, `Branch`, `Contact_Num`) VALUES
('234abc231', 'Sanjay', '1966-02-21', '21/694, Satyam Apartment, Refinery Road, Gorwa', 390016, 'Vadodara', 7016636685);


INSERT INTO `agent` (`Agent_code`, `Agent_name`, `DOB`, `Address`, `Pincode`, `Branch`, `Contact_Num`) VALUES
('234abc232', 'Tarun', '1966-05-12', '2/174, Hirebagewadi, MG Road, Belgaum', 577345, 'Vadodara', 9449254208);

INSERT INTO `agent` (`Agent_code`, `Agent_name`, `DOB`, `Address`, `Pincode`, `Branch`, `Contact_Num`) VALUES
('234abc233', 'Girish', '1963-04-11', '29/454, Gandhi nagar, Nehru Road, Shimoga', 577123, 'Vadodara', 7072536685);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_Num` bigint(10) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Middle_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Gender` char(1) NOT NULL,
  `DOB` date NOT NULL,
  `Address` varchar(70) NOT NULL,
  `Pincode` int(6) NOT NULL,
  `Contact_Number` bigint(10) NOT NULL,
  `Mother_Name` varchar(150) NOT NULL,
  `Mother_Status` varchar(10) NOT NULL,
  `Father_Name` varchar(150) NOT NULL,
  `Father_Status` varchar(10) NOT NULL,
  `Marital_status` char(1) NOT NULL,
  `Spouse` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--



INSERT INTO `customer` (`Customer_Num`, `First_Name`, `Middle_Name`, `Last_Name`, `Gender`, `DOB`, `Address`, `Pincode`, `Contact_Number`, `Mother_Name`, `Mother_Status`, `Father_Name`, `Father_Status`, `Marital_status`, `Spouse`) VALUES
(10002, 'Devam', 'Sanjay', 'Sheth', 'M', '2018-10-02', '21/694, Satyam Apartment, Refinery Road, Gorwa', 390016, 7016636683, 'Harsha Sheth', 'A', 'Sanjay Sheth', 'A', 'S', '');

INSERT INTO `customer` (`Customer_Num`, `First_Name`, `Middle_Name`, `Last_Name`, `Gender`, `DOB`, `Address`, `Pincode`, `Contact_Number`, `Mother_Name`, `Mother_Status`, `Father_Name`, `Father_Status`, `Marital_status`, `Spouse`) VALUES
(10003, 'Naveen', 'Polly', 'Shetty', 'M', '2018-11-06', '21/694, Chandu Apartment, Main Road, Hassan', 577453, 7015657758, 'Amar Polly Shetty', 'A', 'Yashoda Shetty', 'A', 'S', '');

INSERT INTO `customer` (`Customer_Num`, `First_Name`, `Middle_Name`, `Last_Name`, `Gender`, `DOB`, `Address`, `Pincode`, `Contact_Number`, `Mother_Name`, `Mother_Status`, `Father_Name`, `Father_Status`, `Marital_status`, `Spouse`) VALUES
(10004, 'ABC', 'Ram', 'Xyz', 'F', '2018-07-12', '56/123, Bhaskar Apartment, Subhash Road, Chikmagaluru', 577125, 7017657758, 'Ramesh Kamath', 'A', 'Myna Kamath', 'A', 'S', '');

-- --------------------------------------------------------

--
-- Table structure for table `paid_premium`,
Also has Check constraint in Create statement
--

CREATE TABLE `paid_premium` (
  `Receipt_Num` int(23) NOT NULL CHECK(Receipt_Num>=1),
  `Receipt_Date` date NOT NULL,
  `Policy_Num` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paid_premium`
--

INSERT INTO `paid_premium` (`Receipt_Num`, `Receipt_Date`, `Policy_Num`) VALUES
(325256815, '2018-10-31', 123564789),
(325284137, '2018-11-01', 284049583),
(325289940, '2018-11-01', 123564789);

-- --------------------------------------------------------

--
-- Table structure for table `policy_data`,
Also has Check constraint in Create statement
--

CREATE TABLE `policy_data` (
  `Policy_Num` int(15) NOT NULL,
  `Customer_Num` bigint(10) NOT NULL CHECK(Customer_Num>=1),
  `Agent_code` varchar(10) NOT NULL,
  `DOC` date NOT NULL,
  `Product` varchar(50) NOT NULL,
  `Sum_Assured` int(10) NOT NULL,
  `Pay_Period` int(2) NOT NULL,
  `Ins_Period` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `policy_data`
--

INSERT INTO `policy_data` (`Policy_Num`, `Customer_Num`, `Agent_code`, `DOC`, `Product`, `Sum_Assured`, `Pay_Period`, `Ins_Period`) VALUES
(123564789, 10002, '234abc231', '2018-10-02', 'Jeevan Labh', 35000, 5, 10),
(284049583, 10002, '234abc231', '2007-06-20', 'Jeevan Lakshya', 450000, 35, 80),
(123564789, 10003, '234abc232', '2018-11-02', 'Jeevan Labh', 35000, 5, 10),
(123564789, 10004, '234abc233', '2018-10-02', 'Jeevan Labh', 35000, 5, 10),
(284049583, 10004, '234abc233', '2007-06-20', 'Jeevan Lakshya', 450000, 35, 80);

-- --------------------------------------------------------

--
-- Table structure for table `premium`
--

CREATE TABLE `premium` (
  `Policy_Num` int(15) NOT NULL,
  `Premium` int(10) NOT NULL,
  `Mode` varchar(3) NOT NULL,
  `Last_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `premium`
--

INSERT INTO `premium` (`Policy_Num`, `Premium`, `Mode`, `Last_date`) VALUES
(123564789, 3500, 'YLY', '2018-12-01'),
(284049583, 469, 'MLY', '2018-12-01');

-- --------------------------------------------------------

--
-- Table structure for table `unpaid_premium`
--

CREATE TABLE `unpaid_premium` (
  `Policy_Num` int(15) NOT NULL,
  `Fine` int(10) NOT NULL,
  `Lateness` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unpaid_premium`
--

INSERT INTO `unpaid_premium` (`Policy_Num`, `Fine`, `Lateness`) VALUES
(123564789, 0, 0),
(284049583, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`Agent_code`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_Num`);

--
-- Indexes for table `paid_premium`
--
ALTER TABLE `paid_premium`
  ADD PRIMARY KEY (`Receipt_Num`),
  ADD KEY `paid_premium_ibfk_1` (`Policy_Num`);

--
-- Indexes for table `policy_data`
--
ALTER TABLE `policy_data`
  ADD PRIMARY KEY (`Policy_Num`),
  ADD KEY `Agent_code` (`Agent_code`),
  ADD KEY `Customer_Num` (`Customer_Num`);

--
-- Indexes for table `premium`
--
ALTER TABLE `premium`
  ADD PRIMARY KEY (`Policy_Num`);

--
-- Indexes for table `unpaid_premium`
--
ALTER TABLE `unpaid_premium`
  ADD PRIMARY KEY (`Policy_Num`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_Num` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10003;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `paid_premium`
--
ALTER TABLE `paid_premium`
  ADD CONSTRAINT `paid_premium_ibfk_1` FOREIGN KEY (`Policy_Num`) REFERENCES `premium` (`Policy_Num`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `policy_data`
--
ALTER TABLE `policy_data`
  ADD CONSTRAINT `Agent_code` FOREIGN KEY (`Agent_code`) REFERENCES `agent` (`Agent_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Customer_Num` FOREIGN KEY (`Customer_Num`) REFERENCES `customer` (`Customer_Num`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `premium`
--
ALTER TABLE `premium`
  ADD CONSTRAINT `premium_ibfk_1` FOREIGN KEY (`Policy_Num`) REFERENCES `policy_data` (`Policy_Num`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `unpaid_premium`
--
ALTER TABLE `unpaid_premium`
  ADD CONSTRAINT `Policy` FOREIGN KEY (`Policy_Num`) REFERENCES `premium` (`Policy_Num`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;




--
-- creating triggers
--
  
  

DELIMITER $$

CREATE TRIGGER agent_update
BEFORE UPDATE
ON agent FOR EACH ROW
BEGIN
    DECLARE errorMessage VARCHAR(255);
    SET errorMessage = CONCAT('changes','currently not allowed ');
                        
    IF 4> 3 THEN
        SIGNAL SQLSTATE'45000' 
            SET MESSAGE_TEXT = errorMessage;
    END IF;
END $$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER agent_create
BEFORE INSERT
ON agent FOR EACH ROW
BEGIN
    DECLARE errorMessage VARCHAR(255);
    SET errorMessage = CONCAT('new registrations ',' not required right now ');
                        
    IF 4> 3 THEN
        SIGNAL SQLSTATE'45000' 
            SET MESSAGE_TEXT = errorMessage;
    END IF;
END $$

DELIMITER ;



--
-- sql commands
--
SELECT SUM(Premium) FROM premium;
SELECT COUNT(Policy_Num) FROM unpaid_premium; 
SELECT MAX(Premium) FROM premium;
SELECT AVG(Premium) FROM premium;


SELECT *
FROM customer
WHERE EXISTS
	(SELECT 1
     FROM policy_data
     WHERE customer.Customer_Num=policy_data.Customer_Num);

     
     
     
SELECT * FROM premium WHERE EXISTS ( SELECT 1 FROM paid_premium WHERE premium.Policy_Num=paid_premium.Policy_Num);


SELECT Policy_Num FROM premium WHERE Premium>=(SELECT AVG(Premium) FROM premium);



SELECT Agent_Name FROM agent WHERE Pincode='390016'
UNION
SELECT FIRST_Name FROM customer WHERE Pincode='390016';
