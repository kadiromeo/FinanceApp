-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 25 Eki 2022, 15:50:55
-- Sunucu sürümü: 10.4.25-MariaDB
-- PHP Sürümü: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `financeappdb`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bankas`
--

CREATE TABLE `bankas` (
  `id` int(10) UNSIGNED NOT NULL,
  `ad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iban` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hesapNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `bankas`
--

INSERT INTO `bankas` (`id`, `ad`, `iban`, `hesapNo`, `created_at`, `updated_at`) VALUES
(2, 'Ziraat Bankası', '21351685646515648648616', '45615645611', '2022-10-21 11:46:41', '2022-10-21 11:50:06'),
(3, 'dewafewaf', '123213213', '341324324', '2022-10-25 10:35:40', '2022-10-25 10:35:40');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `faturas`
--

CREATE TABLE `faturas` (
  `id` int(10) UNSIGNED NOT NULL,
  `faturaTipi` int(11) NOT NULL DEFAULT 0 COMMENT '0 ise gelir, 1 ise gider',
  `faturaNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `musteriId` int(11) NOT NULL,
  `faturaTarih` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `faturas`
--

INSERT INTO `faturas` (`id`, `faturaTipi`, `faturaNo`, `musteriId`, `faturaTarih`, `created_at`, `updated_at`) VALUES
(3, 0, '4', 8, '2022-10-22', '2022-10-22 05:34:02', '2022-10-22 05:34:02'),
(4, 1, '5', 8, '2022-10-22', '2022-10-22 05:55:24', '2022-10-22 05:55:24'),
(5, 0, '10', 8, '2022-10-25', '2022-10-25 08:54:57', '2022-10-25 08:54:57'),
(6, 0, '15', 8, '2022-10-25', '2022-10-25 10:34:50', '2022-10-25 10:34:50'),
(7, 0, '40', 7, '2022-10-25', '2022-10-25 10:40:23', '2022-10-25 10:40:23'),
(8, 0, '55', 7, '2022-10-25', '2022-10-25 10:41:33', '2022-10-25 10:41:33'),
(9, 0, '60', 8, '2022-10-25', '2022-10-25 10:42:37', '2022-10-25 10:42:37');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fatura_islems`
--

CREATE TABLE `fatura_islems` (
  `id` int(10) UNSIGNED NOT NULL,
  `faturaId` int(11) NOT NULL,
  `kalemId` int(11) NOT NULL,
  `miktar` int(11) NOT NULL,
  `fiyat` double NOT NULL,
  `kdv` int(11) DEFAULT 0,
  `araToplam` double NOT NULL,
  `kdvToplam` double NOT NULL,
  `genelToplam` double NOT NULL,
  `urunId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `islems`
--

