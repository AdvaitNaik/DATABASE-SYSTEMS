-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2023 at 05:10 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `youtube`
--

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

CREATE TABLE `channel` (
  `channel_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `subscription_count` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `channel`
--

INSERT INTO `channel` (`channel_id`, `name`, `owner`, `subscription_count`, `created_date`) VALUES
(1, 'BCC', 3, 1000, '2023-01-01'),
(2, 'Nerd Wallet', 4, 500, '2016-02-15'),
(3, 'Take You Forward', 2, 2000, '2021-12-31'),
(4, 'Marvel Entertainment', 1, 1500, '2023-01-01'),
(5, 'Talyor Swift', 6, 8000, '2014-01-20'),
(6, 'Taarak Metha Ka Ooltah Chashmah', 5, 1800, '2023-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  `comment_text` varchar(255) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `sentiment_score` float DEFAULT NULL,
  `commented_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `video_id`, `User_id`, `comment_text`, `likes`, `sentiment_score`, `commented_date`) VALUES
(1, 1, 1, 'Great video!', 10, 0.8, '2023-02-01'),
(2, 1, 2, 'Very informative', 5, 0.9, '2023-02-02'),
(3, 2, 3, 'I disagree with this', 3, 0.3, '2023-02-03'),
(4, 3, 4, 'Nice video, thanks for sharing!', 7, 0.7, '2023-02-04'),
(5, 4, 5, 'I found this very helpful', 8, 0.8, '2023-02-05'),
(6, 5, 6, 'Not bad, but could be better', 2, 0.5, '2023-02-06'),
(7, 6, 1, 'This is amazing', 12, 1, '2023-02-07'),
(8, 7, 2, 'I learned a lot from this video', 4, 0.8, '2023-02-08'),
(9, 8, 3, 'This is so interesting', 9, 0.6, '2023-02-09'),
(10, 9, 4, 'I have some questions about this', 1, 0.2, '2023-02-10'),
(11, 9, 1, 'Great Video', 10, 0.4, '2023-02-12'),
(12, 9, 5, 'Professor saty sings better than you', 10, 0.6, '2023-02-14');

-- --------------------------------------------------------

--
-- Table structure for table `keyword`
--

