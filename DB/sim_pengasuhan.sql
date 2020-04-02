-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2019 at 11:10 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sim_pengasuhan`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(20) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `flag` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `flag`) VALUES
(1, 'Kesamptaan', 1),
(2, 'Kejujuran', 1),
(3, 'Keindonesiaan Yang Pluralis', 1),
(4, 'Prima Melayani', 1),
(5, 'Disiplin dan Pentang Menyerah', 1),
(6, 'Senantiasa Evaluasi dan Mengembangkan diri', 1),
(7, 'Tanggung jawab dan Kepemimpinan', 1),
(8, 'Loyalitas Pada Cita-cita Organisasi', 1),
(9, 'Pelanggaran Ringan', 2),
(10, 'Pelanggaran Sedang', 2),
(11, 'Pelanggaran Berat', 2);

-- --------------------------------------------------------

--
-- Table structure for table `login_session`
--

CREATE TABLE `login_session` (
  `id_log` int(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('admin','pimpinan') NOT NULL,
  `reg` enum('normal','hard') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_session`
--

INSERT INTO `login_session` (`id_log`, `username`, `password`, `level`, `reg`) VALUES
(1, 'pakadmin', '023b6c33b38194e003336eaf4acb2b86', 'admin', 'normal'),
(2, 'pakpimpinan', 'pakpimpinan', 'pimpinan', 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mhs` int(20) NOT NULL,
  `nama_mhs` varchar(100) NOT NULL,
  `prodi` varchar(100) NOT NULL,
  `tahun` varchar(20) NOT NULL,
  `kd_angkatan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `melakukan`
--

CREATE TABLE `melakukan` (
  `nim` int(20) NOT NULL,
  `id_peristiwa` int(20) NOT NULL,
  `id_mahasiswa` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `melakukan`
--

INSERT INTO `melakukan` (`nim`, `id_peristiwa`, `id_mahasiswa`) VALUES
(12345678, 1, 12345);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(20) NOT NULL,
  `id_mhs` int(20) NOT NULL,
  `ips` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peristiwa`
--

CREATE TABLE `peristiwa` (
  `id_peristiwa` int(50) NOT NULL,
  `id_kategori` int(50) NOT NULL,
  `nama_peristiwa` varchar(225) NOT NULL,
  `point` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peristiwa`
--

INSERT INTO `peristiwa` (`id_peristiwa`, `id_kategori`, `nama_peristiwa`, `point`) VALUES
(1, 1, 'Ditugaskan/dipilih sebagai Petugas Upacara/ Kegiatan di dalam atau luar kampus: l. petugas prosesi pemakaman jenazah', '1.50'),
(2, 10, 'Menggunakan handphone tidak sesuai ketentuan', '-1.00'),
(3, 1, 'Kegiatan lain yang patut diberikan penghargaan dengan pertimbangan Pengasuh', '3.00'),
(4, 11, 'Melawan atasan (insubordinasi), memperlakukan dosen dan pengasuh tidak dengan hormat', '-5.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `login_session`
--
ALTER TABLE `login_session`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mhs`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `peristiwa`
--
ALTER TABLE `peristiwa`
  ADD PRIMARY KEY (`id_peristiwa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
