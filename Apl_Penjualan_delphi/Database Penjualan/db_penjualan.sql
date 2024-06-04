-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2024 at 02:59 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `barang_id` int(8) NOT NULL,
  `barkode` int(20) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `harga_jual` bigint(20) DEFAULT NULL,
  `harga_beli` bigint(20) DEFAULT NULL,
  `stok` int(10) DEFAULT NULL,
  `kategori_id` int(8) DEFAULT NULL,
  `satuan_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL,
  `supplier_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`barang_id`, `barkode`, `nama`, `harga_jual`, `harga_beli`, `stok`, `kategori_id`, `satuan_id`, `user_id`, `supplier_id`) VALUES
(1000, 123123123, 'Fantu', 5000, 3500, 223, 1001, 1000, 1000, 1000),
(1001, 212121313, 'Tora', 3000, 2000, 97, 1000, 1000, 1001, 1003),
(1002, 212415456, 'Bangku Kecil', 20000, 15000, 40, 1005, 1000, 1004, 1004),
(1003, 214154251, 'Pulpen Pilot', 3000, 2500, 173, 1002, 1003, 1004, 1004),
(1004, 512136128, 'Sprute', 12000, 9000, 78, 1001, 1004, 1000, 1001);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(8) NOT NULL,
  `nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `nama`) VALUES
(1000, 'Makanan'),
(1001, 'Minuman'),
(1002, 'ATK'),
(1003, 'Buah'),
(1004, 'Sayur'),
(1005, 'Perabotan');

-- --------------------------------------------------------

--
-- Table structure for table `kustomer`
--

CREATE TABLE `kustomer` (
  `kustomer_id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kustomer`
--

INSERT INTO `kustomer` (`kustomer_id`, `nik`, `nama`, `alamat`, `telp`, `email`) VALUES
(1000, 2147483647, 'Dhea Afrizal', 'Jl. Kemuning', '+62 89289736578', 'Dheaafrizal@gmail.com'),
(1001, 2147483647, 'Fitriyanto', 'Jl. Semarang', '+62 18219371937', 'Fitriyanto@gmail.com'),
(1002, 2147483647, 'Yanto', 'Jl. Binuang', '+62 81623716311', 'Yanto@gmail.com'),
(1003, 2147483647, 'Lena', 'Jl. Bangka', '+62 85343121312', 'Lena@gmail.com'),
(1004, 2147483647, 'Alex', 'Jl. Belitung', '+62 81351673179', 'Alex@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `pembelian_id` int(8) NOT NULL,
  `invoice` int(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `bayar` int(11) DEFAULT NULL,
  `deskripsi` char(100) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `supplier_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_detail`
--

CREATE TABLE `pembelian_detail` (
  `pembelian_detail_id` int(8) NOT NULL,
  `barang_id` int(8) DEFAULT NULL,
  `pembelian_id` int(8) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `penjualan_id` int(8) NOT NULL,
  `invoice` int(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `bayar` int(11) DEFAULT NULL,
  `kembali` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kustomer_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `penjualan_detail_id` int(8) NOT NULL,
  `barang_id` int(8) DEFAULT NULL,
  `penjualan_id` int(8) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `satuan_id` int(8) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`satuan_id`, `nama`, `deskripsi`) VALUES
(1000, 'ML', 'Mili Liter'),
(1001, 'Liter', 'Liter'),
(1002, 'Kg', 'Kilogram'),
(1003, 'gram', 'gram'),
(1004, 'PCS', 'Pieces'),
(1011, 'Lusin', '12pcs PerLusin');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nama_bank` varchar(100) DEFAULT NULL,
  `nama_akun_bank` varchar(100) DEFAULT NULL,
  `no_akun_bank` varchar(100) DEFAULT NULL,
  `perusahaan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `nik`, `nama`, `telp`, `alamat`, `email`, `nama_bank`, `nama_akun_bank`, `no_akun_bank`, `perusahaan`) VALUES
(1000, 2147483647, 'Putri', '+62 87756789955', 'Jl. Kencana', 'Putri992@gmail.com', 'BNI', 'Putri Cendrawati', '12910291029', 'PT. PERKASA'),
(1001, 2147483647, 'Haiz', '+62 81267721289', 'Jl. Samudra', 'Haiz992@gmail.com', 'MANDIRI', 'Haiz', '12910291030', 'PT. JADI'),
(1002, 2147483647, 'Dian', '+62 81212351635', 'Jl. Binuang', 'Diansostro@gmail.com', 'BCA', 'Dian', '12910291031', 'PT. AYAM'),
(1003, 2147483647, 'Lita', '+62 81231313213', 'Jl. Sidomulyo', 'Litabinuang@gmail.com', 'BCA', 'Lita', '12910291032', 'PT. KUCING'),
(1004, 2147483647, 'Bagas', '+62 81291029009', 'Jl. Nikah', 'Bagastambang@gmail.com', 'BCA', 'Bagas', '12910291033', 'PT. BUAYA');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `username` char(50) DEFAULT NULL,
  `full_name` char(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `tipe` enum('L','P') DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `is_active` enum('yes','no') DEFAULT NULL,
  `role` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `nik`, `username`, `full_name`, `password`, `tipe`, `email`, `alamat`, `is_active`, `role`) VALUES
(1000, 2147483647, 'Satria992', 'Satria Mahatir', 'thisiscogil', 'L', 'Satria992@gmail.com', 'Jl. Diponogoro', 'yes', 'Admin'),
(1001, 2147483647, 'Kelra992', 'Kelra Tzy', 'kelrasiemas', 'L', 'Kelra992@gmail.com', 'Jl. Djuanda', 'yes', 'User'),
(1002, 2147483647, 'Wawan992', 'Wawan M.K.S', 'wawanjumpshot', 'L', 'Wawan992@gmail.com', 'Jl. Sudarisa', 'yes', 'Admin'),
(1003, 2147483647, 'Benny992', 'Benny Sitanggang', 'bennyyoutuber', 'L', 'Benny992@gmail.com', 'Jl. Jakarta', 'yes', 'User'),
(1004, 2147483647, 'Jerry992', 'Jerry Haye', 'hayeshooting', 'L', 'Jerry992@gmail.com', 'jL. a. yANI 992', 'yes', 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`barang_id`),
  ADD KEY `FK_KATEGORI` (`kategori_id`),
  ADD KEY `FK_SATUAN` (`satuan_id`),
  ADD KEY `FK_USER` (`user_id`),
  ADD KEY `FK_SUPPLIER` (`supplier_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `kustomer`
