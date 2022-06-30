-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220609.11e34a6fec
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jun 2022 pada 05.17
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.0.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `is_barang`
--

CREATE TABLE `is_barang` (
  `kode_barang` varchar(7) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `stok` int(11) NOT NULL,
  `created_user` int(3) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_user` int(3) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `is_barang`
--

INSERT INTO `is_barang` (`kode_barang`, `nama_barang`, `harga_beli`, `harga_jual`, `satuan`, `stok`, `created_user`, `created_date`, `updated_user`, `updated_date`) VALUES
('B000001', 'Indomie Soto', 24000, 29000, 'Dus', 150, 1, '2022-06-21 02:19:28', 1, '2022-06-21 02:44:11'),
('B000002', 'AQUA', 18000, 23000, 'Dus', 0, 1, '2022-06-21 02:20:04', 1, '2022-06-21 02:20:04'),
('B000003', 'Teh Pucuk Harum', 28000, 35000, 'Dus', 0, 1, '2022-06-21 02:21:39', 1, '2022-06-21 02:21:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `is_barang_keluar`
--

CREATE TABLE `is_barang_keluar` (
  `kode_transaksi` varchar(15) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `kode_barang` varchar(7) NOT NULL,
  `jumlah_keluar` int(11) NOT NULL,
  `created_user` int(3) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `is_barang_keluar`
--

INSERT INTO `is_barang_keluar` (`kode_transaksi`, `tanggal_keluar`, `kode_barang`, `jumlah_keluar`, `created_user`, `created_date`) VALUES
('BK-2022-0000001', '2022-06-21', 'B000001', 100, 1, '2022-06-21 02:43:47'),
('BK-2022-0000002', '2022-06-21', 'B000001', 50, 1, '2022-06-21 02:44:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `is_barang_masuk`
--

CREATE TABLE `is_barang_masuk` (
  `kode_transaksi` varchar(15) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `kode_barang` varchar(7) NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `created_user` int(3) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `is_barang_masuk`
--

INSERT INTO `is_barang_masuk` (`kode_transaksi`, `tanggal_masuk`, `kode_barang`, `jumlah_masuk`, `created_user`, `created_date`) VALUES
('BM-2022-0000001', '2022-06-21', 'B000001', 150, 1, '2022-06-21 02:33:39'),
('BM-2022-0000002', '2022-06-21', 'B000001', 150, 1, '2022-06-21 02:34:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `is_users`
--

CREATE TABLE `is_users` (
  `id_user` int(3) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telepon` varchar(13) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `hak_akses` enum('Super Admin','Manajer','Gudang') NOT NULL,
  `status` enum('aktif','blokir') NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `is_users`
--

INSERT INTO `is_users` (`id_user`, `username`, `nama_user`, `password`, `email`, `telepon`, `foto`, `hak_akses`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Jhon Dom', '21232f297a57a5a743894a0e4a801fc3', 'jhon.dom@gmail.com', '080098765432', 'avatar5.png', 'Super Admin', 'aktif', '2017-04-01 08:15:15', '2022-06-21 03:02:33'),
(2, 'jin', 'Hyung Jin', '21232f297a57a5a743894a0e4a801fc3', 'hyung.jin@gmail.com', '089664222476', 'kadina.png', 'Manajer', 'aktif', '2017-04-01 08:15:15', '2022-06-21 03:01:48'),
(3, 'yuu', 'YUU', '21232f297a57a5a743894a0e4a801fc3', 'YUU@gmail.com', '089866277711', '', 'Gudang', 'aktif', '2017-04-01 08:15:15', '2022-06-21 03:01:39');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `is_barang`
--
ALTER TABLE `is_barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `created_user` (`created_user`),
  ADD KEY `updated_user` (`updated_user`);

--
-- Indeks untuk tabel `is_barang_keluar`
--
ALTER TABLE `is_barang_keluar`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `id_barang` (`kode_barang`),
  ADD KEY `created_user` (`created_user`);

--
-- Indeks untuk tabel `is_barang_masuk`
--
ALTER TABLE `is_barang_masuk`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `id_barang` (`kode_barang`),
  ADD KEY `created_user` (`created_user`);

--
-- Indeks untuk tabel `is_users`
--
ALTER TABLE `is_users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `level` (`hak_akses`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `is_users`
--
ALTER TABLE `is_users`
  MODIFY `id_user` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `is_barang`
--
ALTER TABLE `is_barang`
  ADD CONSTRAINT `is_barang_ibfk_1` FOREIGN KEY (`created_user`) REFERENCES `is_users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `is_barang_ibfk_2` FOREIGN KEY (`updated_user`) REFERENCES `is_users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `is_barang_masuk`
--
ALTER TABLE `is_barang_masuk`
  ADD CONSTRAINT `is_barang_masuk_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `is_barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `is_barang_masuk_ibfk_2` FOREIGN KEY (`created_user`) REFERENCES `is_users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



