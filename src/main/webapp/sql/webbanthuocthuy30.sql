-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 14, 2024 lúc 09:04 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webbanthuocthuy30`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(25) NOT NULL,
  `hotline` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `timeOpen` varchar(255) NOT NULL,
  `map` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `address`
--

INSERT INTO `address` (`id`, `address`, `phone`, `hotline`, `email`, `timeOpen`, `map`) VALUES
(1, 'Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh.', '0384774118 - 0972087207', '1900 9054', 'doanwebnhom30@gmail.com', '8:00 AM - 7:00 PM every day, except Monday.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.214525515988!2d106.78918677590663!3d10.871281657435139!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRQLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1697118240058!5m2!1svi!2s');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_items`
--

CREATE TABLE `cart_items` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_items`
--

INSERT INTO `cart_items` (`user_id`, `product_id`, `quantity`) VALUES
(78, 2, 1),
(78, 3, 24),
(78, 9, 10),
(78, 33, 20),
(78, 85, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `delivery_address`
--

CREATE TABLE `delivery_address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `province` text NOT NULL,
  `district` text NOT NULL,
  `ward` text NOT NULL,
  `detail_address` varchar(255) NOT NULL,
  `at_home` tinyint(1) DEFAULT 0,
  `primary` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `delivery_address`
--

INSERT INTO `delivery_address` (`id`, `user_id`, `full_name`, `phone`, `province`, `district`, `ward`, `detail_address`, `at_home`, `primary`) VALUES
(1, 82, 'fdfdf', '0384774118', 'HN', 'GT', 'TX', 'GG', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounts`
--

CREATE TABLE `discounts` (
  `id` int(11) NOT NULL,
  `code` varchar(25) NOT NULL,
  `discountName` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sale_percent` double NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `expirationDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `discounts`
--

INSERT INTO `discounts` (`id`, `code`, `discountName`, `description`, `sale_percent`, `quantity`, `startDate`, `expirationDate`) VALUES
(6, 'HEELO', 'VVCVC', NULL, 0.2, 10, '2024-07-13 22:20:56', '2025-07-13 22:20:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL,
  `email` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `content` varchar(255) NOT NULL,
  `submissionDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `email`, `name`, `content`, `submissionDate`) VALUES