CREATE TABLE `keyword` (
  `keyword_id` int(11) NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `keyword`
--

INSERT INTO `keyword` (`keyword_id`, `video_id`, `keyword`) VALUES
(1, 1, 'Technology'),
(2, 1, 'Study'),
(3, 4, 'Study'),
(4, 5, 'Wallet'),
(5, 8, 'Study'),
(6, 7, 'Hike');

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE `sponsor` (
  `sponsor_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sponsor`
--

INSERT INTO `sponsor` (`sponsor_id`, `name`, `phone`, `address`) VALUES
(1, 'Acme Corporation', '555-987-6565', '789 Oak St'),
(2, 'Smith Enterprises', '555-555-5467', '1010 Pine St'),
(3, 'Johnson Industries', '555-432-1234', '1111 Cedar St'),
(4, 'Global Corp.', '555-999-5555', '2222 Maple St'),
(5, 'Smith & Sons', '555-444-4784', '6666 Oak St');

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_video_mapping`
--

CREATE TABLE `sponsor_video_mapping` (
  `sponsor_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `sponsor_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sponsor_video_mapping`
--

INSERT INTO `sponsor_video_mapping` (`sponsor_id`, `video_id`, `sponsor_amount`) VALUES
(1, 1, '500.00'),
(1, 2, '750.00'),
(1, 3, '1000.00'),
(2, 2, '250.00'),
(2, 4, '300.00'),
(3, 1, '1000.00'),
(3, 5, '1500.00'),
(4, 6, '200.00'),
(5, 8, '350.00'),
(5, 9, '500.00');

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `video_id` int(11) NOT NULL,
  `views` int(11) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `dislikes` int(11) DEFAULT NULL,
  `number_shares` int(11) DEFAULT NULL,
  `number_comments` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `statistics`
--

INSERT INTO `statistics` (`video_id`, `views`, `likes`, `dislikes`, `number_shares`, `number_comments`) VALUES
(1, 1000, 50, 5, 10, 20),
(2, 500, 2500, 3, 5, 15),
(3, 2000, 100, 15, 20, 30),
(4, 750, 40, 10, 8, 25),
(5, 3000, 200, 20, 30, 50),
(6, 100, 5, 1, 2, 3),
(7, 1500, 75, 7, 12, 40),
(8, 600, 30, 5, 10, 18),
(9, 4000, 300, 30, 50, 75),
(10, 200, 10, 2, 3, 5),
(11, 600, 30, 5, 10, 18),
(12, 750, 40, 10, 8, 25),
(13, 1000, 50, 5, 10, 20),
(14, 2000, 50, 5, 10, 20),
(15, 400, 2500, 5, 5, 35),
(16, 6000, 100, 45, 20, 30),
(17, 950, 50, 10, 8, 35),
(18, 1000, 200, 70, 30, 50);

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `channel_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `subscription_type` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`channel_id`, `User_id`, `subscription_type`) VALUES
(1, 2, 1),
(2, 1, 0),
(2, 6, 0),
(3, 5, 1),
(4, 3, 1),
(5, 4, 0),
(6, 7, 1),
(6, 8, 1),
(6, 9, 1),
(6, 10, 1),
(6, 11, 1),
(6, 12, 1),
(6, 13, 1),
(6, 14, 1),
(6, 15, 1),
(6, 16, 1),
(6, 17, 1),
(6, 18, 1),
(6, 19, 1),
(6, 20, 1),
(6, 21, 1),
(6, 22, 1),
(6, 23, 1),
(6, 24, 1),
(6, 25, 1),
(6, 26, 1),
(6, 27, 1),
(6, 28, 1),
(6, 29, 1),
(6, 30, 1),
(6, 31, 1),
(6, 32, 1),
(6, 33, 1),
(6, 34, 1),
(6, 35, 1),
(6, 36, 1),
(6, 37, 1),
(6, 38, 1),
(6, 39, 1),
(6, 40, 1),
(6, 41, 1),
(6, 42, 1),
(6, 43, 1),
(6, 44, 1),
(6, 45, 1),
(6, 46, 1),
(6, 47, 1),
(6, 48, 1),
(6, 49, 1),
(6, 50, 1),
(6, 51, 1),
(6, 52, 1),
(6, 53, 1),
(6, 54, 1),
(6, 55, 1),
(6, 56, 1),
(6, 57, 1),
(6, 58, 1),
(6, 59, 1),
(6, 60, 1),
(6, 61, 1),
(6, 62, 1),
(6, 63, 1),
(6, 64, 1),
(6, 65, 1),
(6, 66, 1),
(6, 67, 1),
(6, 68, 1),
(6, 69, 1),
(6, 70, 1),
(6, 71, 1),
(6, 72, 1),
(6, 73, 1),
(6, 74, 1),
(6, 75, 1),
(6, 76, 1),
(6, 77, 1),
(6, 78, 1),
(6, 79, 1),
(6, 80, 1),
(6, 81, 1),
(6, 82, 1),
(6, 83, 1),
(6, 84, 1),
(6, 85, 1),
(6, 86, 1),
(6, 87, 1),
(6, 88, 1),
(6, 89, 1),
(6, 90, 1),
(6, 91, 1),
(6, 92, 1),
(6, 93, 1),
(6, 94, 1),
(6, 95, 1),
(6, 96, 1),
(6, 97, 1),
(6, 98, 1),
(6, 99, 1),
(6, 100, 1),
(6, 101, 1),
(6, 102, 1),
(6, 103, 1),
(6, 104, 1),
(6, 105, 1),
(6, 106, 1),
(6, 107, 1),
(6, 108, 1),
(6, 109, 1),
(6, 110, 1),
(6, 111, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`tag_id`, `video_id`, `tag`) VALUES
(1, 2, 'Marvel'),
(2, 3, 'Music'),
(3, 9, 'Music'),
(4, 10, 'Comedy'),
(5, 6, 'Marvel');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_id`, `first_name`, `last_name`, `email`, `age`, `street`, `country`) VALUES
(1, 'Marvel Entertainment', 'Limited', 'marvel@usc.edu', 30, '123 Main St', 'Germany'),
(2, 'Jane', 'Doe', 'janedoe@usc.edu', 28, '456 Elm St', 'Mexico'),
(3, 'Bob', 'Smith', 'bobsmith@usc.edu', 42, '789 Oak St', 'US'),
(4, 'Alice', 'Johnson', 'alicejohnson@usc.edu', 25, '1010 Pine St', 'US'),
(5, 'Tarak', 'Mehta', 'tarakmehta@usc.edu', 38, '1111 Cedar St', 'Canada'),
(6, 'Taylor', 'Swift', 'taylorswift@usc.edu', 27, '720 W Portland', 'US'),
(7, 'Tom', 'Cruise', 'tomcruise@gmail.com', 59, '123 Main St', 'US'),
(8, 'Brad', 'Pitt', 'bradpitt@gmail.com', 58, '456 Elm St', 'US'),
(9, 'Jennifer', 'Aniston', 'jenniferaniston@gmail.com', 52, '789 Oak St', 'US'),
(10, 'Angelina', 'Jolie', 'angelinajolie@gmail.com', 46, '1010 Pine St', 'US'),
(11, 'Leonardo', 'DiCaprio', 'leonardodicaprio@gmail.com', 47, '1111 Cedar St', 'US'),
(12, 'Emma', 'Stone', 'emmastone@gmail.com', 33, '720 W Portland', 'US'),
(13, 'Ryan', 'Gosling', 'ryangosling@gmail.com', 41, '321 Market St', 'Canada'),
(14, 'Margot', 'Robbie', 'margotrobbie@gmail.com', 32, '555 5th Ave', 'Australia'),
(15, 'Chris', 'Hemsworth', 'chrishemsworth@gmail.com', 38, '10 Downing St', 'Australia'),
(16, 'Scarlett', 'Johansson', 'scarlettjohansson@gmail.com', 37, '44 Wall St', 'US'),
(17, 'Robert', 'De Niro', 'robertdeniro@gmail.com', 78, '22 Park Ave', 'US'),
(18, 'Meryl', 'Streep', 'merylstreep@gmail.com', 72, '222 Broadway', 'US'),
(19, 'Denzel', 'Washington', 'denzelwashington@gmail.com', 67, '123 Main St', 'US'),
(20, 'Anne', 'Hathaway', 'annehathaway@gmail.com', 38, '789 Oak St', 'US'),
(21, 'Johnny', 'Depp', 'johnnydepp@gmail.com', 58, '1010 Pine St', 'US'),
(22, 'Julia', 'Roberts', 'juliaroberts@gmail.com', 54, '1111 Cedar St', 'US'),
(23, 'Will', 'Smith', 'willsmith@gmail.com', 53, '222 Elm St', 'US'),
(24, 'Halle', 'Berry', 'halleberry@gmail.com', 55, '444 Oak St', 'US'),
(25, 'Matthew', 'McConaughey', 'matthewmcconaughey@gmail.com', 52, '666 Maple St', 'US'),
(26, 'Sandra', 'Bullock', 'sandrabullock@gmail.com', 57, '777 Beach Ave', 'US'),
(27, 'George', 'Clooney', 'georgeclooney@gmail.com', 60, '888 Vine St', 'US'),
(28, 'Angelica', 'Houston', 'angelicahouston@gmail.com', 70, '999 1st St', 'US'),
(29, 'Serena', 'Williams', 'serenawilliams@gmail.com', 40, '123 Main St', 'US'),
(30, 'Roger', 'Federer', 'rogerfederer@gmail.com', 40, '456 Elm St', 'Switzerland'),
(31, 'Cristiano', 'Ronaldo', 'cristianoronaldo@gmail.com', 36, '789 Oak St', 'Portugal'),
(32, 'Lionel', 'Messi', 'lionelmessi@gmail.com', 34, '1010 Pine St', 'Argentina'),
(33, 'Usain', 'Bolt', 'usainbolt@gmail.com', 35, '1111 Cedar St', 'Jamaica'),
(34, 'Simone', 'Biles', 'simonebiles@gmail.com', 24, '720 W Portland', 'US'),
(35, 'Michael', 'Phelps', 'michaelphelps@gmail.com', 36, '321 Market St', 'US'),
(36, 'Kobe', 'Bryant', 'kobebryant@gmail.com', 41, '555 5th Ave', 'US'),
(37, 'Tom', 'Brady', 'tombrady@gmail.com', 44, '10 Downing St', 'US'),
(38, 'LeBron', 'James', 'lebronjames@gmail.com', 37, '44 Wall St', 'US'),
(39, 'Rafael', 'Nadal', 'rafaelnadal@gmail.com', 35, '22 Park Ave', 'Spain'),
(40, 'Novak', 'Djokovic', 'novakdjokovic@gmail.com', 34, '222 Broadway', 'Serbia'),
(41, 'Muhammad', 'Ali', 'muhammadali@gmail.com', 74, '123 Main St', 'US'),
(42, 'Mike', 'Tyson', 'miketyson@gmail.com', 55, '789 Oak St', 'US'),
(43, 'Manny', 'Pacquiao', 'mannypacquiao@gmail.com', 43, '1010 Pine St', 'Philippines'),
(44, 'Floyd', 'Mayweather', 'floydmayweather@gmail.com', 44, '1111 Cedar St', 'US'),
(45, 'Serena', 'Guthrie', 'serenaguthrie@gmail.com', 28, '222 Elm St', 'US'),
(46, 'Lindsey', 'Vonn', 'lindseyvonn@gmail.com', 37, '444 Oak St', 'US'),
(47, 'Shaun', 'White', 'shaunwhite@gmail.com', 35, '666 Maple St', 'US'),
(48, 'Dan', 'Carter', 'dancarter@gmail.com', 39, '777 Beach Ave', 'New Zealand'),
(49, 'Sania', 'Mirza', 'saniamirza@gmail.com', 34, '888 Vine St', 'India'),
(50, 'Virat', 'Kohli', 'viratkohli@gmail.com', 33, '999 1st St', 'India'),
(51, 'Barack', 'Obama', 'barackobama@gmail.com', 60, '1600 Pennsylvania Ave', 'US'),
(52, 'Joe', 'Biden', 'joebiden@gmail.com', 78, '1 Observatory Cir NW', 'US'),
(53, 'Hillary', 'Clinton', 'hillaryclinton@gmail.com', 74, '55th St & 5th Ave', 'US'),
(54, 'Kamala', 'Harris', 'kamalaharris@gmail.com', 56, '1 Observatory Cir NW', 'US'),
(55, 'Justin', 'Trudeau', 'justintrudeau@gmail.com', 49, '24 Sussex Dr', 'Canada'),
(56, 'Emmanuel', 'Macron', 'emmanuelmacron@gmail.com', 43, '55 Rue du Faubourg Saint-Honoré', 'France'),
(57, 'Angela', 'Merkel', 'angelamerkel@gmail.com', 67, 'Wilhelmstraße 77', 'Germany'),
(58, 'Xi', 'Jinping', 'xijinping@gmail.com', 68, 'Zhongnanhai Compound', 'China'),
(59, 'Vladimir', 'Putin', 'vladimirputin@gmail.com', 68, '23 Ilyinka St', 'Russia'),
(60, 'Jacinda', 'Ardern', 'jacindaardern@gmail.com', 40, '101 Boulcott St', 'New Zealand'),
(61, 'Narendra', 'Modi', 'narendramodi@gmail.com', 70, '7 Lok Kalyan Marg', 'India'),
(62, 'Scott', 'Morrison', 'scottmorrison@gmail.com', 53, 'The Lodge, Adelaide', 'Australia'),
(63, 'Jair', 'Bolsonaro', 'jairbolsonaro@gmail.com', 66, 'Palácio da Alvorada', 'Brazil'),
(64, 'Andrés Manuel', 'López Obrador', 'amlo@gmail.com', 68, 'National Palace', 'Mexico'),
(65, 'Boris', 'Johnson', 'borisjohnson@gmail.com', 57, '10 Downing St', 'UK'),
(66, 'Shinzo', 'Abe', 'shinzoabe@gmail.com', 67, '1 Chome-6-1 Nagatacho', 'Japan'),
(67, 'Moon', 'Jae-in', 'moonjaein@gmail.com', 68, 'The Blue House', 'South Korea'),
(68, 'Mikhail', 'Gorbachev', 'mikhailgorbachev@gmail.com', 90, '10/1 Kutuzovsky Ave', 'Russia'),
(69, 'Margaret', 'Thatcher', 'margaretthatcher@gmail.com', 87, '10 Downing St', 'UK'),
(70, 'Mahathir', 'Mohamad', 'mahathirmohamad@gmail.com', 96, 'Jalan Dato Onn', 'Malaysia'),
(71, 'Lee', 'Kuan Yew', 'leekuanyew@gmail.com', 91, '38 Oxley Rd', 'Singapore'),
(72, 'Ada', 'Lovelace', 'adalovelace@gmail.com', 36, 'Horsleydown Lane', 'UK'),
(73, 'Alan', 'Turing', 'alanturing@gmail.com', 41, 'Enfield, London', 'UK'),
(74, 'Grace', 'Hopper', 'gracehopper@gmail.com', 85, 'Arlington, Virginia', 'US'),
(75, 'John', 'von Neumann', 'johnvonneumann@gmail.com', 53, '1050 Fifth Ave', 'US'),
(76, 'Claude', 'Shannon', 'claudeshannon@gmail.com', 84, '1413 Doon Ct', 'US'),
(77, 'Linus', 'Pauling', 'linuspauling@gmail.com', 93, '564 Arroyo Drive', 'US'),
(78, 'Rosalind', 'Franklin', 'rosalindfranklin@gmail.com', 37, '63 Wyndham Place', 'UK'),
(79, 'Erwin', 'Schrödinger', 'erwinschrodinger@gmail.com', 73, 'Boltzmanngasse 9', 'Austria'),
(80, 'James', 'Watson', 'jameswatson@gmail.com', 93, 'Copenhagen, Denmark', 'US'),
(81, 'Francis', 'Crick', 'franciscrick@gmail.com', 88, 'Northampton, UK', 'UK'),
(82, 'Dorothy', 'Hodgkin', 'dorothyhodgkin@gmail.com', 84, 'Wolfson College, Oxford', 'UK'),
(83, 'Max', 'Born', 'maxborn@gmail.com', 87, 'Bückeburg, Germany', 'Germany'),
(84, 'Louis', 'Pasteur', 'louispasteur@gmail.com', 72, 'Institut Pasteur', 'France'),
(85, 'Gertrude', 'B. Elion', 'gertrudeelion@gmail.com', 73, 'New York, USA', 'US'),
(86, 'Jonas', 'Salk', 'jonassalk@gmail.com', 80, 'La Jolla, California', 'US'),
(87, 'Alexander', 'Fleming', 'alexanderfleming@gmail.com', 73, 'St. Mary’s Hospital, London', 'UK'),
(88, 'Edward', 'Teller', 'edwardteller@gmail.com', 95, 'New York City, US', 'US'),
(89, 'Edward', 'Witten', 'edwardwitten@gmail.com', 69, 'Princeton, New Jersey', 'US'),
(90, 'John', 'Bardeen', 'johnbardeen@gmail.com', 82, 'University of Illinois', 'US'),
(91, 'Hideki', 'Yukawa', 'hidekiyukawa@gmail.com', 65, 'Kyoto University', 'Japan'),
(92, 'Frits', 'Zernike', 'fritszernike@gmail.com', 85, 'University of Groningen', 'Netherlands'),
(93, 'Isaac', 'Newton', 'isaacnewton@gmail.com', 84, 'Woolsthorpe Manor', 'UK'),
(94, 'Galileo', 'Galilei', 'galileogalilei@gmail.com', 77, 'Via del Governo Vecchio', 'Italy'),
(95, 'Charles', 'Darwin', 'charlesdarwin@gmail.com', 73, 'Down House', 'UK'),
(96, 'Stephen', 'Hawking', 'stephenhawking@gmail.com', 76, 'University of Cambridge', 'UK'),
(97, 'Nikola', 'Tesla', 'nikolatesla@gmail.com', 86, '33-35 South Fifth Ave', 'US'),
(98, 'Richard', 'Feynman', 'richardfeynman@gmail.com', 69, '300 Alta Ave', 'US'),
(99, 'Ernest', 'Rutherford', 'ernestrutherford@gmail.com', 66, 'The University of Manchester', 'UK'),
(100, 'James', 'Clerk Maxwell', 'jamesclerkmaxwell@gmail.com', 48, '14 India St', 'UK'),
(101, 'Niels', 'Bohr', 'nielsbohr@gmail.com', 77, 'Carlsbergvej 2', 'Denmark'),
(102, 'Max', 'Planck', 'maxplanck@gmail.com', 89, 'Hofgartenstraße 8', 'Germany'),
(103, 'Michael', 'Faraday', 'michaelfaraday@gmail.com', 75, 'Royal Institution of Great Britain', 'UK'),
(104, 'Werner', 'Heisenberg', 'wernerheisenberg@gmail.com', 74, 'Bunsenstraße 10', 'Germany'),
(105, 'Paul', 'Dirac', 'pauldirac@gmail.com', 82, '25 St Giles', 'UK'),
(106, 'Enrico', 'Fermi', 'enricofermi@gmail.com', 53, 'Via Panisperna 89', 'Italy'),
(107, 'Robert', 'Boyle', 'robertboyle@gmail.com', 64, '7 Stalbridge St', 'UK'),
(108, 'Gottfried', 'Leibniz', 'gottfriedleibniz@gmail.com', 70, 'Markt 1', 'Germany'),
(109, 'Blaise', 'Pascal', 'blaisepascal@gmail.com', 39, '39 rue Etienne Marcel', 'France'),
(110, 'Johannes', 'Kepler', 'johanneskepler@gmail.com', 58, 'St. Anna-Platz 1', 'Germany'),
(111, 'Carl', 'Sagan', 'carlsagan@gmail.com', 62, 'Cornell University', 'US');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `video_id` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `uploaded_date` date DEFAULT NULL,
  `uploaded_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`video_id`, `channel_id`, `title`, `URL`, `category`, `duration`, `description`, `uploaded_date`, `uploaded_time`) VALUES
(1, 3, 'Introduction to SQL', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '00:15:30', 'Learn SQL basics', '2022-02-15', '12:30:00'),
(2, 4, 'Iron Man', 'https://www.youtube.com/watch?v=1CRDQTuylsM', 2, '00:10:20', 'Get started with Iron Man world', '2023-01-16', '16:45:00'),
(3, 5, 'Taylor Swift - Lavender Haze', 'https://www.youtube.com/watch?v=ioKjLXnWBvQ', 2, '00:05:45', 'Official music video for Lavender Haze by Taylor Swift from the album Midnights', '2022-02-17', '09:15:00'),
(4, 3, 'Advanced SQL Queries', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '00:20:45', 'Learn advanced SQL techniques', '2022-02-18', '14:20:00'),
(5, 2, 'Wallet', 'https://www.youtube.com/watch?v=jFm_wY-mQcw', 1, '00:08:15', 'Learn to bake delicious treats', '2022-02-19', '10:00:00'),
(6, 4, 'Secret Invasion', 'https://www.youtube.com/watch?v=12345', 2, '00:08:15', 'I am the last person standing between them and what they really want', '2023-01-01', '08:00:00'),
(7, 1, 'The Best Hiking Trails in the US', 'https://www.youtube.com/watch?v=67890', 1, '00:08:14', 'Discover some of the most beautiful hiking trails in the United States', '2023-02-15', '12:30:00'),
(8, 3, 'Introduction to Machine Learning', 'https://www.youtube.com/watch?v=23456', 1, '01:08:15', 'Get started with machine learning with this beginner-friendly tutorial', '2022-03-10', '16:45:00'),
(9, 5, 'Taylor Swift - Bejeweled', 'https://www.youtube.com/watch?v=78901', 2, '00:20:45', 'Official music video for Bejeweled by Taylor Swift from the album Midnights', '2023-01-04', '10:00:00'),
(10, 6, 'Eposide 1432', 'https://www.youtube.com/watch?v=23456', 2, '00:20:45', 'Learn how to stay motivated and achieve your goals with these helpful tips', '2022-05-05', '14:00:00'),
(11, 5, 'Taylor Swift - Enchanted', 'https://www.youtube.com/watch?v=23456', 2, '00:21:45', 'Official music video for Enchanted by Taylor Swift from the album Speak Now', '2023-01-26', '14:30:00'),
(12, 5, 'Taylor Swift - Fireflies', 'https://www.youtube.com/watch?v=23456', 2, '00:22:45', 'Official music video for Fireflies by Taylor Swift from the album Luminescence', '2023-01-11', '18:30:00'),
(13, 5, 'Taylor Swift - Stardust', 'https://www.youtube.com/watch?v=34567', 2, '00:23:45', 'Official music video for Stardust by Taylor Swift from the album Cosmic', '2023-01-31', '15:45:00'),
(14, 2, '10 Tips for Saving Money', 'https://www.youtube.com/watch?v=12345', 1, '00:20:44', 'In this video, we share 10 tips for saving money on everyday expenses.', '2023-02-01', '12:00:00'),
(15, 2, 'The Best Credit Cards for Travel', 'https://www.youtube.com/watch?v=23456', 1, '00:20:55', 'If you love to travel, you need the right credit card. In this video, we review the best credit cards for travel.', '2023-02-08', '14:30:00'),
(16, 2, 'How to Choose the Right Insurance Policy', 'https://www.youtube.com/watch?v=34567', 1, '00:18:45', 'Choosing the right insurance policy can be confusing. In this video, we explain how to pick the right policy for your needs.', '2023-02-15', '09:00:00'),
(17, 2, 'Investing in Stocks for Beginners', 'https://www.youtube.com/watch?v=45678', 1, '00:28:45', 'If you want to invest in stocks but dont know where to start, this video is for you. We cover the basics of investing in stocks for beginners.', '2023-02-22', '16:15:00'),
(18, 2, 'How to Save for Retirement in Your 20s', 'https://www.youtube.com/watch?v=56789', 1, '00:20:48', 'Its never too early to start saving for retirement. In this video, we share tips on how to save for retirement in your 20s.', '2023-02-28', '11:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `video_category_mapping`
--

CREATE TABLE `video_category_mapping` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `video_category_mapping`
--

INSERT INTO `video_category_mapping` (`category_id`, `category_name`) VALUES
(1, 'Informational'),
(2, 'Entertainment');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`channel_id`),
  ADD KEY `fk_owner` (`owner`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`keyword_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`sponsor_id`);

