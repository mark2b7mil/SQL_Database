-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 28, 2023 at 03:26 AM
-- Server version: 10.6.12-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u958184899_recipes`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`u958184899_recipes`@`127.0.0.1` PROCEDURE `register` (IN `pdepartment` CHAR(4), IN `pcode` CHAR(6), IN `pemployeeid` INT, IN `ass_name` CHAR(20), OUT `pstatus` VARCHAR(255))  BEGIN
set TRANSACTION ISOLATION LEVEL SERIALIZABLE;
if enrollment(pdepartment, pcode) < 10 then 
insert into assignment( project_department_code, project_code, employee_id, ass_name)
values (pdepartment, pcode, pemployeeid, ass_name);
set pstatus = 'good';
ELSE
set pstatus = 'bad';
end if;
commit;
END$$

--
-- Functions
--
CREATE DEFINER=`u958184899_recipes`@`127.0.0.1` FUNCTION `enrollment` (`pdepartment` CHAR(2), `pcode` CHAR(6)) RETURNS INT(11) BEGIN
declare enroll int;
set enroll = (select count(*) from assignment where project_code = pcode and project_department_code = pdepartment);
return enroll;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `project_code` char(6) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `project_department_code` char(3) NOT NULL,
  `ass_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`project_code`, `employee_id`, `project_department_code`, `ass_name`) VALUES
('123456', 19, 'sa', 'whatever'),
('111111', 23, 'ma', 'make lots of money');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `code` char(2) NOT NULL,
  `department_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`code`, `department_name`) VALUES
('fi', 'Finance'),
('ma', 'Marketing'),
('sa', 'Sales');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `fname`, `lname`, `email`) VALUES
(19, 'dru', 'plopy', 'dp@orange.com'),
(23, 'pete', 'best', 'pb@orange.com');

--
-- Triggers `employee`
--
DELIMITER $$
CREATE TRIGGER `update_employee` AFTER UPDATE ON `employee` FOR EACH ROW BEGIN
insert into employee_audit (id, old_fname, old_lname, old_email) values (old.id, old.fname, old.lname, old.email);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_audit`
--

CREATE TABLE `employee_audit` (
  `id` int(11) DEFAULT NULL,
  `old_fname` varchar(255) DEFAULT NULL,
  `old_lname` varchar(255) DEFAULT NULL,
  `old_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_audit`
--

INSERT INTO `employee_audit` (`id`, `old_fname`, `old_lname`, `old_email`) VALUES
(19, 'dru', 'plopy', 'dplop@orange.com');

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_per_project`
-- (See below for the actual view)
--
CREATE TABLE `employee_per_project` (
`department_code` char(3)
,`name` varchar(100)
,`count(*)` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `department_code` char(2) NOT NULL,
  `prog_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`department_code`, `prog_name`) VALUES
('sa', 'splunk');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `proj_code` char(6) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `department_code` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`proj_code`, `name`, `department_code`) VALUES
('111111', 'market', 'ma'),
('123456', 'sell', 'sa'),
('222222', 'print money', 'fi');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `employee_id` int(11) NOT NULL,
  `salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`employee_id`, `salary`) VALUES
(19, 500),
(23, 2);

-- --------------------------------------------------------

--
-- Table structure for table `vacation`
--

CREATE TABLE `vacation` (
  `employee_id` int(11) NOT NULL,
  `dates` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vacation`
--

INSERT INTO `vacation` (`employee_id`, `dates`) VALUES
(19, 'jan-feb and march'),
(23, '12/3-12/5');

-- --------------------------------------------------------

--
-- Structure for view `employee_per_project`
--
DROP TABLE IF EXISTS `employee_per_project`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u958184899_recipes`@`127.0.0.1` SQL SECURITY DEFINER VIEW `employee_per_project`  AS SELECT `p`.`department_code` AS `department_code`, `p`.`name` AS `name`, count(0) AS `count(*)` FROM (`project` `p` join `assignment` `a` on(`p`.`proj_code` = `a`.`project_code` and `p`.`department_code` = `a`.`project_department_code`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`employee_id`,`ass_name`),
  ADD KEY `project_code` (`project_code`),
  ADD KEY `project_department_code` (`project_department_code`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`department_code`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`proj_code`,`department_code`),
  ADD KEY `department_code` (`department_code`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `vacation`
--
ALTER TABLE `vacation`
  ADD PRIMARY KEY (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `vacation`
--
ALTER TABLE `vacation`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignment`
--
ALTER TABLE `assignment`
  ADD CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`project_code`) REFERENCES `project` (`proj_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assignment_ibfk_3` FOREIGN KEY (`project_department_code`) REFERENCES `project` (`department_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `program_ibfk_1` FOREIGN KEY (`department_code`) REFERENCES `department` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`department_code`) REFERENCES `department` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `vacation`
--
ALTER TABLE `vacation`
  ADD CONSTRAINT `vacation_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