--
ALTER TABLE `kustomer`
  ADD PRIMARY KEY (`kustomer_id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`pembelian_id`),
  ADD KEY `FK_PEMBELIAN_USER` (`user_id`),
  ADD KEY `FK_PEMBELIAN_SUPPLIER` (`supplier_id`);

--
-- Indexes for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD PRIMARY KEY (`pembelian_detail_id`),
  ADD KEY `FK_DETAIL_PEMBELIAN_BARANG` (`barang_id`),
  ADD KEY `FK_DETAIL_PEMBELIAN` (`pembelian_id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`penjualan_id`),
  ADD KEY `FK_PENJUALAN_USER` (`user_id`),
  ADD KEY `FK_PENJUALAN_KUSTOMER` (`kustomer_id`);

--
-- Indexes for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`penjualan_detail_id`),
  ADD KEY `FK_DETAIL_PENJUALAN_BARANG` (`barang_id`),
  ADD KEY `FK_DETAIL_PENJUALAN` (`penjualan_id`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`satuan_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `barang_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011;

--
-- AUTO_INCREMENT for table `kustomer`
--
ALTER TABLE `kustomer`
  MODIFY `kustomer_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `pembelian_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  MODIFY `pembelian_detail_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `penjualan_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  MODIFY `penjualan_detail_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `satuan_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1013;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `FK_KATEGORI` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`),
  ADD CONSTRAINT `FK_SATUAN` FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`satuan_id`),
  ADD CONSTRAINT `FK_SUPPLIER` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  ADD CONSTRAINT `FK_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `FK_PEMBELIAN_SUPPLIER` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  ADD CONSTRAINT `FK_PEMBELIAN_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD CONSTRAINT `FK_DETAIL_PEMBELIAN` FOREIGN KEY (`pembelian_id`) REFERENCES `pembelian` (`pembelian_id`),
  ADD CONSTRAINT `FK_DETAIL_PEMBELIAN_BARANG` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`barang_id`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `FK_PENJUALAN_KUSTOMER` FOREIGN KEY (`kustomer_id`) REFERENCES `kustomer` (`kustomer_id`),
  ADD CONSTRAINT `FK_PENJUALAN_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD CONSTRAINT `FK_DETAIL_PENJUALAN` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualan` (`penjualan_id`),
  ADD CONSTRAINT `FK_DETAIL_PENJUALAN_BARANG` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`barang_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