CREATE TABLE `islems` (
  `id` int(10) UNSIGNED NOT NULL,
  `tip` int(11) NOT NULL DEFAULT 0,
  `musteriId` int(11) NOT NULL,
  `faturaId` int(11) NOT NULL DEFAULT 0,
  `fiyat` double NOT NULL,
  `tarih` date NOT NULL,
  `Hesap` int(11) NOT NULL,
  `odemeSekli` int(11) NOT NULL,
  `aciklama` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `islems`
--

INSERT INTO `islems` (`id`, `tip`, `musteriId`, `faturaId`, `fiyat`, `tarih`, `Hesap`, `odemeSekli`, `aciklama`, `created_at`, `updated_at`) VALUES
(1, 0, 8, 4, 3500, '2022-10-24', 0, 0, 'oşoıjşıoşı2', '2022-10-24 07:38:35', '2022-10-24 10:15:57'),
(2, 1, 8, 3, 2000, '2022-10-24', 2, 0, 'ok', '2022-10-24 07:48:09', '2022-10-24 07:48:09'),
(4, 1, 8, 3, 3500, '2022-10-24', 0, 0, 'TAMAM', '2022-10-24 10:16:12', '2022-10-24 10:16:12'),
(5, 1, 8, 5, 1500, '2022-10-25', 0, 0, 'tamam', '2022-10-25 08:56:29', '2022-10-25 08:56:29');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kalems`
--

CREATE TABLE `kalems` (
  `id` int(10) UNSIGNED NOT NULL,
  `kalemTipi` int(11) NOT NULL,
  `ad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdv` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `kalems`
--

INSERT INTO `kalems` (`id`, `kalemTipi`, `ad`, `kdv`, `created_at`, `updated_at`) VALUES
(1, 0, 'Script Yazılımları', 18, '2022-10-21 11:28:14', '2022-10-21 11:33:40'),
(3, 1, 'İnternet', 10, '2022-10-22 05:20:48', '2022-10-22 05:20:48');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `loggers`
--

CREATE TABLE `loggers` (
  `id` int(10) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `islem` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `loggers`
--

INSERT INTO `loggers` (`id`, `text`, `islem`, `created_at`, `updated_at`) VALUES
(1, 'urun1 Ürün Eklendi', 'Ürün', '2022-10-25 08:07:21', '2022-10-25 08:07:21'),
(2, 'urun1 Ürün Düzenlendi', 'Ürün', '2022-10-25 08:18:19', '2022-10-25 08:18:19'),
(3, 'Ekran Kartı Ürün Silindi', 'urun', '2022-10-25 08:18:25', '2022-10-25 08:18:25'),
(4, 'Blog Script PHP Ürün Eklendi', 'Ürün', '2022-10-25 08:42:29', '2022-10-25 08:42:29'),
(5, 'Gelir Faturası Eklendi', 'Fatura', '2022-10-25 08:54:57', '2022-10-25 08:54:57'),
(6, 'Tahsilat Yapıldı', 'İşlem', '2022-10-25 08:56:30', '2022-10-25 08:56:30'),
(7, 'deneme Kullanıcı Eklendi', 'Ürün', '2022-10-25 10:19:33', '2022-10-25 10:19:33'),
(8, 'Gelir Faturası Eklendi', 'Fatura', '2022-10-25 10:34:50', '2022-10-25 10:34:50'),
(9, 'deneme123213 Ürün Eklendi', 'Ürün', '2022-10-25 10:35:22', '2022-10-25 10:35:22'),
(10, 'Gelir Faturası Eklendi', 'Fatura', '2022-10-25 10:40:23', '2022-10-25 10:40:23'),
(11, 'Gelir Faturası Eklendi', 'Fatura', '2022-10-25 10:41:33', '2022-10-25 10:41:33');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2022_10_21_065654_create_musterilers_table', 1),
(4, '2022_10_21_070145_create_bankas_table', 1),
(5, '2022_10_21_070242_create_faturas_table', 1),
(6, '2022_10_21_070654_create_fatura_islems_table', 1),
(7, '2022_10_21_071023_create_kalems_table', 1),
(8, '2022_10_21_071407_create_odemes_table', 1),
(9, '2022_10_22_090654_create_islems_table', 2),
(10, '2022_10_25_103714_create_loggers_table', 3),
(11, '2022_10_25_105334_create_uruns_table', 3),
(12, '2022_10_25_124033_create_user_permissions_table', 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musterilers`
--

CREATE TABLE `musterilers` (
  `id` int(10) UNSIGNED NOT NULL,
  `musteriTipi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soyad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dogumTarih` date DEFAULT NULL,
  `tc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firmaAd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vergiNumara` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vergiDaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adres` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `musterilers`
--

INSERT INTO `musterilers` (`id`, `musteriTipi`, `photo`, `ad`, `soyad`, `dogumTarih`, `tc`, `firmaAd`, `vergiNumara`, `vergiDaire`, `adres`, `telefon`, `email`, `created_at`, `updated_at`) VALUES
(4, '0', '', 'Hasan', 'Mehmet', '1995-01-01', '11111111111', NULL, NULL, NULL, 'istanbul', '05111111111', 'hasanmemet@gmail.com', '2022-10-21 08:29:31', '2022-10-21 08:29:31'),
(7, '0', '', 'berk', 'yılmazer', '1997-01-01', '1111111111', NULL, NULL, NULL, 'istanbul', '05111111111', 'wefpkew@gmail.com', '2022-10-21 09:09:55', '2022-10-21 09:09:55'),
(8, '0', '', 'kadir', 'yolcu', '2000-12-19', '12345678987', NULL, NULL, NULL, 'istanbul', '1231231231', 'kdr@gmail.com', '2022-10-21 10:30:42', '2022-10-21 10:30:42');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uruns`
--

CREATE TABLE `uruns` (
  `id` int(10) UNSIGNED NOT NULL,
  `urunAdi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alisFiyati` double NOT NULL,
  `satisFiyati` double NOT NULL,
  `kalemId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `uruns`
--

INSERT INTO `uruns` (`id`, `urunAdi`, `alisFiyati`, `satisFiyati`, `kalemId`, `created_at`, `updated_at`) VALUES
(2, 'Blog Script PHP', 1500, 1500, 1, '2022-10-25 08:42:29', '2022-10-25 08:42:29'),
(3, 'deneme123213', 500, 600, 3, '2022-10-25 10:35:22', '2022-10-25 10:35:22');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'kadir', 'kadir@gmail.com', NULL, '4c93008615c2d041e33ebac605d14b5b', 'j5jkceady3MCyYoH4VoyJMpmc5WNlGcRuY5904kOnEGJHJy3CZs2535JA34i', NULL, '2022-10-24 10:16:50'),
(2, 'deneme', 'deneme123@gmail.com', NULL, '4297f44b13955235245b2497399d7a93', NULL, '2022-10-25 10:19:33', '2022-10-25 10:19:33');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `userId` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `bankas`
--
ALTER TABLE `bankas`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `faturas`
--
ALTER TABLE `faturas`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `fatura_islems`
--
ALTER TABLE `fatura_islems`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `islems`
--
ALTER TABLE `islems`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kalems`
--
ALTER TABLE `kalems`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `loggers`
--
ALTER TABLE `loggers`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `musterilers`
--
ALTER TABLE `musterilers`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Tablo için indeksler `uruns`
--
ALTER TABLE `uruns`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Tablo için indeksler `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `bankas`
--
ALTER TABLE `bankas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `faturas`
--
ALTER TABLE `faturas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `fatura_islems`
--
ALTER TABLE `fatura_islems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `islems`
--
ALTER TABLE `islems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `kalems`
--
ALTER TABLE `kalems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `loggers`
--
ALTER TABLE `loggers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `musterilers`
--
ALTER TABLE `musterilers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `uruns`
--
ALTER TABLE `uruns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
