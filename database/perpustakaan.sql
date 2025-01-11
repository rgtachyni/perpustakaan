-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 11, 2025 at 07:20 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `nama` varchar(35) NOT NULL,
  `email` varchar(35) NOT NULL,
  `adminid` varchar(16) NOT NULL,
  `pasw` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nama`, `email`, `adminid`, `pasw`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id` int NOT NULL,
  `idagt` varchar(10) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `t4lahir` varchar(40) NOT NULL,
  `tglhr` date NOT NULL,
  `jkel` varchar(11) NOT NULL,
  `alamat` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id`, `idagt`, `nama`, `password`, `t4lahir`, `tglhr`, `jkel`, `alamat`) VALUES
(1, 'ilham', 'Ilham', '12345', 'makassar', '2024-01-04', 'cowoo', 'perintis'),
(2, 'muhammad', 'muhammad', '12345', 'makassar', '2021-01-01', 'cowo', 'perintis');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int NOT NULL,
  `kdbuku` varchar(15) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `jumlah` int NOT NULL,
  `idpeng` int NOT NULL,
  `idpen` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `kdbuku`, `judul`, `tahun`, `jumlah`, `idpeng`, `idpen`) VALUES
(26, 'SD', 'Sejarah dunia', '2001', 100, 9, 8),
(27, 'SSUBBA', 'Sebuah seni untuk bersikap bodo amat', '2022', 22, 11, 9),
(28, 'FT', 'filosofi teras', '2021', 78, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `kembali`
--

CREATE TABLE `kembali` (
  `id` int NOT NULL,
  `idagt` varchar(10) NOT NULL,
  `kdbuku` varchar(10) NOT NULL,
  `tglp` date NOT NULL,
  `tglhk` date NOT NULL,
  `tglk` date NOT NULL,
  `denda` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kembali`
--

INSERT INTO `kembali` (`id`, `idagt`, `kdbuku`, `tglp`, `tglhk`, `tglk`, `denda`) VALUES
(29, 'ilham', 'SD', '2025-01-10', '2025-01-14', '2025-01-10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `idpen` int NOT NULL,
  `penerbit` varchar(40) NOT NULL,
  `alamat` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`idpen`, `penerbit`, `alamat`) VALUES
(8, 'erlangga', 'surabaya'),
(9, 'gramedia pustaka utama', 'makassar'),
(10, 'mizan pustaka', 'bandung');

-- --------------------------------------------------------

--
-- Table structure for table `pengarang`
--

CREATE TABLE `pengarang` (
  `idpeng` int NOT NULL,
  `nm_pengarang` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pengarang`
--

INSERT INTO `pengarang` (`idpeng`, `nm_pengarang`) VALUES
(9, 'eka kurniawan'),
(10, 'stephen king'),
(11, 'mitch albom');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `id` int NOT NULL,
  `idagt` varchar(10) NOT NULL,
  `kdbuku` varchar(10) NOT NULL,
  `tglp` date NOT NULL,
  `tglhk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pinjam`
--

INSERT INTO `pinjam` (`id`, `idagt`, `kdbuku`, `tglp`, `tglhk`) VALUES
(44, 'muhammad', 'SSUBBA', '2025-01-10', '2025-01-14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userid` (`adminid`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idagt` (`idagt`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kdbuku` (`kdbuku`),
  ADD KEY `idpen` (`idpen`),
  ADD KEY `idpeng` (`idpeng`);

--
-- Indexes for table `kembali`
--
ALTER TABLE `kembali`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kembali_ibfk_1` (`idagt`),
  ADD KEY `kdbuku` (`kdbuku`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`idpen`);

--
-- Indexes for table `pengarang`
--
ALTER TABLE `pengarang`
  ADD PRIMARY KEY (`idpeng`),
  ADD KEY `idpeng` (`idpeng`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pinjam_ibfk_1` (`idagt`),
  ADD KEY `pinjam_ibfk_2` (`kdbuku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `kembali`
--
ALTER TABLE `kembali`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `idpen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pengarang`
--
ALTER TABLE `pengarang`
  MODIFY `idpeng` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pinjam`
--
ALTER TABLE `pinjam`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`idpen`) REFERENCES `penerbit` (`idpen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `buku_ibfk_2` FOREIGN KEY (`idpeng`) REFERENCES `pengarang` (`idpeng`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kembali`
--
ALTER TABLE `kembali`
  ADD CONSTRAINT `kembali_ibfk_1` FOREIGN KEY (`idagt`) REFERENCES `anggota` (`idagt`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kembali_ibfk_2` FOREIGN KEY (`kdbuku`) REFERENCES `buku` (`kdbuku`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `pinjam_ibfk_1` FOREIGN KEY (`idagt`) REFERENCES `anggota` (`idagt`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pinjam_ibfk_2` FOREIGN KEY (`kdbuku`) REFERENCES `buku` (`kdbuku`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