(1, 'example1@gmail.com', 'John Doe', 'Great service!', '2023-01-15 08:30:00'),
(2, 'cactungte2912200@gmail.co', 'Nguyễn Đình Tùng', 'Thuốc tốt quá', '2024-01-17 14:03:10'),
(3, 'cactungte291220@gmail.com', 'Nguyễn Đình Tùng', 'Thuốc xịn quá', '2024-01-18 04:04:55'),
(4, 'Nam22@gmail.com', 'Lê Văn Nam', 'Rất hài lòng với dịch vụ.', '2024-01-20 12:15:20'),
(5, 'Anh293@gmail.com', 'Trần Thị Minh Anh', 'Phản hồi nhanh chóng và nhân viên hữu ích.', '2024-01-21 15:30:45'),
(6, 'DuongP4@gmail.com', 'Phạm Văn Dương', 'Rất đáng giới thiệu!', '2024-01-21 18:20:10'),
(7, 'MaiDo95@gmail.com', 'Đỗ Thị Mai', 'Dịch vụ tuyệt vời, sẽ sử dụng lại.', '2024-01-21 21:05:55'),
(26, '21130556@st.hcmuaf.edu.vn', 'Đặng Nam Thuận', '                                     <span id=\"feedbackMessage\" class=\"feedback-message\" style=\"color: Green;\"></span>\n                                     <span id=\"errorMessage\" class=\"error-message\"  style=\"color: red;\"></span>', '2024-07-09 23:22:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `date_save` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`id`, `product_id`, `url`, `date_save`) VALUES
(1, 1, '/data/sp_1/Dipomax-J.jpg', '2024-07-03 20:02:43'),
(2, 1, '/data/sp_1/Dipomax-J1.jpg', '2024-07-03 20:02:43'),
(3, 1, '/data/sp_1/Dipomax-J2.jpg', '2024-07-03 20:02:43'),
(4, 2, '/data/sp_2/ARBP-ME-2.jpg', '2024-07-03 20:02:43'),
(5, 2, '/data/sp_2/ARBP-ME-3.jpg', '2024-07-03 20:02:43'),
(6, 3, '/data/sp_3/APM-1.jpg', '2024-07-03 20:02:43'),
(7, 3, '/data/sp_3/APM-2.jpg', '2024-07-03 20:02:43'),
(8, 4, '/data/sp_4/AP125RX-2.jpg', '2024-07-03 20:02:43'),
(9, 4, '/data/sp_4/AP125RX-3.jpg', '2024-07-03 20:02:43'),
(10, 5, '/data/sp_5/pedtge.jpg', '2024-07-03 20:02:43'),
(11, 5, '/data/sp_5/pedtge1.jpg', '2024-07-03 20:02:43'),
(12, 6, '/data/sp_6/Dynazide-20-Injection-khang-sinh-dieu-tri-benh-duong-tieu-hoa (1).jpg', '2024-07-03 20:02:43'),
(13, 6, '/data/sp_6/Dynazide-20-Injection-khang-sinh-dieu-tri-benh-duong-tieu-hoa.jpg', '2024-07-03 20:02:43'),
(14, 7, '/data/sp_7/Dynazide-10-khang-sinh-Tiamulin-10-dieu-tri-benh-hong-ly (1).jpg', '2024-07-03 20:02:43'),
(15, 7, '/data/sp_7/Dynazide-10-khang-sinh-Tiamulin-10-dieu-tri-benh-hong-ly.jpg', '2024-07-03 20:02:43'),
(16, 8, '/data/sp_8/Mectinvet-Plus-tri-noi-ngoai-ky-sinh-tren-trau-bo-heo-va-cuu (1).jpg', '2024-07-03 20:02:43'),
(17, 8, '/data/sp_8/Mectinvet-Plus-tri-noi-ngoai-ky-sinh-tren-trau-bo-heo-va-cuu.jpg', '2024-07-03 20:02:43'),
(18, 9, '/data/sp_9/Danoguard-khang-sinh-tiem-tri-cac-benh-ho-hap-va-duong-ruot (1).jpg', '2024-07-03 20:02:43'),
(19, 9, '/data/sp_9/Danoguard-khang-sinh-tiem-tri-cac-benh-ho-hap-va-duong-ruot.jpg', '2024-07-03 20:02:43'),
(20, 10, '/data/sp_10/Pharmatilin-25-khang-sinh-dieu-tri-hong-ly-heo (1).jpg', '2024-07-03 20:02:43'),
(21, 10, '/data/sp_10/Pharmatilin-25-khang-sinh-dieu-tri-hong-ly-heo.jpg', '2024-07-03 20:02:43'),
(22, 11, '/data/sp_11/Colicure-40-thuoc-thu-y-Tien-Thang-Vet-1.jpg', '2024-07-03 20:02:43'),
(23, 11, '/data/sp_11/Colicure-40-thuoc-thu-y-Tien-Thang-Vet.jpg', '2024-07-03 20:02:43'),
(24, 12, '/data/sp_12/Colicure-40-thuoc-thu-y-Tien-Thang-Vet (1) - Copy.jpg', '2024-07-03 20:02:43'),
(25, 12, '/data/sp_12/Colicure-40-thuoc-thu-y-Tien-Thang-Vet (1).jpg', '2024-07-03 20:02:43'),
(26, 13, '/data/sp_13/nutrimaxplus-bo-sung-vitamin-khoang-cho-thu-cung.jpg', '2024-07-03 20:02:43'),
(27, 13, '/data/sp_13/nutrimaxplus-gel-dinh-duong-cho-thu-cung.jpg', '2024-07-03 20:02:43'),
(28, 14, '/data/sp_14/Nokodemaseb-dieu-tri-cac-trieu-chung-do-nam-gay-ra.jpg', '2024-07-03 20:02:43'),
(29, 14, '/data/sp_14/Nokodemaseb-dieu-tri-nam-tai-cho-va-dien-rong.jpg', '2024-07-03 20:02:43'),
(30, 14, '/data/sp_14/Nokodemaseb-xit-khang-khuan-diet-nam.jpg', '2024-07-03 20:02:43'),
(31, 15, '/data/sp_15/itragol-dac-tri-nam-cho-meo-600x600.jpg', '2024-07-03 20:02:43'),
(32, 15, '/data/sp_15/Itragol-dung-dich-uong-itraconazole.jpg', '2024-07-03 20:02:43'),
(33, 15, '/data/sp_15/Itragol-vi-sua-thom-ngon.jpg', '2024-07-03 20:02:43'),
(34, 16, '/data/sp_16/Selight-120-0.25-600x600.jpg', '2024-07-03 20:02:43'),
(35, 16, '/data/sp_16/Selight-120-0.5.jpg', '2024-07-03 20:02:43'),
(36, 16, '/data/sp_16/Selight-120.jpg', '2024-07-03 20:02:43'),
(37, 17, '/data/sp_17/Selight-60-0.75ml.jpg', '2024-07-03 20:02:43'),
(38, 17, '/data/sp_17/Selight-60-present.jpg', '2024-07-03 20:02:43'),
(39, 17, '/data/sp_17/Selight-solution-60-0.25ml.jpg', '2024-07-03 20:02:43'),
(40, 18, '/data/sp_18/Early-3Cs-bu-nuoc-va-dien-giai-khi-van-chuyen-ga-con-ve-trai (1).jpg', '2024-07-03 20:02:43'),
(41, 18, '/data/sp_18/Early-3Cs-bu-nuoc-va-dien-giai-khi-van-chuyen-ga-con-ve-trai.jpg', '2024-07-03 20:02:43'),
(42, 19, '/data/sp_19/nutrimaxplus-bo-sung-vitamin-khoang-cho-thu-cung - Copy.jpg', '2024-07-03 20:02:43'),
(43, 19, '/data/sp_19/nutrimaxplus-bo-sung-vitamin-khoang-cho-thu-cung.jpg', '2024-07-03 20:02:43'),
(44, 20, '/data/sp_20/nutrimaxplus-bo-sung-vitamin-khoang-cho-thu-cung - Copy.jpg', '2024-07-03 20:02:43'),
(45, 20, '/data/sp_20/nutrimaxplus-bo-sung-vitamin-khoang-cho-thu-cung.jpg', '2024-07-03 20:02:43'),
(46, 21, '/data/sp_21/cat-ve-sinh-meo-Captain-Meow-1.jpg', '2024-07-03 20:02:43'),
(47, 21, '/data/sp_21/cat-ve-sinh-meo-Captain-Meow-mui-ca-phe.jpg', '2024-07-03 20:02:43'),
(48, 21, '/data/sp_21/cat-ve-sinh-meo-Captain-Meow-mui-chanh.jpg', '2024-07-03 20:02:43'),
(49, 21, '/data/sp_21/cat-ve-sinh-meo-Captain-Meow-mui-tao.jpg', '2024-07-03 20:02:43'),
(50, 22, '/data/sp_22/Regalos-ca-ngu-phu-ca-bao.jpg', '2024-07-03 20:02:43'),
(51, 22, '/data/sp_22/Regalos-ca-ngu-phu-ca-hoi (1).jpg', '2024-07-03 20:02:43'),
(52, 22, '/data/sp_22/Regalos-ca-ngu-phu-thanh-cua.jpg', '2024-07-03 20:02:43'),
(53, 22, '/data/sp_22/Regalos-ca-ngu-phu-uc-ga.jpg', '2024-07-03 20:02:43'),
(54, 22, '/data/sp_22/Regalos-ca-ngu.jpg', '2024-07-03 20:02:43'),
(55, 22, '/data/sp_22/thuc-an-uot-Regalos-cho-meo.jpg', '2024-07-03 20:02:43'),
(56, 23, '/data/sp_23/jinny-stick-snack-cho-meo-2.jpg', '2024-07-03 20:02:43'),
(57, 23, '/data/sp_23/Jinny-Stick-vi-ca-hoi.jpg', '2024-07-03 20:02:43'),
(58, 23, '/data/sp_23/Jinny-Stick-vi-ca-ngu.jpg', '2024-07-03 20:02:43'),
(59, 23, '/data/sp_23/Jinny-Stick-vi-gan.jpg', '2024-07-03 20:02:43'),
(60, 23, '/data/sp_23/Jinny-Stick-vi-hai-san.jpg', '2024-07-03 20:02:43'),
(61, 23, '/data/sp_23/Jinny-Stick-vi-thit-ga.jpg', '2024-07-03 20:02:43'),
(62, 24, '/data/sp_24/Cupid-perfume-huong-Bright-Sunshine-vang.jpg', '2024-07-03 20:02:43'),
(63, 24, '/data/sp_24/Cupid-perfume-huong-Florarium-hong.jpg', '2024-07-03 20:02:43'),
(64, 24, '/data/sp_24/Cupid-perfume-huong-Heavenly-Fruits-cam.jpg', '2024-07-03 20:02:43'),
(65, 24, '/data/sp_24/Cupid-perfume-huong-Herbarium-xanh-la.jpg', '2024-07-03 20:02:43'),
(66, 24, '/data/sp_24/Cupid-perfume-huong-Secret-love-tim.jpg', '2024-07-03 20:02:43'),
(67, 24, '/data/sp_24/Nuoc-hoa-cho-meo-Cupid-Perfume.jpg', '2024-07-03 20:02:43'),
(68, 25, '/data/sp_25/pet-ear-cleaner-dung-dich-sach-tai-cho-cho-va-meo-khu-mui-hoi-va-di-ung (1).jpg', '2024-07-03 20:02:43'),
(69, 25, '/data/sp_25/pet-ear-cleaner-dung-dich-sach-tai-cho-cho-va-meo-khu-mui-hoi-va-di-ung.jpg', '2024-07-03 20:02:43'),
(70, 26, '/data/sp_26/Nutri-Forte-Gel-Gel-cung-cap-nang-luong-va-vitamin-khoang-acid-amin-danh-cho-cho-meo (1).jpg', '2024-07-03 20:02:43'),
(71, 26, '/data/sp_26/Nutri-Forte-Gel-Gel-cung-cap-nang-luong-va-vitamin-khoang-acid-amin-danh-cho-cho-meo.jpg', '2024-07-03 20:02:43'),
(72, 27, '/data/sp_27/Metricyclin-Vien-dat-tu-cung-Chlortetracyclin-hydrochloride-su-dung-trong-thu-y (1).jpg', '2024-07-03 20:02:43'),
(73, 27, '/data/sp_27/Metricyclin-Vien-dat-tu-cung-Chlortetracyclin-hydrochloride-su-dung-trong-thu-y.jpg', '2024-07-03 20:02:43'),
(74, 28, '/data/sp_28/Advance-Sulfa-Thoxine-Dac-tri-cau-trung-ky-sinh-trung-duong-mau-dau-den (1).jpg', '2024-07-03 20:02:43'),
(75, 28, '/data/sp_28/Advance-Sulfa-Thoxine-Dac-tri-cau-trung-ky-sinh-trung-duong-mau-dau-den.jpg', '2024-07-03 20:02:43'),
(76, 29, '/data/sp_29/Advance-New-Max-moi-truong-pha-tinh-heo (1).jpg', '2024-07-03 20:02:43'),
(77, 29, '/data/sp_29/Advance-New-Max-moi-truong-pha-tinh-heo.jpg', '2024-07-03 20:02:43'),
(78, 30, '/data/sp_30/Advance-Pro-lim-da-liem-bo-sung-khoang-cho-gia-suc (1).jpg', '2024-07-03 20:02:43'),
(79, 30, '/data/sp_30/Advance-Pro-lim-da-liem-bo-sung-khoang-cho-gia-suc.jpg', '2024-07-03 20:02:43'),
(80, 31, '/data/sp_31/Mectinvet-Injection-Ivermectin-10mgml-tri-noi-ngoai-ky-sinh (1).jpg', '2024-07-03 20:02:43'),
(81, 31, '/data/sp_31/Mectinvet-Injection-Ivermectin-10mgml-tri-noi-ngoai-ky-sinh.jpg', '2024-07-03 20:02:43'),
(82, 32, '/data/sp_32/Vaccine-nhuoc-doc-phong-benh-Dich-ta-heo-San-xuat-tren-te-bao (1).jpg', '2024-07-03 20:02:43'),
(83, 32, '/data/sp_32/Vaccine-nhuoc-doc-phong-benh-Dich-ta-heo-San-xuat-tren-te-bao.jpg', '2024-07-03 20:02:43'),
(84, 33, '/data/sp_33/Vaccine-vo-hoat-phong-benh-tai-xanh-chung-NVDC-JXA1 (1).jpg', '2024-07-03 20:02:43'),
(85, 33, '/data/sp_33/Vaccine-vo-hoat-phong-benh-tai-xanh-chung-NVDC-JXA1.jpg', '2024-07-03 20:02:43'),
(86, 34, '/data/sp_34/Vac-xin-vo-hoat-phong-benh-Newcastle-chung-Lasota-va-Cum-gia-cam-phan-typ-H9-chung-SS (1).jpg', '2024-07-03 20:02:43'),
(87, 34, '/data/sp_34/Vac-xin-vo-hoat-phong-benh-Newcastle-chung-Lasota-va-Cum-gia-cam-phan-typ-H9-chung-SS.jpg', '2024-07-03 20:02:43'),
(88, 35, '/data/sp_35/Tukono (1).jpg', '2024-07-03 20:02:43'),
(89, 35, '/data/sp_35/Tukono.jpg', '2024-07-03 20:02:43'),
(90, 36, '/data/sp_36/provita-bo-sung-vitamin-khoang-acid-amin-cho-vat-nuoi-khoe-manh.jpg', '2024-07-03 20:02:43'),
(91, 36, '/data/sp_36/PROVITA-–-bo-sung-vitamin-khoang-acid-amin-cho-vat-nuoi-khoe-manh-1.jpg', '2024-07-03 20:02:43'),
(92, 37, '/data/sp_37/super-red-skin-450ml-giup-ga-da-san-da-giam-bam-phong-nam.jpg', '2024-07-03 20:02:43'),
(93, 37, '/data/sp_37/Super-red-skin-giup-ga-da-san-da-giam-bam-phong-nam...jpg', '2024-07-03 20:02:43'),
(94, 38, '/data/sp_38/Keto-gel-Ketoconazole-dung-ngoai-dieu-tri-nam-da-cho-cho-meo-2.jpg', '2024-07-03 20:02:43'),
(95, 38, '/data/sp_38/Keto-gel-Ketoconazole-dung-ngoai-dieu-tri-nam-da-cho-cho-meo-3.jpg', '2024-07-03 20:02:43'),
(96, 38, '/data/sp_38/Keto-gel-Ketoconazole-dung-ngoai-dieu-tri-nam-da-cho-cho-meo-4.jpg', '2024-07-03 20:02:43'),
(97, 38, '/data/sp_38/Keto-gel-Ketoconazole-dung-ngoai-dieu-tri-nam-da-cho-cho-meo.jpg', '2024-07-03 20:02:43'),
(98, 39, '/data/sp_39/CP-–-CIN-20-hormone-dang-dung-dich-tiem-vo-trung (1).jpg', '2024-07-03 20:02:43'),
(99, 39, '/data/sp_39/CP-–-CIN-20-hormone-dang-dung-dich-tiem-vo-trung.jpg', '2024-07-03 20:02:43'),
(100, 40, '/data/sp_40/Doggygel-cung-cap-Omega-3-vi-khoang-thiet-yeu-cho-cho.jpg', '2024-07-03 20:02:43'),
(101, 40, '/data/sp_40/I-Pett-Doggy-Gel-cung-cap-Omega-3-vi-khoang-thiet-yeu-cho-cho.jpg', '2024-07-03 20:02:43'),
(102, 41, '/data/sp_41/I-Pett-Kitty-Gel-cung-cap-Omega-3-vi-khoang-thiet-yeu-cho-meo-.jpg', '2024-07-03 20:02:43'),
(103, 41, '/data/sp_41/Kitty-Gel-cung-cap-Omega-3-vi-khoang-thiet-yeu-cho-meo.jpg', '2024-07-03 20:02:43'),
(104, 42, '/data/sp_42/I-PETT-LIPOTIN-cham-soc-chuyen-sau-cho-da-long-danh-cho-cho.jpg', '2024-07-03 20:02:43'),
(105, 42, '/data/sp_42/Lipotin-cham-soc-chuyen-sau-cho-da-long-danh-cho-cho.jpg', '2024-07-03 20:02:43'),
(106, 43, '/data/sp_43/Nutrical-vien-bo-sung-Canxi-va-khoang-cho-cho-tam-voc-lon-30-vien (1).jpg', '2024-07-03 20:02:43'),
(107, 43, '/data/sp_43/Nutrical-vien-bo-sung-Canxi-va-khoang-cho-cho-tam-voc-lon-30-vien.jpg', '2024-07-03 20:02:43'),
(108, 43, '/data/sp_43/Nutrical-vien-bo-sung-Canxi-va-khoang-cho-cho-tam-voc-lon-60-vien-.jpg', '2024-07-03 20:02:43'),
(109, 44, '/data/sp_44/Dotrol-dung-dich-dieu-tri-giun-cho-cho-duoi-1-tuoi (1).jpg', '2024-07-03 20:02:43'),
(110, 44, '/data/sp_44/Dotrol-dung-dich-dieu-tri-giun-cho-cho-duoi-1-tuoi.jpg', '2024-07-03 20:02:43'),
(111, 45, '/data/sp_45/Catrol-dung-dich-dieu-tri-giun-tron-tren-meo (1).jpg', '2024-07-03 20:02:43'),
(112, 45, '/data/sp_45/Catrol-dung-dich-dieu-tri-giun-tron-tren-meo.jpg', '2024-07-03 20:02:43'),
(113, 46, '/data/sp_46/Advance-Lac-premix-thuc-An-bo-sung-vitamin-khoang-va-methionine-cho-heo-va-gia-cam (1).jpg', '2024-07-03 20:02:43'),
(114, 46, '/data/sp_46/Advance-Lac-premix-thuc-An-bo-sung-vitamin-khoang-va-methionine-cho-heo-va-gia-cam.jpg', '2024-07-03 20:02:43'),
(115, 47, '/data/sp_47/Yemune-G7-vacxin-phong-Newcastle-chung-A-VII-1 (1).jpg', '2024-07-03 20:02:43'),
(116, 47, '/data/sp_47/Yemune-G7-vacxin-phong-Newcastle-chung-A-VII-1.jpg', '2024-07-03 20:02:43'),
(117, 48, '/data/sp_48/AVI-POX-vac-xin-phong-benh-dau-ga-dong-Cutter-1 (1).jpg', '2024-07-03 20:02:43'),
(118, 48, '/data/sp_48/AVI-POX-vac-xin-phong-benh-dau-ga-dong-Cutter-1.jpg', '2024-07-03 20:02:43'),
(119, 49, '/data/sp_49/supercid (1).jpg', '2024-07-03 20:02:43'),
(120, 49, '/data/sp_49/supercid.jpg', '2024-07-03 20:02:43'),
(121, 50, '/data/sp_50/viatox (1).jpg', '2024-07-03 20:02:43'),
(122, 50, '/data/sp_50/viatox.jpg', '2024-07-03 20:02:43'),
(123, 51, '/data/sp_51/z4522333612940_488d9fdc8f2eeacc3c3621e90fbc182d-scaled.jpg', '2024-07-03 20:02:43'),
(124, 51, '/data/sp_51/z4522333617723_258555c26b006f9761076baf7e3d25c7-scaled.jpg', '2024-07-03 20:02:43'),
(125, 51, '/data/sp_51/z4522333634830_7e648cf1b5ec30c25dea21ac04db26b5-scaled.jpg', '2024-07-03 20:02:43'),
(126, 51, '/data/sp_51/z4522333645399_13b284dba22403682087a4a73c28a31e-scaled.jpg', '2024-07-03 20:02:43'),
(127, 52, '/data/sp_52/z4484496051046_324b6888e3a24d696b20a14283a2cb41-scaled.jpg', '2024-07-03 20:02:43'),
(128, 52, '/data/sp_52/z4484496056488_a00cfb1b89afe3c9eebf2111c075407e-scaled.jpg', '2024-07-03 20:02:43'),
(129, 53, '/data/sp_53/z4389541762182_889f2dafe829ee8eaa98a633d2abbcac-scaled.jpg', '2024-07-03 20:02:43'),
(130, 53, '/data/sp_53/z4475328357944_10f704bc36356c8ca272ba7454002be7-scaled.jpg', '2024-07-03 20:02:43'),
(131, 53, '/data/sp_53/z4475328442423_df342305eb7f07e958cc7fa934702a34-scaled.jpg', '2024-07-03 20:02:43'),
(132, 54, '/data/sp_54/1-scaled.jpg', '2024-07-03 20:02:43'),
(133, 54, '/data/sp_54/2-scaled.jpg', '2024-07-03 20:02:43'),
(134, 54, '/data/sp_54/3-scaled.jpg', '2024-07-03 20:02:43'),
(135, 55, '/data/sp_55/16-scaled (1).jpg', '2024-07-03 20:02:43'),
(136, 55, '/data/sp_55/16-scaled.jpg', '2024-07-03 20:02:43'),
(137, 56, '/data/sp_56/z4473172182232_20ed6cb28db1a8b51c54c173745c8dd5.jpg', '2024-07-03 20:02:43'),
(138, 56, '/data/sp_56/z4473172448000_07877f1634a08fc9440ed5b826478dfd.jpg', '2024-07-03 20:02:43'),
(139, 56, '/data/sp_56/z4475328455467_78044dc9eb0fb797f640f0cf4df70eb0-scaled.jpg', '2024-07-03 20:02:43'),
(140, 57, '/data/sp_57/14-scaled (1).jpg', '2024-07-03 20:02:43'),
(141, 57, '/data/sp_57/14-scaled.jpg', '2024-07-03 20:02:43'),
(142, 58, '/data/sp_58/13-scaled (1).jpg', '2024-07-03 20:02:43'),
(143, 58, '/data/sp_58/13-scaled.jpg', '2024-07-03 20:02:43'),
(144, 59, '/data/sp_59/17-scaled.jpg', '2024-07-03 20:02:43'),
(145, 59, '/data/sp_59/18-scaled.jpg', '2024-07-03 20:02:43'),
(146, 59, '/data/sp_59/19-scaled.jpg', '2024-07-03 20:02:43'),
(147, 59, '/data/sp_59/20-scaled.jpg', '2024-07-03 20:02:43'),
(148, 60, '/data/sp_60/3-33-scaled.jpg', '2024-07-03 20:02:43'),
(149, 60, '/data/sp_60/4-31-scaled.jpg', '2024-07-03 20:02:43'),
(150, 61, '/data/sp_61/4-30-scaled.jpg', '2024-07-03 20:02:43'),
(151, 61, '/data/sp_61/6-19-scaled.jpg', '2024-07-03 20:02:43'),
(152, 61, '/data/sp_61/7-1-scaled.jpg', '2024-07-03 20:02:43'),
(153, 62, '/data/sp_62/3-31-scaled.jpg', '2024-07-03 20:02:43'),
(154, 62, '/data/sp_62/4-29-scaled.jpg', '2024-07-03 20:02:43'),
(155, 63, '/data/sp_63/3-30-scaled.jpg', '2024-07-03 20:02:43'),
(156, 63, '/data/sp_63/4-28-scaled.jpg', '2024-07-03 20:02:43'),
(157, 63, '/data/sp_63/5-18-scaled.jpg', '2024-07-03 20:02:43'),
(158, 64, '/data/sp_64/3-29-scaled.jpg', '2024-07-03 20:02:43'),
(159, 64, '/data/sp_64/3-29-scaled1.jpg', '2024-07-03 20:02:43'),
(160, 65, '/data/sp_65/3-27-scaled.jpg', '2024-07-03 20:02:43'),
(161, 65, '/data/sp_65/4-25-scaled.jpg', '2024-07-03 20:02:43'),
(162, 65, '/data/sp_65/5-16-scaled.jpg', '2024-07-03 20:02:43'),
(163, 66, '/data/sp_66/3-26-scaled (1).jpg', '2024-07-03 20:02:43'),
(164, 66, '/data/sp_66/3-26-scaled.jpg', '2024-07-03 20:02:43'),
(165, 67, '/data/sp_67/3-25-scaled.jpg', '2024-07-03 20:02:43'),
(166, 67, '/data/sp_67/7-4-scaled.jpg', '2024-07-03 20:02:43'),
(167, 67, '/data/sp_67/z4375593397324_81691fbcf021dcdb050456d22be5d71b.jpg', '2024-07-03 20:02:43'),
(168, 68, '/data/sp_68/3-24-scaled.jpg', '2024-07-03 20:02:43'),
(169, 68, '/data/sp_68/4-23-scaled.jpg', '2024-07-03 20:02:43'),
(170, 68, '/data/sp_68/5-15-scaled.jpg', '2024-07-03 20:02:43'),
(171, 69, '/data/sp_69/10-1-scaled.jpg', '2024-07-03 20:02:43'),
(172, 69, '/data/sp_69/3-23-scaled.jpg', '2024-07-03 20:02:43'),
(173, 69, '/data/sp_69/4-22-scaled.jpg', '2024-07-03 20:02:43'),
(174, 69, '/data/sp_69/z4374543881011_1109ac84168d6d9fdfb76d5428a1d8b5.jpg', '2024-07-03 20:02:43'),
(175, 70, '/data/sp_70/3-22-scaled.jpg', '2024-07-03 20:02:43'),
(176, 70, '/data/sp_70/4-21-scaled.jpg', '2024-07-03 20:02:43'),
(177, 70, '/data/sp_70/5-14-scaled.jpg', '2024-07-03 20:02:43'),
(178, 70, '/data/sp_70/6-14-scaled.jpg', '2024-07-03 20:02:43'),
(179, 71, '/data/sp_71/3-20-scaled.jpg', '2024-07-03 20:02:43'),
(180, 71, '/data/sp_71/4-20-scaled.jpg', '2024-07-03 20:02:43'),
(181, 72, '/data/sp_72/3-19-scaled.jpg', '2024-07-03 20:02:43'),
(182, 72, '/data/sp_72/4-19-scaled.jpg', '2024-07-03 20:02:43'),
(183, 72, '/data/sp_72/z4375593448656_602ff33534537b7f464f629852f79ab8.jpg', '2024-07-03 20:02:43'),
(184, 73, '/data/sp_73/AVI-POX-vac-xin-phong-benh-dau-ga-dong-Cutter-1.jpg', '2024-07-03 20:02:43'),
(185, 74, '/data/sp_74/ITA-New-Vac-xin-bat-hoat-phong-benh-Dich-ta-ga-dong-Lasota-1.jpg', '2024-07-03 20:02:43'),
(186, 75, '/data/sp_75/ITA-ND-IBD-vac-xin-phong-benh-Dich-ta-Gumboro-1.jpg', '2024-07-03 20:02:43'),
(187, 76, '/data/sp_76/ITA-ND-IB-EDS-vac-xin-phong-benh-Dich-ta-Viem-phe-quan-truyen-nhiem-va-hoi-chung-giam-de-1-600x600.jpg', '2024-07-03 20:02:43'),
(188, 77, '/data/sp_77/AVI-ND-HB1IB-Vac-xin-phong-benh-IB-chung-Massachusetts-B48-va-Newcastle-chung-Hitchner-B1.jpg', '2024-07-03 20:02:43'),
(189, 78, '/data/sp_78/AVI-ND-Lasota-IB-Vac-xin-phong-benh-IB-dong-Massachusetts-B48-va-ND-dong-Lasota-1.jpg', '2024-07-03 20:02:43'),
(190, 79, '/data/sp_79/AVI-ND-Lasota-Vac-xin-phong-benh-ND-dong-Lasota-1.jpg', '2024-07-03 20:02:43'),
(191, 80, '/data/sp_80/AVI-IBD-PLUS-vac-xin-phong-benh-Gumboro-dong-Winterfiled-2512-G-61-1.jpg', '2024-07-03 20:02:43'),
(192, 81, '/data/sp_81/AVI-IBD-Inter-Vac-xin-phong-Gumboro-dong-LIBDV-1.jpg', '2024-07-03 20:02:44'),
(193, 82, '/data/sp_82/AVI-H120-Vac-xin-phong-benh-IB-dong-Massachusetts-H120-1-600x600.jpg', '2024-07-03 20:02:44'),
(194, 83, '/data/sp_83/ITA-Coryza-ABC-Gel-–-vac-xin-phong-benh-So-mui-truyen-nhiem-Coryza-tren-ge.jpg', '2024-07-03 20:02:44'),
(195, 84, '/data/sp_84/vac-xin-cum-gia-cam-typ-H9-chung-SS-1-e1626340751354.jpg', '2024-07-03 20:02:44'),
(196, 85, '/data/sp_85/Pro-acid-ho-hop-dung-dich-axit-huu-co-1.jpg', '2024-07-03 20:02:44'),
(197, 86, '/data/sp_86/Nano-Klea-Rx-xit-truc-tiep-len-vet-thuong.jpg', '2024-07-03 20:02:44'),
(198, 86, '/data/sp_86/nanokleanew.jpg', '2024-07-03 20:02:44'),
(199, 87, '/data/sp_87/Alpha-Trypsin-wsp-1kg-01-768x1024-1.png', '2024-07-03 20:02:44'),
(200, 87, '/data/sp_87/Alpha-Trypsin-wsp-500g-768x1024-1.png', '2024-07-03 20:02:44'),
(201, 87, '/data/sp_87/Alpha-Trypsin-wsp-768x1024-1.png', '2024-07-03 20:02:44'),
(202, 88, '/data/sp_88/3-17-768x768.jpg', '2024-07-03 20:02:44'),
(203, 88, '/data/sp_88/4-16-768x768.jpg', '2024-07-03 20:02:44'),
(204, 89, '/data/sp_89/oxytocin-kich-thich-co-bop-tu-cung-khi-sinh-con.jpg', '2024-07-03 20:02:44'),
(205, 90, '/data/sp_90/sua-tam-Modern-Pet-Gel-Plus-tri-ve-ran-bo-chet.jpg', '2024-07-03 20:02:44'),
(206, 91, '/data/sp_91/Khang-the-viem-gan-vit-Hepatitis-Antibodies.jpg', '2024-07-03 20:02:44'),
(207, 91, '/data/sp_91/Khang-the-viem-gan-vit-Hepatitis-Antibodies1.jpg', '2024-07-03 20:02:44'),
(208, 92, '/data/sp_92/MYCO-AD-hap-thu-doc-to-nam-moc1 - Copy.jpg', '2024-07-03 20:02:44'),
(209, 92, '/data/sp_92/MYCO-AD-hap-thu-doc-to-nam-moc1.jpg', '2024-07-03 20:02:44'),
(210, 93, '/data/sp_93/Modern-Pet-Vita-Hemo-ho-tro-tao-mau-cho-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(211, 93, '/data/sp_93/Modern-Pet-Vita-Hemo-ho-tro-tao-mau-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(212, 94, '/data/sp_94/AMOX-15-LA-768x830.png', '2024-07-03 20:02:44'),
(213, 95, '/data/sp_95/10-vien-Prarintel-xo-giun-cho-meo.jpg', '2024-07-03 20:02:44'),
(214, 95, '/data/sp_95/Vien-Prarintel-xo-giun-duong-ruot-cho-meo.jpg', '2024-07-03 20:02:44'),
(215, 95, '/data/sp_95/Vien-xo-giun-tron-giun-dep-cho-meo-Prarintel.jpg', '2024-07-03 20:02:44'),
(216, 96, '/data/sp_96/20-vien-xo-giun-cho-cho-Prarintel-plus.jpg', '2024-07-03 20:02:44'),
(217, 96, '/data/sp_96/vien-xo-giun-dep-giun-tron-cho-cho-Prarintel-plus.jpg', '2024-07-03 20:02:44'),
(218, 96, '/data/sp_96/vien-xo-giun-Thai-Lan-cho-cho-Prarintel-plus.jpg', '2024-07-03 20:02:44'),
(219, 97, '/data/sp_97/I-pett-Coxae-ho-tro-chuc-nang-khop-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(220, 97, '/data/sp_97/thanh-phan-cua-Coxae.jpg', '2024-07-03 20:02:44'),
(221, 98, '/data/sp_98/Os-cal-Vien-ho-tro-chuc-nang-xuong-cho-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(222, 98, '/data/sp_98/Os-cal-Vien-ho-tro-chuc-nang-xuong-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(223, 99, '/data/sp_99/I-PETT-KIDY-Vien-ho-tro-chuc-nang-than-cho-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(224, 99, '/data/sp_99/I-PETT-KIDY-Vien-ho-tro-chuc-nang-than-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(225, 100, '/data/sp_100/Amoxclamed-drop-Khang-sinh-amox-dang-uong-cho-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(226, 100, '/data/sp_100/Amoxclamed-drop-Khang-sinh-amox-dang-uong-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(227, 101, '/data/sp_101/thuoc-tien-me-Xylinvet-su-dung-cho-cho-meo (1).jpg', '2024-07-03 20:02:44'),
(228, 101, '/data/sp_101/thuoc-tien-me-Xylinvet-su-dung-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(229, 102, '/data/sp_102/Heartsaver-Chewable-Small-xo-giun-cho-cho-nho.jpg', '2024-07-03 20:02:44'),
(230, 102, '/data/sp_102/Heartsaver-Plus-Chewable-Small.jpg', '2024-07-03 20:02:44'),
(231, 102, '/data/sp_102/Vien-xo-giun-cho-cho-duoi-11kg-Heartsaver-Chewable-Small.jpg', '2024-07-03 20:02:44'),
(232, 103, '/data/sp_103/Heartsaver-Plus-Chewable-Large-hop-6-vien.jpg', '2024-07-03 20:02:44'),
(233, 103, '/data/sp_103/Heartsaver-Plus-Chewable-Large.jpg', '2024-07-03 20:02:44'),
(234, 103, '/data/sp_103/Vien-xo-giun-cho-cho-23-45kg-Heartsaver-Plus-Chewable-Large.jpg', '2024-07-03 20:02:44'),
(235, 104, '/data/sp_104/Thuoc-sat-trung-Advance-APA-Clean-dung-trong-trai-chan-nuoi - Copy.jpg', '2024-07-03 20:02:44'),
(236, 104, '/data/sp_104/Thuoc-sat-trung-Advance-APA-Clean-dung-trong-trai-chan-nuoi.jpg', '2024-07-03 20:02:44'),
(237, 105, '/data/sp_105/Thuc-an-kanipro-10kg-danh-cho-cho-moi-lua-tuoi - Copy.jpg', '2024-07-03 20:02:44'),
(238, 105, '/data/sp_105/Thuc-an-kanipro-10kg-danh-cho-cho-moi-lua-tuoi.jpg', '2024-07-03 20:02:44'),
(239, 106, '/data/sp_106/Thuoc-mo-ancomast (1).jpg', '2024-07-03 20:02:44'),
(240, 106, '/data/sp_106/Thuoc-mo-ancomast.jpg', '2024-07-03 20:02:44'),
(241, 107, '/data/sp_107/Chat-thay-the-sua-Birthright-cho-cho-meo-non-trong-vong-12-gio-tuoi-den-14-ngay-tuoi - Copy.jpg', '2024-07-03 20:02:44'),
(242, 107, '/data/sp_107/Chat-thay-the-sua-Birthright-cho-cho-meo-non-trong-vong-12-gio-tuoi-den-14-ngay-tuoi.jpg', '2024-07-03 20:02:44'),
(243, 108, '/data/sp_108/Coxzuril-5-kiem-soat-benh-cau-trung-tren-heo-con - Copy.jpg', '2024-07-03 20:02:44'),
(244, 108, '/data/sp_108/Coxzuril-5-kiem-soat-benh-cau-trung-tren-heo-con.jpg', '2024-07-03 20:02:44'),
(245, 109, '/data/sp_109/Coxzuril-2-5-dieu-tri-benh-cau-trung-tren-ga-vit-ngong - Copy.jpg', '2024-07-03 20:02:44'),
(246, 109, '/data/sp_109/Coxzuril-2-5-dieu-tri-benh-cau-trung-tren-ga-vit-ngong.jpg', '2024-07-03 20:02:44'),
(247, 110, '/data/sp_110/Sua-tam-Diamond-Pet-giup-khu-mui-hoi-duong-long-duong-da - Copy.jpg', '2024-07-03 20:02:44'),
(248, 110, '/data/sp_110/Sua-tam-Diamond-Pet-giup-khu-mui-hoi-duong-long-duong-da.jpg', '2024-07-03 20:02:44'),
(249, 111, '/data/sp_111/Dau-tam-Douxe-S3-dang-Mouse-cho-thu-cung-da-nhon-da-bong-troc - Copy.jpg', '2024-07-03 20:02:44'),
(250, 111, '/data/sp_111/Dau-tam-Douxe-S3-dang-Mouse-cho-thu-cung-da-nhon-da-bong-troc.jpg', '2024-07-03 20:02:44'),
(251, 112, '/data/sp_112/Cefvet-chua-khang-sinh-Ceftiofur-4g - Copy.jpg', '2024-07-03 20:02:44'),
(252, 112, '/data/sp_112/Cefvet-chua-khang-sinh-Ceftiofur-4g.jpg', '2024-07-03 20:02:44'),
(253, 113, '/data/sp_113/thuoc-nho-gay-Cleartix-Spot-on-tri-ve-bo-chet-tren-cho - Copy.jpg', '2024-07-03 20:02:44'),
(254, 113, '/data/sp_113/thuoc-nho-gay-Cleartix-Spot-on-tri-ve-bo-chet-tren-cho.jpg', '2024-07-03 20:02:44'),
(255, 114, '/data/sp_114/thuoc-nho-gay-cleartix-spot-on-cat-tri-ve-bo-chet-tren-meo - Copy.jpg', '2024-07-03 20:02:44'),
(256, 114, '/data/sp_114/thuoc-nho-gay-cleartix-spot-on-cat-tri-ve-bo-chet-tren-meo.jpg', '2024-07-03 20:02:44'),
(257, 115, '/data/sp_115/Thuoc-nho-tai-Auriclean-lam-sach-tai-cho-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(258, 115, '/data/sp_115/Thuoc-nho-tai-Auriclean-lam-sach-tai-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(259, 116, '/data/sp_116/Chromamix-Plus-bo-sung-Crom-huu-co-cho-heo - Copy.jpg', '2024-07-03 20:02:44'),
(260, 116, '/data/sp_116/Chromamix-Plus-bo-sung-Crom-huu-co-cho-heo.jpg', '2024-07-03 20:02:44'),
(261, 117, '/data/sp_117/Advance-Normal-Saline-bu-nuoc-va-chat-dien-giai-do-mat-nuoc - Copy.jpg', '2024-07-03 20:02:44'),
(262, 117, '/data/sp_117/Advance-Normal-Saline-bu-nuoc-va-chat-dien-giai-do-mat-nuoc.jpg', '2024-07-03 20:02:44'),
(263, 118, '/data/sp_118/Biosol-poultry-cung-cap-khoang-chat-cho-gia-cam - Copy.jpg', '2024-07-03 20:02:44'),
(264, 118, '/data/sp_118/Biosol-poultry-cung-cap-khoang-chat-cho-gia-cam.jpg', '2024-07-03 20:02:44'),
(265, 119, '/data/sp_119/Vaccine-H5N1-Re5 - Copy.jpg', '2024-07-03 20:02:44'),
(266, 119, '/data/sp_119/Vaccine-H5N1-Re5.jpg', '2024-07-03 20:02:44'),
(267, 120, '/data/sp_120/3-16-768x768.jpg', '2024-07-03 20:02:44'),
(268, 120, '/data/sp_120/4-16-768x768.jpg', '2024-07-03 20:02:44'),
(269, 120, '/data/sp_120/5-12-768x768.jpg', '2024-07-03 20:02:44'),
(270, 120, '/data/sp_120/6-12-768x768.jpg', '2024-07-03 20:02:44'),
(271, 121, '/data/sp_121/3-15-768x768.jpg', '2024-07-03 20:02:44'),
(272, 121, '/data/sp_121/4-15-768x768.jpg', '2024-07-03 20:02:44'),
(273, 121, '/data/sp_121/5-11-768x768.jpg', '2024-07-03 20:02:44'),
(274, 122, '/data/sp_122/3-14-768x768.jpg', '2024-07-03 20:02:44'),
(275, 122, '/data/sp_122/4-14-768x768.jpg', '2024-07-03 20:02:44'),
(276, 122, '/data/sp_122/5-10-768x768.jpg', '2024-07-03 20:02:44'),
(277, 123, '/data/sp_123/3-13-768x768.jpg', '2024-07-03 20:02:44'),
(278, 124, '/data/sp_124/3-12-768x768.jpg', '2024-07-03 20:02:44'),
(279, 124, '/data/sp_124/4-12-768x768.jpg', '2024-07-03 20:02:44'),
(280, 124, '/data/sp_124/5-9-768x768.jpg', '2024-07-03 20:02:44'),
(281, 125, '/data/sp_125/3-11-768x768.jpg', '2024-07-03 20:02:44'),
(282, 126, '/data/sp_126/3-10-768x768.jpg', '2024-07-03 20:02:44'),
(283, 126, '/data/sp_126/4-10-768x768.jpg', '2024-07-03 20:02:44'),
(284, 126, '/data/sp_126/5-8-768x768.jpg', '2024-07-03 20:02:44'),
(285, 127, '/data/sp_127/3-9-768x768.jpg', '2024-07-03 20:02:44'),
(286, 127, '/data/sp_127/4-9-768x768.jpg', '2024-07-03 20:02:44'),
(287, 127, '/data/sp_127/5-7-768x768.jpg', '2024-07-03 20:02:44'),
(288, 128, '/data/sp_128/3-8-768x768.jpg', '2024-07-03 20:02:44'),
(289, 128, '/data/sp_128/4-8-768x768.jpg', '2024-07-03 20:02:44'),
(290, 128, '/data/sp_128/5-6-768x768.jpg', '2024-07-03 20:02:44'),
(291, 129, '/data/sp_129/3-7-768x768.jpg', '2024-07-03 20:02:44'),
(292, 130, '/data/sp_130/3-6-768x768.jpg', '2024-07-03 20:02:44'),
(293, 130, '/data/sp_130/4-6-768x768.jpg', '2024-07-03 20:02:44'),
(294, 130, '/data/sp_130/5-5-scaled.jpg', '2024-07-03 20:02:44'),
(295, 131, '/data/sp_131/3-5-768x768.jpg', '2024-07-03 20:02:44'),
(296, 132, '/data/sp_132/3-4-768x768.jpg', '2024-07-03 20:02:44'),
(297, 132, '/data/sp_132/4-4-768x768.jpg', '2024-07-03 20:02:44'),
(298, 132, '/data/sp_132/5-4-768x768.jpg', '2024-07-03 20:02:44'),
(299, 133, '/data/sp_133/3-2-768x768.jpg', '2024-07-03 20:02:44'),
(300, 133, '/data/sp_133/4-2-768x768.jpg', '2024-07-03 20:02:44'),
(301, 133, '/data/sp_133/5-2-768x768.jpg', '2024-07-03 20:02:44'),
(302, 134, '/data/sp_134/3-1-768x768.jpg', '2024-07-03 20:02:44'),
(303, 134, '/data/sp_134/4-1-768x768.jpg', '2024-07-03 20:02:44'),
(304, 134, '/data/sp_134/5-1-768x768.jpg', '2024-07-03 20:02:44'),
(305, 135, '/data/sp_135/3-768x768.jpg', '2024-07-03 20:02:44'),
(306, 135, '/data/sp_135/4-768x768.jpg', '2024-07-03 20:02:44'),
(307, 135, '/data/sp_135/5-768x768.jpg', '2024-07-03 20:02:44'),
(308, 136, '/data/sp_136/4-15-768x768.jpg', '2024-07-03 20:02:44'),
(309, 137, '/data/sp_137/3-14-768x768.jpg', '2024-07-03 20:02:44'),
(310, 138, '/data/sp_138/3-9-768x768.jpg', '2024-07-03 20:02:44'),
(311, 139, '/data/sp_139/3-3-768x768.jpg', '2024-07-03 20:02:44'),
(312, 140, '/data/sp_140/1-16-768x768.jpg', '2024-07-03 20:02:44'),
(313, 140, '/data/sp_140/2-17-768x768.jpg', '2024-07-03 20:02:44'),
(314, 140, '/data/sp_140/khang-sinh-vit-ngan-01-768x543.jpg', '2024-07-03 20:02:44'),
(315, 140, '/data/sp_140/Untitled-1-768x768.jpg', '2024-07-03 20:02:44'),
(316, 141, '/data/sp_141/DSC00387-Edit-1-768x768.jpg', '2024-07-03 20:02:44'),
(317, 141, '/data/sp_141/DSC00390-Edit-1-768x768.jpg', '2024-07-03 20:02:44'),
(318, 141, '/data/sp_141/DSC00393-Edit-1-768x768.jpg', '2024-07-03 20:02:44'),
(319, 141, '/data/sp_141/DSC00396-Edit-1-768x768.jpg', '2024-07-03 20:02:44'),
(320, 141, '/data/sp_141/DSC00401-Edit-Edit-1-768x768.jpg', '2024-07-03 20:02:44'),
(321, 142, '/data/sp_142/379cc3ab-8eed-4a13-8c7a-de9bd5f8309d.png', '2024-07-03 20:02:44'),
(322, 143, '/data/sp_143/3-14-768x768.jpg', '2024-07-03 20:02:44'),
(323, 143, '/data/sp_143/4-13-768x768.jpg', '2024-07-03 20:02:44'),
(324, 143, '/data/sp_143/5-4-768x768.jpg', '2024-07-03 20:02:44'),
(325, 144, '/data/sp_144/DSC00927-Edit-768x768.jpg', '2024-07-03 20:02:44'),
(326, 145, '/data/sp_145/3-3-768x768.jpg', '2024-07-03 20:02:44'),
(327, 145, '/data/sp_145/z4374543881019_7ed4ae075ba3554e63952018158ccc96-768x768.jpg', '2024-07-03 20:02:44'),
(328, 146, '/data/sp_146/Dung-dich-truyen-Glucose-5-tri-mat-nuoc-o-gia-suc-heo-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(329, 146, '/data/sp_146/Dung-dich-truyen-Glucose-5-tri-mat-nuoc-o-gia-suc-heo-cho-meo.jpg', '2024-07-03 20:02:44'),
(330, 147, '/data/sp_147/Drycloxaject-phong-tri-benh-viem-vu-cho-gia-suc-o-giai-doan-can-sua - Copy.jpg', '2024-07-03 20:02:44'),
(331, 147, '/data/sp_147/Drycloxaject-phong-tri-benh-viem-vu-cho-gia-suc-o-giai-doan-can-sua.jpg', '2024-07-03 20:02:44'),
(332, 148, '/data/sp_148/Khang-sinh-Gentaguard-10-Injection-dac-tri-benh-cho-gia-suc - Copy.jpg', '2024-07-03 20:02:44'),
(333, 148, '/data/sp_148/Khang-sinh-Gentaguard-10-Injection-dac-tri-benh-cho-gia-suc.jpg', '2024-07-03 20:02:44'),
(334, 149, '/data/sp_149/Khang-sinh-Enroguard - Copy.jpg', '2024-07-03 20:02:44'),
(335, 149, '/data/sp_149/Khang-sinh-Enroguard.jpg', '2024-07-03 20:02:44'),
(336, 150, '/data/sp_150/Khang-sinh-Enrophar-0-5-Oral-tri-nhiem-trung-ho-hap-tieu-hoa-o-heo - Copy.jpg', '2024-07-03 20:02:44'),
(337, 150, '/data/sp_150/Khang-sinh-Enrophar-0-5-Oral-tri-nhiem-trung-ho-hap-tieu-hoa-o-heo.jpg', '2024-07-03 20:02:44'),
(338, 151, '/data/sp_151/Fermin-Tab-hon-hop-vitamin-ho-tro-qua-trinh-tao-mau - Copy.jpg', '2024-07-03 20:02:44'),
(339, 151, '/data/sp_151/Fermin-Tab-hon-hop-vitamin-ho-tro-qua-trinh-tao-mau.jpg', '2024-07-03 20:02:44'),
(340, 152, '/data/sp_152/Khang-sinh-Amoxclamed-500-tri-cac-benh-nhiem-trung-tren-cho.jpg', '2024-07-03 20:02:44'),
(341, 152, '/data/sp_152/Khang-sinh-amoxclamed-500.jpg', '2024-07-03 20:02:44'),
(342, 153, '/data/sp_153/Dau-tam-Modern-Pet-Dermacare-100ml.jpg', '2024-07-03 20:02:44'),
(343, 153, '/data/sp_153/Dau-tam-Modern-Pet-Dermacare-250ml.jpg', '2024-07-03 20:02:44'),
(344, 153, '/data/sp_153/Dau-tam-Modern-Pet-Dermacare-tri-nam-da-tren-cho-meo.jpg', '2024-07-03 20:02:44'),
(345, 154, '/data/sp_154/vac-xin-tai-to-hop-phong-benh-cum-gia-cam-h5n1-chung-re-6 - Copy.jpg', '2024-07-03 20:02:44'),
(346, 154, '/data/sp_154/vac-xin-tai-to-hop-phong-benh-cum-gia-cam-h5n1-chung-re-6.jpg', '2024-07-03 20:02:44'),
(347, 155, '/data/sp_155/Vac-xin-dong-kho-phong-benh-tai-xanh-chung-jxa-r - Copy.jpg', '2024-07-03 20:02:44'),
(348, 155, '/data/sp_155/Vac-xin-dong-kho-phong-benh-tai-xanh-chung-jxa-r.jpg', '2024-07-03 20:02:44'),
(349, 155, '/data/sp_155/Vaccine-phong-benh-heo-tai-xanh-chung-jxa-r.jpg', '2024-07-03 20:02:44'),
(350, 155, '/data/sp_155/Vaccine-tai-xanh-chung-jxa-r.jpg', '2024-07-03 20:02:44'),
(351, 156, '/data/sp_156/Khang-sinh-pho-rong-Advance-Amoxclavu-S-cho-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(352, 156, '/data/sp_156/Khang-sinh-pho-rong-Advance-Amoxclavu-S-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(353, 157, '/data/sp_157/Felipro-8kg-Thuc-an-cao-cap-danh-cho-meo-moi-lua-tuoi - Copy.jpg', '2024-07-03 20:02:44'),
(354, 157, '/data/sp_157/Felipro-8kg-Thuc-an-cao-cap-danh-cho-meo-moi-lua-tuoi.jpg', '2024-07-03 20:02:44'),
(355, 158, '/data/sp_158/Khang-sinh-Amoxivet-50-Powder-tri-benh-ho-hap-tieu-hoa-o-gia-cam-heo - Copy.jpg', '2024-07-03 20:02:44'),
(356, 158, '/data/sp_158/Khang-sinh-Amoxivet-50-Powder-tri-benh-ho-hap-tieu-hoa-o-gia-cam-heo.jpg', '2024-07-03 20:02:44'),
(357, 159, '/data/sp_159/Sua-tam-Modern-Pet-Sunny-Gel-danh-cho-cho-long-trang - Copy.jpg', '2024-07-03 20:02:44'),
(358, 159, '/data/sp_159/Sua-tam-Modern-Pet-Sunny-Gel-danh-cho-cho-long-trang.jpg', '2024-07-03 20:02:44'),
(359, 160, '/data/sp_160/Khang-sinh-Nalistin-10-tri-nhiem-trung-duong-tieu-hoa-do-khuan-E-Coli-tren-heo-va-gia-cam - Copy.jpg', '2024-07-03 20:02:44'),
(360, 160, '/data/sp_160/Khang-sinh-Nalistin-10-tri-nhiem-trung-duong-tieu-hoa-do-khuan-E-Coli-tren-heo-va-gia-cam.jpg', '2024-07-03 20:02:44'),
(361, 161, '/data/sp_161/Sua-tam-Modern-Pet-Lucky-Gel-cho-cho-meo-co-long-nau-long-nau-do - Copy.jpg', '2024-07-03 20:02:44'),
(362, 161, '/data/sp_161/Sua-tam-Modern-Pet-Lucky-Gel-cho-cho-meo-co-long-nau-long-nau-do.jpg', '2024-07-03 20:02:44'),
(363, 162, '/data/sp_162/Thuoc-minical-bo-sung-Canxi-Photpho-va-Vitamin-A-D3-C-danh-cho-thu-tam-nho - Copy.jpg', '2024-07-03 20:02:44'),
(364, 162, '/data/sp_162/Thuoc-minical-bo-sung-Canxi-Photpho-va-Vitamin-A-D3-C-danh-cho-thu-tam-nho.jpg', '2024-07-03 20:02:44'),
(365, 163, '/data/sp_163/Sua-tam-Modern-Pet-Sweetie-Gel-khu-mui-tao-kieu-cho-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(366, 163, '/data/sp_163/Sua-tam-Modern-Pet-Sweetie-Gel-khu-mui-tao-kieu-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(367, 164, '/data/sp_164/Khang-sinh-Marbovet-80-tri-nhiem-trung-da-va-mo-mem-tren-cho - Copy.jpg', '2024-07-03 20:02:44'),
(368, 164, '/data/sp_164/Khang-sinh-Marbovet-80-tri-nhiem-trung-da-va-mo-mem-tren-cho.jpg', '2024-07-03 20:02:44'),
(369, 165, '/data/sp_165/KC-Pol-bo-sung-hon-hop-vitamin-khoang-va-axit-amin - Copy.jpg', '2024-07-03 20:02:44'),
(370, 165, '/data/sp_165/KC-Pol-bo-sung-hon-hop-vitamin-khoang-va-axit-amin.jpg', '2024-07-03 20:02:44'),
(371, 166, '/data/sp_166/Actifarm-bo-sung-Bacillus-subtilis-cai-thien-tieu-hoa-cho-vat-nuoi - Copy.jpg', '2024-07-03 20:02:44'),
(372, 166, '/data/sp_166/Actifarm-bo-sung-Bacillus-subtilis-cai-thien-tieu-hoa-cho-vat-nuoi.jpg', '2024-07-03 20:02:44'),
(373, 166, '/data/sp_166/Actifarm100g.jpg', '2024-07-03 20:02:44'),
(374, 167, '/data/sp_167/Thuoc-bo-Hairry-dang-vien-bo-sung-Vitamin-A-D3-E-cho-cho.jpg', '2024-07-03 20:02:44'),
(375, 167, '/data/sp_167/Vien-nhai-Hairry-bo-sung-sat-cho-cho.jpg', '2024-07-03 20:02:44'),
(376, 168, '/data/sp_168/Dau-tam-Roy-lam-mem-diu-da-long-cho-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(377, 168, '/data/sp_168/Dau-tam-Roy-lam-mem-diu-da-long-cho-cho-meo.jpg', '2024-07-03 20:02:44'),
(378, 169, '/data/sp_169/pate-cho-cho-Hi-Diet-Dog-Food-Tuna-Chicken-Lamb-flavour - Copy.jpg', '2024-07-03 20:02:44'),
(379, 169, '/data/sp_169/pate-cho-cho-Hi-Diet-Dog-Food-Tuna-Chicken-Lamb-flavour.jpg', '2024-07-03 20:02:44'),
(380, 170, '/data/sp_170/Pate-cho-meo-Hi-Diet-Cat-Food-Tuna-Chicken-flavour - Copy.jpg', '2024-07-03 20:02:44'),
(381, 170, '/data/sp_170/Pate-cho-meo-Hi-Diet-Cat-Food-Tuna-Chicken-flavour.jpg', '2024-07-03 20:02:44'),
(382, 171, '/data/sp_171/Thanh-phan-Doxicure-50 - Copy.jpg', '2024-07-03 20:02:44'),
(383, 171, '/data/sp_171/Thanh-phan-Doxicure-50.jpg', '2024-07-03 20:02:44'),
(384, 172, '/data/sp_172/Khang-sinh-Lincospecvet - Copy.jpg', '2024-07-03 20:02:44'),
(385, 172, '/data/sp_172/Khang-sinh-Lincospecvet.jpg', '2024-07-03 20:02:44'),
(386, 173, '/data/sp_173/Khang-sinh-tilmiguard.jpg', '2024-07-03 20:02:44'),
(387, 173, '/data/sp_173/khang-viem-Keprofen-10-tren-gia-suc-heo-cho-meo.jpg', '2024-07-03 20:02:44'),
(388, 174, '/data/sp_174/khang-viem-Keprofen-10-tren-gia-suc-heo-cho-meo - Copy.jpg', '2024-07-03 20:02:44'),
(389, 174, '/data/sp_174/khang-viem-Keprofen-10-tren-gia-suc-heo-cho-meo.jpg', '2024-07-03 20:02:44'),
(390, 175, '/data/sp_175/Vien-Ketoconazole-giup-tri-nam-da-hoac-khang-nam-tren-cho - Copy.jpg', '2024-07-03 20:02:44'),
(391, 175, '/data/sp_175/Vien-Ketoconazole-giup-tri-nam-da-hoac-khang-nam-tren-cho.jpg', '2024-07-03 20:02:44'),
(392, 176, '/data/sp_176/Vaccine-Newcastle-Bronchitis-B1-type-B1-strain-Mass-and-Conn-Types-Live-Virus - Copy.jpg', '2024-07-03 20:02:44'),
(393, 176, '/data/sp_176/Vaccine-Newcastle-Bronchitis-B1-type-B1-strain-Mass-and-Conn-Types-Live-Virus.jpg', '2024-07-03 20:02:44'),
(394, 177, '/data/sp_177/Scocvac-4-phong-benh-cau-trung-o-ga.jpg', '2024-07-03 20:02:44'),
(395, 177, '/data/sp_177/Vac-xin-da-gia-Scocvac-4-phong-benh-cau-trung-cho-ga-150x150.jpg', '2024-07-03 20:02:44'),
(396, 177, '/data/sp_177/Vac-xin-Scocvac-4-phong-benh-cau-trung-o-ga-long-mau-45-ngay-tuoi.jpg', '2024-07-03 20:02:44'),
(397, 178, '/data/sp_178/Scocvac-3-phong-benh-cau-trung-ga-thit-duoi-45-ngay.jpg', '2024-07-03 20:02:44'),
(398, 178, '/data/sp_178/Vaccine-gia-cam-scocvac-3-phong-benh-cau-trung-o-ga.jpg', '2024-07-03 20:02:44'),
(399, 178, '/data/sp_178/Vaccine-nhuoc-doc-tam-gia-Scocvac-3-phong-benh-cau-trung-o-ga-150x150.jpg', '2024-07-03 20:02:44'),
(400, 179, '/data/sp_179/XO-SAVE-1l-giup-cai-thien-ho-hap-luu-thong-khi.jpg', '2024-07-03 20:02:44'),
(401, 179, '/data/sp_179/XO-SAVE-250ml-giup-cai-thien-ho-hap-luu-thong-khi.jpg', '2024-07-03 20:02:44'),
(402, 179, '/data/sp_179/XO-SAVE-giup-cai-thien-ho-hap-luu-thong-khi.jpg', '2024-07-03 20:02:44'),
(403, 180, '/data/sp_180/Khang-sinh-amoxiguard-15 - Copy.jpg', '2024-07-03 20:02:44'),
(404, 180, '/data/sp_180/Khang-sinh-amoxiguard-15.jpg', '2024-07-03 20:02:44'),
(405, 181, '/data/sp_181/Khang-sinh-amoxivet-15 - Copy.jpg', '2024-07-03 20:02:44'),
(406, 181, '/data/sp_181/Khang-sinh-amoxivet-15.jpg', '2024-07-03 20:02:44'),
(407, 182, '/data/sp_182/Khang-sinh-ampi-200 - Copy.jpg', '2024-07-03 20:02:44'),
(408, 182, '/data/sp_182/Khang-sinh-ampi-200.jpg', '2024-07-03 20:02:44'),
(409, 183, '/data/sp_183/Vaccine-cum-gia-cam-H5N1-chung-Re-1 - Copy.jpg', '2024-07-03 20:02:44'),
(410, 183, '/data/sp_183/Vaccine-cum-gia-cam-H5N1-chung-Re-1.jpg', '2024-07-03 20:02:44'),
(411, 184, '/data/sp_184/sua-tam-modern-pet-gel-giup-kiem-soat-bo-chay-ran-ve-tren-cho-150x150 - Copy.jpg', '2024-07-03 20:02:44'),
(412, 184, '/data/sp_184/sua-tam-modern-pet-gel-giup-kiem-soat-bo-chay-ran-ve-tren-cho-150x150.jpg', '2024-07-03 20:02:44'),
(413, 185, '/data/sp_185/petty-gel-22-b - Copy.jpg', '2024-07-03 20:02:44'),
(414, 185, '/data/sp_185/petty-gel-22-b.jpg', '2024-07-03 20:02:44'),
(415, 185, '/data/sp_185/Petty-gel-a-2022.jpg', '2024-07-03 20:02:44'),
(416, 186, '/data/sp_186/DSC00838-Edit-scaled.jpg', '2024-07-03 20:02:44'),
(417, 186, '/data/sp_186/DSC00839-Edit-600x600 - Copy.jpg', '2024-07-03 20:02:44'),
(418, 186, '/data/sp_186/DSC00839-Edit-600x600.jpg', '2024-07-03 20:02:44'),
(419, 187, '/data/sp_187/DSC00765-Edit-scaled.jpg', '2024-07-03 20:02:44'),
(420, 187, '/data/sp_187/DSC00771-Edit-scaled.jpg', '2024-07-03 20:02:44'),
(421, 187, '/data/sp_187/DSC00775-Edit-scaled.jpg', '2024-07-03 20:02:44'),
(422, 188, '/data/sp_188/3-24-scaled.jpg', '2024-07-03 20:02:44'),
(423, 188, '/data/sp_188/Damong-01-scaled.jpg', '2024-07-03 20:02:44'),
(424, 189, '/data/sp_189/3-21-scaled.jpg', '2024-07-03 20:02:44'),
(425, 189, '/data/sp_189/DAMONG-SPRAY-100ml-01-scaled.jpg', '2024-07-03 20:02:44'),
(426, 190, '/data/sp_190/3-32-scaled - Copy.jpg', '2024-07-03 20:02:44'),
(427, 190, '/data/sp_190/3-32-scaled.jpg', '2024-07-03 20:02:44'),
(428, 191, '/data/sp_191/DSC00572-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(429, 191, '/data/sp_191/DSC00573-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(430, 191, '/data/sp_191/DSC00575-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(431, 192, '/data/sp_192/DSC00995-Edit-scaled - Copy.jpg', '2024-07-03 20:02:44'),
(432, 192, '/data/sp_192/DSC00995-Edit-scaled.jpg', '2024-07-03 20:02:44'),
(433, 193, '/data/sp_193/DSC00530-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(434, 193, '/data/sp_193/DSC00531-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(435, 193, '/data/sp_193/DSC00532-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(436, 194, '/data/sp_194/DSC00302-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(437, 194, '/data/sp_194/DSC00308-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(438, 194, '/data/sp_194/DSC00312-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(439, 195, '/data/sp_195/DSC00239-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(440, 195, '/data/sp_195/DSC00240-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(441, 195, '/data/sp_195/DSC00243-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(442, 196, '/data/sp_196/DSC00980-Edit-scaled - Copy.jpg', '2024-07-03 20:02:44'),
(443, 196, '/data/sp_196/DSC00980-Edit-scaled.jpg', '2024-07-03 20:02:44'),
(444, 197, '/data/sp_197/DSC00592-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(445, 197, '/data/sp_197/DSC00594-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(446, 197, '/data/sp_197/DSC00596-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(447, 198, '/data/sp_198/DSC00544-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(448, 198, '/data/sp_198/DSC00545-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(449, 198, '/data/sp_198/DSC00547-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(450, 199, '/data/sp_199/DSC00366-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(451, 199, '/data/sp_199/DSC00372-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(452, 199, '/data/sp_199/DSC00375-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(453, 199, '/data/sp_199/DSC00380-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(454, 200, '/data/sp_200/DSC00102-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(455, 200, '/data/sp_200/DSC00104-Edit-1-scaled.jpg', '2024-07-03 20:02:44'),
(456, 200, '/data/sp_200/Untitled-1-scaled.jpg', '2024-07-03 20:02:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inventory`
--

CREATE TABLE `inventory` (
  `user_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `addDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isUsed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `level` varchar(15) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `level`
--

INSERT INTO `level` (`id`, `level`, `description`) VALUES
(1, 'INFO', NULL),
(2, 'WARNING', NULL),
(3, 'ALERT', NULL),
(4, 'DANGER', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `pre_value` text DEFAULT NULL,
  `post_value` text DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `log`
--

INSERT INTO `log` (`id`, `level_id`, `ip`, `address`, `pre_value`, `post_value`, `create_at`) VALUES
(1, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '83: Login by 1 success. Congratulation!', '2024-07-14 13:08:00'),
(2, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:08:03'),
(3, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:08:03'),
(4, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:08:05'),
(5, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:08:05'),
(6, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:08:05'),
(7, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:08:08'),
(8, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:08:13'),
(9, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:08:13'),
(10, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:08:13'),
(11, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:08:13'),
(12, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:08:16'),
(13, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:08:16'),
(14, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:08:16'),
(15, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:08:16'),
(16, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:08:16'),
(17, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:08:16'),
(18, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:08:17'),
(19, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:08:18'),
(20, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:08:18'),
(21, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:08:18'),
(22, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:08:20'),
(23, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:08:20'),
(24, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:08:20'),
(25, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:08:20'),
(26, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:08:22'),
(27, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:08:22'),
(28, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:08:22'),
(29, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:08:24'),
(30, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:08:24'),
(31, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:08:29'),
(32, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=2 successfully', '2024-07-14 13:08:35'),
(33, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=166 successfully', '2024-07-14 13:08:37'),
(34, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:08:38'),
(35, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:08:44'),
(36, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:08:44'),
(37, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:08:46'),
(38, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:08:46'),
(39, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:08:46'),
(40, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:06'),
(41, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:12'),
(42, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:09:12'),
(43, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:09:12'),
(44, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:12'),
(45, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:14'),
(46, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:09:14'),
(47, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:09:14'),
(48, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:14'),
(49, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:14'),
(50, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:16'),
(51, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:09:16'),
(52, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:09:16'),
(53, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:16'),
(54, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:16'),
(55, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:16'),
(56, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=100 successfully', '2024-07-14 13:09:24'),
(57, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 13:09:30'),
(58, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:09:30'),
(59, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:09:30'),
(60, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:30'),
(61, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:30'),
(62, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:30'),
(63, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 13:09:30'),
(64, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 13:09:32'),
(65, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=120 successfully', '2024-07-14 13:09:40'),
(66, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=120 successfully', '2024-07-14 13:09:45'),
(67, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:09:45'),
(68, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:09:45'),
(69, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:45'),
(70, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:45'),
(71, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:45'),
(72, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 13:09:45'),
(73, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=120 successfully', '2024-07-14 13:09:45'),
(74, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=120 successfully', '2024-07-14 13:09:47'),
(75, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:09:52'),
(76, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:09:58'),
(77, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:09:58'),
(78, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:09:58'),
(79, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:58'),
(80, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:58'),
(81, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:09:58'),
(82, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 13:09:58'),
(83, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=120 successfully', '2024-07-14 13:09:58'),
(84, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:09:58'),
(85, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:10:00'),
(86, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:10:00'),
(87, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:10:00'),
(88, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:10:00'),
(89, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:10:00'),
(90, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:10:00'),
(91, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 13:10:01'),
(92, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=120 successfully', '2024-07-14 13:10:01'),
(93, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:10:01'),
(94, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:10:01'),
(95, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:10:03'),
(96, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:10:03'),
(97, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:10:03'),
(98, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:10:03'),
(99, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:10:03'),
(100, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:10:03'),
(101, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 13:10:03'),
(102, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=120 successfully', '2024-07-14 13:10:03'),
(103, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:10:03'),
(104, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:10:03'),
(105, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:10:03'),
(106, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=125 successfully', '2024-07-14 13:10:21'),
(107, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=125 successfully', '2024-07-14 13:10:26'),
(108, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:10:26'),
(109, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:10:26'),
(110, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:10:26'),
(111, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:10:26'),
(112, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:10:26'),
(113, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 13:10:26'),
(114, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=120 successfully', '2024-07-14 13:10:26'),
(115, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:10:26'),
(116, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:10:26'),
(117, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:10:26'),
(118, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=125 successfully', '2024-07-14 13:10:26'),
(119, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=125 successfully', '2024-07-14 13:10:28'),
(120, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:10:34'),
(121, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:10:39'),
(122, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:10:39'),
(123, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:10:39'),
(124, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:10:39'),
(125, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:10:39'),
(126, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:10:39'),
(127, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 13:10:39'),
(128, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=120 successfully', '2024-07-14 13:10:39'),
(129, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:10:39'),
(130, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:10:39'),
(131, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:10:39'),
(132, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=125 successfully', '2024-07-14 13:10:39'),
(133, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:10:39'),
(134, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:10:41'),
(135, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:10:45'),
(136, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:10:51'),
(137, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:10:51'),
(138, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:10:51'),
(139, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:10:51'),
(140, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:10:51'),
(141, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:10:51'),
(142, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 13:10:51'),
(143, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=120 successfully', '2024-07-14 13:10:51'),
(144, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:10:51'),
(145, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:10:51'),
(146, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:10:51'),
(147, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=125 successfully', '2024-07-14 13:10:51'),
(148, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:10:51'),
(149, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:10:51'),
(150, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:10:53'),
(151, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:10:57'),
(152, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:11:01'),
(153, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:11:01'),
(154, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:11:01'),
(155, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:11:01'),
(156, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:11:01'),
(157, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:11:01'),
(158, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 13:11:01'),
(159, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=120 successfully', '2024-07-14 13:11:01'),
(160, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:11:01'),
(161, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:11:01'),
(162, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:11:01'),
(163, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=125 successfully', '2024-07-14 13:11:01'),
(164, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:11:01'),
(165, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:11:01'),
(166, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:11:01'),
(167, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:11:04'),
(168, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:11:04'),
(169, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:11:04'),
(170, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:11:04'),
(171, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:11:04'),
(172, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:11:04'),
(173, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 13:11:04'),
(174, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=120 successfully', '2024-07-14 13:11:04'),
(175, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:11:04'),
(176, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:11:04'),
(177, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:11:04'),
(178, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=125 successfully', '2024-07-14 13:11:04'),
(179, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:11:05'),
(180, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:11:05'),
(181, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:11:05'),
(182, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:11:05'),
(183, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:11:09'),
(184, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:11:16'),
(185, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:11:21'),
(186, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:11:21'),
(187, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:11:21'),
(188, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:11:21'),
(189, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:11:21'),
(190, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:11:21'),
(191, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 13:11:21'),
(192, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=120 successfully', '2024-07-14 13:11:21'),
(193, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:11:21'),
(194, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:11:21'),
(195, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:11:21'),
(196, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=125 successfully', '2024-07-14 13:11:21'),
(197, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:11:21'),
(198, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:11:21'),
(199, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:11:21'),
(200, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:11:21'),
(201, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:11:21'),
(202, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:11:23'),
(203, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:11:23'),
(204, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=150 successfully', '2024-07-14 13:11:23'),
(205, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:11:23'),
(206, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:11:23'),
(207, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=140 successfully', '2024-07-14 13:11:23'),
(208, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 13:11:23'),
(209, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=120 successfully', '2024-07-14 13:11:23'),
(210, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:11:23'),
(211, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:11:23'),
(212, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=130 successfully', '2024-07-14 13:11:23'),
(213, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=125 successfully', '2024-07-14 13:11:23'),
(214, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:11:23'),
(215, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:11:23'),
(216, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:11:23'),
(217, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:11:24'),
(218, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:11:24'),
(219, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:11:24'),
(220, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=200 successfully', '2024-07-14 13:13:25'),
(221, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '79: Login by 4 success. Congratulation!', '2024-07-14 13:16:24'),
(222, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:16:29'),
(223, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:33'),
(224, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:39'),
(225, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:39'),
(226, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:41'),
(227, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:41'),
(228, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:41'),
(229, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:43'),
(230, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:43'),
(231, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:43'),
(232, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:43'),
(233, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:45'),
(234, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:45'),
(235, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:45'),
(236, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:45'),
(237, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:45'),
(238, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:45'),
(239, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:16:50'),
(240, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:16:55'),
(241, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:55'),
(242, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:55'),
(243, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:16:56'),
(244, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:16:56'),
(245, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:16:58'),
(246, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:17:01'),
(247, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:17:01'),
(248, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:17:01'),
(249, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:17:01'),
(250, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:17:01'),
(251, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:17:01'),
(252, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:17:01'),
(253, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:17:01'),
(254, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '76: Login by 3 success. Congratulation!', '2024-07-14 13:19:48'),
(255, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=2 successfully', '2024-07-14 13:19:51'),
(256, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:19:54'),
(257, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:19:59'),
(258, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:19:59'),
(259, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:20:01'),
(260, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:20:01'),
(261, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:20:01'),
(262, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:20:03'),
(263, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:20:03'),
(264, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:20:03'),
(265, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:20:03'),
(266, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:20:07'),
(267, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:20:07'),
(268, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:20:07'),
(269, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:20:07'),
(270, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:20:07'),
(271, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:20:07'),
(272, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=135 successfully', '2024-07-14 13:22:38'),
(273, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=138 successfully', '2024-07-14 13:22:43'),
(274, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=139 successfully', '2024-07-14 13:22:46'),
(275, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=139 successfully', '2024-07-14 13:22:53'),
(276, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:22:53'),
(277, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:22:53'),
(278, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:22:53'),
(279, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=139 successfully', '2024-07-14 13:22:53'),
(280, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=139 successfully', '2024-07-14 13:22:55'),
(281, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:22:55'),
(282, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:22:55'),
(283, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:22:55'),
(284, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=139 successfully', '2024-07-14 13:22:55'),
(285, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=139 successfully', '2024-07-14 13:22:55'),
(286, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '75: Login by 5 success. Congratulation!', '2024-07-14 13:24:43'),
(287, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:24:46'),
(288, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:24:46'),
(289, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:24:48'),
(290, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:24:48'),
(291, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:24:48'),
(292, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:24:51'),
(293, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:24:51'),
(294, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:24:51'),
(295, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:24:51'),
(296, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:24:54'),
(297, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:24:54'),
(298, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:24:56'),
(299, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '75: Login by 5 success. Congratulation!', '2024-07-14 13:25:10'),
(300, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:36:32'),
(301, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:36:37'),
(302, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:36:37'),
(303, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:36:42'),
(304, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:36:44'),
(305, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:36:55'),
(306, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:36:55'),
(307, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:37:02'),
(308, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:37:02'),
(309, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:37:05'),
(310, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:37:05'),
(311, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:37:09'),
(312, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:37:09'),
(313, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:37:12'),
(314, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:37:12'),
(315, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:37:14'),
(316, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:37:14'),
(317, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:38:26'),
(318, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:38:32'),
(319, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:38:43'),
(320, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:38:43'),
(321, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:38:43'),
(322, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:38:52'),
(323, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:38:52'),
(324, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:38:52'),
(325, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:39:04'),
(326, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:39:04'),
(327, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:39:04'),
(328, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:39:31'),
(329, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:39:37'),
(330, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=2 successfully', '2024-07-14 13:39:44'),
(331, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 13:39:49'),
(332, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:39:49'),
(333, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:39:49'),
(334, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 13:39:49'),
(335, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 13:39:55'),
(336, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:40:00'),
(337, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:40:05'),
(338, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:40:05'),
(339, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:40:05'),
(340, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 13:40:05'),
(341, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:40:05'),
(342, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:40:27'),
(343, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 13:40:27'),
(344, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:40:27'),
(345, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 13:40:27'),
(346, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 13:40:27'),
(347, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '78: Login by 1 success. Congratulation!', '2024-07-14 13:43:49'),
(348, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:43:54'),
(349, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:44:00'),
(350, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:44:00'),
(351, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:44:03'),
(352, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:44:06'),
(353, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:44:06'),
(354, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:44:12'),
(355, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:44:17'),
(356, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:44:17'),
(357, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:44:17'),
(358, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:44:20'),
(359, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:44:25'),
(360, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:44:32'),
(361, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:44:32'),
(362, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:44:32'),
(363, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:44:32'),
(364, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:44:35'),
(365, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:44:37'),
(366, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:44:41'),
(367, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:44:46'),
(368, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:44:46'),
(369, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:44:46'),
(370, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:44:46'),
(371, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:44:46'),
(372, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:44:49'),
(373, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:44:49'),
(374, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:44:49'),
(375, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:44:49'),
(376, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:44:49'),
(377, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:44:49'),
(378, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:44:54'),
(379, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:44:54'),
(380, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:44:54'),
(381, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:44:54'),
(382, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:44:54'),
(383, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:44:54'),
(384, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:44:54'),
(385, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:44:54'),
(386, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:44:54'),
(387, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:44:54'),
(388, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:00'),
(389, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:45:00'),
(390, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:45:00'),
(391, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:45:00'),
(392, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:00'),
(393, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:00'),
(394, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:00'),
(395, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:45:04'),
(396, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:45:04'),
(397, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:45:04'),
(398, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:04'),
(399, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:04'),
(400, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:04'),
(401, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:45:04'),
(402, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:45:04'),
(403, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:45:04'),
(404, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:04'),
(405, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:04'),
(406, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:04'),
(407, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:45:24'),
(408, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:45:24'),
(409, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:45:24'),
(410, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:24'),
(411, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:24'),
(412, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:24'),
(413, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:45:24'),
(414, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:45:24'),
(415, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:45:24'),
(416, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:24'),
(417, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:24'),
(418, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:24'),
(419, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 13:45:26'),
(420, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:45:26'),
(421, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:45:26'),
(422, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:26'),
(423, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:26'),
(424, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:45:26'),
(425, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=4 successfully', '2024-07-14 13:50:10'),
(426, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=200 successfully', '2024-07-14 13:50:12'),
(427, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=200 successfully', '2024-07-14 13:50:19'),
(428, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:50:19'),
(429, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:50:19'),
(430, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:50:19'),
(431, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:50:19'),
(432, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:50:19'),
(433, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=200 successfully', '2024-07-14 13:50:19'),
(434, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=200 successfully', '2024-07-14 13:50:21'),
(435, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:50:21'),
(436, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:50:21'),
(437, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:50:21'),
(438, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:50:21'),
(439, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:50:21'),
(440, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=200 successfully', '2024-07-14 13:50:21'),
(441, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=200 successfully', '2024-07-14 13:50:21'),
(442, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:50:29'),
(443, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:50:29'),
(444, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:50:29'),
(445, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:50:29'),
(446, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:50:29'),
(447, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=200 successfully', '2024-07-14 13:50:29'),
(448, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=200 successfully', '2024-07-14 13:50:29'),
(449, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=127 successfully', '2024-07-14 13:50:29'),
(450, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=126 successfully', '2024-07-14 13:50:29'),
(451, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:50:29'),
(452, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:50:29'),
(453, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=128 successfully', '2024-07-14 13:50:29');
INSERT INTO `log` (`id`, `level_id`, `ip`, `address`, `pre_value`, `post_value`, `create_at`) VALUES
(454, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=200 successfully', '2024-07-14 13:50:29'),
(455, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=200 successfully', '2024-07-14 13:50:29'),
(456, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-14 22:16:54'),
(457, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:16:58'),
(458, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:16:58'),
(459, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:17:00'),
(460, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:17:00'),
(461, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:17:00'),
(462, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:17:03'),
(463, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:17:03'),
(464, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:17:03'),
(465, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:17:03'),
(466, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:17:05'),
(467, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:17:05'),
(468, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:17:07'),
(469, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-14 22:17:16'),
(470, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-14 22:17:25'),
(471, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-14 22:17:26'),
(472, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=69 successfully', '2024-07-14 22:17:31'),
(473, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=69 successfully', '2024-07-14 22:17:31'),
(474, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=61 successfully', '2024-07-14 22:17:34'),
(475, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=69 successfully', '2024-07-14 22:17:34'),
(476, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=61 successfully', '2024-07-14 22:17:34'),
(477, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=61 successfully', '2024-07-14 22:17:36'),
(478, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=69 successfully', '2024-07-14 22:17:38'),
(479, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=69 successfully', '2024-07-14 22:17:40'),
(480, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=61 successfully', '2024-07-14 22:17:40'),
(481, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=69 successfully', '2024-07-14 22:17:40'),
(482, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=61 successfully', '2024-07-14 22:17:40'),
(483, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=69 successfully', '2024-07-14 22:17:41'),
(484, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=61 successfully', '2024-07-14 22:17:41'),
(485, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=61 successfully', '2024-07-14 22:17:43'),
(486, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:02'),
(487, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:12'),
(488, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:12'),
(489, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:14'),
(490, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:14'),
(491, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:14'),
(492, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:16'),
(493, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:16'),
(494, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:16'),
(495, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:16'),
(496, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:18'),
(497, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:19'),
(498, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:19'),
(499, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:20'),
(500, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:20'),
(501, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:20'),
(502, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:24'),
(503, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:24'),
(504, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:24'),
(505, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:25'),
(506, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-14 22:18:44'),
(507, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-14 22:18:44'),
(508, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:45'),
(509, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:45'),
(510, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:54'),
(511, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=157 successfully', '2024-07-14 22:18:54'),
(512, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-14 22:19:29'),
(513, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-14 22:19:29'),
(514, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:19:34'),
(515, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:19:34'),
(516, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:19:36'),
(517, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:19:36'),
(518, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:19:36'),
(519, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:19:38'),
(520, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:19:38'),
(521, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:19:38'),
(522, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:19:38'),
(523, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:23:16'),
(524, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:23:21'),
(525, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:23:21'),
(526, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:23:21'),
(527, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:23:27'),
(528, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:23:30'),
(529, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:23:34'),
(530, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:23:34'),
(531, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:23:34'),
(532, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:23:40'),
(533, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:23:40'),
(534, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:23:40'),
(535, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:23:45'),
(536, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:23:45'),
(537, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:23:45'),
(538, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:23:49'),
(539, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:23:49'),
(540, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:23:49'),
(541, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-14 22:26:56'),
(542, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=56 successfully', '2024-07-14 22:27:00'),
(543, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=56 successfully', '2024-07-14 22:27:00'),
(544, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:27:02'),
(545, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:27:08'),
(546, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=56 successfully', '2024-07-14 22:27:08'),
(547, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:27:08'),
(548, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:27:17'),
(549, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:27:28'),
(550, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:27:32'),
(551, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=56 successfully', '2024-07-14 22:27:32'),
(552, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:27:32'),
(553, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:27:32'),
(554, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:27:38'),
(555, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:27:52'),
(556, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:27:59'),
(557, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=56 successfully', '2024-07-14 22:28:00'),
(558, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:28:00'),
(559, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:28:00'),
(560, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:28:00'),
(561, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:28:06'),
(562, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=56 successfully', '2024-07-14 22:28:06'),
(563, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:28:06'),
(564, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:28:06'),
(565, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:28:06'),
(566, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:28:08'),
(567, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:28:09'),
(568, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:28:09'),
(569, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:28:10'),
(570, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:28:16'),
(571, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-14 22:30:59'),
(572, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-14 22:30:59'),
(573, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:04'),
(574, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:11'),
(575, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:11'),
(576, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:16'),
(577, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:16'),
(578, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:18'),
(579, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:20'),
(580, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:21'),
(581, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:21'),
(582, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:21'),
(583, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:21'),
(584, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:22'),
(585, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:23'),
(586, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:23'),
(587, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:23'),
(588, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:44'),
(589, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:51'),
(590, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:51'),
(591, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:53'),
(592, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:31:53'),
(593, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-14 22:33:06'),
(594, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:33:10'),
(595, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:33:10'),
(596, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:33:18'),
(597, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:33:18'),
(598, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:33:18'),
(599, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:33:21'),
(600, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:33:21'),
(601, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:33:21'),
(602, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:33:21'),
(603, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:33:23'),
(604, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:33:23'),
(605, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-14 22:33:25'),
(606, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:33:33'),
(607, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:33:40'),
(608, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:33:40'),
(609, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:33:47'),
(610, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:33:47'),
(611, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:33:49'),
(612, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:33:52'),
(613, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:33:56'),
(614, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:33:56'),
(615, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:33:56'),
(616, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:34:02'),
(617, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:34:02'),
(618, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:34:02'),
(619, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:34:06'),
(620, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:34:06'),
(621, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:34:06'),
(622, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:34:06'),
(623, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:34:10'),
(624, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:34:10'),
(625, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:34:10'),
(626, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:36:17'),
(627, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:36:20'),
(628, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:36:24'),
(629, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:36:24'),
(630, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:36:24'),
(631, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:36:24'),
(632, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:36:29'),
(633, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:36:32'),
(634, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:36:36'),
(635, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:36:36'),
(636, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:36:36'),
(637, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:36:36'),
(638, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:36:36'),
(639, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:36:41'),
(640, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:36:41'),
(641, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:36:41'),
(642, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:36:41'),
(643, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:36:41'),
(644, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:38:27'),
(645, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:38:31'),
(646, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:38:31'),
(647, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:38:31'),
(648, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:38:31'),
(649, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:38:31'),
(650, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:38:31'),
(651, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:39:41'),
(652, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:39:45'),
(653, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:39:45'),
(654, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:39:45'),
(655, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:39:45'),
(656, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:39:45'),
(657, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:39:45'),
(658, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:39:45'),
(659, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:39:51'),
(660, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:39:55'),
(661, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:39:59'),
(662, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:39:59'),
(663, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:39:59'),
(664, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:39:59'),
(665, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:39:59'),
(666, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:39:59'),
(667, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:39:59'),
(668, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:39:59'),
(669, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:40:03'),
(670, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:40:03'),
(671, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:40:03'),
(672, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:40:03'),
(673, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:40:03'),
(674, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:40:03'),
(675, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:40:03'),
(676, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:40:03'),
(677, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:40:38'),
(678, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:40:38'),
(679, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:40:38'),
(680, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:40:38'),
(681, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:40:38'),
(682, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:40:38'),
(683, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:40:38'),
(684, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:40:38'),
(685, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:40:41'),
(686, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:40:41'),
(687, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:40:41'),
(688, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:40:41'),
(689, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:40:41'),
(690, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:40:41'),
(691, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:40:41'),
(692, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:40:41'),
(693, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:41:34'),
(694, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:41:41'),
(695, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:41:44'),
(696, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:41:49'),
(697, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:41:49'),
(698, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:41:49'),
(699, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:41:49'),
(700, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:41:49'),
(701, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:41:49'),
(702, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:41:49'),
(703, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:41:49'),
(704, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:41:50'),
(705, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:41:55'),
(706, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:42:04'),
(707, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:42:10'),
(708, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:42:14'),
(709, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:42:14'),
(710, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:42:14'),
(711, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:42:14'),
(712, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:42:14'),
(713, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:42:15'),
(714, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:42:15'),
(715, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:42:15'),
(716, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:42:15'),
(717, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:42:15'),
(718, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:42:20'),
(719, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:42:20'),
(720, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:42:20'),
(721, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:42:20'),
(722, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:42:20'),
(723, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:42:20'),
(724, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:42:20'),
(725, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:42:20'),
(726, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:42:20'),
(727, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:42:20'),
(728, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:42:23'),
(729, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:42:23'),
(730, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:42:23'),
(731, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:42:23'),
(732, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:42:23'),
(733, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:42:23'),
(734, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:42:23'),
(735, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:42:23'),
(736, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:42:23'),
(737, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:42:23'),
(738, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:42:56'),
(739, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:43:03'),
(740, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:43:08'),
(741, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:43:08'),
(742, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:43:08'),
(743, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:43:08'),
(744, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:43:08'),
(745, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:43:08'),
(746, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:43:08'),
(747, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:43:08'),
(748, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:43:08'),
(749, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:43:08'),
(750, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:43:08'),
(751, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:43:13'),
(752, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:43:13'),
(753, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:43:13'),
(754, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:43:13'),
(755, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:43:13'),
(756, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:43:13'),
(757, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:43:13'),
(758, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:43:13'),
(759, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:43:13'),
(760, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:43:13'),
(761, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:43:13'),
(762, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:44:52'),
(763, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=141 successfully', '2024-07-14 22:45:18'),
(764, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:45:23'),
(765, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:45:27'),
(766, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:45:27'),
(767, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:45:27'),
(768, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:45:27'),
(769, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:45:27'),
(770, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:45:27'),
(771, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:45:27'),
(772, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:45:27'),
(773, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:45:27'),
(774, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:45:27'),
(775, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:45:27'),
(776, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:45:27'),
(777, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:45:32'),
(778, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:45:32'),
(779, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:45:32'),
(780, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:45:32'),
(781, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:45:32'),
(782, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:45:32'),
(783, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:45:32'),
(784, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:45:32'),
(785, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:45:32'),
(786, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:45:32'),
(787, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:45:32'),
(788, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:45:32'),
(789, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:45:39'),
(790, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:45:39'),
(791, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:45:39'),
(792, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:45:39'),
(793, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:45:39'),
(794, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:45:39'),
(795, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:45:39'),
(796, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:45:39'),
(797, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:45:39'),
(798, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:45:39'),
(799, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:45:39'),
(800, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:45:39'),
(801, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:46:39'),
(802, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:46:52'),
(803, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:46:57'),
(804, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:46:57'),
(805, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:46:57'),
(806, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:46:57'),
(807, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:46:57'),
(808, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:46:57'),
(809, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:46:57'),
(810, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:46:57'),
(811, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:46:57'),
(812, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:46:57'),
(813, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:46:57'),
(814, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:46:57'),
(815, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:46:57'),
(816, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:47:44'),
(817, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:47:49'),
(818, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:47:51'),
(819, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:47:54'),
(820, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:47:54'),
(821, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:47:54'),
(822, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:47:54'),
(823, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:47:54'),
(824, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:47:54'),
(825, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:47:54'),
(826, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:47:54'),
(827, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:47:54'),
(828, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:47:54'),
(829, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:47:54'),
(830, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:47:54'),
(831, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:47:54'),
(832, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:47:55'),
(833, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:47:59'),
(834, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:47:59'),
(835, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:47:59'),
(836, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:47:59'),
(837, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:47:59'),
(838, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:47:59'),
(839, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:47:59'),
(840, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:47:59'),
(841, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:47:59'),
(842, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:47:59'),
(843, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:47:59'),
(844, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:47:59'),
(845, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:47:59'),
(846, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:47:59'),
(847, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:10'),
(848, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:48:10'),
(849, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:48:10'),
(850, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:48:10'),
(851, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:48:10'),
(852, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:48:10'),
(853, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:48:10'),
(854, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:48:10'),
(855, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:48:10'),
(856, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:48:10'),
(857, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:48:10'),
(858, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:48:10'),
(859, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:48:10'),
(860, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:10'),
(861, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:17'),
(862, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:48:25'),
(863, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:48:25'),
(864, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:48:25'),
(865, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:48:25'),
(866, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:48:25'),
(867, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:48:25'),
(868, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:48:25'),
(869, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:48:25'),
(870, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:48:25'),
(871, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:48:25'),
(872, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:48:25'),
(873, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:48:25'),
(874, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:25'),
(875, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:48:25'),
(876, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:48:25'),
(877, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:48:25'),
(878, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:48:25'),
(879, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:48:25'),
(880, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:48:25'),
(881, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:48:25'),
(882, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:48:25'),
(883, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:48:25'),
(884, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:48:25'),
(885, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:48:25'),
(886, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:48:25'),
(887, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:25'),
(888, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=55 successfully', '2024-07-14 22:48:26'),
(889, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:48:26'),
(890, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:48:26'),
(891, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:48:26'),
(892, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:48:26'),
(893, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:48:26'),
(894, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:48:26'),
(895, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:48:26'),
(896, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:48:26'),
(897, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:48:26'),
(898, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:48:26'),
(899, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:48:26'),
(900, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:26'),
(901, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-14 22:48:28'),
(902, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:48:28'),
(903, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:48:28'),
(904, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:48:28'),
(905, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:48:28'),
(906, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:48:28'),
(907, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:48:28'),
(908, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:48:28');
INSERT INTO `log` (`id`, `level_id`, `ip`, `address`, `pre_value`, `post_value`, `create_at`) VALUES
(909, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:48:28'),
(910, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:48:28'),
(911, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:48:28'),
(912, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:28'),
(913, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:48:28'),
(914, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:48:28'),
(915, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:48:28'),
(916, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:48:28'),
(917, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:48:28'),
(918, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:48:28'),
(919, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:48:28'),
(920, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:48:28'),
(921, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:48:28'),
(922, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:48:28'),
(923, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:28'),
(924, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 22:48:29'),
(925, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:48:29'),
(926, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:48:29'),
(927, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:48:29'),
(928, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:48:29'),
(929, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:48:29'),
(930, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:48:29'),
(931, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:48:29'),
(932, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:48:29'),
(933, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:29'),
(934, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=12 successfully', '2024-07-14 22:48:30'),
(935, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:48:30'),
(936, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:48:30'),
(937, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:48:30'),
(938, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:48:30'),
(939, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:48:30'),
(940, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:48:30'),
(941, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:48:30'),
(942, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:30'),
(943, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-14 22:48:31'),
(944, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:48:31'),
(945, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:48:31'),
(946, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:48:31'),
(947, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:48:31'),
(948, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:48:31'),
(949, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:48:31'),
(950, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:31'),
(951, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=6 successfully', '2024-07-14 22:48:31'),
(952, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:48:31'),
(953, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:48:31'),
(954, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:48:31'),
(955, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:48:31'),
(956, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:48:31'),
(957, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:31'),
(958, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=5 successfully', '2024-07-14 22:48:32'),
(959, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:48:32'),
(960, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:48:32'),
(961, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:48:32'),
(962, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:48:32'),
(963, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:32'),
(964, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-14 22:48:33'),
(965, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:48:33'),
(966, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:48:33'),
(967, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:48:33'),
(968, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:33'),
(969, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=34 successfully', '2024-07-14 22:48:33'),
(970, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:48:33'),
(971, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:48:33'),
(972, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:33'),
(973, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=100 successfully', '2024-07-14 22:48:34'),
(974, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:48:34'),
(975, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:34'),
(976, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=8 successfully', '2024-07-14 22:48:35'),
(977, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:35'),
(978, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=7 successfully', '2024-07-14 22:48:37'),
(979, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=53 successfully', '2024-07-14 22:48:45'),
(980, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=53 successfully', '2024-07-14 22:48:52'),
(981, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=53 successfully', '2024-07-14 22:48:52'),
(982, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=53 successfully', '2024-07-14 22:49:00'),
(983, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=53 successfully', '2024-07-14 22:49:00'),
(984, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=53 successfully', '2024-07-14 22:49:07'),
(985, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=53 successfully', '2024-07-14 22:49:51'),
(986, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:49:56'),
(987, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:49:59'),
(988, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=53 successfully', '2024-07-14 22:49:59'),
(989, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:49:59'),
(990, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:50:05'),
(991, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=53 successfully', '2024-07-14 22:50:05'),
(992, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:50:05'),
(993, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=11 successfully', '2024-07-14 22:50:09'),
(994, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=23 successfully', '2024-07-14 22:50:28'),
(995, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-14 22:53:04'),
(996, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:53:06'),
(997, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:53:10'),
(998, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:53:17'),
(999, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:53:24'),
(1000, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:53:33'),
(1001, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:53:33'),
(1002, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:53:37'),
(1003, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:54:34'),
(1004, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=2 successfully', '2024-07-14 22:54:34'),
(1005, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-14 22:57:36'),
(1006, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:57:38'),
(1007, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:57:42'),
(1008, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:57:47'),
(1009, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:57:51'),
(1010, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 22:57:51'),
(1011, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-14 23:02:38'),
(1012, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 23:02:39'),
(1013, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-14 23:02:39'),
(1014, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-14 23:02:42'),
(1015, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 23:02:46'),
(1016, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 23:02:46'),
(1017, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 23:02:52'),
(1018, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 23:02:52'),
(1019, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 23:03:35'),
(1020, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 23:03:35'),
(1021, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=1 successfully', '2024-07-14 23:04:00'),
(1022, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=2 successfully', '2024-07-14 23:04:03'),
(1023, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 23:04:06'),
(1024, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 23:04:06'),
(1025, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 23:04:06'),
(1026, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 23:04:11'),
(1027, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 23:04:11'),
(1028, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 23:04:11'),
(1029, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 23:04:14'),
(1030, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 23:04:14'),
(1031, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 23:04:14'),
(1032, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 23:04:17'),
(1033, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-14 23:04:17'),
(1034, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-14 23:04:17'),
(1035, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, 'Login success with ID=82', '2024-07-14 23:05:24'),
(1036, 1, '0:0:0:0:0:0:0:1', '/user/signin', NULL, '21130556@st.hcmuaf.edu.vn: Your account has unlocked successfully. Congratulation!', '2024-07-14 23:05:24'),
(1037, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=3 successfully', '2024-07-14 23:05:27'),
(1038, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 23:05:31'),
(1039, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 23:05:31'),
(1040, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 23:05:35'),
(1041, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-14 23:05:41'),
(1042, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-15 00:54:37'),
(1043, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:54:39'),
(1044, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:54:39'),
(1045, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:54:42'),
(1046, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:54:42'),
(1047, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:54:43'),
(1048, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:54:43'),
(1049, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:55:16'),
(1050, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:55:18'),
(1051, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:55:21'),
(1052, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:55:29'),
(1053, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:55:31'),
(1054, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:56:30'),
(1055, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:56:34'),
(1056, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:56:34'),
(1057, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:56:37'),
(1058, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:57:13'),
(1059, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-15 00:59:17'),
(1060, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:59:18'),
(1061, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:59:19'),
(1062, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 00:59:30'),
(1063, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-15 01:06:51'),
(1064, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:06:52'),
(1065, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:06:53'),
(1066, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:06:56'),
(1067, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:07:24'),
(1068, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:07:41'),
(1069, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:07:41'),
(1070, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:07:44'),
(1071, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:07:48'),
(1072, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:07:50'),
(1073, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:07:50'),
(1074, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:07:53'),
(1075, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:07:53'),
(1076, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:07:56'),
(1077, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:09:17'),
(1078, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:09:24'),
(1079, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:09:29'),
(1080, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:09:33'),
(1081, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:09:33'),
(1082, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:09:36'),
(1083, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:09:36'),
(1084, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:09:36'),
(1085, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:09:39'),
(1086, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:09:39'),
(1087, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:09:39'),
(1088, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:09:39'),
(1089, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:09:44'),
(1090, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:09:44'),
(1091, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:10:47'),
(1092, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:10:47'),
(1093, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:10:55'),
(1094, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:10:55'),
(1095, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:10:57'),
(1096, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:10:57'),
(1097, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:10:58'),
(1098, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:10:58'),
(1099, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:00'),
(1100, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:00'),
(1101, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:02'),
(1102, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:02'),
(1103, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:04'),
(1104, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:04'),
(1105, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:06'),
(1106, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:06'),
(1107, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:10'),
(1108, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:10'),
(1109, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:14'),
(1110, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:14'),
(1111, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:15'),
(1112, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:15'),
(1113, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:20'),
(1114, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:25'),
(1115, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:31'),
(1116, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:31'),
(1117, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:32'),
(1118, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:32'),
(1119, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:38'),
(1120, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:38'),
(1121, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:39'),
(1122, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:11:39'),
(1123, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:14:49'),
(1124, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:14:49'),
(1125, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:14:49'),
(1126, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:14:51'),
(1127, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:14:51'),
(1128, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:14:51'),
(1129, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:14:51'),
(1130, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:14:55'),
(1131, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:14:55'),
(1132, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:14:58'),
(1133, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:14:58'),
(1134, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:14:59'),
(1135, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:14:59'),
(1136, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:15:00'),
(1137, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:15:00'),
(1138, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:15:06'),
(1139, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:15:06'),
(1140, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:15:06'),
(1141, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:15:08'),
(1142, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:15:08'),
(1143, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:15:08'),
(1144, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:15:08'),
(1145, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:15:11'),
(1146, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:15:11'),
(1147, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:15:11'),
(1148, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:15:11'),
(1149, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:15:12'),
(1150, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:15:12'),
(1151, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:15:12'),
(1152, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:15:12'),
(1153, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:15:13'),
(1154, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:15:13'),
(1155, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:15:15'),
(1156, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:15:15'),
(1157, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:16:11'),
(1158, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:16:11'),
(1159, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:16:14'),
(1160, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:16:14'),
(1161, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:16:17'),
(1162, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:16:17'),
(1163, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:16:18'),
(1164, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:16:18'),
(1165, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:16:20'),
(1166, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:16:20'),
(1167, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:16:22'),
(1168, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:16:22'),
(1169, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:22:11'),
(1170, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:22:13'),
(1171, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:22:19'),
(1172, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:23:26'),
(1173, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:23:26'),
(1174, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:23:27'),
(1175, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:23:27'),
(1176, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:23:29'),
(1177, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:23:29'),
(1178, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:23:30'),
(1179, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:23:30'),
(1180, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:23:33'),
(1181, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:24:00'),
(1182, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:24:00'),
(1183, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:24:02'),
(1184, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:24:02'),
(1185, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:24:05'),
(1186, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-15 01:27:13'),
(1187, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:14'),
(1188, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:15'),
(1189, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:23'),
(1190, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:33'),
(1191, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:36'),
(1192, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:36'),
(1193, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:38'),
(1194, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:38'),
(1195, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:42'),
(1196, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:46'),
(1197, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:46'),
(1198, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:50'),
(1199, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:50'),
(1200, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:54'),
(1201, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:54'),
(1202, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:56'),
(1203, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:56'),
(1204, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:27:59'),
(1205, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:28:07'),
(1206, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:28:07'),
(1207, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:28:31'),
(1208, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:28:31'),
(1209, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:28:33'),
(1210, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:28:36'),
(1211, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:28:36'),
(1212, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-15 01:29:20'),
(1213, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:29:23'),
(1214, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:29:23'),
(1215, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:29:27'),
(1216, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:29:27'),
(1217, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:29:29'),
(1218, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:29:29'),
(1219, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:29:36'),
(1220, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:29:38'),
(1221, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:29:38'),
(1222, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:29:40'),
(1223, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:29:40'),
(1224, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:29:42'),
(1225, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:29:42'),
(1226, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-15 01:39:54'),
(1227, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:39:56'),
(1228, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:39:56'),
(1229, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:40:40'),
(1230, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:40:41'),
(1231, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:40:51'),
(1232, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:40:52'),
(1233, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:41:03'),
(1234, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:41:03'),
(1235, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:41:17'),
(1236, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:41:17'),
(1237, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:41:24'),
(1238, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:41:48'),
(1239, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:41:49'),
(1240, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:41:50'),
(1241, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:41:55'),
(1242, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:42:02'),
(1243, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:42:29'),
(1244, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-15 01:42:38'),
(1245, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-15 01:42:38'),
(1246, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:42:40'),
(1247, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-15 01:42:40'),
(1248, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:42:40'),
(1249, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-15 01:42:42'),
(1250, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:42:42'),
(1251, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=10 successfully', '2024-07-15 01:42:42'),
(1252, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:42:42'),
(1253, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:42:45'),
(1254, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-15 01:42:45'),
(1255, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-15 01:42:48'),
(1256, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-15 01:42:48'),
(1257, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-15 01:42:50'),
(1258, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-15 01:42:50'),
(1259, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-15 01:42:52'),
(1260, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-15 01:42:52'),
(1261, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-15 01:42:56'),
(1262, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=10 successfully', '2024-07-15 01:42:56'),
(1263, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-15 01:42:58'),
(1264, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=10 successfully', '2024-07-15 01:42:58'),
(1265, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '78: Login by 1 success. Congratulation!', '2024-07-15 01:45:20'),
(1266, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:45:23'),
(1267, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:45:27'),
(1268, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:45:27'),
(1269, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:45:33'),
(1270, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:45:37'),
(1271, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:45:37'),
(1272, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:45:37'),
(1273, 1, '0:0:0:0:0:0:0:1', '/user/product', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:45:41'),
(1274, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:45:42'),
(1275, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:45:42'),
(1276, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:45:42'),
(1277, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:45:42'),
(1278, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:45:46'),
(1279, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:45:46'),
(1280, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:45:46'),
(1281, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:45:46'),
(1282, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:45:49'),
(1283, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:45:49'),
(1284, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:45:49'),
(1285, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:45:49'),
(1286, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:45:49'),
(1287, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:45:49'),
(1288, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:45:59'),
(1289, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:45:59'),
(1290, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:45:59'),
(1291, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:45:59'),
(1292, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:08'),
(1293, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:46:08'),
(1294, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:46:08'),
(1295, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:08'),
(1296, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:10'),
(1297, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:46:10'),
(1298, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:46:10'),
(1299, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:10'),
(1300, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:13'),
(1301, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:46:13'),
(1302, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:46:13'),
(1303, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:13'),
(1304, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:46:26'),
(1305, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:46:26'),
(1306, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:26'),
(1307, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:46:31'),
(1308, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:46:31'),
(1309, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:31'),
(1310, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:46:31'),
(1311, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:46:31'),
(1312, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:31'),
(1313, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:34'),
(1314, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:46:34'),
(1315, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:46:34'),
(1316, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:34'),
(1317, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:46:41'),
(1318, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:46:41'),
(1319, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:41'),
(1320, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:46:41'),
(1321, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:46:41'),
(1322, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:41'),
(1323, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:46:43'),
(1324, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:46:43'),
(1325, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:43'),
(1326, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:46:43'),
(1327, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:46:43'),
(1328, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:43'),
(1329, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:46:49'),
(1330, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:46:49'),
(1331, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:46:49'),
(1332, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:49'),
(1333, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:46:49'),
(1334, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:46:52'),
(1335, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:46:52'),
(1336, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:52'),
(1337, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:46:52'),
(1338, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:46:52'),
(1339, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:46:52'),
(1340, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:46:52'),
(1341, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:46:52'),
(1342, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:47:01'),
(1343, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:47:01'),
(1344, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:47:01'),
(1345, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:47:01'),
(1346, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:48:18'),
(1347, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:48:18'),
(1348, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:48:18'),
(1349, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:48:18'),
(1350, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:49:03'),
(1351, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:49:03'),
(1352, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:49:03'),
(1353, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:49:03'),
(1354, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:49:03'),
(1355, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:49:03'),
(1356, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:49:03'),
(1357, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:49:03'),
(1358, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:49:05'),
(1359, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:49:05'),
(1360, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:49:05'),
(1361, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:49:05');
INSERT INTO `log` (`id`, `level_id`, `ip`, `address`, `pre_value`, `post_value`, `create_at`) VALUES
(1362, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:49:05'),
(1363, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:49:05'),
(1364, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:49:05'),
(1365, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:49:05'),
(1366, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:49:08'),
(1367, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:49:08'),
(1368, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:49:08'),
(1369, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:49:08'),
(1370, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:49:10'),
(1371, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:49:10'),
(1372, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:49:10'),
(1373, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:49:10'),
(1374, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:49:10'),
(1375, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:49:10'),
(1376, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:49:10'),
(1377, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:49:10'),
(1378, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:49:11'),
(1379, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:49:11'),
(1380, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:49:11'),
(1381, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:49:12'),
(1382, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:49:12'),
(1383, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:49:12'),
(1384, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:49:12'),
(1385, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:49:12'),
(1386, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:50:38'),
(1387, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:50:38'),
(1388, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:50:38'),
(1389, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:50:38'),
(1390, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:50:38'),
(1391, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:50:38'),
(1392, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:50:40'),
(1393, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:50:40'),
(1394, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:50:40'),
(1395, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:50:40'),
(1396, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:50:40'),
(1397, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=9 successfully', '2024-07-15 01:50:40'),
(1398, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=33 successfully', '2024-07-15 01:50:40'),
(1399, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:50:40'),
(1400, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=85 successfully', '2024-07-15 01:50:40'),
(1401, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:50:40'),
(1402, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-15 01:50:46'),
(1403, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:50:51'),
(1404, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:50:51'),
(1405, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:50:57'),
(1406, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:50:57'),
(1407, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:50:57'),
(1408, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:50:59'),
(1409, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:50:59'),
(1410, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:50:59'),
(1411, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:50:59'),
(1412, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:51:07'),
(1413, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:51:07'),
(1414, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-15 01:57:53'),
(1415, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:57:55'),
(1416, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:57:55'),
(1417, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:57:58'),
(1418, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:57:58'),
(1419, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:57:58'),
(1420, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:00'),
(1421, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:00'),
(1422, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:00'),
(1423, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:00'),
(1424, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:02'),
(1425, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:02'),
(1426, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:02'),
(1427, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:02'),
(1428, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:02'),
(1429, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:02'),
(1430, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:05'),
(1431, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:05'),
(1432, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:05'),
(1433, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:06'),
(1434, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:06'),
(1435, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:06'),
(1436, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:06'),
(1437, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:06'),
(1438, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:06'),
(1439, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:06'),
(1440, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:06'),
(1441, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:06'),
(1442, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:07'),
(1443, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:07'),
(1444, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:07'),
(1445, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:07'),
(1446, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:07'),
(1447, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:07'),
(1448, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:07'),
(1449, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:07'),
(1450, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:07'),
(1451, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:08'),
(1452, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:08'),
(1453, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:08'),
(1454, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:08'),
(1455, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:08'),
(1456, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:08'),
(1457, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:08'),
(1458, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:08'),
(1459, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:08'),
(1460, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:08'),
(1461, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:08'),
(1462, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:08'),
(1463, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:09'),
(1464, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:09'),
(1465, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:09'),
(1466, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:09'),
(1467, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:09'),
(1468, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:09'),
(1469, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:09'),
(1470, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:09'),
(1471, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:09'),
(1472, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:10'),
(1473, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:10'),
(1474, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:10'),
(1475, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:10'),
(1476, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:10'),
(1477, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:10'),
(1478, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:11'),
(1479, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:11'),
(1480, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:11'),
(1481, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:11'),
(1482, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:13'),
(1483, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:13'),
(1484, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:13'),
(1485, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:13'),
(1486, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:13'),
(1487, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:13'),
(1488, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:13'),
(1489, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:13'),
(1490, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:13'),
(1491, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:15'),
(1492, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:15'),
(1493, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:15'),
(1494, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:16'),
(1495, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:16'),
(1496, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:16'),
(1497, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:16'),
(1498, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:16'),
(1499, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:16'),
(1500, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:16'),
(1501, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:17'),
(1502, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:17'),
(1503, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:23'),
(1504, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:23'),
(1505, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:23'),
(1506, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:27'),
(1507, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:27'),
(1508, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:27'),
(1509, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:32'),
(1510, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:32'),
(1511, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:32'),
(1512, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:39'),
(1513, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:39'),
(1514, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:39'),
(1515, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:42'),
(1516, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:42'),
(1517, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:42'),
(1518, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:42'),
(1519, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=3 successfully', '2024-07-15 01:58:45'),
(1520, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:46'),
(1521, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:46'),
(1522, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:51'),
(1523, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:51'),
(1524, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:59'),
(1525, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:59'),
(1526, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=2 successfully', '2024-07-15 01:58:59'),
(1527, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 01:58:59'),
(1528, 1, '0:0:0:0:0:0:0:1', '/user/loginByAPIS', NULL, '80: Login by 2 success. Congratulation!', '2024-07-15 02:01:24'),
(1529, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:01:26'),
(1530, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:01:26'),
(1531, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:01:29'),
(1532, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:01:29'),
(1533, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:01:29'),
(1534, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:01:31'),
(1535, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:01:31'),
(1536, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:01:31'),
(1537, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:01:31'),
(1538, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:01:36'),
(1539, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:01:36'),
(1540, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:01:40'),
(1541, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:01:40'),
(1542, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:01:47'),
(1543, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:01:47'),
(1544, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:01:56'),
(1545, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:01:56'),
(1546, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:02:01'),
(1547, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:01'),
(1548, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:02:01'),
(1549, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:01'),
(1550, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:02:09'),
(1551, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:09'),
(1552, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:02:13'),
(1553, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:13'),
(1554, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:16'),
(1555, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:02:16'),
(1556, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:16'),
(1557, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:18'),
(1558, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:02:18'),
(1559, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:18'),
(1560, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:20'),
(1561, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:02:20'),
(1562, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:20'),
(1563, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:02:24'),
(1564, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:02:24'),
(1565, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:24'),
(1566, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=2 successfully', '2024-07-15 02:02:28'),
(1567, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:28'),
(1568, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:41'),
(1569, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:42'),
(1570, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:46'),
(1571, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:50'),
(1572, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:52'),
(1573, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:02:54'),
(1574, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:03:02'),
(1575, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:03:02'),
(1576, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:03:09'),
(1577, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:03:09'),
(1578, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:03:12'),
(1579, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:03:31'),
(1580, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:03:31'),
(1581, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:03:35'),
(1582, 1, '0:0:0:0:0:0:0:1', '/user/cart', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:03:39'),
(1583, 1, '0:0:0:0:0:0:0:1', '/user/cart.jsp', NULL, 'Get product with ID=1 successfully', '2024-07-15 02:03:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `ship_type` int(11) NOT NULL DEFAULT 1,
  `discount_id` int(11) DEFAULT NULL,
  `payment_id` int(11) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_payment` datetime DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT 1,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address_id`, `ship_type`, `discount_id`, `payment_id`, `date_created`, `date_payment`, `note`, `status_id`, `admin_id`) VALUES
(10, 82, 1, 1, 6, 1, '2024-07-13 22:22:06', '2024-07-23 22:22:07', NULL, 1, 81);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `order_price`) VALUES
(10, 1, 8, 80000),
(10, 108, 5, 52000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_status`
--

INSERT INTO `order_status` (`id`, `status_name`, `description`) VALUES
(1, 'Chờ Thanh Toán', NULL),
(2, 'Chờ vận chuyển', NULL),
(3, 'Chờ giao hàng', NULL),
(4, 'Chờ đánh giá', NULL),
(5, 'Đã huỷ', NULL),
(6, 'Trả hàng/ Hoàn tiền', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `remaining_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payment`
--

INSERT INTO `payment` (`id`, `name`, `description`, `remaining_time`) VALUES
(1, 'NFNFOINUFNFG', NULL, '2024-07-13 22:20:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `productName` longtext NOT NULL,
  `sale_percent` double DEFAULT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `purpose` text DEFAULT NULL,
  `contraindications` text DEFAULT NULL,
  `ingredients` text DEFAULT NULL,
  `dosage` text DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `warrantyPeriod` text DEFAULT NULL,
  `storageCondition` text DEFAULT NULL,
  `cate_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `productName`, `sale_percent`, `price`, `quantity`, `purpose`, `contraindications`, `ingredients`, `dosage`, `instructions`, `warrantyPeriod`, `storageCondition`, `cate_id`, `type_id`, `supplier_id`, `active`) VALUES
(1, ' Dipomax-J trị viêm da', NULL, 50000, 100, 'DIPROMAX-J là sản phẩm điều trị viêm da Tiết Bã Do Vi Khuẩn (Staphylococcus Pseudintermedius),  Nấm Men (Malassezia Pachydermatis) Và Nấm Ngoài Da (Dermatophytosis). các triệu chứng viêm da cấp trên chó mèo.', '– Không để thuốc dính vào mắt hoặc bôi lên vết thương hở.– Không dùng cho vật nuôi quá mẫn cảm với bất kỳ thành phần nào của thuốc.', 'Betamethasone Dipropionate, Gentamicin Sulfate.', 'Thoa 2 lầngày (sáng & tối) cho đến khi hết các', 'Liều lượng sử dụng tùy thuộc vào mức độ vùng da bị bệnh', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 10, 1, 1, 1),
(2, 'Vắc-xin vô hoạt Nisseiken ARBP ', NULL, 35000, 50, 'Vắc xin ARBP ME giúp phòng ngừa bệnh teo mũi truyền nhiễm ở heo (AR) do nhiễm trùng kết hợp giữa Bordetella bronchiseptica (Bb) và độc tố được Pasteurella multocida (Pm) sinh ra hoặc do Bb hoặc Pm.', 'Dùng cho chó, mèo qua đường miệng, có thể cho ăn trực tiếp hoặc trộn với thức ăn', 'Bordetella bronchiseptica, Pasteurella  multocida,', 'Tiêm 2 mũi', 'Tiêm bắp liều 2ml cho mỗi heo nái mang thai, mỗi lần cách nhau từ 1-2 tháng.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 1, 2, 1),
(3, 'Vắc-xin vô hoạt Nisseiken Swine ', NULL, 25000, 80, 'Vắc-xin vô hoạt kết hợp phòng Actinobacillus pleuropneumoniae (serotypes 1, 2 và 5, cùng các giả độc đố tái tổ hợp) và Mycoplasma hyopneumoniae (cùng chất bổ trợ)', 'Khi con vật biểu hiện một trong những vấn đề sức khỏe hoặc tình trạng thể chất sau đây, hãy xem xét cẩn thận liệu có nên tiêm phòng hay không', 'Actinobacillus pleuropneumoniae, Escherichia coli ', 'Tiêm 2 mũi', 'Tiêm bắp liều 2ml/con từ 3 tuần tuổi hoặc lớn hơn, 2 lần mỗi lần cách nhau 3 – 5 tuần', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 2, 1, 1),
(4, 'Vắc -xin vô hoạt Nisseiken Swine AP ', NULL, 45000, 60, ' Vắc -xin vô hoạt kiểm soát Actinobacillus pleuropneumoniae ở heo  (Serotype 1, 2 và 5, và các độc tố tái tổ hợp)', 'Khi con vật biểu hiện một trong những vấn đề sức khỏe hoặc tình trạng thể chất sau đây, hãy xem xét cẩn thận liệu có nên tiêm phòng hay không.', 'Actinobacillus pleuropneumoniae, Escherichia coli', '1 mlgày', 'Tiêm bắp cổ với liều 1ml/ heo liều đầu từ 35 ngày hoặc lớn hơn, liều thứ 2 được thực hiện sau 3- 5 tuần', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 2, 1, 1),
(5, 'Vắc xin vô hoạt PED+TGE ', NULL, 20000, 30, 'Vắc xin vô hoạt phòng bệnh Viêm dạ dày ruột truyền nhiễm (TGE) và Dịch tiêu chảy cấp (PED) ở lợn', 'Khi con vật biểu hiện một trong những vấn đề sức khỏe hoặc tình trạng thể chất', 'Transmissible Gastroenteritis, Porcine Epidemic Di', '1 mũigày', 'Tiêm vào điểm trũng ở giữa gốc đuôi và hậu môn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 2, 1, 1),
(6, 'Dynazide 20% Injection ', NULL, 15000, 120, 'Dynazide 20% Injection – kháng sinh điều trị nhiễm khuẩn đường tiêu hóa trên gia súc, gia cầm', 'Không nên dùng các loại thuốc khác như monensin, narasin hoặc salinomycin trong khi điều trị bằng thuốc này.', 'Tiamulin hydro fumarate, Tiamulin ', '1mlgày', 'Tiêm bắp.• Bệnh đường ruột (viêm hồi tràng,hồng lỵ, viêm khớp truyền nhiễm): 1 ml / 20 kg thể trọng, bằng 1 hoặc 2 lần tiêm mỗi ngày.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 3, 1, 1),
(7, 'Dynazide 10%', NULL, 30000, 70, 'Dynazide 10% – kháng sinh Tiamulin 10% điều trị bệnh hồng lỵ', 'Không có chống chỉ định cụ thể', 'Tiamulin fumarate 100 g', '1 viêngày', 'Trộn thức ăn. Liều dùng như sau• Điều trị bệnh lỵ trên heo: trộn 1.2 kg DYNAZIDE 10% / 1 tấn thức ăn, dùng trong 5-10 ngày• Điều trị bệnh viêm phổi trên động vật: trộn 2 kg DYNAZIDE 10%/ 1 tấn thức ăn, dùng trong 10 ngày', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 3, 3, 1),
(8, 'Mectinvet Plus', NULL, 40000, 40, 'Mectinvet Plus – trị nội, ngoại ký sinh trên trâu, bò, heo và cừu', 'Không tiêm bắp và tiêm tĩnh mạchKhông sử dụng cho bò sữa giai đoạn không tiết sữa, trong vòng 60 ngày sau khi sinh.Không sử dụng cho bò đang sản xuất sữa thương phẩmKhông sử dụng cho những con vật không được chỉ định, trong trường hợp chó có thể bị chế', 'Ivermectin 10 mgClorsulon 100 mg', '2 viêngày', 'Đường dùng: tiêm dưới da', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 14, 3, 4, 1),
(9, 'Danoguard', NULL, 18000, 50, 'Danoguard – kháng sinh tiêm trị các bệnh hô hấp và đường ruột', 'Không sử dụng cho ngựa chuyên dùng để nuôi lấy thịt', 'Danofloxacin mesylate, Danofloxacin', '100ggày', 'Tiêm bắp hoặc tiêm tĩnh mạch.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 14, 4, 5, 1),
(10, 'Pharmatilin 25%', NULL, 28000, 60, 'Pharmatilin 25%- kháng sinh điều trị bệnh hồng lỵ trên heo', 'Không sử dụng cho động vật có tiền sử nhạy cảm với Tiamulin.• Heo đang điều trị bằng Tiamulin không nên cho ăn thức ăn có chứa polyether ionophores.• Không nên dùng Tiamulin trong vòng 7 ngày trước và sau khi sử dụng polyether ionophores.', 'Tiamulin hydrogen fumarate', '1 viêngày', 'Trộn thức ăn 150-200g Tiamulin hydrogen fumarate/ tấn thức ăn (150-200ppm)', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 4, 2, 1),
(11, 'Colicure 40%', NULL, 52000, 60, 'Colicure 40% – kháng sinh điều trị bệnh đường ruột', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Colistin sulfate, Colistin', '10 mlgày', 'Trộn vào thức ăn với liều 160ppm (hay 400g COLICURE 40% cho 1 tấn thức ăn) dùng liên tục trong 5-10 ngày ( 100.000 IU / kg thể trọng) .', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 4, 1, 1),
(12, 'Colicure 40%', NULL, 62000, 60, 'Colicure 40% – kháng sinh điều trị bệnh đường ruột', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Colistin sulfate, Colistin', '10 mlgày', 'Trộn vào thức ăn với liều 160ppm (hay 400g COLICURE 40% cho 1 tấn thức ăn) dùng liên tục trong 5-10 ngày ( 100.000 IU / kg thể trọng) .', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 4, 2, 1),
(13, 'Nutrimax-plus', NULL, 47000, 60, 'Nutrimax-plus là gel dinh dưỡng bổ sung vitamin, khoáng dành cho chó mèo dễ tiêu hóa giúp hỗ trợ sự phát triển, vận động, hồi phục sức khỏe, ngăn ngừa búi lông cho mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Vitamin A, D3, E, B1, B2, B6, B12, B3, Calcium pan', '10 mlgày', 'Dùng cho chó, mèo qua đường miệng, có thể cho ăn trực tiếp hoặc trộn với thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 5, 3, 1),
(14, 'Nokodermaseb', NULL, 59000, 60, 'Nokodermaseb là dung dịch kháng khuẩn và điều trị nấm dạng xịt chứa Chlorhexidine, Miconazole, giúp thú cưng khỏi các triệu chứng khó chịu, đau đớn do nấm da', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Miconazole Nitrate, Chlorhexidine gluconate', ' 2 – 3 lần/ ngày', 'Sau khi vệ sinh, làm sạch da, xịt thuốc trực tiếp lên vùng da bị nhiễm nấm', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 5, 4, 1),
(15, 'Itragol dung dich uống itraconazole', NULL, 66000, 60, 'Giúp điều trị hiệu quả bệnh nấm da ở mèo do Microsporum canis tác nhân gây bệnh phổ biến và chủ yếu nhất ở mèo, có thể lây lan cho cả chó và người cùng các bệnh nhiễm trùng liên quan đến nấm men Malassezia gây viêm da và nhiễm trùng.', 'Không sử dụng itraconazole cho mèo bị suy giảm chức năng gan thận, mèo mẹ đang mang thai và đang cho con bú.', 'Itraconazole ', '5 mg itraconazole/kg thể trọng', ' Dùng một lần mỗi ngày vào các tuần xen kẽ cho 3 đợt điều trị.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 15, 5, 5, 1),
(16, 'Selight 120 (Selamectin 12%) ', NULL, 85000, 60, 'Selight 120 là thuốc nhỏ gáy trị nội ngoại ký sinh, với thành phần chính là Selamectin, ngoài phòng trị ve, bọ chét, rận tai, thuốc nhỏ gáy trị ve rận Selight còn phòng và trị được giun tim cho chó mèo', 'không dùng cho chó mèo dưới 6 tuần tuổi', 'selamectin', '0.25ml', 'Dùng tay vạch lớp lông dưới cổ thú, giữa 2 bả vai để bộc lộ vùng da. Nhỏ trực tiếp lên da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 15, 5, 6, 1),
(17, 'Selight 60 (Selamectin 6%)', NULL, 90000, 60, 'Selight 60 là thuốc nhỏ gáy trị nội ngoại ký sinh, với thành phần chính là Selamectin, ngoài phòng trị ve, bọ chét, rận tai, thuốc nhỏ gáy trị ve rận Selight còn phòng và trị được giun tim cho chó mèo', 'không dùng cho chó mèo dưới 6 tuần tuổi', 'selamectin', '0.25ml', 'Dùng tay vạch lớp lông dưới cổ thú, giữa 2 bả vai để bộc lộ vùng da. Nhỏ trực tiếp lên da. ', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 15, 1, 7, 1),
(18, 'Early 3Cs', NULL, 42000, 60, 'Early 3Cs là một giải pháp bù nước hiệu quả cho gà con.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Vitamin E: 0.2mgProbiotic, acid amin, tá dược vừa', '100g ', 'Trộn đều trong 5-6 phút. Khi hạt Early3Cs được hoàn nguyên, sản phẩm lúc này đã sẵn dùng cho gà con trong khay gà/ hộp vận chuyển gà hoặc ở bên ngoài', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 1, 5, 1),
(19, 'Nutrimax-plus', NULL, 45000, 60, 'Nutrimax-plus là gel dinh dưỡng bổ sung vitamin, khoáng dành cho chó mèo dễ tiêu hóa giúp hỗ trợ sự phát triển, vận động, hồi phục sức khỏe, ngăn ngừa búi lông cho mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Vitamin A, D3, E, B1, B2, B6, B12, B3, Calcium pan', '10 mlgày', 'Dùng cho chó, mèo qua đường miệng, có thể cho ăn trực tiếp hoặc trộn với thức ăn.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 1, 8, 1),
(20, 'Nokodermaseb', NULL, 32000, 60, 'Nokodermaseb là dung dịch kháng khuẩn và điều trị nấm dạng xịt chứa Chlorhexidine, Miconazole, giúp thú cưng khỏi các triệu chứng khó chịu, đau đớn do nấm da', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Miconazole Nitrate, Chlorhexidine gluconate', ' 2 – 3 lần/ ngày', 'Dùng cho chó, mèo qua đường miệng, có thể cho ăn trực tiếp hoặc trộn với thức ăn.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 1, 9, 1),
(21, 'Cát vệ sinh Captain Meow 5 lít', NULL, 72000, 60, 'dùng để cho mèo đi vệ sinh', 'Không có', 'Bentonite ', 'Đồ lượng vừa đủ vào khay vệ sinh với độ dày tầm 2', 'Khi tiếp xúc với chất tải rắn và lòng của vật nuôi, cát sẽ đóng thành từng cục nhỏ. Sử dụng xẻng xúc cát ra khỏi khay. Không cần đổ bỏ phần cát còn lại mà làm đầy bằng cách đó thêm cát với độ dày như đã khuyến cáo.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 5, 10, 1),
(22, 'Thức ăn ướt Regalos cho mèo', NULL, 37000, 60, 'pate cao cấp được tuyển chọn nguyên liệu 100% cá ngừ trắng thơm ngon nhất theo tiêu chuẩn dùng cho người giúp cung cấp dưỡng chất thiết yếu, hỗ trợ cho quá trình phát triển của mèo cưng', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cá ngừ, cá hồi, ức gà, cá bào Katsuobushi, thanh c', '2-3g', 'Cho mèo ăn trực tiếp, liều lượng tùy thuộc vào giống mèo, tuổi, cân nặng & mức độ hoạt động.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 5, 5, 1),
(23, 'Jinny Stick – Snack cho mèo', NULL, 48000, 60, 'Thích hợp cho ăn như bánh ăn nhẹ hoặc phần thưởng cho thú cưng để thể hiện tình yêu của bạn với vật nuôi hay trong quá trình huấn luyện mèo. ', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cá ngừ, cá hồi, ức gà, cá bào Katsuobushi, thanh c', '1 góigày', ' Ăn ngay sau khi mở', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 5, 1, 1),
(24, 'Nước hoa cho chó mèo Cupid Perfume', NULL, 90000, 60, 'Cupid Perfume là dòng nước hoa diệu kì dành cho chó mèo trong gia đình bạn giúp dưỡng lông, khử mùi, tạo hương thơm trên mình thú cưng nhanh với mùi hương được lưu giữ lâu nhẹ nhàng.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Propylene glycol, Tea extract oil 0.2%', '0.25ml', 'Xịt trực tiếp', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 5, 5, 1),
(25, 'Pet Ear Cleaner', NULL, 62000, 60, 'làm sạch tai cho chó mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Propylene glycol, Tea extract oil 0.2%', '2-3 lần -tuần', 'Lắc kỹ chai thuốc trước khi sử dụng. Nhỏ vào tai, sau đó lấy tay xoa nhẹ phần gốc tai, lau phần trên vành tai và các phần khác bằng bông gòn thấm. Lấy bông ngoáy tai hoặc khăn mềm cho nhẹ nhàng vào tai thú cưng lấy các chất bẩn ra.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 5, 2, 1),
(26, 'Nutri-Forte Gel', NULL, 82000, 60, 'Nutri-Forte gel là thức ăn rất hữu dụng cho thú cưng trong các trường hợp cần cung cấp năng lượng và các chất dinh dưỡng cần thiết trong trường hợp suy dinh dưỡng, biếng ăn hoặc cần chăm sóc đặc biệt', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Vitamin A, Vitamin D3, Vitamin E, Thiamine (B1), R', '1 thìa cà phê mỗi 4-6 giờ.', 'Cung cấp qua đường miệng.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 5, 3, 1),
(27, 'Metricyclin – viên đặt tử cung chlortetracyclin', NULL, 49000, 60, 'Dùng để phòng bệnh viêm nội mạc tử cung sau khi sinh và điều trị các trường hợp nhiễm trùng tử cung.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 5, 5, 1),
(28, 'Advance Sulfa Thoxine –', NULL, 57000, 60, 'Đặc trị cầu trùng, ký sinh trùng đường máu, đầu đen', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 5, 4, 1),
(29, 'Advance New Max', NULL, 55000, 60, 'môi trường pha tinh heo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 2, 5, 1),
(30, 'Advance Pro-lim', NULL, 62000, 60, 'Thức ăn bổ sung, hỗ trợ bổ sung khoáng chất cho gia súc.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 7, 3, 6, 1),
(31, 'Mectinvet Injection', NULL, 52000, 60, 'trị nội ngoại ký sinh', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 3, 7, 1),
(32, 'Vắc xin nhược độc phòng bệnh Dịch tả heo ', NULL, 82000, 60, 'phòng bệnh Dịch tả heo (Sản xuất trên tế bào)', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 2, 8, 1),
(33, 'Vắc xin vô hoạt', NULL, 72000, 60, 'phòng bệnh tai xanh chủng NVDC-JXA1', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 6, 9, 1),
(34, 'Vắc xin vô hoạt', NULL, 82000, 60, 'phòng bệnh Newcastle (chủng Lasota) và Cúm gia cầm (phân typ H9, chủng SS)', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 4, 5, 1),
(35, 'TUKONO', NULL, 34000, 60, 'Tukono giúp điều trị viêm tai ngoài cấp tính hoặc mãn tính ở thủ cưng do vi khuẩn và nấm gây ra, đặc biệt là Maracetia pachydermatis', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 2, 5, 10, 1),
(36, 'PROVITA', NULL, 45000, 60, 'bổ sung vitamin khoáng, acid amin cho vật nuôi khỏe mạnh', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 5, 1, 1),
(37, 'SUPER RED SKIN (NANO)', NULL, 52000, 60, 'giúp gà đá săn da, giảm bầm, phòng nấm', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 4, 2, 1),
(38, 'Advance Keto – Ketoconazole', NULL, 60000, 60, 'giúp trị nấm da cho chó mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 4, 3, 1),
(39, 'CP – CIN 20 hormone', NULL, 70000, 60, 'Kích thích phát triển', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 11, 2, 4, 1),
(40, 'I-Pett Doggy Gel', NULL, 72000, 60, 'cung cấp Omega 3 vi khoáng thiết yếu cho chó', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 5, 5, 1),
(41, 'I-Pett Kitty Gel', NULL, 98000, 60, 'cung cấp Omega 3 vi khoáng thiết yếu cho mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 5, 6, 1),
(42, 'I-PETT LIPOTIN', NULL, 67000, 60, 'viên chăm sóc chuyên sâu da lông dành cho chó', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 1, 7, 1),
(43, 'Nutrical', NULL, 42000, 60, 'viên bổ sung Canxi và khoáng cho chó tầm vóc lớn', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 1, 8, 1),
(44, 'Dotrol', NULL, 56000, 60, 'Dung dịch điều trị giun cho chó dưới 1 tuổi', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 14, 1, 9, 1),
(45, 'Catrol', NULL, 47000, 60, 'Dung dịch điều trị giun tròn trên mèo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 14, 5, 10, 1),
(46, 'Lac-premix', NULL, 49000, 60, 'Thức Ăn Bổ Sung Vitamin, Khoáng Và Methionine Cho Heo Và Gia Cầm', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 2, 5, 1),
(47, 'Yemune G7 ', NULL, 45000, 60, 'phòng bệnh Newcastle (chủng A VII)', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 2, 1, 1),
(48, 'AVI Pox', NULL, 47000, 60, 'Vắc-xin phòng bệnh đậu gà, dòng Cutter', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '10 mlgày', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 4, 2, 1),
(49, 'THUỐC THÚ Y SUPERCID', NULL, 46000, 60, 'Dùng sát trùng chuồng trại, dụng cụ chăn nuôi, phương tiện vận chuyển, hố chôn, môitrường, khu vực chế biến thịt, sữa… để phòng và xử lý các dịch bệnh do vi khuẩn, virus,nấm mốc, bào tử gây ra trên gia súc, gia cầm.', 'Không dùng đồng thời với xà phòng.', 'Glutaraldehyde 250gFormaldehyd 185gAlkyl -dimeth', ' 1 lít SUPERCID với 250-300 lít nước sạch', ' Khử trùng không khí: pha 1 lít SUPERCID với 250-300 lít nước sạch, phun sương vớitỷ lệ 1 lít dung dịch đã pha cho 150 m3 không khí.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 3, 3, 1),
(50, 'THUỐC THÚ Y VIATOX', NULL, 48000, 60, '– Diệt ruồi, muỗi, nhặng, kiến, gián, bọ chét, cái ghẻ trong trại chăn nuôi gia súc, gia cầm, gia đình, bãi rác, khu chôn xác động vật chết.– Phòng, trị: Ve bò, rận, ghẻ, bọ chét, bét, bọ chó, mòng trên trâu, bò, dê, cừu, lợn, mạt gà ở gia cầm.', 'Không ăn uống, hút thuốc khi sử dụng chế phẩm.* Không phun trên ao cá, bể cá, nơi đựng thức ăn, nước sinh hoạt, không đổ chế phẩm thừa xuống ao, hồ, sông, suối…', 'Deltamethrin, Dung môi vừa đủ', '1 lít ', ' Chuồng trống: phun đều lên tường, trần, sàn, cột, máng ăn, uống, không khí…', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 4, 5, 1),
(51, 'THỨC ĂN BỔ SUNG BIOSUBTYL CHÓ MÈO', NULL, 49000, 60, '– BIOSUBTYL được bào chế theo công nghệ bao vi nang, siêu tan, cung cấp bổ sung các lợi khuẩn có ích, vitamin và điện giải giúp cân bằng hệ vi sinh đường ruột.– Tăng cường hệ miễn dịch, hỗ trợ và cải thiện rối loạn tiêu hoá, giúp phòng và trị tiêu chảy ', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Bacillus subtilis, Saccharomyces cerevisiae, Lipas', 'Chó con, mèo (nhỏ hơn 6 tháng tuổi):…………………….1 gói', 'Trộn thường xuyên vào khẩu phần thức ăn hoặc pha nước uống.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 7, 5, 6, 1),
(52, 'SACCHAROMYCES CEREVISIAE MEN SỐNG CHỊU KHÁNG SINH', NULL, 41000, 60, '– Nâng cao hiệu quả sử dụng thức ăn giúp vật nuôi hấp thu tối đa các chất dinh dưỡng, tăng trọng nhanh, giảm chi phí thức ăn.– Giúp cân bằng hệ vi sinh đường ruột cho gia súc, gia cầm.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Saccharomyces cerevisiae', '– Heo con:1,5-2kg/tấn TĂ.– Heo', 'Để đảm bảo sản phẩm trộn đều trong thức ăn, nên trộn sản phẩm (Đã được tính theo liều quy định) với lượng thức ăn nhỏ rồi tăng dần lên.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 2, 7, 1),
(53, 'THUỐC THÚ Y KHÁNG THỂ HEO CON PREVENTAL', NULL, 42000, 60, '– Bổ sung kháng thể IgG, L-Carnitine trong sữa đầu tăng cường hệ miễn dich, chống lại các loại virus và vi khuẩn xâm nhập cơ thể vật nuôi.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Beta glucan, Mannan oligosaccharides, Dung môi vđ ', 'Mỗi lần xịt tương ứng 1ml.', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 10, 2, 8, 1),
(54, 'THUỐC THÚ Y ACEFA S LA', NULL, 40000, 60, 'Đặc trị các chứng viêm và nhiễm trùng trên trâu, bò, dê, cừu, heo', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cefalexin, Dung môi (Labrac PG,…)', '20ml ', 'Tiêm sau khi ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 3, 9, 1),
(55, 'VIABIO MEN SỐNG GISOL ', NULL, 42000, 60, 'Bổ sung các lợi khuẩn dạng bào tử. Bào tử có thể sống sót ở nhiệt độ môi trường cao, khi di chuyển qua môi trường pH acid của dịch vị dạ dày – nơi phần lớn các vi khuẩn ở dạng thường sẽ bị tiêu diệt. Chống chịu tốt với các kháng sinh, có tác dụng vượt trộ', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Bacillus, Độ ẩm, Cát sạn, Tá dược ', '100gr/300kgTTgày ', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 6, 10, 1),
(56, 'THUỐC DIỆT RUỒI', NULL, 47000, 60, 'THU HÚT MẠNH – DIỆT RUỒI NHANHHIỆU LỰC TỨC THÌ – TÁC DỤNG KÉO DÀI', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Thiamethoxam, Tá dược vđ', '15g thuốc với 50g đường cát', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 6, 5, 1),
(57, 'VIABIO MEN SỐNG GISOL ', NULL, 40000, 60, 'Bổ sung các lợi khuẩn dạng bào tử. Bào tử có thể sống sót ở nhiệt độ môi trường cao, khi di chuyển qua môi trường pH acid của dịch vị dạ dày – nơi phần lớn các vi khuẩn ở dạng thường sẽ bị tiêu diệt. Chống chịu tốt với các kháng sinh, có tác dụng vượt trộ', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Bacillus, Độ ẩm, Cát sạn, Tá dược vđ', '100gr/300kgTTgày', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 13, 6, 7, 1),
(58, 'VIABIO.KN01 MEN KHỬ MÙI NỀN CHUỒNG', NULL, 72000, 60, 'Hỗ trợ đệm lót nhằm: không phải dọn phân, rửa chuồng hàng ngày (nuôi lợn), không phải định kỳ thay đệm lót (nuôi gà) trong suốt quá trình nuôi, hút ẩm, khử mùi hôi trong tiểu khí hậu trang trại chăn nuôi nhưng vẫn đảm bảo chuồng nuôi hầu như không còn mùi', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Bacillus, Độ ẩm, Cát sạn, Tá dược vđ, Saccharomyce', '1kg chế phẩm trộn cùng 5-7 kg bột ngô hoặc cám gạo', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 6, 5, 1),
(59, 'THUỐC THÚ Y AZ.FASCIOLIS', NULL, 78000, 60, 'Tẩy sạch sán lá gan (sống trong ống mật), sán lá dạ cỏ, sán dây, các loại giun tròn, cả dạng ấu trùng và trưởng thành ký sinh ở trâu, bò, dê, cừu.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Triclabendazole, Tá dược vđ', 'Trâu, bò: 1 viên/60kgTTDê, cừu:1/2 viên/25kgTT', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 3, 5, 1),
(60, 'THUỐC THÚ Y VIA', NULL, 42000, 60, 'Thuốc có tác dụng điều trị các bệnh nhiễm trùng nhạy cảm với Ampicillin và Erthromycin. Đặc hiệu với bệnh gà rù, gà toi, xù lông, sã cánh, mào thâm, chướng diều, khô chân, ăn không tiêu. Gia cầm tiêu chảy phân xanh, phân trắng, nghẹo đầu, nghẹo cổ, gục đầ', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Ampicillin trihydrate, Erythromycin thiocyanate', '10g/20kgTT hoặc 2g/lít nước uống', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 3, 8, 1),
(61, 'THUỐC THÚ Y CÚM GIA CẦM VIA', NULL, 49000, 60, 'Đặc trị nhiễm trùng đường tiêu hoá, hô hấp, sinh dục trên gia cầm như: tiêu chảy phân xanh, phân trắng bết hậu môn, hở rốn, viêm rốn, lòng đỏ chậm tiêu, CRD (khò khè) do E.coli, Salmonella gây ra.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Ampicillin trihydrate, Erythromycin thiocyanate', '1g/kgTTgày hoặc pha 2 thìa cafe/lít nước', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 4, 3, 1),
(62, 'THUỐC THÚ Y SANFO.GENTADOX', NULL, 67000, 60, 'Điều trị các bệnh nhiễm trùng do các chủng vi khuẩn nhạy cảm với Gentamicin và Doxycycline:', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Doxycycline hyclate, Gentamicin sulphate, ', '1g/5kgTTgày', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 2, 6, 1),
(63, 'THUỐC THÚ Y AZ-MOXY 50S', NULL, 56000, 60, 'Đặc trị nhiễm khuẩn đường tiêu hoá, hô hấp, sinh dục gây ra bởi các vi khuẩn nhạy cảm với Amoxicillin:', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Amoxycillin, Tá dược ', '50g/200 lít nước', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 3, 6, 1),
(64, 'THUỐC THÚ Y AMPI-COLI (GOLD)', NULL, 56000, 60, 'Đặc trị các trường hợp nhiễm khuẩn do vi khuẩn nhạy cảm với Ampicillin và Colistin trên gia cầm như: Bệnh tiêu chảy do E.coli, Salmonella gây tiêu chảy phân xanh, phân trắng nhớt, bại huyết kéo màng trắng trên bao tim và gan; viêm túi lòng đỏ và hở rốn, b', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Ampicillin trihydrat, Colistin sulfate, Coloring a', '100g/400-600kgTTgày.', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 4, 5, 1),
(65, 'THUỐC THÚ Y VIA.DOXY-200', NULL, 42000, 60, 'Đặc trị nhiễm khuẩn đường hô hấp, tiêu hoá do vi khuẩn nhạy cảm với Doxycycline:', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Doxycycline HCl, Tá dược vđ', '1g/8-10kgTTgày', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 3, 5, 1),
(66, 'THUỐC THÚ Y VIATOX 300', NULL, 82000, 60, 'Diệt trừ các loại côn trùng gây hại như muỗi, ruồi, kiến, gián, ve, chấy, rận, bọ chét …', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Cephalexin, Amikacin', '1 lít', 'Phun toàn bộ chuồng trại', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 3, 5, 1),
(67, 'THUỐC THÚ Y SANFO.TIAMULIN', NULL, 52000, 60, 'Trị các bệnh hô hấp, tiêu hoá do vi khuẩn nhạy cảm với Tiamulin gây bệnh trên heo và gia cầm.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Tiamulin hydrogen fumarate', '1kg/10-12 tấn TTgày ', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 2, 5, 1),
(68, 'THUỐC THÚ Y MOXYCOLI NANO', NULL, 22000, 60, 'Đặc trị nhiễm trùng đường tiêu hoá, hô hấp trên gia cầm và heo:', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Amoxicillin, Colistin sulfate', '100g/200 lít nước ', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 2, 5, 1),
(69, 'THỨC ĂN BỔ SUNG GLUCO-K.C', NULL, 62000, 60, 'Gluco -K.C giúp giải độc, giải nhiệt, làm mát cơ thể khi bị sốt cao, cầm máu, phòng báng nước cho gà hữu hiệu.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Vitamin C, Vitamin K3, Glucose.', '200g pha với 20 lít nước uống.', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 3, 5, 1),
(70, 'THUỐC THÚ Y DOXYCOLI NANO', NULL, 92000, 60, 'Gia cầm: Đặc trị CRD – khò khè, CRD ghép ORT, CRD ghép E.coli tiêu chảy phân xanh, phân trắng Coryza, bạch lỵ, thương hàn, tụ huyết trùng.Heo: Đặc trị bệnh viêm phổi do Mycoplasma gây ho khan, ho kéo dài, viêm phổi dính sườn, tụ huyết trùng, lepto, hồng', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Doxycycline hyclate, Colistin sulfate', '1kg/30-35 tấnTTgày', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 4, 5, 1),
(71, 'THUỐC THÚ Y COLISTIN 10% PREMIX', NULL, 82000, 60, 'Đặc trị các bệnh nhiễm khuẩn tiêu hoá như E.coli, viêm ruột, tiêu chảy phân xanh, phân trắng, phân có bọt, thương hàn, bạch lỵ, viêm rốn gà con.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Colistin sulphate, tá dược vđ', '1kg/8-10 tấnTT ', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 2, 5, 1),
(72, 'MEN SỐNG BIOSUBTYL', NULL, 72000, 60, 'BIOSUBTYL là hỗn hợp men sống chịu kháng sinh và kháng acid; bổ sung dạng thức ăn cho gia súc, gia cầm.', 'Không dùng cho động vật quá mẫn cảm với bất cứ thành phần nào của thuốc.', 'Lactobacillus aicdophiius, Bacillus subtilis, Sacc', '1g/10kgTT', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 3, 5, 1),
(73, 'Vắc-xin phòng bệnh đậu gà', NULL, 50000, 100, 'AVI Pox giúp tạo miễn dịch chủ động của gà chống lại bệnh đậu gà.', 'Được dùng để chủng ngừa lần đầu hoặc tái chủng cho gà thịt, hậu bị và gà hướng trứng.', 'Trong 1 liều vắc-xin chứa: Virus dòng Cutter gây bệnh Đậu gà ở dạng nhược độc, đông khô.', '1 mũigày', 'Gà nên được chủng ngừa từ 4 – 16 tuần tuổi.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 8, 4, 1, 1),
(74, 'Vắc-xin bất hạt phòng bệnh dịch tả gà', NULL, 30000, 50, 'Được khuyến cáo sử dụng cho đàn gà giúp phòng bệnh Newcastle (dịch tả gà).', 'Không dùng cho gà con', 'Trong 1 liều vắc-xin chứa: Virus dòng Lasota gây bệnh Newcastle, chất bổ trợ là nhũ dầu.', '2 mũigày', 'Tiêm dưới da cổ, hoặc tiêm cơ (cơ ức hoặc đùi), liều 0,5ml/ gà.', '12 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ 2℃～8℃.', 8, 4, 2, 1),
(75, 'Vắc-xin bất phòng bệnh dịch tả gà', NULL, 25000, 70, 'Vắc-xin bất hoạt được khuyến cáo sử dụng cho đàn gà giống và gà đẻ trước đó đã có miễn dịch phòng bệnh Newcastle (ND) và Gumboro từ vắc-xin sống nhược độc.', 'Không nên sử dụng cho gà đang mang thai.', 'Trong 1 liều vắc-xin chứa: Tổ hợp virus dòng Lasota gây bệnh Newcastle,và virus dòng GP gây bệnh Viêm túi Bursal (Gumboro), chất bổ trợ là nhũ dầu.', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 8, 4, 3, 1),
(76, 'Vắc-xin phòng bệnh viêm phế quản', NULL, 35000, 60, 'Trị bệnh viêm phế quản ở gà.', 'Không nên sử dụng cho gà đang mang thai.', 'Trong 1 liều vắc-xin chứa: Tổ hợp virus dòng Lasota gây bệnh Newcastle, virus dòng Massachussetts gây bệnh Viêm Phế quản truyền nhiễm', '2 mũigày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ 2℃～8℃', 8, 4, 4, 1),
(77, 'Vắc-xin phòng IB', NULL, 58000, 90, 'AVI ND Lasota + IB giúp tạo miễn dịch chủ động của gà chống lại bệnh Viêm Phế quản Truyền nhiễm và Newcastle.', 'Không nên dùng cho gà đẻ trứng', 'Trong 1 liều vắc-xin chứa: Virus dòng Massachusetts B48 gây bệnh Viêm Phế quản truyền nhiễm và dòng LaSota gây bệnh Newcastle ở dạng nhược độc, đông khô.', '5mlgày', 'Sử dụng liên tục khi gà có bệnh.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 8, 4, 1, 1),
(78, 'Lasota+IB Vắc-xin phòng IB dòng Massachusetts', NULL, 18000, 90, 'AVI ND Lasota + IB giúp tạo miễn dịch chủ động của gà chống lại bệnh Viêm Phế quản Truyền nhiễm và Newcastle.', 'Không nên dùng cho gà đẻ trứng', 'Trong 1 liều vắc-xin chứa: Virus dòng Massachusetts B48 gây bệnh Viêm Phế quản truyền nhiễm và dòng LaSota gây bệnh Newcastle ở dạng nhược độc, đông khô.', '5mlgày', 'Sử dụng liên tục khi gà có bệnh.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 8, 4, 1, 1),
(79, 'Vắc-xin phòng bệnh Newcastle', NULL, 18000, 90, 'AVI ND Lasota giúp tạo miễn dịch chủ động của gà chống lại bệnh Newcastle.', 'Không nên dùng cho gà đẻ trứng', 'Trong 1 liều vắc-xin chứa: Virus dòng Lasota gây bệnh Newcastle, ở dạng nhược độc, đông khô nồng độ tối thiểu 5.5 log10 EID50/ liều.', '5mlgày', 'Sử dụng liên tục khi gà có bệnh.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ 2℃～8℃', 8, 4, 1, 1),
(80, 'AVI IBD Plus Vắc-xin phòng bệnh Gumboro', NULL, 32000, 70, ' AVI IBD Plus giúp tạo miễn dịch chủ động của gà chống lại bệnh Gumboro do virus độc lực gây ra', 'Nên cho đàn gà nhịn khát trong vòng 60-90 phút trước khi uống vắc xin', 'Trong 1 liều vắc-xin chứa: Virus dòng Winterfield 2512 G-61 gây viêm túi bursa, ở dạng nhược độc, đông khô nồng độ tối thiểu 2.0 log10 EID50/ liều', '2 mlgày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 8, 4, 3, 1),
(81, 'Vắc-xin phòng bệnh Gumboro dòng LIBDV', NULL, 28000, 80, 'AVI IBD Inter  giúp tạo miễn dịch chủ động của gà chống lại bệnh Gumboro.', 'Không dùng cho gà đẻ trứng', 'Trong 1 liều vắc-xin chứa: Virus dòng LIBDV gây viêm túi bursa, ở dạng nhược độc', '1 liềugày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 8, 4, 4, 1),
(82, 'Vắc-xin phòng bệnh IB H120', NULL, 20000, 95, 'AVI IB H120 giúp tạo miễn dịch chủ động của gà chống lại bệnh Viêm Phế quản Truyền nhiễm.', 'Được dùng để chủng ngừa lần đầu hoặc tái chủng cho gà thịt, hậu bị và gà đẻ. ', 'Trong 1 liều vắc-xin chứa: Virus dòng Massachusetts H120 gây bệnh Viêm Phế quản Truyền nhiễm, ở dạng nhược độc', '1 viêngày', 'Sử dụng liên tục trong giai đoạn nuôi gà con.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 8, 4, 8, 1),
(83, 'Vắc-xin phòng sổ mũi truyền nhiễm trên gà', NULL, 26000, 65, 'Giảm triệu chứng sổ mũi ở gà.', 'Không nên sử dụng cho gà đang mang thai.', 'Trong 1 liều vắc-xin chứa: tổ hợp 3 chủng huyết thanh A, B, C của vi khuẩn  gây bệnh Sổ mũi truyền nhiễm (bệnh Coryza), đồng nhất với chất bổ trợ là nhôm hydroxit và được bảo quản bởi merthiolate.', '1 mlgày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 8, 4, 2, 1),
(84, 'Vắc xin vô hoạt phòng bệnh Cúm gia cầm', NULL, 32000, 70, 'Ngăn chặn sự phát triển của virus cúm gia cầm', 'Chỉ sử dụng vắc xin trong ngày sau khi đã mở nắp chai.', 'Vắc xin chứa vi rút cúm gia cầm phân typ H9, chủng A/Chicken/Guangdong/SS/94 (H9N2) đã được vô hoạt. Hàm lượng vi rút trước khi vô hoạt ≥ 5×107.0 EID50/ml.', '2 mlgày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ 2℃～8℃.', 8, 4, 3, 1),
(85, 'Hỗn hợp dung dịch các axit', NULL, 45000, 90, 'Pro-Acid là sản phẩm được tạo thành tự sự kết hợp của nhiều loại axit hữu cơ với công nghệ đệm được cấp bằng sáng chế.', 'Sau khi mở, phải sử dụng hết sản phẩm càng sớm càng tốt.', 'A-xít Citric, A-xít Lactic , A-xít formic , A-xít Acetic , A-xít Propionic chất mang: nước tinh khiết', 'Chai 500ml', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nơi khô thoáng, tránh ánh sáng mặt trời', 4, 6, 3, 1),
(86, 'Thuốc sát trùng Nano Klea Rx', NULL, 28000, 80, 'Nano Klea Rx có chức năng khử mùi, phân tử nano bạc giúp cải thiện vết thương bề mặt, không gây độc cho thú cưng, thành phần sản phẩm thân thiện với môi trường.', 'Không kích thích', ' Nano Bạc', 'Xịt trực tiếp', 'Xịt trực tiếp lên da, vết thương, khu vực cần điều trị 2-3 lầngày.', '20 tháng kể từ ngày sản xuất', 'Bảo quản nơi thoáng mát, dưới 30oC', 14, 1, 8, 1),
(87, 'Thuốc kháng viêm vịt', NULL, 20000, 95, 'Điều trị viêm, giảm xuất huyết, chống phù nề sau phẫu thuật, tan máu bầm do chấn thương, áp xe.', 'Thú quá mẫn với các thành phần của thuốc.', 'Alpha-chymotrypsin', '1 viêngày', 'Pha vào nước uống hoặc trộn vào thức ăn.', '24 tháng kể từ ngày sản xuất', 'Nơi khô ráo, thoáng mát, nhiệt độ dưới 30oC, tránh ánh nắng trực tiếp. Tránh xa tầm tay trẻ em.', 10, 4, 5, 1),
(88, 'Thức ăn bổ sung ADE.B-Complex', NULL, 26000, 70, ' ADE.B-complex là thức ăn bổ sung dạng bột hòa tan chứa các loại vitamin.', 'Không nên sử dụng cho heo con.', 'trong 1000g chứa: Vitamin A, D3, E, C, B1, B2, B5, B6, B9, B12, Lactose', '1 kggày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 7, 6, 1, 1),
(89, 'Thuốc dung dịch tiêm', NULL, 32000, 75, 'Kích thích co bóp tử cung (duy trì tử cung), thúc đẩy co hồi tử cung và tăng cường tiết sữa.', 'Khi được sử dụng một cách thích hợp theo liều khuyến cáo, oxytocin hiếm khi gây ra các phản ứng bất lợi.', 'Phenol, citric acid monohydrate, sodium chloride, nước pha tiêm.', ' Tiêm 2 mũigày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 9, 3, 2, 1),
(90, 'Dầu tắm đặc trị Modern Pet', NULL, 45000, 90, 'Điều trị ngoại ký sinh trùng cho chó, mèo.', 'Không có.', 'Trong 1l chứa Permethrin 5 g', 'Tắm 1 – 2 tuần/lần', 'Sử dụng tốt cho những chó giống lớn cả lông ngắn và lông dài.', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C , nơi khô ráo, thoáng mát', 1, 1, 3, 1),
(91, 'Kháng thể vi rút viêm gan vịt', NULL, 22000, 85, ' Kháng thể giúp phòng và điều trị khẩn cấp bệnh Viêm gan siêu trùng vịt, ngan, ngỗng, gà tây, gà sao, chim trĩ.', 'Không có', 'Kháng thể vi rút viêm gan vịt. Hiệu giá kháng thể trung hòa ≥ 1: 256', 'Chai 250ml', 'Tiêm dưới da hoặc tiêm bắp.', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ 2-8°C', 8, 4, 6, 1),
(92, 'MYCO AD hấp thụ độc tố nấm mốc', NULL, 24000, 75, 'Bổ sung chất hấp thụ độc tố nấm mốc dùng trộn vào thức ăn cho gia súc, gia cầm.', 'Không mất tác dụng khi trộn với bất kì thành phần thức ăn nào.', 'SiO2,AI2O3', '1,5 – 2,5 kg/ tấn thức ăn.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 4, 6, 5, 1),
(93, 'Modern Pet Vita Hemo hỗ trợ tạo máu', NULL, 30000, 80, 'Hỗ trợ tạo máu, giúp thú cưng phục hồi nhanh chóng và kích thích sự thèm ăn sau bệnh.', 'Không có', 'Đồng, Folic acid, Inositol, Niacin, Pantothenic acid, Sắt, Vitamin B1, Vitamin B12, Vitamin B2, Vitamin B6', ' 2,2 ml/ 10 kg thể trọng', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 3, 1, 6, 1),
(94, 'Thuốc trị viêm vú trên heo nái', NULL, 20000, 95, 'Được thiết kế đặc biệt để đối phó với tình trạng viêm vú và viêm tử cung ở heo nái.', 'Không có', 'Amoxicillin trihydrate: 15g', '1ml/15kg thể trọng/72 giờ.', 'Tiêm nhắc lại sau 48 giờ nếu cần thiết.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 10, 2, 2, 1),
(95, 'Viên xổ giun cho mèo Prarintel', NULL, 24000, 70, ' Điều trị bệnh nhiễm giun tròn và giun dẹp đường ruột ở mèo.', 'Không nên sử dụng cho mèo đang mang thai.', 'Mỗi viên có chứa:Praziquatel 20mg, Pyrantel pamoate 230 mg', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 25°C', 10, 5, 3, 1),
(96, 'Viên xổ giun cho chó Prarintel Plus', NULL, 32000, 75, 'Kiểm soát và điều trị chứng nhiễm giun dẹp và giun tròn có trong hệ tiêu hóa của chó lớn và chó con.', 'Không sử dụng ở động vật có độ nhạy đã biết với các thành phần hoạt động hoặc với bất kỳ tá dược nào.', 'Praziquatel', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 25°C', 14, 1, 9, 1),
(97, 'hỗ trợ chức năng khớp cho chó mèo', NULL, 18000, 90, 'Bổ sung vitamin và khoáng chất cho chó mèo trong giai đoạn phát triển.', 'Không có', 'L-Ascorbic acid monophosphate', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 5, 1, 5, 1),
(98, 'Viên hỗ trợ chức năng xương cho chó mèo', NULL, 20000, 85, 'nguồn cung cấp canxi và các dưỡng chất thiết yếu cho chó con, chó mang thai và cho con bú.', 'Không có.', 'Dicalcium Phosphate', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 5, 1, 1, 1),
(99, 'Viên hỗ trợ chức năng thận cho chó mèo', NULL, 22000, 80, 'I-PETT KIDY chứa chiết xuất Phytochemical, Vitamin, axit amin, khoáng và các vi sinh vật có lợi sử dụng cho chó, mèo giúp ngăn ngừa nhiễm trùng đường tiết niệu.', 'Không có', 'Lactobacillus acidophilus, Arginine HCL', '2 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C , nơi khô ráo, thoáng mát', 9, 6, 2, 1),
(100, 'Kháng sinh amox dạng uống cho chó mèo', NULL, 25000, 95, 'Điều trị các bệnh nhiễm trùng trên da và mô mềm, nhiễm trùng răng nướu, đường tiết niệu trên chó mèo.', 'Không sử dụng cho thỏ, chuột lang, hamsters, sóc sin-sin hoặc chuột túi.', 'Amoxicillin trihydrate', 'uống 1 ml, ngày 2 lần.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C', 2, 6, 3, 1),
(101, 'Thuốc tiền mê chó mèo Xylinvet', NULL, 20000, 90, 'Thuốc tiền mê cho chó và mèo.', 'Không sử dụng cho động vật đang trong giai đoạn cuối của thai kỳ.', 'Xylazine ', 'Tiêm bắp hoặc tiêm dưới da: 0,125 – 0,25 ml XYLINVET/ 5 kg thể trọng', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 9, 6, 4, 1),
(102, 'Thuốc sổ giun cho chó con', NULL, 22000, 85, ' Phòng bệnh giun tim trên chó bằng cách loại bỏ giai đoạn mô của ấu trùng giun tim (Dirolaria immitis) khoảng 1 tháng (30 ngày) sau khi nhiễm.', 'Sử dụng với sự cẩn trọng trên thú bị suy nhược nghiêm trọng', 'Trong mỗi viên nhai chứa: Ivermectin,Pyrantel/ muối Pamoate', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 14, 1, 5, 1),
(103, 'Thuốc xổ giun cho chó lớn', NULL, 35000, 80, 'Phòng bệnh giun tim trên chó bằng cách loại bỏ giai đoạn mô của ấu trùng giun tim (Dirolaria immitis) khoảng 1 tháng (30 ngày) sau khi nhiễm.', 'Sử dụng với sự cẩn trọng trên thú bị suy nhược nghiêm trọng.', 'Trong mỗi viên nhai chứa: Ivermectin,Pyrantel/ muối Pamoate', '1 mũigày', 'An toàn khi sử dụng trên thú mang thai và cho con bú.', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C, nơi khô ráo, thoáng mát', 14, 1, 1, 1),
(104, 'Thuốc sát trùng Advance APA', NULL, 28000, 80, 'Sát trùng, diệt khuẩn virus, vi trùng, bào tử nấm, Mycoplasma, nấm mốc.', 'Không có', 'Trong 1 lít chứa: Benzalkonium chloride 10%, Glutaraldehyde 15%', 'Phun 1 – 2 lầngày; liên tục 3 – 5 ngày hoặc cho đến khi hết dịch.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 12, 6, 1, 1),
(105, 'Thức ăn cao cấp Kanipro dành cho chó trưởng thành', NULL, 22000, 90, 'Bổ sung vitamin và khoáng chất cho chó.', 'Không có', 'Thức ăn chứa bột cá, gia cầm thịt, ngô gluten, bắp, gạo nát, đậu nành, vitamin E (Tocopherol Acetate), và vitamin C (Axit ascorbic).', '1 kggày', 'Sử dụng liên tục trong giai đoạn nuôi chó.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 6, 1, 3, 1),
(106, 'Thuốc mỡ Ancomast phòng trị bệnh viêm', NULL, 24000, 85, 'Sử dụng điều trị cục bộ bệnh viêm vú cấp tính trong giai đọan bò tiết sữa', 'Không có.', 'Neomycin sulphate', 'dùng 1 ống (injector) cho 1 bầu vú bị viêm', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Sản phẩm ở dạng nguyên vẹn và tránh ánh sáng (dưới 30°C)', 9, 3, 4, 1),
(107, 'Chất thay thế sữa Birthright cho thú non', NULL, 26000, 80, 'Là sản phẩm được nghiên cứu dành cho thú con sơ sinh không chứa kháng thể đặc hiệu.', 'Không có', 'Whey sấy khô, sữa tách béo sấy khô, casein, thức ăn đậm đặc protein từ whey sấy khô, huyết tương heo, chất béo động vật.', 'cho ăn lạnh từ 12 giờ sau sinh đến 14 ngày tuổi', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 6, 6, 5, 1),
(108, ' Thuốc đặc trị kiểm soát bệnh cầu trùng trên heo con', NULL, 18000, 90, 'Sử dụng để điều trị và kiểm soát bệnh cầu trùng do Isospora suis gây ra trên heo. Tác dụng nhanh chóng và diệt tất cả các giai đoạn của cầu trùng (Isospora suis).', 'Không ảnh hưởng đến chức năng của hệ miễn dịch trong việc ức chế cầu trùng.', 'Toltrazuril', 'liều 20 mg', 'Sử dụng với 1 liều bơm duy nhất cho heo trong tuần đầu tiên sau khi sinh.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 14, 2, 1, 1),
(109, 'Thuốc trị bệnh cầu trùng trên gà vịt ngỗng', NULL, 20000, 85, 'Điều trị và kiểm soát bệnh cầu trùng gây ra bởi Eimeia anseris, Eimeria truncata.', 'Không nên sử dụng cho gia cầm đang mang thai.', 'Toltrazuril', '1 lít sản phẩm dùng được 3 500kg thể trọng.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 14, 4, 2, 1),
(110, 'Sữa tắm dưỡng da cho chó mèo', NULL, 22000, 80, 'Ngăn chặn sự phát triển của ký sinh trùng trong đàn mèo già.', 'Không có', ' Chiết xuất Hemicellulose, nguồn protein đậm đặc, whey sấy khô, dầu olive, nước, sodium saccharide, Xanthan Gum, tinh dầu cây kinh giới', 'Chai 300ml.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 1, 6, 1, 1),
(111, 'Dầu tắm khô dạng mouse', NULL, 20000, 95, 'Douxo S3 SEB phù hợp dùng cho chó mèo có da nhờn hoặc bong tróc: giảm gàu, bã nhờn dư thừa và mùi khó chịu nhờ hoạt động của Seboliance, đồng thời dưỡng ẩm và bảo vệ hệ sinh thái của da.', 'Không có', 'Seboliance, Ophytrium', 'Bơm 1 hoặc 2 lần lên bàn tay và mát-xa để lớp mouse thấm vào da.', 'Sử dụng ngoài da, dùng trên lớp lông khô và đã chải.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 1, 6, 4, 1),
(112, 'Kháng sinh phổ rộng Ceftiofur', NULL, 26000, 65, 'Điều trị bệnh trên đường hô hấp có liên quan đến các vi khuẩn Mannheimia haemolytica.', 'Không sử dụng cho ngựa chuyên dùng để nuôi lấy thịt.', 'Trong mỗi chai 4g chứa: Ceftiofur sodium hay Ceftiofur 4 g', '1 ml dung dịch CEFVET/ 50 kg thể trọng, cách 24 giờ, liên tục 3 – 5 ngày.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 9, 6, 5, 1),
(113, 'Thuốc điều trị bọ chét và ve gây bệnh trên chó', NULL, 32000, 70, 'Điều trị bọ chét và ve gây bệnh trên chó.', 'Không sử dụng cho chó con dưới 2 tháng tuổi', 'Chất Fipronil ', '2ml gày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C.', 14, 1, 2, 1),
(114, 'Thuốc điều trị bọ chét và ve gây bệnh trên mèo', NULL, 32000, 70, 'Điều trị bọ chét và ve gây bệnh trên mèo.', 'Không sử dụng cho mèo con dưới 2 tháng tuổi', 'Chất Fipronil ', '2ml gày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 30°C.', 14, 5, 2, 1),
(115, 'Thuốc nhỏ tai Auriclean làm sạch tai cho chó', NULL, 28000, 80, 'Giải pháp làm sạch tai cho chó và mèo, khử mùi hôi và dị ứng.', 'Không có', 'Deionized water', 'nhỏ 1-3ml vào ống tai', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 3, 1, 3, 1),
(116, 'Thuốc bổ sung Crom hữu cơ cho heo', NULL, 45000, 90, 'Giúp heo Cải thiện màu sắc thịt,Tăng tỷ lệ thân thịt,Tăng tỷ lệ thịt thăn...', 'Không có.', 'Chromium (min – max)', 'Trộn thức ăn với liều 1kg/tấn thức ăn', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 13, 2, 4, 1),
(117, 'Dịch truyền Advance Normal', NULL, 28000, 80, 'Bù nước và chất điện giải do mất nước, dùng làm thuốc nhỏ mắt, rửa vết thương mắt, niêm mạ mũi, làm dung môi pha vaccine.', 'Không có', 'Trong 100ml chứa: Natri clorid ……………………..0.9 g', '1 viêngày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 14, 4, 5, 1),
(118, 'Vi khoáng tăng năng suất cho gia cầm', NULL, 20000, 95, 'Bổ sung khoáng chất trong thức ăn chăn nuôi.', 'Không có', 'Canxi, Kẽm', '5mlgày', 'Hòa tan vào nước uống với liều cho gia cầm; 1-2ml / lít nước trong vòng 5 ngày.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 7, 4, 1, 1);
INSERT INTO `products` (`id`, `productName`, `sale_percent`, `price`, `quantity`, `purpose`, `contraindications`, `ingredients`, `dosage`, `instructions`, `warrantyPeriod`, `storageCondition`, `cate_id`, `type_id`, `supplier_id`, `active`) VALUES
(119, 'Vaccine vô hoạt phòng bệnh cúm', NULL, 26000, 70, ' Phòng bệnh cúm gia cầm gây bởi vi-rút cúm gia cầm tái tổ hợp subtype H5.', 'Không nên sử dụng cho gia cầm con.', 'Vaccine chứa vi-rút cúm gia cầm tái tổ hợp subtype H5N1, chủng Re-5 vô hoạt, trước khi vô hoạt, hiệu giá HA≥ 8log2', '0,5 ml/con', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Ở nhiệt độ 2-8 °C. Không được để vaccine đóng đá.', 8, 4, 2, 1),
(120, 'Thuốc trị viêm phổi', NULL, 32000, 75, 'Đặc trị hen khẹc, viêm phổi, e.coli kéo màng, bại huyết, tiêu chảy nặng.', 'Không có', 'Apramycin sulfat, Tá dược vđ', '100g/1,5-2,0 tấnTTgày', 'Hoà nước cho uống hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '15 tháng kể từ ngày sản xuất', 'Nơi khô, nhiệt độ dưới 30 độ C, tránh ánh sáng', 10, 6, 3, 1),
(121, 'Thuốc đặc trị viêm phổi, tiêu chảy nặng', NULL, 18000, 90, 'Đặc trị bại huyết, E.coli kéo màng, tụ huyết trùng, hen khẹc, viêm phổi, viêm màng phổi.', 'Không có', 'Trong 1kg chứa: Cefalexin monohydrate 600g, Tá dược đặc biệt vđ 400g.', '1g/25 – 30kgTTgày', 'Pha nước uống hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 10, 6, 4, 1),
(122, 'Thuốc đặc trị hen gà, khẹc vịt', NULL, 20000, 85, 'Đặc trị viêm đường hô hấp, nhiễm khuẩn đường tiêu hoá.', 'Không nên sử dụng cho gia cầm già đang mang thai.', 'Erythromycin 10g, Colistin 25,000,000 IU, Tá dược đặc biệt vđ 100g.', 'Dùng bằng 1/2 liều trị.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 9, 4, 5, 1),
(123, 'Thuốc đặc trị viêm phổi, chướng diều', NULL, 24000, 85, 'Đặc trị nhiễm trùng đường hô hấp do vi khuẩn nhạy cảm với Sulfadimidine và Oxytetracycline.', 'Không có', 'Trong 1kg chứa: Sulfadimidine 112,5g, Oxytetracycline 60g, Tá dược (Glucose) vđ 827,5g.', 'Dùng bằng 1/2 liều trị.', 'Pha nước uống hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 10, 6, 1, 1),
(124, 'Thuốc viêm khớp trên gà', NULL, 35000, 80, 'Trị bệnh viêm khớp do Mycoplasma synoviae (MS) trên gia cầm.', 'Không dùng với thuốc khác.', 'Trong 1kg chứa: Tylosin tartrate 800g, Tá dược vđ 200g.', '1g/4 lít nước uống hoặc 1kg/2 tấnTĂgày, liên tục 5-10 ngày', 'Pha nước cho uống hoặc trộn thức ăn.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 10, 4, 2, 1),
(125, 'Thuốc viêm phổi ghép thương hàn', NULL, 28000, 80, 'Đặc trị nhiễm khuẩn đường hô hấp gây ra bởi các vi khuẩn nhạy cảm với Florfenicol trên gia cầm và heo.', 'Không có', 'Trong 1kg chứa: Florfenicol 40g, Tá dược vđ 960g.', '100g/400kgTTgày hoặc 1g/lít nước.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 10, 6, 3, 1),
(126, 'Thuốc đặc trị viêm hồi tràng', NULL, 28000, 80, 'Linspec Extra chỉ định điều trị các bệnh do vi khuẩn nhạy cảm với Lincomycin và Spectinomycin gây ra.', 'Không có', 'Trong 1kg chứa: Lincomycin HCl 222,2g, Spectinomycin HCl 444,4g, Tá dược vđ 333,4g', '100g/2 tấnTTgày hoặc 1kg/20 tấnTTgày hay 1g/4 lít nước.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 10, 4, 10, 1),
(127, 'Thuốc trị suyễn heo', NULL, 20000, 85, 'Đặc trị bệnh viêm phổi do Mycoplasma gây ho khan, ho kéo dài; viêm phổi dính sườn, phó thương hàn, tụ huyết trùng, bệnh do E.coli: phân trắng, phân vàng.', 'Không có', 'Trong 1kg chứa: Florfenicol 500g, Tá dược vđ 500g.', '10g/1.000kgTTgày.', 'Pha nước uống hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 2, 3, 1),
(128, 'Thuốc đặc trị viêm ruột gia cầm', NULL, 24000, 85, 'Đặc trị viêm ruột hoại tử do Clostridium SPP., hồng lị, tiêu chảy trên gia cầm.', 'Không nên sử dụng cho gia cầm đang mang thai.', 'Trong 1kg chứa: Bacitracin methylene disalicylate 150g, Tá dược vđ 850g.', '100g/1-1,2 tấnTTgày hoặc gói 100g/200-250 kgTĂ.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 10, 4, 5, 1),
(129, 'Thuốc đặc trị nấm phổi', NULL, 32000, 75, 'Đặc trị nhiễm trùng do nấm (nấm phổi, nấm phủ tạng, nấm diều, nấm ruột) .', 'Không có', 'Trong 1kg chứa: Neomycin sulfate 100g, Nystatin 75,000,000 IU, Tá dược vđ 899.999.900g.', '100g/200-250kgTTgày hay 1g/2 lít nước uống', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 9, 4, 1, 1),
(130, 'Thuốc viêm ruột tiêu chảy', NULL, 35000, 80, 'Đặc trị nhiễm trùng do vi khuẩn nhạy cảm với Gentamicin và Doxycycline trên gia cầm.', 'Không dùng quá liều.', 'Trong 1kg chứa: Gentamicin sulfate 100g, Doxycycline hyclate 200g, Tá dược đặc biệt vđ 700g.', '10g/150-200kgTTgày', 'Pha nước uống hoặc trộn thức ăn, liệu trình liên tục 3-5 ngày.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 10, 4, 5, 1),
(131, 'Thuốc đặc trị E. coli', NULL, 45000, 90, 'Đặc trị các nhiễm khuẩn đường tiêu hoá, hô hấp.', 'Khi bị bệnh thương hàn, tăng liều gấp đôi.', 'Trong 1kg chứa: Enrofloxacin 100g, Tá dược vđ 900g.', '10g/100kgTTgày', 'Pha nước uống, sữa hoặc trộn thức ăn liệu trình 3-5 ngày.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 10, 6, 5, 1),
(132, 'Thuốc trị hồng lị trên heo', NULL, 28000, 80, 'Đặc trị bệnh viêm phổi do Mycoplasma gây ho khan, ho kéo dài, viêm phổi dính sườn, lepto, hồng lỵ.', 'Không có', 'Trong 1kg chứa: Doxycycline hyclate 500g; Tá dược đặc biệt vđ 500g.', '1 kg/2tấnTĂgày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Nơi khô, nhiệt độ dưới 30 độ C, tránh ánh sáng trực tiếp!', 10, 2, 1, 1),
(133, 'Thuốc đặc trị CRD gia cầm', NULL, 20000, 95, 'Đặc trị nhiễm trùng do các vi khuẩn nhạy cảm với Doxycycline và Tylosin trên gia cầm.', 'Không có', 'Trong 1 kg chứa: Tylosin tartrate 100g, Doxycycline hyclate 200g, Tá dược đặc biệt vđ 700g.', '10g/100kgTTgày', 'Pha nước uống hoặc trộn thức ăn, liệu trình liên tục 3-5 ngày.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 10, 4, 2, 1),
(134, 'Thuốc đặc trị E.COL', NULL, 26000, 70, 'Đặc trị nhiễm khuẩn đường hô hấp, viêm ruột tiêu chảy do E.coli.', 'Không nên sử dụng cho heo già đang mang thai.', 'Acid Oxolinic 200g; Tá dược đặc biệt (Lactose, Sodium carbonate) vđ 800g.', '100g/1 tấnTTgày hoặc 100g/100-200 lít nước', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 10, 4, 3, 1),
(135, 'Thuốc đặc trị đường hô hấp heo', NULL, 32000, 75, 'Đặc trị các bệnh viêm đường hô hấp, viêm màng phổi (APP).', 'Không có', 'Florfenicol 200g, Doxycycline hyclate 100g, Bromhexine HCl 10g, Vitamin C 20g, Tá dược vđ 670g.', '1g/3 lít nước hoặc 1g/1,5kgTĂ', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 10, 2, 4, 1),
(136, 'Kháng sinh trị bệnh vịt ngan', NULL, 18000, 90, 'Trị viêm ruột, tiêu chảy do E.coli, Salmonella cho ngan vịt', 'Không có', 'Trong 1 kg chứa: Enrofloxacin 50g; Tá dược đặc biệt vđ 950g', '1g/10kgTTgày hay 1g/2 lít nước uống.', 'Pha nước uống hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 4, 3, 1),
(137, 'Thuốc đặc trị tiêu chảy', NULL, 20000, 85, 'Trị các bệnh nhiễm trùng dạ dày-ruột do vi khuẩn nhạy cảm với Sulfaguanidine.', 'Không nên sử dụng cho vật nuôi đang mang thai.', 'Trong 100g chứa: Sulfaguanidine 18g, Sodium salicylate 15,5g, Tá dược vừa đủ 66,5g.', '1g/2lít nước uống hoặc 1g/10kgTTgày.', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 10, 6, 3, 1),
(138, 'Thuốc đặc trị hen gà', NULL, 24000, 85, 'Đặc trị các trường hợp nhiễm trùng đường tiêu hoá, hô hấp trên gia cầm.', 'Không có', 'Doxycycline hyclate 100g, Tylosin tartrate 50g, Tá dược đặc biệt vđ 850g', '1g/5kgTTgày hoặc 1g/lít nước uống', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 10, 4, 5, 1),
(139, 'Tụ huyết trùng gia cầm', NULL, 35000, 80, 'Bệnh tụ huyết trùng ở gà, vịt, ngan, chim cút, biểu hiện gia cầm chết nhanh, xác chết béo, mào, tích, thân thịt tím tái.', 'Không dùng chung với thuốc khác.', 'Colistin Sulfate 1.200.000.000 IU', 'Tá dược đặc biệt vđ 1kg.', 'Pha nước hoặc trộn thức ăn, liệu trình 3-5 ngày liên tục.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 10, 4, 5, 1),
(140, 'Bộ kháng sinh vịt ngan', NULL, 28000, 80, 'Đặc trị nhiễm trùng huyết, ghép tiêu chảy phân xanh, phân trắng.', 'Không có', 'Ceftiofur sodium', 'Tiêm bắp hoặc tiêm dưới da 1ml/3-5kg/TT', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 9, 4, 5, 1),
(141, 'Thuốc đặc trị bệnh trên heo', NULL, 22000, 85, 'Đặc trị bệnh trên heo, viêm hồi tràng, suyễn, hồng lỵ.', 'Không tiêm chung với sản phẩm khác', 'Tiamulin hydrogen fumarate', '1ml/5-8kgTT', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 10, 2, 3, 1),
(142, 'Thuốc chống sổ mũi cho chó con', NULL, 26000, 70, 'Giảm triệu chứng sổ mũi ở chó con.', 'Không nên sử dụng cho chó con đang mang thai.', 'Silver nano, Zinc oxide, Quaternary ammonium, Glycerol, Aqua.', 'nhỏ vào mỗi bên mũi từ 1-2 giọt', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '18 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thoáng mát', 9, 1, 5, 1),
(143, 'Thuốc phòng trị nhiễm khuẩn hô hấp', NULL, 32000, 75, 'Đặc trị các bệnh nhiễm khuẩn huyết, bại huyết ở vịt, viêm rốn, tụ huyết trùng, viêm ruột do E.coli, bạch lỵ, thương hàn.', 'Không có', 'Trong 1kg chứa: Chlortetracycline HCl 500g, Tá dược vđ 500g.', '1g/12,5kgTT, tương ứng 1g/2,5 lít nước uống hoặc 2g/2.5kgTĂ', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '15 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ khô ráo', 10, 4, 1, 1),
(144, 'Dung dịch uống', NULL, 45000, 90, 'Tăng cường hệ miễn dịch cho vật nuôi.', 'Dùng kết hợp với kháng sinh giúp mau phục hồi và giảm tỷ lệ chết.', 'Malic acid, Glucosamine, Arginine, Glycine, Vitamin C, B6, B12', '1ml/lít nước uống', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '24 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ thấp', 11, 6, 1, 1),
(145, 'Hoocmon kích trứng gia cầm', NULL, 28000, 80, 'Tăng năng suất trứng, kéo dài thời gian cao sản.', 'Không có', 'Oxytetracycline HCl 60.000 mg, Vitamin A 4.000.000 IU, Vitamin D3 700.000 IU', 'Pha 1g/lít nước uống hay 1g/5kgTTgày', 'Sử dụng theo hướng dẫn của bác sĩ thú y.', '20 tháng kể từ ngày sản xuất', 'Bảo quản ở nhiệt độ mát', 11, 4, 3, 1),
(146, 'Dịch truyền Glucose 5% cho gia súc, gia cầm, chó mèo', NULL, 45000, 90, 'Trị mất nước ở trâu, bò, dê, cừu, heo, ngựa, chó và mèo; điều chỉnh tăng Kali máu, cải thiện thình trạng hạ đường huyết nhẹ.', 'Không có.', 'Glucose Monohydrate', '100mlgày', 'Tiêm chậm vào tĩnh mạch hoặc xoang bụng.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 3, 1),
(147, 'Thuốc mỡ Drycloxaject phòng trị viêm vú cho gia súc giai đoạn cạn sữa', NULL, 55000, 45, ' Dùng để phòng và trị bệnh viêm vú gây ra bởi các vi trùng Gram + mẫn cảm với Cloxacillin trong giai đoạn cạn sữa.', 'Không có.', 'Glucose Monohydrate', '100mlgày', 'Sau khi vắt hết sữa, lau sạch và sát trùng núm vú tiến hành bơm 1 Injector 9 g thuốc Drycloxa-Ject cho một núm vú có bầu vú bị viêm.Thông thường thì bơm cả bốn phần của bầu vú.', '24 tháng kể từ ngày sản xuất', 'Sản phẩm ở dạng nguyên vẹn và tránh ánh sáng (dưới 30°C)', 9, 3, 1, 1),
(148, 'Kháng sinh Gentaguard 10% Injection đặc trị bệnh cho gia súc', NULL, 34000, 72, 'Điều trị các bệnh do vi khuẩn mẫn cảm với gentamicin, bao gồm Pseudomonas aeruginosa, Rhodococcus equi và Salmonella spp.', 'Không có.', 'Gentamicin ', '2 mũigày', 'Tiêm bắp và tiêm tĩnh mạch chậm, lặp lại sau 8-12 giờ, tùy vào tình trạng bệnh:', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 3, 1, 1),
(149, 'Kháng sinh Enroguard 10% Injection gia súc', NULL, 55000, 90, 'Điều trị nhiễm trùng đường hô hấp, nhiễm trùng đường tiêu hóa do vi khuẩn hoặc Mycoplasma nhạy cảm với Enro­oxacin;', 'Không sử dụng cho bê cung cấp thịt', 'Enro­oxacin', '2 mũigày', 'Tiêm cơ ức hoặc dưới da cổ', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 3, 3, 1),
(150, 'Kháng sinh Enrophar 0.5% Oral trị nhiễm trùng hô hấp, tiêu hóa ở heo', NULL, 45000, 90, 'Đặc trị bệnh tiêu chảy trên heo con và bệnh nhiễm trùng huyết do E. coli mẫn cảm enro­floxacin; Điều trị bệnh nhiễm trùng đường hô hấp do Pasteurella multocida và Mycoplasma spp mẫn cảm với enrofl­oxacin gây ra.', 'Không có.', 'Enrofl­oxacin', '1ml/lần bơm 1 lầngày', 'Bơm trực tiếp vào miệng', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 2, 3, 1),
(151, 'Fermin Tab bổ sung dinh dưỡng hỗ trợ tạo máu cho chó mèo', NULL, 45000, 90, 'I-PETT FERMIN TAB chứa hỗ hợp vitamin và khoáng chất ở dạng chelate giúp thúc đẩy quá trình sản sinh tế bào máu dùng trong trường hợp: Thú mang thai và đang cho con bú; Thú sau khi phẫu thuật và nhiễm ký sinh trùng máu.', 'Không có.', 'Ferrous amino acid chelate, Copper amino acid chelate,Vitamin B6, Vitamin B12, Vitamin K3, Folic acid.', '1 viêngày', 'Cho uống trực tiếp hoặc nghiền, trộn với thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 13, 1, 1, 1),
(152, 'Kháng sinh Amoxclamed 500 trị các bệnh nhiễm trùng trên chó', NULL, 64000, 47, 'Dùng để điều trị bệnh nhiễm trùng trên chó, bao gồm: nhiễm trùng da (nhiễm trùng sâu trong da và bên ngoài), nhiễm trùng mô mềm (ví dụ: áp-xe và nhiễm trùng đường sinh dục) nhiễm trùng hệ tiết niệu, hô hấp bao gồm hệ hô hấp trên và hệ hô hấp bên dưới, nhiễm trùng đường tiêu hóa do các vi khuẩn mẫn cảm Amoxicillin kết hợp với axit Clavulanic.', 'Không dùng cho vật nuôi mẫn cảm với Penicillins; Không sử dụng cho vật nuôi bị suy giảm chức năng thận trầm trọng do chứng bí tiểu và tiểu ít gây ra; Không dùng cho thỏ, chuột lang, chuột hamsters, chinchillas hoặc các loài gặm nhắm nhỏ.', 'Glucose Monohydrate', '2 lần/ ngày', 'Chỉ cấp thuốc bằng đường miệng', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ dưới 25°C.', 9, 1, 3, 1),
(153, 'Dầu tắm Modern Pet Dermacare trị viêm nấm da trên chó mèo 100ml – 250ml', NULL, 42000, 23, 'Điều trị và kiểm soát viêm da gây ra do Staphylococcus intermedius và Malassezia pachydermatis', 'Không dùng cho vật nuôi quá mẫn cảm với các thành phần của thuốc.', 'Chlorhexidine gluconate, Miconazole nitrate', '1 – 2 tuần/lần.', 'Làm ướt toàn bộ lông, cho lượng dầu tắm vừa đủ lên lông, xoa đều từ đầu đến chân để tạo bọt, để yên trong 5 – 7 phút cho thuốc thấm, tắm lại với nước sạch vài lần cho đến khi sạch hẳn dầu tắm, sau đó lau và sấy khô lông;', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 6, 3, 1),
(154, 'Vắc xin tái tổ hợp vô hoạt phòng bệnh cúm gia cầm H5N1 – Chủng Re-6', NULL, 45000, 90, 'Phòng bệnh cúm gia cầm gây bởi vi rút cúm gia cầm tái tổ hợp subtype H5. Đáp ứng miễn dịch 14 ngày sau khi tiêm, thời gian bảo hộ đối với gà là 6 tháng và 04 tháng đối với vịt, ngan và ngỗng sau khi tiêm mũi nhắc lại sau 21 ngày.', 'Không có.', 'Glucose Monohydrate', '100mlgày', 'Tiêm cơ ức hoặc dưới da cổ cho gia cầm và thủy cầm theo khuyến cáo của chương trình vaccine', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ 2-8 °C. Không được để vaccine đóng đá.', 8, 6, 2, 1),
(155, 'Vắc xin nhược độc đông khô phòng bệnh Tai xanh – Chủng JXA1-R', NULL, 45000, 90, 'Tạo miễn dịch chủ động phòng Hội chứng gây rối loạn hô hấp và sinh sản (PRRS) thể độc lực cao trên heo. Hàm lượng kháng thể đạt cao nhất vào khoảng 21 – 28 ngày sau khi tiêm vaccine, thời gian bảo hộ kéo dài 4 – 6 tháng.', 'Không có.', 'Glucose Monohydrate', '100mlgày', 'Hòa tan vaccine với nước pha đi kèm. Tiêm bắp sau hốc tai.', '24 tháng kể từ ngày sản xuất', 'Ở nhiệt độ 2-8°C. Không được để vaccine đóng đá.', 8, 2, 1, 1),
(156, 'Kháng sinh phổ rộng Advance Amoxclavu S cho chó mèo', NULL, 45000, 90, ' Phòng và trị các bệnh viêm phổi, tiết niệu, tiêu hóa; Trị nhiễm khuẩn da, mô mềm, áp xe, viêm mô tế bào; Hiệu quả đối với nhiễm trùng da lần đầu và viêm da mũ dai dẳng trên chó, mèo.', 'Không có.', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 3, 1),
(157, 'Thức ăn cao cấp Felipro vị hải sản dành cho mèo mọi lứa tuổi', NULL, 66000, 90, ' Công thức cân bằng khoáng chất làm giảm nguy cơ gây sỏi mật', 'Không có.', 'Bột cá, gia cầm thịt, ngô Gluten, bắp, Broken Rice, đậu nành Bean, Vitamin E (Tocopherol Acetate) và Vitamin C (Axit ascorbic),…', '2-4 bữa/ ngày', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 5, 3, 1),
(158, 'Kháng sinh Amoxivet 50% Powder trị bệnh hô hấp, tiêu hóa gia cầm, heo', NULL, 45000, 90, ' Điều trị bệnh trên đường hô hấp do vi khuẩn Actinobacillus pleuropneumoniae mẫn cảm với amoxicillin gây ra trên heo;', 'Không sử dụng cho vật nuôi mẫn cảm với penicillin hoặc kháng sinh nhóm ß- lactam; vật nuôi có dấu hiệu suy gan, suy thận; Không sử dụng cho động vật gặm nhấm như thỏ, chuột lang, chuột hamster và chồn, thú ăn cỏ và ngựa..', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'Liều pha nước uống.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 4, 3, 1),
(159, 'Dầu tắm Modern Pet Sunny Gel dành cho chó lông trắng', NULL, 45000, 64, ' Modern Pet Sunny Gel dành cho chó lông trắng, giữ màu lông ko bị ngả vàng, chỉ cần tắm 1 lần là có thể giúp bộ lông cải thiện độ trắng sáng.', 'Không có.', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'Làm ướt toàn bộ lông thú yêu, thoa đều sữa tắm Modern Pet Sunny Gel lên da cho đến khi lông thú đầy bọt.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 1, 3, 1),
(160, 'Kháng sinh Nalistin 10 trị nhiễm trùng đường tiêu hóa do khuẩn E. Coli', NULL, 67000, 35, ' Điều trị các bệnh nhiễm trùng đường tiêu hóa do vi khuẩn Salmonella, E. coli và các vi khuẩn nhạy cảm với Colistin gây ra trên heo và gia cầm.', 'Không sử dụng cho động vật mẫn cảm với thành phần của thuốc.', 'Colistin base', '1g NALISTIN – 10/12,5 kg thể trọnggày', ' Pha nước uống', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 4, 3, 1),
(161, 'Dầu tắm Modern Pet Lucky Gel cho thú cưng lông nâu và lông đỏ', NULL, 45000, 90, 'Giúp lông mềm mượt và phù hợp với da nhạy cảm của thú cưng.', 'Không có.', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'Làm ướt toàn bộ lông thú yêu, thoa đều sữa tắm Modern Pet Lucky Gel lên da cho đến khi lông thú đầy bọt.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 5, 3, 1),
(162, 'Minical – viên bổ sung Canxi cho thú có tầm nhỏ', NULL, 55000, 90, 'Duy trì khung xương ở thú trưởng thành.', 'Không có.', 'Canxi, Phosphorus, Vitamin A', '2 viên / ngày', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 7, 1, 2, 1),
(163, 'Dầu tắm Modern Pet Sweetie Gel khử mùi và tạo kiểu', NULL, 45000, 34, 'Giúp lông mịn, bông, dễ dàng tạo kiểu cho thú cưng của bạn.', 'Không có.', 'Vitamin B6, Glycerin, D- Pantothenol, Acid Citric', '', 'Làm ướt toàn bộ lông thú yêu, thoa đều sữa tắm Modern Pet Sweetie Gel lên da cho đến khi lông thú đầy bọt.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 1, 1, 1),
(164, 'Kháng sinh Marbovet 80 trị nhiễm trùng da và mô mềm trên chó', NULL, 55000, 66, ' Điều trị chứng nhiễm trùng da và mô mềm (viêm da có mủ, chốc lở, viêm nang lông, viêm da, viêm mô tế bào), nhiễm trùng đường tiết niệu và hô hấp do các vi khuẩn mẫn cảm với Marbofloxacin gây ra trên chó.', 'Không có.', 'Marbofloxacin', '2 mg/kg', '2 mg/kg thể trọng bằng đường miệng', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 1, 3, 1),
(165, 'KC-Pol bổ sung hỗn hợp vitamin, khoáng và axit amin', NULL, 45000, 90, ' Kích thích tăng trọng và tăng sản xuất trứng', 'Không có.', 'Amoxicillin trihydrate', '5-10kg/tấn', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 7, 6, 3, 1),
(166, 'Actifarm cải thiện khả năng tiêu hóa và hấp thụ dinh dưỡng ở gia cầm', NULL, 45000, 53, ' Cải thiện tiêu chuẩn và hấp thụ chất dinh dưỡng trong hệ thống tiêu hóa.', 'Không có.', 'Bacillus subtilis', '', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 7, 4, 3, 1),
(167, 'Hairry – viên bổ sung giúp chó tầm vóc lớn lông, da khỏe đẹp', NULL, 45000, 90, ' Duy trì chức năng của các hệ thống trong cơ thể. Duy trì sức khỏe làn da và bộ lông thú.', 'Không có.', 'Sắt, Vitamin A, Vitamin D3, Vitamin E', '1 viên / 10 kg thể trọng mỗi ngày', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 5, 1, 4, 1),
(168, 'Dầu tắm Roy làm mềm dịu lông, hạn chế rụng lông chó mèo', NULL, 45000, 90, 'Với chiết xuất từ Aloe Vera, chăm sóc dịu nhẹ cho làn da thú cưng, giữ ẩm, làm mượt da lông, giúp lông mềm mượt, dễ chải, hạn chế rụng lông', 'Không có.', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'Làm ướt toàn bộ lông thú yêu, thoa đều sữa tắm Roy lên da cho đến khi lông thú đầy bọt.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 6, 6, 1),
(169, 'Pate dành cho chó Hi-Diet Dog Food ', NULL, 45000, 90, 'Tăng khả năng hồi phục sức khỏe khi: có vấn đề về các bệnh mãn tính, các vấn đề da, hậu phẫu…', 'Không có.', 'Thịt gà, cá, thịt cừu, gan bò, nước, Bột năng, Glycine, Chất kết dính, dầu hoa hướng dương, chất tạo mùi, vách tế bào nấm men', '1 ml / 18 -20 kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 1, 3, 1),
(170, 'Pate dành cho mèo Hi-Diet Cat Food ', NULL, 45000, 90, 'Tăng khả năng hồi phục sức khỏe khi : có vấn đề về các bệnh mãn tính, các vấn đề da, hậu phẫu…', 'Không có.', 'Thịt gà, cá mòi, mỡ gà, chất tạo mùi, cá, Vitamin & khoáng chất, chất kết dính, chất ly trích từ nấm men, bột mỳ, bột gạo, Fructo Oligosaccharide, Taurine, Folic acid, nước.', 'Trọng lượng 2.1 – 5 (kg), 3.5 hộpgày.', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 6, 5, 7, 1),
(171, 'Doxicure-50 – kháng sinh Doxycycline dạng bột pha nước', NULL, 45000, 90, 'Thuốc được chỉ định để điều trị bệnh nhiễm trùng đường hô hấp trên gia cầm , gây ra bởi vi khuẩn nhạy cảm với Doxycycline, bao gồm Chlamydias spp . và Mycoplasma spp .', ' Không sử dụng cho gà trong giai đoạn đẻ trứng', 'Doxycycline hyclate', '1 ml / 18 -20 kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 4, 6, 1),
(172, 'Kháng sinh Lincospecvet trị nhiễm trùng hô hấp,…gia súc, chó mèo', NULL, 45000, 90, 'Điều trị các bệnh nhiễm trùng đường hô hấp, đường ruột, đường tiết niệu  nhiễm trùng da và viêm khớp do các vi khuẩn gây ra bao gồm: Actinobacillus spp., Pasteurella spp., E.coli, Salmonella, Clostridium spp., Staphylococcus spp., Mycoplasma spp,… trên chó, mèo, heo, gia súc.', 'Không có.', 'Spectinomycin ', '1ml/5 kg', 'Tiêm bắp với liều 1ml/5 kg, lặp lại sau 12-24 giờ trong 3-7 ngày..', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 3, 1),
(173, 'Kháng sinh Tilmiguard Solution trị nhiễm khuẩn đường hô hấp gia cầm', NULL, 45000, 90, 'Hiệu quả cao trong điều trị chứng nhiễm trùng đường hô hấp trên gia cầm do M.gallisepticum và M.synoviae.', 'Không sử dụng cho gà đẻ thương phẩm..', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'Pha vào nước cho uống với liều 10-25 mg / kg thể trọng (tương đương 10 – 25 tấn thể trọng), từ 3-5 ngày liên tục. Thuốc sau khi pha xong chỉ nên sử dụng trong vòng 24 giờ.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 4, 5, 1),
(174, 'Kháng viêm Keprofen 10 cho gia súc, heo, chó, mèo', NULL, 45000, 90, 'Điều trị các chứng bệnh có triệu chứng viêm, sưng hoặc sốt có liên quan đến hệ hô hấp, viêm vú, cơ và xương khớp (như viêm cơ, xương khớp) và các chấn thương', 'Không dùng chung với thuốc nhóm non-steroid trước và sau khi cấp thuốc 24 giờ..', 'Ketoprofen ', '3 mg ketoprofen/kg thể trọng/ ngày hay 1 ml KEPROFEN 10%/ 30 kg thể trọng, sử dụng 3 ngày liên tiếp.', 'Tiêm sâu trong cơ hoặc tiêm tĩnh mạch.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 10, 3, 3, 1),
(175, 'Thuốc trị nấm da Ketoconazole dạng viên trên chó', NULL, 45000, 90, 'Điều trị các bệnh truyền nhiễm trên da gây ra bởi Malassezia và dermatophytes trên chó.', 'Không dùng cho thú có khả năng dị ứng (shock)..', 'Ketoconazole', '10mg ketoconazole cho mỗi kg thể trọng', 'Cấp qua đường miệng', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 15, 1, 5, 1),
(176, 'Vaccine Newcastle Bronchitis', NULL, 45000, 90, ' Vaccine giúp phòng bệnh Newcastle và viêm phế quản truyền nhiễm trên gà.', 'Chỉ chủng cho gà khoẻ mạnh..', 'Amoxicillin trihydrate', '1 ml / 18 -20 kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 8, 4, 5, 1),
(177, 'Vaccine nhược độc đa giá Scocvac 4 phòng bệnh cầu trùng ở gà', NULL, 45000, 90, ' Vaccine dùng phòng bệnh cầu trùng cho gà lông màu trên 45 ngày tuổi, gà ta thả vườn, gà hậu bị và gà giống. Sau khi chủng ngừa vaccine 21 ngày, gà sẽ có miễn dịch bảo hộ đầy đủ với bệnh cầu trùng. Miễn dịch bảo hộ kéo dài suốt đời.', 'Không có.', 'E. tenella (chủng PTMZ), E. maxima (chủng PMHY) và E. acervulina (chủng PAHY), E. necatrix (chủng PNHZ).', 'pha vaccine trong 6 lít nước / 1000 gà', 'Chủng ngừa bằng đường uống', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 8, 4, 3, 1),
(178, 'Vaccine nhược độc tam giá Scocvac 3 phòng bệnh cầu trùng ở gà', NULL, 75000, 90, 'Vaccine dùng phòng bệnh cầu trùng cho gà thịt dưới 45 ngày. Sau khi chủng ngừa vaccine 14 ngày, gà đã có miễn dịch bảo hộ với bệnh cầu trùng. Miễn dịch bảo hộ kéo dài đến khi xuất chuồng', 'Không có.', 'E. tenella (chủng PTMZ)', 'pha vaccine trong 6 lít nước / 1000 gà', 'Chủng ngừa bằng đường uống', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 8, 4, 4, 1),
(179, 'XO Save giúp cải thiện hô hấp và lưu thông khí cho gia cầm', NULL, 45000, 90, 'Sản phẩm này làm tăng năng suất vật nuôi và tăng miễn dịch cụ thể là phòng bệnh hô hấp trên gia cầm', 'Không có.', 'Amoxicillin trihydrate', 'Sử dụng cho vật nuôi bằng cách pha 1-2ml/1 lít nước uống.', 'Sử dụng cho vật nuôi bằng cách pha 1-2ml/1 lít nước uống.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 4, 3, 1),
(180, 'Kháng sinh Amoxiguard 15% Injection LA gia súc, chó mèo', NULL, 45000, 90, 'Điều trị các bệnh trên đường tiêu hóa, hô hấp, các bệnh trên da, mô mềm, ngăn ngừa nhiễm trùng hậu phẫu (sử dụng trước khi phẫu thuật) do các vi khuẩn như E. coli, Proteus mirablis, Salmonella spp., Staphylococci (không tự tạo pencillin), Streptococci (không tự tạo pencillin), và Klebsiella pneumonia', 'Không cấp thuốc bằng đường tiêm tĩnh mạch, tiêm não tủy.', 'Amoxicillin trihydrate', ' 15 mg/kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 3, 1),
(181, 'Kháng sinh Amoxivet trị nhiễm trùng gia súc, chó mèo', NULL, 87000, 90, '  Điều trị các bệnh nhiễm trùng trên trâu, bò, heo, cừu, chó và mèo, nguyên nhân gây ra bởi các vi khuẩn gram âm và gram dương nhạy cảm với amoxicilin như: Actinobacillusequuli, Actinomyces bovis, Actinobacillus lignieresi, Bacillusanthracis, Bordetella bronchisep tica, Clostridium spp., Corynebacterium spp., Erysipelothrix rhusi opathiae, Escherichia coli, Fusiformisspp., Haemophilus spp. Morax ella spp., Pasteurella spp., Proteusmirabilis, Salmonella spp., Staphylococci.', 'Không có.', 'Amoxicillin ', '1ml/ 25kg thể trọng; 1 lần/ ngày; 5 ngày', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 3, 1),
(182, 'Kháng sinh Ampi 200 điều trị bệnh viêm ruột', NULL, 50000, 90, ' Phòng và trị các bệnh viêm phổi, tiết niệu, tiêu hóa; Trị nhiễm khuẩn da, mô mềm, áp xe, viêm mô tế bào; Hiệu quả đối với nhiễm trùng da lần đầu và viêm da mũ dai dẳng trên chó, mèo.', 'Không sử dụng cho vật nuôi đang sản xuất sữa thương phẩm.', 'Ampicillin ', '1 ml / 18 -20 kg thể trọng', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 3, 1, 1),
(183, 'Vắc xin Cúm Gia Cầm H5N1 – chủng Re-1', NULL, 55000, 90, 'Vắc xin sử dụng để phòng bệnh Cúm gia cầm H5N1 chủng Re-1.', 'Không có.', 'Amoxicillin trihydrate', 'Vaccine chứa vi-rút cúm gia cầm tái tổ hợp H5N1 chủng Re-1 vô hoạt. Trước khi vô hoạt, hiệu giá HA của dịch niệu nang ≥ 8log2.', 'tiêm dưới da.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 8, 4, 3, 1),
(184, 'Sữa tắm đặt trị ve rận Modern Pet Gel dành cho chó', NULL, 45000, 90, 'Kiểm soát bọ chét, chấy, rận và ve trên chó và chó con trên 12 tuần tuổi.', 'Không có.', 'Permethrin ', '1 ml / 18 -20 kg thể trọng', 'Sử dụng tốt cho những chó giống lớn cả lông ngắn và lông dài.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 1, 1, 7, 1),
(185, 'Petty gel hỗ trợ chức năng gan cho chó mèo', NULL, 45000, 90, 'Hỗ trợ trong thời kỳ phẫu thuật hoặc theo khuyến cáo của bác sỹ thú y.', 'Không có.', 'Vitamin A, Vitamin D3, Vitamin E, Vitamin B1, Vitamin B2, Vitamin B5, Vitamin B6, Vitamin B12, Folic Acid, Ascorbic acid, Taurine, Methionine, Lecithin, Triglyceride, Glucose syrup, Glycerine.', '2 thìa cà phê, ngày 2 lần.', 'Cung cấp qua đường miệng.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 3, 1),
(186, 'THUỐC THÚ Y – VIAQUINO 25', NULL, 66000, 90, 'ĐẶC TRỊ PHÂN NHỚT VÀNG, PHÓ THƯƠNG HÀN GHÉP CẦU TRÙNG HEO.', 'Không có.', 'Enrofloxacin', '1,5ml/5kg TT/ lần, ngày 1-2 lần, dùng 3-5 ngày. Một lần bơm tương ứng 1,5ml.', 'Cho uống trực tiếp hay pha vào nước hoặc sữa cho uống.', '24 tháng kể từ ngày sản xuất', 'Nơi khô, nhiệt độ dưới 30 độ C, tránh ánh sáng!', 9, 2, 3, 1),
(187, 'THUỐC THÚ Y – VIAQUINO 100', NULL, 45000, 90, 'Đặc trị nhiễm trùng do vi khuẩn nhạy cảm với Enrofloxacin trên gia cầm như: bệnh viêm đường hô hấp mãn tính trên ra cầm gây hen nặng (CRD), hen ghép E.coli kết hợp (CCRD), với các biểu hiện: gia cầm khó thở, thở khò khè, khẹc, vảy mỏ, sưng đầu, sưng mặt, kèm theo tiêu chảy phân xanh, phân trắng, phân nhiều nước. Các bệnh thương hàn, bạch lỵ, Coryza trên gia cầm.', 'Không có.', 'Curcumin ', '10mg Enrofloxacin/kgTTgày hay 1ml/10kgTTgày hoặc 1ml/2lit nước.', 'Pha nước uống hoặc trộn thức ăn', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 10, 4, 2, 1),
(188, 'THUỐC THÚ Y DAMONG SPRAY ', NULL, 45000, 90, 'ĐẶC TRỊ NHIỄM TRÙNG DA, CHÂN, MÓNG, VẾT THƯƠNG HỞ ĐẶC TRỊ NHIỄM TRÙNG DA', 'Không có.', 'Thiamphenicol', 'Phun dung dịch trên bề mặt vết thương 1 lần mỗi ngày/trong 3 ngày liên tiếp.', '', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 14, 6, 3, 1),
(189, 'THUỐC THÚ Y DAMONG SPRAY', NULL, 45000, 90, 'ĐẶC TRỊ NẤM DA, MÓNG TRÊN BÒ, DÊ, CỪU, THỎ', 'Không có.', 'Tiabendazole, Thiamphenicol, Curcumin ', 'Phun 1 lầngày', 'Phun đều lên vùng da bị nấm, theo hướng từ bên ngoài đến vùng bị bệnh cho thuốc thấm đều.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 15, 6, 3, 1),
(190, 'THUỐC THÚ Y VIA-CMT', NULL, 78000, 90, 'Dùng kiểm tra và phát hiện sớm hiện tượng viêm vú trên bò sữa. Kết quả có ngay sau 4-5 giây tiết kiệm thời gian lấy mẫu, sau khi thử và chính xác đến 100%.', 'Không có.', 'Fe-Dextran', '5ml sữa 2ml dụng dịch VA – CMT', 'Vệ sinh núm vú bò sạch sẽ, lấy mỗi núm vú bò 5ml sữa vào ngăn đĩa để thử. Nhỏ vào mỗi ngăn đĩa 2ml dụng dịch VA – CMT.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 10, 3, 3, 1),
(191, 'THUỐC THÚ Y VIA FER+B12', NULL, 76000, 90, 'SẮT CAO CẤP, TRỊ THIẾU MÁU, PHÒNG TIÊU CHẢY', 'Không có.', 'Vitamin ', '1-2ml/con', 'Tiêm bắp sâu, 1 liều duy nhất đủ bổ sung hàm lượng sắt cho cơ thể..', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 11, 4, 7, 1),
(192, 'THUỐC THÚ Y – ACHYMOSIN', NULL, 45000, 90, 'TAN ĐỜM, GIẢM DỊCH NHẦY, TIÊU VIÊM, CHỐNG PHÙ NỀ, TIÊU SỢI HUYẾT, PHÁ HUỶ CASEIN VÀ FIBRIN.', 'Không có.', 'Atropin Sulfat', '1ml/2-3 lít nước tương đương 10-15kgTT', 'Hòa nước cho uống theo liều.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 3, 6, 1),
(193, 'THUỐC THÚ Y – ATROPIN MAX', NULL, 45000, 90, 'Hỗ trợ trong thời kỳ phẫu thuật hoặc theo khuyến cáo của bác sỹ thú y.', 'Không có.', 'Atropin Sulfat', '3 – 5 ml/con', 'Tiêm dưới da', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 6, 1),
(194, 'THUỐC THÚ Y – AMPHERAMIN', NULL, 46000, 90, 'ĐẶC TRỊ DỊ ỨNG, NỔI MẨN ĐỎ, PHÁT BAN, SỐT SỮA AN THẦN – CHỐNG SỐC, CO GIẬT, STRESS', 'Không có.', 'Chlorpheniramin maleat', '1ml/35-40kgTT', 'Tiêm bắp hoặc tiêm tĩnh mạch.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 8, 1),
(195, 'THUỐC THÚ Y AZ.KETOPRO', NULL, 45000, 90, 'KHÁNG VIÊM, GIẢM ĐAU, HẠ SỐT NHANH, MẠNH, KHÔNG LÀM MẤT SỮA.', 'Không có.', 'Ketoprofen', '1 ml/33kg TT, ngày 1 lần, trong 1 – 3 ngày.', 'Tiêm sâu bắp thịt hoặc tiêm tĩnh mạch..', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 10, 6, 8, 1),
(196, 'THUỐC THÚ Y – BROMREPSI', NULL, 87000, 90, 'THÔNG THỞ, TIÊU DỊCH NHẦY – HẠ SỐT, CHỐNG VIÊM, PHỤC HỒI CHỨC NĂNG PHỔI', 'Không có.', 'Bromhexine HCl', '2ml/1 lít nước', 'Hòa nước cho uống .', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 4, 9, 1),
(197, 'THUỐC THÚ Y – CARNITOSAL', NULL, 45000, 90, 'TĂNG LỰC CẤP TỐC, TĂNG SỮA – TẠO NẠC, KÍCH THÍCH TĂNG TRỌNG', 'Không có.', 'Butafosfan, Vitamin PP', '1ml/10 – 15kgTT.', 'Tiêm dưới da, tiêm bắp', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 9, 1),
(198, 'THUỐC THÚ Y – CARNITOSAL BÒ SỮA', NULL, 45000, 90, 'KÍCH THÍCH TRAO ĐỔI CHẤT, TĂNG KHÔ – BÉO, SẢN LƯỢNG SỮA, NGỪA BIẾN CHỨNG SAU SINH', 'Không có.', 'Vitamin B9', '20ml/congày.', 'Tiêm dưới da, tiêm bắp hay tiêm tĩnh mạch.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 7, 3, 3, 1),
(199, 'THUỐC THÚ Y DEXASON', NULL, 45000, 90, 'KHÁNG VIÊM, GIẢM ĐAU, CHỐNG DỊ ỨNG', 'Không có.', 'Dexamethasone (phosphat dinatri)', '5 – 10ml/400kgTT.', 'Tiêm bắp, tĩnh mạch, dưới da, trong bao khớp.', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 10, 6, 3, 1),
(200, 'THUỐC THÚ Y AZ GLUCO KC BAMIN', NULL, 45000, 90, 'Hỗ trợ trong thời kỳ phẫu thuật hoặc theo khuyến cáo của bác sỹ thú y.', 'Không có.', 'Calcium glucono glucoheptonate', '1ml/20kgTTgày.', 'Tiêm bắp thịt, liệu trình 3-5 ngày liên tục..', '24 tháng kể từ ngày sản xuất', 'Bảo quản nơi khô ráo thoáng mát (dưới 30°C) tránh ánh sáng trực tiếp.', 9, 6, 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_categories`
--

INSERT INTO `product_categories` (`id`, `categoryName`, `group_id`, `active`) VALUES
(1, 'Dầu tắm thú cưng', 1, 1),
(2, 'Phụ kiện làm đẹp', 1, 1),
(3, 'Vệ sinh sát trùng', 1, 1),
(4, 'Phụ gia thức ăn', 2, 1),
(5, 'Hỗ trợ chức năng', 2, 1),
(6, 'Thức ăn thú cưng', 2, 1),
(7, 'Thức ăn bổ sung', 2, 1),
(8, 'Vắc xin', 3, 1),
(9, 'Kháng sinh', 3, 1),
(10, 'Kháng viêm', 3, 1),
(11, 'Hoocmon', 3, 1),
(12, 'Sát trùng', 3, 1),
(13, 'Vitamins và khoáng', 1, 1),
(14, 'Thuốc trị nội ngoại ký sinh', 1, 1),
(15, 'Thuốc điều trị nấm', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_groups`
--

CREATE TABLE `product_groups` (
  `id` int(11) NOT NULL,
  `groupName` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_groups`
--

INSERT INTO `product_groups` (`id`, `groupName`, `active`) VALUES
(1, 'Chăm sóc thú cưng', 1),
(2, 'Thức ăn chăn nuôi', 1),
(3, 'Thuốc thú y', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_types`
--

CREATE TABLE `product_types` (
  `id` int(11) NOT NULL,
  `type_name` varchar(25) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_types`
--

INSERT INTO `product_types` (`id`, `type_name`, `active`) VALUES
(1, 'Chó', 0),
(2, 'Heo', 0),
(3, 'Gia súc', 0),
(4, 'Gia cầm', 0),
(5, 'Mèo', 0),
(6, 'Khác', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `role_name`) VALUES
(0, 'staff'),
(1, 'user'),
(2, 'admin'),
(3, 'Mod'),
(4, 'Thuan dep trai');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping_info`
--

CREATE TABLE `shipping_info` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(50) NOT NULL,
  `pricePerKg` int(11) NOT NULL,
  `pricePerSize` int(11) NOT NULL,
  `pricePerKm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shipping_info`
--

INSERT INTO `shipping_info` (`id`, `name`, `phone`, `pricePerKg`, `pricePerSize`, `pricePerKm`) VALUES
(1, 'Giao hàng nhanh', '0972087207', 17, 3, 7),
(2, 'Giao hàng tiết kiệm', '0384774118', 16, 3, 5),
(3, 'Lalamove', '0369274066', 18, 3, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping_type`
--

CREATE TABLE `shipping_type` (
  `id` int(11) NOT NULL,
  `type_name` varchar(25) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `info_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shipping_type`
--

INSERT INTO `shipping_type` (`id`, `type_name`, `description`, `info_id`) VALUES
(1, 'Nhanh', 'Giao hàng từ 2-4 ngày', 1),
(2, 'Tiết kiệm', 'Giao hàng từ 7-10 ngày', 2),
(3, 'Hoả tốc', 'Giao hàng trong vòng 24h', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `social_media`
--

CREATE TABLE `social_media` (
  `id` int(11) NOT NULL,
  `facebook` text DEFAULT NULL,
  `instagram` text DEFAULT NULL,
  `twitter` text DEFAULT NULL,
  `pinterest` text DEFAULT NULL,
  `youtube` text DEFAULT NULL,
  `linkedin` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `supplierName` varchar(255) NOT NULL,
  `contactName` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `detail_address` varchar(255) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplierName`, `contactName`, `email`, `phone`, `detail_address`, `imageUrl`, `active`) VALUES
(1, 'Công ty TNHH Công nghệ nano hợp nhất APA', 'apanano', 'support@apanano.com', '0286 292 1224', 'Sài Gòn', 'https://apanano.com/wp-content/uploads/APA-Cover@2x.png', 0),
(2, 'Công ty cổ phần thuốc thú y Trung Ương 5', 'Linh', 'info@fivevet.vn', '024 6653 9878', 'Hà Nội', 'https://fivevet.vn/system/cms/themes/default/images/logo.png', 0),
(3, 'Công ty TNHH Tigervet Việt Nam', 'marphavetcom', 'info@marphavet.com', '0979 899 172', 'Thái Nguyên', 'https://cdn.nhanlucnganhluat.vn/uploads/images/837E314E/logo/2019-10/Logo_Tigervet.jpg', 0),
(4, 'Công ty TNHH thuốc thú y Gấu Vàng', 'gauvang', 'info@gauvang.com.vn', '0901 868 678', 'Long An', 'https://bizweb.dktcdn.net/100/367/359/themes/738633/assets/footer_logo.png?1679275348083', 0),
(5, 'Công ty Liên doanh Bio', 'Việt Nam', 'bio@biopharmachemie.com', '028 3731 3489', 'TPHCM', 'https://cdn1.vieclam24h.vn/images/employer_avatar/2023/09/12/z4686265529605_c4f36c015f6ba57d17961c4a482817b0_169450203397.jpg', 0),
(6, 'Công ty sản xuất thuốc thú y Việt Anh', 'hitech', 'info@hitech.com.vn', '0368 987 654', 'Đà Nẵng', 'https://vietanhviavet.com/wp-content/uploads/2022/11/log_637717089243518829.png', 0),
(7, 'Công ty thuốc thú y Safa', 'safa', 'contact@pharmaplus.com', '0912 345 678', 'Hồ Chí Minh', 'https://phongsachquocphuong.com/thumbs/537x317x2/upload/news/lofo-safa-8359.jpg', 0),
(8, 'Công ty thuốc thú y Marphavet', 'greenlife', 'info@greenlife.com', '024 6688 1122', 'Hà Nội', 'https://i0.wp.com/hoanto.com/wp-content/uploads/2020/02/MPV.png?fit=224%2C225&ssl=1', 0),
(9, 'Công ty CP thuốc thú y Trung Ương Vinavietco', 'pharmacare', 'info@pharmacare.vn', '0905 123 456', 'Quảng Ninh', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-XJdo4UqCCI8FBkOdf6EFhBa0OgxKbWppgY8tO_i1ipFk5Dh2buGH8YQQpgGc5YLTJS8&usqp=CAU', 0),
(10, 'Công ty Greengroup', 'bellecosmetics', 'info@belle.com.vn', '028 3969 7890', 'Bình Dương', 'https://greengroup.com.vn/wp-content/uploads/2023/12/GG-04-e1701675746943.png', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `ward` varchar(100) DEFAULT NULL,
  `detail_address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `login_by` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: normal, 1: google, 2: facebook, 3: twitter, 4: discord, 5: github',
  `login_times` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int(11) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `fullName`, `dateOfBirth`, `city`, `district`, `ward`, `detail_address`, `phone`, `avatar`, `verified`, `login_by`, `login_times`, `role_id`, `date_created`) VALUES
(75, 'namthuan2304', '', NULL, 'Đặng Nam Thuận', NULL, '60', '601', '23236', 'gfdgff', '0384774118', 'https://avatars.githubusercontent.com/u/146423539?v=4', 1, 5, 0, 1, '2024-07-07 20:02:11'),
(76, 'thuanhahahihi', '', NULL, 'Nam Thuận Đặng', NULL, NULL, NULL, NULL, NULL, NULL, 'https://pbs.twimg.com/profile_images/1806013098832384000/BQ8FcjbK_normal.jpg', 1, 3, 0, 1, '2024-07-07 20:02:34'),
(78, 'Đặng Nam', '21130556@st.hcmuaf.edu.vn', NULL, 'Đặng Nam Thuận', NULL, '77', '750', '26578', 'dsdsds', '0987365222', 'https://lh3.googleusercontent.com/a/ACg8ocLRN9ohOUxOWR5xr0fch3t6YlgEXwZEmjDyvtSQUs3bTC-BIsQ=s96-c', 1, 1, 0, 1, '2024-07-07 22:10:27'),
(79, 'namthuan2k3', 'thuandangnam@gmail.com', NULL, 'Southwind', NULL, NULL, NULL, NULL, NULL, NULL, 'c6ae0d72fd50ad23b2b138691677fa15', 1, 4, 0, 1, '2024-07-07 22:11:31'),
(80, '', '21130556@st.hcmuaf.edu.vn', NULL, '', NULL, 'Tỉnh Bình Thuận', 'Huyện Hàm Tân', 'Thị trấn Tân Nghĩa', 'gfdgff', '0987365222', '/uploads/react.png', 1, 2, 0, 1, '2024-07-07 22:15:57'),
(81, 'Rựa', 'dnamthuan@gmail.com', NULL, 'Rựa Đực', NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocIjaL52zPg17MWOLhehbJfci6fABX4ZmdPYZeV1KqKBI5BQPHI=s96-c', 1, 1, 0, 1, '2024-07-07 23:40:26'),
(82, 'chuotcon', '21130556@st.hcmuaf.edu.vn', '$2a$10$6tfZeQ65AEzPXL38uiqO4OwL8N1Nm3XD/W6AcZwFjmN4GnZ9RXFpK', '', NULL, 'Tỉnh Bắc Ninh', 'Huyện Lương Tài', 'Xã Minh Tân', 'bggbgb', 'dsfdddshuoh', '/uploads/NT.jpg', 1, 0, 0, 1, '2024-07-08 02:52:38'),
(83, 'Nam Thuận', 'thuandangnam@gmail.com', NULL, 'Nam Thuận Đặng', NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJrI9-OL0XD1YeUPT5NDzI1NPtgsI4pGQo7jJl9sxnhznJ_Z24=s96-c', 1, 1, 0, 1, '2024-07-14 03:56:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `FK_cart_products` (`product_id`),
  ADD KEY `FK_cart_users` (`user_id`);

--
-- Chỉ mục cho bảng `delivery_address`
--
ALTER TABLE `delivery_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_delivery_address_users` (`user_id`);

--
-- Chỉ mục cho bảng `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- Chỉ mục cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_images_products` (`product_id`);

--
-- Chỉ mục cho bảng `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`user_id`,`discount_id`),
  ADD KEY `fk_inventory_discount` (`discount_id`),
  ADD KEY `fk_inventory_user` (`user_id`) USING BTREE;

--
-- Chỉ mục cho bảng `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_log_level` (`level_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_orders_shipping_type` (`ship_type`),
  ADD KEY `FK_orders_order_status` (`status_id`),
  ADD KEY `FK_orders_delivery_address` (`address_id`),
  ADD KEY `FK_orders_discounts` (`discount_id`),
  ADD KEY `FK_orders_users` (`user_id`) USING BTREE,
  ADD KEY `FK_orders_order_payment` (`payment_id`),
  ADD KEY `FK_orders_admin` (`admin_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_id`,`product_id`) USING BTREE,
  ADD KEY `FK_order_products_products` (`product_id`),
  ADD KEY `FK_order_products_order` (`order_id`) USING BTREE;

--
-- Chỉ mục cho bảng `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products_supplier` (`supplier_id`),
  ADD KEY `FK_products_product_types` (`type_id`),
  ADD KEY `fk_products_categories` (`cate_id`);

--
-- Chỉ mục cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categories_group` (`group_id`);

--
-- Chỉ mục cho bảng `product_groups`
--
ALTER TABLE `product_groups`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shipping_info`
--
ALTER TABLE `shipping_info`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shipping_type`
--
ALTER TABLE `shipping_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_shipping_type_shipping_info` (`info_id`);

--
-- Chỉ mục cho bảng `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__address` (`id`);

--
-- Chỉ mục cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_users_role` (`role_id`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `FK__products` (`product_id`),
  ADD KEY `FK__users` (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `delivery_address`
--
ALTER TABLE `delivery_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=457;

--
-- AUTO_INCREMENT cho bảng `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1584;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `product_groups`
--
ALTER TABLE `product_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `product_types`
--
ALTER TABLE `product_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `shipping_info`
--
ALTER TABLE `shipping_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `FK_cart_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_cart_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `delivery_address`
--
ALTER TABLE `delivery_address`
  ADD CONSTRAINT `FK_delivery_address_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `FK_images_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `fk_inventory_discount` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`),
  ADD CONSTRAINT `fk_inventory_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `FK_log_level` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_orders_admin` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_orders_delivery_address` FOREIGN KEY (`address_id`) REFERENCES `delivery_address` (`id`),
  ADD CONSTRAINT `FK_orders_discounts` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`),
  ADD CONSTRAINT `FK_orders_order_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  ADD CONSTRAINT `FK_orders_order_status` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `FK_orders_shipping_type` FOREIGN KEY (`ship_type`) REFERENCES `shipping_type` (`id`),
  ADD CONSTRAINT `FK_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `FK_order_products_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FK_order_products_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products_product_types` FOREIGN KEY (`type_id`) REFERENCES `product_types` (`id`),
  ADD CONSTRAINT `fk_products_categories` FOREIGN KEY (`cate_id`) REFERENCES `product_categories` (`id`),
  ADD CONSTRAINT `fk_products_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Các ràng buộc cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `fk_categories_group` FOREIGN KEY (`group_id`) REFERENCES `product_groups` (`id`);

--
-- Các ràng buộc cho bảng `shipping_type`
--
ALTER TABLE `shipping_type`
  ADD CONSTRAINT `FK_shipping_type_shipping_info` FOREIGN KEY (`info_id`) REFERENCES `shipping_info` (`id`);

--
-- Các ràng buộc cho bảng `social_media`
--
ALTER TABLE `social_media`
  ADD CONSTRAINT `FK__address` FOREIGN KEY (`id`) REFERENCES `address` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_users_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Các ràng buộc cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `FK__products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK__users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
