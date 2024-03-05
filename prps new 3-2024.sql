-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Mar 2024 pada 15.44
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prps`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `BukuID` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `Sampul` varchar(255) NOT NULL,
  `Judul` varchar(255) NOT NULL,
  `Penulis` varchar(255) NOT NULL,
  `Penerbit` varchar(255) NOT NULL,
  `Tahun_Terbit` int(11) NOT NULL,
  `Stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`BukuID`, `id_kategori`, `Sampul`, `Judul`, `Penulis`, `Penerbit`, `Tahun_Terbit`, `Stok`) VALUES
(29, 1, 'komet.jpg', 'Komet', 'Tereliye', 'Gramedia', 2023, 1),
(30, 1, 'Bintang.jpg', 'Bintang', 'Tereliye', 'Gramedia', 2023, 10),
(31, 1, 'bulan.jpg', 'Bulan', 'Tereliye', 'Gramedia', 2023, 10),
(32, 1, 'matahari.jpg', 'Matahari', 'Tereliye', 'Gramedia', 2023, 10),
(33, 1, 'selena.jpg', 'Selena', 'Tereliye', 'Gramedia', 2023, 10),
(35, 1, '716010920_si_juki_-_lika-liku_anak_kos.jpg', 'Si Juki Lika Liku Anak Kos', 'Faza Meonk', 'Gramedia', 2024, 10),
(36, 5, 'keroyokan.jpg', 'Si Juki Seri Keroyokan', 'Faza Meonk', 'Gramedia', 2024, 10),
(37, 5, 'mang awung.jpg', 'Si Juki & Mang Awung', 'Faza Meonk', 'Gramedia', 2023, 10),
(38, 2, 'GAMBAR-HUTAN-MERAH.jpg', 'Hutan Merah', 'Fauzi. A', 'Gramedia', 2024, 10),
(39, 7, 'mtk.jpg', 'MATEMATIKA KELAS X', 'Arif Ediyanto | Maya Harsasi', 'Erlangga', 2022, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku`
--

CREATE TABLE `kategoribuku` (
  `KategoriID` int(11) NOT NULL,
  `NamaKategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategoribuku`
--

INSERT INTO `kategoribuku` (`KategoriID`, `NamaKategori`) VALUES
(1, 'Novel'),
(2, 'Cerita Pendek'),
(5, 'Komik'),
(6, 'Sejarah Islam Di Indonesia'),
(7, 'Mata Pelajaran');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku_relasi`
--

CREATE TABLE `kategoribuku_relasi` (
  `KategoriBukuID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL,
  `KategoriID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `koleksipribadi`
--

CREATE TABLE `koleksipribadi` (
  `KoleksiID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjam`
--

CREATE TABLE `peminjam` (
  `PeminjamanID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL,
  `TanggalPeminjaman` date NOT NULL,
  `TanggalPengembalian` date NOT NULL,
  `StatusPeminjaman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjam`
--

INSERT INTO `peminjam` (`PeminjamanID`, `UserID`, `BukuID`, `TanggalPeminjaman`, `TanggalPengembalian`, `StatusPeminjaman`) VALUES
(30, 8, 39, '2024-02-27', '2024-02-28', 'dipinjam'),
(31, 5, 38, '2024-02-26', '2024-02-27', 'dikembalikan'),
(32, 5, 38, '2024-02-27', '2024-02-27', 'dikembalikan'),
(33, 5, 38, '2024-02-27', '2024-02-27', 'dikembalikan'),
(34, 5, 29, '2024-02-27', '2024-02-27', 'dikembalikan'),
(35, 5, 37, '2024-02-27', '2024-02-27', 'dikembalikan'),
(36, 5, 29, '2024-02-27', '2024-02-27', 'dikembalikan'),
(37, 5, 29, '2024-02-27', '2024-02-27', 'dikembalikan'),
(38, 5, 32, '2024-02-27', '2024-02-27', 'dikembalikan'),
(39, 5, 33, '2024-02-27', '2024-02-27', 'dikembalikan'),
(40, 5, 33, '2024-02-27', '2024-02-27', 'dikembalikan'),
(41, 5, 29, '2024-02-27', '2024-02-27', 'dikembalikan'),
(42, 5, 29, '2024-02-27', '2024-02-27', 'dikembalikan'),
(43, 5, 31, '2024-02-27', '2024-02-27', 'dikembalikan'),
(44, 5, 33, '2024-02-27', '2024-02-27', 'dikembalikan'),
(45, 5, 35, '2024-02-28', '2024-02-28', 'dikembalikan'),
(46, 5, 35, '2024-02-28', '2024-02-28', 'dikembalikan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulasanbuku`
--

CREATE TABLE `ulasanbuku` (
  `UlasanID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL,
  `Ulasan` text NOT NULL,
  `Rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ulasanbuku`
--

INSERT INTO `ulasanbuku` (`UlasanID`, `UserID`, `BukuID`, `Ulasan`, `Rating`) VALUES
(9, 5, 35, 'Komik ini sangat bagus untuk dibaca ketika waktu luang', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `userid`
--

CREATE TABLE `userid` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `NamaLengkap` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `level` enum('admin','peminjam','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `userid`
--

INSERT INTO `userid` (`UserID`, `Username`, `Password`, `Email`, `NamaLengkap`, `Alamat`, `level`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com', 'admin', 'sby', 'admin'),
(3, 'siswa', 'bcd724d15cde8c47650fda962968f102', 'siswa@gmail.com', 'siswa', 'kediri', 'peminjam'),
(4, 'fitra', '39ac928668d25ccb478c0a0ea0ac7a4c', 'fitra@gmail.com', 'fitra', 'Ponorogo', 'peminjam'),
(5, 'raka', 'e5b2a975d9b73165bcc8b5e63ce488ff', 'raka@gmail.com', 'raka', 'Ponorogo', 'peminjam'),
(6, 'mail', 'b83a886a5c437ccd9ac15473fd6f1788', 'mail@gmail.com', 'mail', 'Ponorogo', 'peminjam'),
(7, 'petuugas', '8948bccac809e6ae1646f725286033c8', 'petuugas@gmail.com', 'petuugas', 'Ponorogo', 'petugas'),
(8, 'Hani eva', 'a0cffb0dfffd115e271d99132991be20', 'Hani@gmail.com', 'Hani', 'sby', 'peminjam'),
(9, 'petugas1', 'b53fe7751b37e40ff34d012c7774d65f', 'petugas1@gmail.com', 'petugas1', 'sby', 'petugas'),
(10, 'petugas2', 'petugas2', 'petugas2@gmail.com', 'petugas2', 'sby', 'petugas'),
(11, 'petugas3', 'petugas3', 'petugas3@gmail.com', 'petugas3', 'sby', 'petugas');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`BukuID`);

--
-- Indeks untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  ADD PRIMARY KEY (`KategoriID`);

--
-- Indeks untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  ADD PRIMARY KEY (`KategoriBukuID`),
  ADD UNIQUE KEY `BukuID` (`BukuID`,`KategoriID`),
  ADD KEY `KategoriID` (`KategoriID`);

--
-- Indeks untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD PRIMARY KEY (`KoleksiID`),
  ADD UNIQUE KEY `UserID` (`UserID`,`BukuID`),
  ADD KEY `BukuID` (`BukuID`);

--
-- Indeks untuk tabel `peminjam`
--
ALTER TABLE `peminjam`
  ADD PRIMARY KEY (`PeminjamanID`),
  ADD KEY `UserID` (`UserID`,`BukuID`);

--
-- Indeks untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD PRIMARY KEY (`UlasanID`),
  ADD UNIQUE KEY `UserID` (`UserID`,`BukuID`),
  ADD KEY `BukuID` (`BukuID`);

--
-- Indeks untuk tabel `userid`
--
ALTER TABLE `userid`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `BukuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  MODIFY `KategoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  MODIFY `KategoriBukuID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  MODIFY `KoleksiID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `peminjam`
--
ALTER TABLE `peminjam`
  MODIFY `PeminjamanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  MODIFY `UlasanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `userid`
--
ALTER TABLE `userid`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  ADD CONSTRAINT `kategoribuku_relasi_ibfk_1` FOREIGN KEY (`KategoriID`) REFERENCES `kategoribuku` (`KategoriID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kategoribuku_relasi_ibfk_2` FOREIGN KEY (`BukuID`) REFERENCES `buku` (`BukuID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD CONSTRAINT `koleksipribadi_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `userid` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `koleksipribadi_ibfk_2` FOREIGN KEY (`BukuID`) REFERENCES `buku` (`BukuID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `peminjam`
--
ALTER TABLE `peminjam`
  ADD CONSTRAINT `peminjam_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `userid` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD CONSTRAINT `ulasanbuku_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `userid` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ulasanbuku_ibfk_2` FOREIGN KEY (`BukuID`) REFERENCES `buku` (`BukuID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