--
-- Indexes for table `sponsor_video_mapping`
--
ALTER TABLE `sponsor_video_mapping`
  ADD PRIMARY KEY (`sponsor_id`,`video_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`video_id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`channel_id`,`User_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`video_id`),
  ADD KEY `fk_channel` (`channel_id`);

--
-- Indexes for table `video_category_mapping`
--
ALTER TABLE `video_category_mapping`
  ADD PRIMARY KEY (`category_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `channel`
--
ALTER TABLE `channel`
  ADD CONSTRAINT `fk_owner` FOREIGN KEY (`owner`) REFERENCES `users` (`User_id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`);

--
-- Constraints for table `keyword`
--
ALTER TABLE `keyword`
  ADD CONSTRAINT `keyword_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`);

--
-- Constraints for table `sponsor_video_mapping`
--
ALTER TABLE `sponsor_video_mapping`
  ADD CONSTRAINT `sponsor_video_mapping_ibfk_1` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsor` (`sponsor_id`),
  ADD CONSTRAINT `sponsor_video_mapping_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`);

--
-- Constraints for table `statistics`
--
ALTER TABLE `statistics`
  ADD CONSTRAINT `statistics_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`);

--
-- Constraints for table `subscription`
--
ALTER TABLE `subscription`
  ADD CONSTRAINT `subscription_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`channel_id`),
  ADD CONSTRAINT `subscription_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`);

--
-- Constraints for table `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`);

--
-- Constraints for table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `fk_channel` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`channel_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
