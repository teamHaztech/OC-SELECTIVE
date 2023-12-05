-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2023 at 08:06 AM
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
-- Database: `ai_tech_ed`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin', '2023-10-11 02:20:38', '$2y$10$KdZM/std5GUHm1QkLk8AZOQVrcxDnEN82dLn//s4DmHzkCuFnNHbq', '6vNm2gl0tr', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tsp_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extra_question_field`
--

CREATE TABLE `extra_question_field` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation` text DEFAULT NULL,
  `paragraph` text DEFAULT NULL,
  `q_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extra_question_field`
--

INSERT INTO `extra_question_field` (`id`, `conversation`, `paragraph`, `q_id`) VALUES
(1, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 76),
(2, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 77),
(3, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 78),
(4, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 79),
(5, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 80),
(6, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 81),
(7, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 82),
(8, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 83),
(9, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 84),
(10, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 85),
(11, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 86),
(12, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 87),
(13, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 88),
(14, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 89),
(15, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 90),
(16, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 91),
(17, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 92);
INSERT INTO `extra_question_field` (`id`, `conversation`, `paragraph`, `q_id`) VALUES
(18, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 93),
(19, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 94),
(20, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 95),
(21, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 96),
(22, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 97),
(23, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 98),
(24, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 99),
(25, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 100),
(26, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 101),
(27, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 102),
(28, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 103),
(29, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 104),
(30, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 105),
(31, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 106),
(32, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 107),
(33, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 108),
(34, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 109);
INSERT INTO `extra_question_field` (`id`, `conversation`, `paragraph`, `q_id`) VALUES
(35, NULL, 'Read the passage and answer all the questions below: \nAuroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 110),
(36, NULL, 'Auroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 111),
(37, NULL, 'Auroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 112),
(38, NULL, 'Auroras- Beautiful Displays in the Sky\nAuroras, typically referred to as the Northern Lights (Aurora Borealis) and Southern Lights (Aurora Australis), are beautiful displays in the sky, commonly observable in the polar areas. These magnificent light displays are produced due to the interactions between the Earth’s magnetic field and the solar wind. The solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space. When charged solar wind particles reach Earth\'s magnetic field, they hit with atmospheric atoms and molecules.\nThe kinetic energy contained inside the electrons of the particles is turned to light by the collisions, which result in quantum leaps. The collisions of different particles produce different colored lights. For instance, atomic oxygen emits red and green light, whereas neon emits rippling orange light, and nitrogen emits pink, blue, or violet light. Auroras can take on a wide variety of shapes, including arcs, swirls, \"curtains,\" and illuminating formations, which frequently seem to be moving.\nAuroras are usually formed by geomagnetic storms. The transient disruption of the Earth\'s magnetic field caused by an extraterrestrial occurrence, such as a solar flare or coronal mass ejection (the ejection of charged particles from the sun\'s corona), is known as a geomagnetic storm. Auroras are best observable well north or south of where they occur during unique geomagnetic storms. \nOne of the most famous displays of Auroras in history is the renowned Great Geomagnetic Storms of 1859. These storms generated the most extraordinary auroras humans have ever seen, which were observed all throughout Australia, Japan, and the United States of America and stayed in the skies for over a week. From Earth\'s orbit, satellites can photograph the aurora, and the results are rather stunning. In fact, auroras are so bright that they would be clearly visible on Earth\'s nightside even if one were viewing them from another planet.\nThe orbit of the International Space Station is so inclined that it even passes past the celestial lights. Due to the low density of charged particles, most of the time, no one is aware. According to Rodney Viereck, director of the National Oceanic and Atmospheric Administration\'s (NOAA) Space Weather Prediction Test Bed, the only time it matters is during exceptionally powerful solar storms when radiation levels are high. When this occurs, all the astronauts must relocate to a safer area of the station. \n\nIronically, because of how charged particles interact with the Earth\'s magnetic field during powerful solar storms, the radiation level around the space station can actually decrease. In the meanwhile, ISS astronauts can take stunning auroral photographs.', 113);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_name` varchar(40) NOT NULL,
  `image_url` varchar(150) NOT NULL,
  `tsc_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images_names`
--

CREATE TABLE `images_names` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image_name` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `non_verbal_question`
--

CREATE TABLE `non_verbal_question` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `option_1` varchar(40) NOT NULL,
  `option_2` varchar(40) NOT NULL,
  `option_3` varchar(40) NOT NULL,
  `option_4` varchar(40) NOT NULL,
  `option_5` varchar(40) DEFAULT NULL,
  `correct_option` int(11) NOT NULL,
  `explanation` text NOT NULL,
  `tst_id` bigint(20) UNSIGNED NOT NULL,
  `marks` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` mediumtext NOT NULL,
  `option_1` varchar(255) NOT NULL,
  `option_2` varchar(255) NOT NULL,
  `option_3` varchar(255) NOT NULL,
  `option_4` varchar(255) NOT NULL,
  `option_5` varchar(255) DEFAULT NULL,
  `correct_option` varchar(11) NOT NULL,
  `explanation` mediumtext DEFAULT NULL,
  `tst_id` bigint(20) UNSIGNED NOT NULL,
  `marks` varchar(255) DEFAULT NULL,
  `nvq` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `question`, `option_1`, `option_2`, `option_3`, `option_4`, `option_5`, `correct_option`, `explanation`, `tst_id`, `marks`, `nvq`, `status`) VALUES
(1, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_1.png', '/NVImages/oImage/option_B_1.png', '/NVImages/oImage/option_C_1.png', '/NVImages/oImage/option_D_1.png', NULL, '3', NULL, 1, NULL, 1, 1),
(2, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_2.png', '/NVImages/oImage/option_B_2.png', '/NVImages/oImage/option_C_2.png', '/NVImages/oImage/option_D_2.png', NULL, '1', NULL, 1, NULL, 1, 1),
(3, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_3.png', '/NVImages/oImage/option_B_3.png', '/NVImages/oImage/option_C_3.png', '/NVImages/oImage/option_D_3.png', NULL, '3', NULL, 1, NULL, 1, 1),
(4, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_4.png', '/NVImages/oImage/option_B_4.png', '/NVImages/oImage/option_C_4.png', '/NVImages/oImage/option_D_4.png', NULL, '3', NULL, 1, NULL, 1, 1),
(5, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_5.png', '/NVImages/oImage/option_B_5.png', '/NVImages/oImage/option_C_5.png', '/NVImages/oImage/option_D_5.png', NULL, '4', NULL, 1, NULL, 1, 1),
(6, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_6.png', '/NVImages/oImage/option_B_6.png', '/NVImages/oImage/option_C_6.png', '/NVImages/oImage/option_D_6.png', NULL, '4', NULL, 1, NULL, 1, 1),
(7, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_7.png', '/NVImages/oImage/option_B_7.png', '/NVImages/oImage/option_C_7.png', '/NVImages/oImage/option_D_7.png', NULL, '2', NULL, 1, NULL, 1, 1),
(8, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_8.png', '/NVImages/oImage/option_B_8.png', '/NVImages/oImage/option_C_8.png', '/NVImages/oImage/option_D_8.png', NULL, '3', NULL, 1, NULL, 1, 1),
(9, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_9.png', '/NVImages/oImage/option_B_9.png', '/NVImages/oImage/option_C_9.png', '/NVImages/oImage/option_D_9.png', NULL, '3', NULL, 1, NULL, 1, 1),
(10, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_10.png', '/NVImages/oImage/option_B_10.png', '/NVImages/oImage/option_C_10.png', '/NVImages/oImage/option_D_10.png', NULL, '2', NULL, 1, NULL, 1, 1),
(11, 'How many dots lie opposite to the face having two dots, when the given figure is folded to form a cube?', 'three', 'five', 'six', 'four', NULL, '2', NULL, 1, NULL, 1, 1),
(12, 'How many dots lie opposite to the face having five dots, when the given figure is folded to form a cube?', 'two', 'six', 'three', 'one', NULL, '2', NULL, 1, NULL, 1, 1),
(13, 'How many dots lie opposite to the face having five dots, when the given figure is folded to form a cube?', 'two', 'one', 'four', 'six', NULL, '1', NULL, 1, NULL, 1, 1),
(14, 'How many dots lie opposite to the face having three dots, when the given figure is folded to form a cube?', 'six', 'four', 'one', 'five', NULL, '2', NULL, 1, NULL, 1, 1),
(15, 'How many dots lie opposite to the face having two dots, when the given figure is folded to form a cube?', 'three', 'five', 'six', 'one', NULL, '3', NULL, 1, NULL, 1, 1),
(16, 'What will be the number at the bottom, if 6 is at the top; the two positions of the dice being as given below:', '5', '1', '4', '3', NULL, '4', NULL, 1, NULL, 1, 1),
(17, 'What number is opposite 5 in the figure shown below? The given two positions are of the same dice whose each surface bears a number among 1, 2, 3, 4, 5 and 6.', '3', '6', '2', '1', NULL, '1', NULL, 1, NULL, 1, 1),
(18, 'What will be the number at the bottom, if 1 is at the top; the two positions of the dice being as given below:', '4', '2', '5', '3', NULL, '4', NULL, 1, NULL, 1, 1),
(19, 'What will be the number at the bottom, if 5 is at the top; the two positions of the dice being as given below:', '2', '4', '3', '6', NULL, '2', NULL, 1, NULL, 1, 1),
(20, 'What will be the number at the bottom, if 2 is at the top; the two positions of the dice being as given below:', '6', '3', '1', '5', NULL, '2', NULL, 1, NULL, 1, 1),
(21, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_21.png', '/NVImages/oImage/option_B_21.png', '/NVImages/oImage/option_C_21.png', '/NVImages/oImage/option_D_21.png', NULL, '4', NULL, 2, NULL, 1, 1),
(22, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_22.png', '/NVImages/oImage/option_B_22.png', '/NVImages/oImage/option_C_22.png', '/NVImages/oImage/option_D_22.png', NULL, '2', NULL, 2, NULL, 1, 1),
(23, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_23.png', '/NVImages/oImage/option_B_23.png', '/NVImages/oImage/option_C_23.png', '/NVImages/oImage/option_D_23.png', NULL, '4', NULL, 2, NULL, 1, 1),
(24, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_24.png', '/NVImages/oImage/option_B_24.png', '/NVImages/oImage/option_C_24.png', '/NVImages/oImage/option_D_24.png', NULL, '2', NULL, 2, NULL, 1, 1),
(25, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_25.png', '/NVImages/oImage/option_B_25.png', '/NVImages/oImage/option_C_25.png', '/NVImages/oImage/option_D_25.png', NULL, '2', NULL, 2, NULL, 1, 1),
(26, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_26.png', '/NVImages/oImage/option_B_26.png', '/NVImages/oImage/option_C_26.png', '/NVImages/oImage/option_D_26.png', NULL, '2', NULL, 2, NULL, 1, 1),
(27, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_27.png', '/NVImages/oImage/option_B_27.png', '/NVImages/oImage/option_C_27.png', '/NVImages/oImage/option_D_27.png', NULL, '1', NULL, 2, NULL, 1, 1),
(28, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_28.png', '/NVImages/oImage/option_B_28.png', '/NVImages/oImage/option_C_28.png', '/NVImages/oImage/option_D_28.png', NULL, '2', NULL, 2, NULL, 1, 1),
(29, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_29.png', '/NVImages/oImage/option_B_29.png', '/NVImages/oImage/option_C_29.png', '/NVImages/oImage/option_D_29.png', NULL, '1', NULL, 2, NULL, 1, 1),
(30, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_30.png', '/NVImages/oImage/option_B_30.png', '/NVImages/oImage/option_C_30.png', '/NVImages/oImage/option_D_30.png', NULL, '4', NULL, 2, NULL, 1, 1),
(31, 'How many dots lie opposite to the face having two dots, when the given figure is folded to form a cube?', 'three', 'five', 'six', 'four', NULL, '1', NULL, 2, NULL, 1, 1),
(32, 'How many dots lie opposite to the face having one dots, when the given figure is folded to form a cube?', 'six', 'five', 'three', 'four', NULL, '4', NULL, 2, NULL, 1, 1),
(33, 'How many dots lie opposite to the face having four dots, when the given figure is folded to form a cube?', 'one', 'two', 'six', 'three', NULL, '2', NULL, 2, NULL, 1, 1),
(34, 'How many dots lie opposite to the face having three dots, when the given figure is folded to form a cube?', 'one', 'six', 'four', 'five', NULL, '4', NULL, 2, NULL, 1, 1),
(35, 'How many dots lie opposite to the face having one dots, when the given figure is folded to form a cube?', 'six', 'four', 'five', 'two', NULL, '4', NULL, 2, NULL, 1, 1),
(36, 'What number is opposite 4 in the figure shown below? The given two positions are of the same dice whose each surface bears a number among 1, 2, 3, 4, 5 and 6.', '1', '3', '6', '5', NULL, '2', NULL, 2, NULL, 1, 1),
(37, 'What number is opposite 2 in the figure shown below? The given two positions are of the same dice whose each surface bears a number among 1, 2, 3, 4, 5 and 6.', '5', '4', '1', '6', NULL, '4', NULL, 2, NULL, 1, 1),
(38, 'What number is opposite four in the figure shown below? The given two positions are of the same dice whose each surface bears a number among one, two, three, four, six', 'three', 'two', 'five', 'six', NULL, '4', NULL, 2, NULL, 1, 1),
(39, 'Two positions of a dice are shown below. Identify the number at the bottom when the top is 1?', '4', '3', '5', '6', NULL, '1', NULL, 2, NULL, 1, 1),
(40, 'What number is opposite 3 in the figure shown below? The given two positions are of the same dice whose each surface bears a number among 1, 2, 3, 4, 5 and 6.', '6', '1', '4', '2', NULL, '2', NULL, 2, NULL, 1, 1),
(76, 'What is the best definition of the word \"emit\" as used in the sentence below?\n\nThe solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space.', 'grew', 'spun', 'taken from', 'released', NULL, '3', 'check the option C as correct answer', 5, NULL, 0, 1),
(77, 'Where would one be MOST likely to view the Aurora Borealis?', 'Sun', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 5, NULL, 0, 1),
(78, 'Where would one be MOST likely to view the Aurora Borealis?', 'Sun', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 5, NULL, 0, 1),
(79, 'Where would one be MOST likely to view the Aurora Borealis?', 'Sun', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 5, NULL, 0, 1),
(80, 'Where would one be MOST likely to view the Aurora Borealis?', 'Sun', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 5, NULL, 0, 1),
(81, 'What is the best definition of the word \"emit\" as used in the sentence below?\n\nThe solar wind, which may reach speeds of up to 400 miles per second, is a torrent of charged particles that the sun\'s corona emits into space.', 'grew', 'spun', 'taken from', 'released', NULL, '3', 'check the option C as correct answer', 6, NULL, 0, 1),
(82, 'Where would one be MOST likely to view the Aurora Borealis?', 'Sun', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(83, 'Where would one be MOST likely to view the Aurora Borealis?', 'Sun', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(84, 'Where would one be MOST likely to view the Aurora Borealis?', 'Sun', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(85, 'Where would one be MOST likely to view the Aurora Borealis?', 'Sun', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(86, 'Where would one be MOST likely to view the Aurora Borealis?', 'Mon', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(87, 'Where would one be MOST likely to view the Aurora Borealis?', 'Tue', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(88, 'Where would one be MOST likely to view the Aurora Borealis?', 'Wed', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(89, 'Where would one be MOST likely to view the Aurora Borealis?', 'Thu', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(90, 'Where would one be MOST likely to view the Aurora Borealis?', 'Fri', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(91, 'Where would one be MOST likely to view the Aurora Borealis?', 'Sat', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(92, 'Where would one be MOST likely to view the Aurora Borealis?', 'Sun', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(93, 'Where would one be MOST likely to view the Aurora Borealis?', 'Mon', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(94, 'Where would one be MOST likely to view the Aurora Borealis?', 'Tue', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(95, 'Where would one be MOST likely to view the Aurora Borealis?', 'Wed', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(96, 'Where would one be MOST likely to view the Aurora Borealis?', 'Thu', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(97, 'Where would one be MOST likely to view the Aurora Borealis?', 'Fri', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(98, 'Where would one be MOST likely to view the Aurora Borealis?', 'Sat', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(99, 'Where would one be MOST likely to view the Aurora Borealis?', 'Sun', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(100, 'Where would one be MOST likely to view the Aurora Borealis?', 'Mon', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(101, 'Where would one be MOST likely to view the Aurora Borealis?', 'Tue', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(102, 'Where would one be MOST likely to view the Aurora Borealis?', 'Wed', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(103, 'Where would one be MOST likely to view the Aurora Borealis?', 'Thu', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(104, 'Where would one be MOST likely to view the Aurora Borealis?', 'Fri', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(105, 'Where would one be MOST likely to view the Aurora Borealis?', 'Sat', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(106, 'Where would one be MOST likely to view the Aurora Borealis?', 'Sun', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(107, 'Where would one be MOST likely to view the Aurora Borealis?', 'Mon', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(108, 'Where would one be MOST likely to view the Aurora Borealis?', 'Tue', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(109, 'Where would one be MOST likely to view the Aurora Borealis?', 'Wed', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(110, 'Where would one be MOST likely to view the Aurora Borealis?', 'Thu', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(111, 'Where would one be MOST likely to view the Aurora Borealis?', 'Fri', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(112, 'Where would one be MOST likely to view the Aurora Borealis?', 'Sat', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(113, 'Where would one be MOST likely to view the Aurora Borealis?', 'Sun', 'north pole', 'north and south pole', 'equator', NULL, '4', 'equator is the correct option', 6, NULL, 0, 1),
(114, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_41.png', '/NVImages/oImage/option_B_41.png', '/NVImages/oImage/option_C_41.png', '/NVImages/oImage/option_D_41.png', NULL, '4', NULL, 7, NULL, 1, 1),
(115, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_42.png', '/NVImages/oImage/option_B_42.png', '/NVImages/oImage/option_C_42.png', '/NVImages/oImage/option_D_42.png', NULL, '3', NULL, 7, NULL, 1, 1),
(116, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_43.png', '/NVImages/oImage/option_B_43.png', '/NVImages/oImage/option_C_43.png', '/NVImages/oImage/option_D_43.png', NULL, '4', NULL, 7, NULL, 1, 1),
(117, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_44.png', '/NVImages/oImage/option_B_44.png', '/NVImages/oImage/option_C_44.png', '/NVImages/oImage/option_D_44.png', NULL, '3', NULL, 7, NULL, 1, 1),
(118, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_45.png', '/NVImages/oImage/option_B_45.png', '/NVImages/oImage/option_C_45.png', '/NVImages/oImage/option_D_45.png', NULL, '4', NULL, 7, NULL, 1, 1),
(119, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_46.png', '/NVImages/oImage/option_B_46.png', '/NVImages/oImage/option_C_46.png', '/NVImages/oImage/option_D_46.png', NULL, '4', NULL, 7, NULL, 1, 1),
(120, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_47.png', '/NVImages/oImage/option_B_47.png', '/NVImages/oImage/option_C_47.png', '/NVImages/oImage/option_D_47.png', NULL, '2', NULL, 7, NULL, 1, 1),
(121, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_48.png', '/NVImages/oImage/option_B_48.png', '/NVImages/oImage/option_C_48.png', '/NVImages/oImage/option_D_48.png', NULL, '3', NULL, 7, NULL, 1, 1),
(122, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_49.png', '/NVImages/oImage/option_B_49.png', '/NVImages/oImage/option_C_49.png', '/NVImages/oImage/option_D_49.png', NULL, '3', NULL, 7, NULL, 1, 1),
(123, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_50.png', '/NVImages/oImage/option_B_50.png', '/NVImages/oImage/option_C_50.png', '/NVImages/oImage/option_D_50.png', NULL, '3', NULL, 7, NULL, 1, 1),
(124, 'How many dots lie opposite to the face having four dots, when the given figure is folded to form a cube?', 'three', 'one', 'two', 'five', NULL, '1', NULL, 7, NULL, 1, 1),
(125, 'How many dots lie opposite to the face having three dots, when the given figure is folded to form a cube?', 'two', 'four', 'one', 'five', NULL, '1', NULL, 7, NULL, 1, 1),
(126, 'How many dots lie opposite to the face having six dots, when the given figure is folded to form a cube?', 'one', 'five', 'three', 'four', NULL, '2', NULL, 7, NULL, 1, 1),
(127, 'How many dots lie opposite to the face having four dots, when the given figure is folded to form a cube?', 'one', 'three', 'two', 'five', NULL, '3', NULL, 7, NULL, 1, 1),
(128, 'How many dots lie opposite to the face having two dots, when the given figure is folded to form a cube?', 'five', 'six', 'four', 'three', NULL, '1', NULL, 7, NULL, 1, 1),
(129, 'What will be the number at the bottom, if five is at the top; the two positions of the dice being as given below:', 'three', 'six', 'two', 'one', NULL, '2', NULL, 7, NULL, 1, 1),
(130, 'What will be the number at the bottom, if 6 is at the top; the two positions of the dice being as given below:', '2', '3', '1', '4', NULL, '2', NULL, 7, NULL, 1, 1),
(131, 'What number is opposite 5 in the figure shown below? The given two positions are of the same dice whose each surface bears a number among 1, 2, 3, 4, 5 and 6.', '1', '6', '2', '3', NULL, '2', NULL, 7, NULL, 1, 1),
(132, 'What number is opposite five in the figure shown below? The given two positions are of the same dice whose each surface bears a number among one, two, three, four, six', 'one', 'three', 'six', 'four', NULL, '4', NULL, 7, NULL, 1, 1),
(133, 'What number is opposite one in the figure shown below? The given two positions are of the same dice whose each surface bears a number among one, two, three, four, six', 'six', 'three', 'five', 'two', NULL, '4', NULL, 7, NULL, 1, 1),
(134, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_61.png', '/NVImages/oImage/option_B_61.png', '/NVImages/oImage/option_C_61.png', '/NVImages/oImage/option_D_61.png', NULL, '3', NULL, 8, NULL, 1, 1),
(135, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_62.png', '/NVImages/oImage/option_B_62.png', '/NVImages/oImage/option_C_62.png', '/NVImages/oImage/option_D_62.png', NULL, '3', NULL, 8, NULL, 1, 1),
(136, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_63.png', '/NVImages/oImage/option_B_63.png', '/NVImages/oImage/option_C_63.png', '/NVImages/oImage/option_D_63.png', NULL, '4', NULL, 8, NULL, 1, 1),
(137, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_64.png', '/NVImages/oImage/option_B_64.png', '/NVImages/oImage/option_C_64.png', '/NVImages/oImage/option_D_64.png', NULL, '2', NULL, 8, NULL, 1, 1),
(138, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_65.png', '/NVImages/oImage/option_B_65.png', '/NVImages/oImage/option_C_65.png', '/NVImages/oImage/option_D_65.png', NULL, '2', NULL, 8, NULL, 1, 1),
(139, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_66.png', '/NVImages/oImage/option_B_66.png', '/NVImages/oImage/option_C_66.png', '/NVImages/oImage/option_D_66.png', NULL, '4', NULL, 8, NULL, 1, 1),
(140, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_67.png', '/NVImages/oImage/option_B_67.png', '/NVImages/oImage/option_C_67.png', '/NVImages/oImage/option_D_67.png', NULL, '3', NULL, 8, NULL, 1, 1),
(141, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_68.png', '/NVImages/oImage/option_B_68.png', '/NVImages/oImage/option_C_68.png', '/NVImages/oImage/option_D_68.png', NULL, '1', NULL, 8, NULL, 1, 1),
(142, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_69.png', '/NVImages/oImage/option_B_69.png', '/NVImages/oImage/option_C_69.png', '/NVImages/oImage/option_D_69.png', NULL, '3', NULL, 8, NULL, 1, 1),
(143, 'You are required to determine which of the cubes could be formed by folding the following figure:', '/NVImages/oImage/option_A_70.png', '/NVImages/oImage/option_B_70.png', '/NVImages/oImage/option_C_70.png', '/NVImages/oImage/option_D_70.png', NULL, '3', NULL, 8, NULL, 1, 1),
(144, 'How many dots lie opposite to the face having four dots, when the given figure is folded to form a cube?', 'six', 'three', 'five', 'one', NULL, '4', NULL, 8, NULL, 1, 1),
(145, 'How many dots lie opposite to the face having two dots, when the given figure is folded to form a cube?', 'six', 'three', 'five', 'four', NULL, '1', NULL, 8, NULL, 1, 1),
(146, 'How many dots lie opposite to the face having six dots, when the given figure is folded to form a cube?', 'two', 'three', 'five', 'one', NULL, '1', NULL, 8, NULL, 1, 1),
(147, 'How many dots lie opposite to the face having two dots, when the given figure is folded to form a cube?', 'three', 'five', 'four', 'one', NULL, '1', NULL, 8, NULL, 1, 1),
(148, 'How many dots lie opposite to the face having two dots, when the given figure is folded to form a cube?', 'three', 'four', 'six', 'five', NULL, '3', NULL, 8, NULL, 1, 1),
(149, 'What number is opposite two in the figure shown below? The given two positions are of the same dice whose each surface bears a number among one, two, three, four, six', 'six', 'five', 'three', 'one', NULL, '3', NULL, 8, NULL, 1, 1),
(150, 'What number is opposite 5 in the figure shown below? The given two positions are of the same dice whose each surface bears a number among 1, 2, 3, 4, 5 and 6.', '2', '6', '3', '1', NULL, '2', NULL, 8, NULL, 1, 1),
(151, 'What will be the number at the bottom, if four is at the top; the two positions of the dice being as given below:', 'two', 'three', 'six', 'five', NULL, '4', NULL, 8, NULL, 1, 1),
(152, 'Two positions of a dice are shown below. Identify the number at the bottom when the top is 1?', '2', '6', '5', '3', NULL, '1', NULL, 8, NULL, 1, 1),
(153, 'What number is opposite six in the figure shown below? The given two positions are of the same dice whose each surface bears a number among one, two, three, four, six', 'four', 'one', 'two', 'five', NULL, '2', NULL, 8, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `question_image`
--

CREATE TABLE `question_image` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `q_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question_image`
--

INSERT INTO `question_image` (`id`, `image_url`, `q_id`) VALUES
(1, '/NVImages/qImage/q_image_1.png', 1),
(2, '/NVImages/qImage/q_image_2.png', 2),
(3, '/NVImages/qImage/q_image_3.png', 3),
(4, '/NVImages/qImage/q_image_4.png', 4),
(5, '/NVImages/qImage/q_image_5.png', 5),
(6, '/NVImages/qImage/q_image_6.png', 6),
(7, '/NVImages/qImage/q_image_7.png', 7),
(8, '/NVImages/qImage/q_image_8.png', 8),
(9, '/NVImages/qImage/q_image_9.png', 9),
(10, '/NVImages/qImage/q_image_10.png', 10),
(11, '/NVImages/qImage/q_image_11.png', 11),
(12, '/NVImages/qImage/q_image_12.png', 12),
(13, '/NVImages/qImage/q_image_13.png', 13),
(14, '/NVImages/qImage/q_image_14.png', 14),
(15, '/NVImages/qImage/q_image_15.png', 15),
(16, '/NVImages/qImage/q_image_16.png', 16),
(17, '/NVImages/qImage/q_image_17.png', 17),
(18, '/NVImages/qImage/q_image_18.png', 18),
(19, '/NVImages/qImage/q_image_19.png', 19),
(20, '/NVImages/qImage/q_image_20.png', 20),
(21, '/NVImages/qImage/q_image_21.png', 21),
(22, '/NVImages/qImage/q_image_22.png', 22),
(23, '/NVImages/qImage/q_image_23.png', 23),
(24, '/NVImages/qImage/q_image_24.png', 24),
(25, '/NVImages/qImage/q_image_25.png', 25),
(26, '/NVImages/qImage/q_image_26.png', 26),
(27, '/NVImages/qImage/q_image_27.png', 27),
(28, '/NVImages/qImage/q_image_28.png', 28),
(29, '/NVImages/qImage/q_image_29.png', 29),
(30, '/NVImages/qImage/q_image_30.png', 30),
(31, '/NVImages/qImage/q_image_31.png', 31),
(32, '/NVImages/qImage/q_image_32.png', 32),
(33, '/NVImages/qImage/q_image_33.png', 33),
(34, '/NVImages/qImage/q_image_34.png', 34),
(35, '/NVImages/qImage/q_image_35.png', 35),
(36, '/NVImages/qImage/q_image_36.png', 36),
(37, '/NVImages/qImage/q_image_37.png', 37),
(38, '/NVImages/qImage/q_image_38.png', 38),
(39, '/NVImages/qImage/q_image_39.png', 39),
(40, '/NVImages/qImage/q_image_40.png', 40),
(61, '/NVImages/qImage/q_image_41.png', 114),
(62, '/NVImages/qImage/q_image_42.png', 115),
(63, '/NVImages/qImage/q_image_43.png', 116),
(64, '/NVImages/qImage/q_image_44.png', 117),
(65, '/NVImages/qImage/q_image_45.png', 118),
(66, '/NVImages/qImage/q_image_46.png', 119),
(67, '/NVImages/qImage/q_image_47.png', 120),
(68, '/NVImages/qImage/q_image_48.png', 121),
(69, '/NVImages/qImage/q_image_49.png', 122),
(70, '/NVImages/qImage/q_image_50.png', 123),
(71, '/NVImages/qImage/q_image_51.png', 124),
(72, '/NVImages/qImage/q_image_52.png', 125),
(73, '/NVImages/qImage/q_image_53.png', 126),
(74, '/NVImages/qImage/q_image_54.png', 127),
(75, '/NVImages/qImage/q_image_55.png', 128),
(76, '/NVImages/qImage/q_image_56.png', 129),
(77, '/NVImages/qImage/q_image_57.png', 130),
(78, '/NVImages/qImage/q_image_58.png', 131),
(79, '/NVImages/qImage/q_image_59.png', 132),
(80, '/NVImages/qImage/q_image_60.png', 133),
(81, '/NVImages/qImage/q_image_61.png', 134),
(82, '/NVImages/qImage/q_image_62.png', 135),
(83, '/NVImages/qImage/q_image_63.png', 136),
(84, '/NVImages/qImage/q_image_64.png', 137),
(85, '/NVImages/qImage/q_image_65.png', 138),
(86, '/NVImages/qImage/q_image_66.png', 139),
(87, '/NVImages/qImage/q_image_67.png', 140),
(88, '/NVImages/qImage/q_image_68.png', 141),
(89, '/NVImages/qImage/q_image_69.png', 142),
(90, '/NVImages/qImage/q_image_70.png', 143),
(91, '/NVImages/qImage/q_image_71.png', 144),
(92, '/NVImages/qImage/q_image_72.png', 145),
(93, '/NVImages/qImage/q_image_73.png', 146),
(94, '/NVImages/qImage/q_image_74.png', 147),
(95, '/NVImages/qImage/q_image_75.png', 148),
(96, '/NVImages/qImage/q_image_76.png', 149),
(97, '/NVImages/qImage/q_image_77.png', 150),
(98, '/NVImages/qImage/q_image_78.png', 151),
(99, '/NVImages/qImage/q_image_79.png', 152),
(100, '/NVImages/qImage/q_image_80.png', 153);

-- --------------------------------------------------------

--
-- Table structure for table `reading_question`
--

CREATE TABLE `reading_question` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `option_1` varchar(40) NOT NULL,
  `option_2` varchar(40) NOT NULL,
  `option_3` varchar(40) NOT NULL,
  `option_4` varchar(40) NOT NULL,
  `option_5` varchar(40) DEFAULT NULL,
  `correct_option` int(11) NOT NULL,
  `explanation` text NOT NULL,
  `tst_id` bigint(20) UNSIGNED NOT NULL,
  `marks` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `set_question`
--

CREATE TABLE `set_question` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `q_id` bigint(20) UNSIGNED DEFAULT NULL,
  `set_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `set_question`
--

INSERT INTO `set_question` (`id`, `q_id`, `set_id`) VALUES
(1, 76, 1),
(2, 77, 1),
(3, 78, 1),
(4, 79, 1),
(5, 80, 1),
(6, 4, 2),
(7, 18, 2),
(8, 15, 2),
(9, 21, 2),
(10, 3, 2),
(11, 1, 2),
(12, 31, 2),
(13, 38, 2),
(14, 16, 2),
(15, 24, 2),
(16, 36, 2),
(17, 40, 2),
(18, 20, 2),
(19, 26, 2),
(20, 17, 2),
(21, 35, 2),
(22, 10, 2),
(23, 8, 2),
(24, 25, 2),
(25, 34, 2),
(26, 32, 2),
(27, 2, 2),
(28, 33, 2),
(29, 30, 2),
(30, 5, 2),
(31, 9, 2),
(32, 7, 2),
(33, 28, 2),
(34, 37, 2),
(35, 22, 2),
(36, 14, 2),
(37, 6, 2),
(38, 23, 2),
(39, 29, 2),
(40, 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `test_series`
--

CREATE TABLE `test_series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `test_type` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_series`
--

INSERT INTO `test_series` (`id`, `test_type`) VALUES
(1, 'OC'),
(2, 'Selective');

-- --------------------------------------------------------

--
-- Table structure for table `test_series_categories`
--

CREATE TABLE `test_series_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tsc_type` varchar(40) NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_series_categories`
--

INSERT INTO `test_series_categories` (`id`, `tsc_type`, `duration`) VALUES
(1, 'Maths', 30),
(2, 'Reading', 45),
(3, 'Thinking', 35);

-- --------------------------------------------------------

--
-- Table structure for table `test_series_product`
--

CREATE TABLE `test_series_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `p_name` varchar(40) NOT NULL,
  `p_description` text NOT NULL,
  `p_price` varchar(11) NOT NULL,
  `p_image` varchar(100) DEFAULT NULL,
  `ts_id` bigint(20) UNSIGNED NOT NULL,
  `test_month_limit` int(11) NOT NULL,
  `total_question` int(11) NOT NULL,
  `release_date` varchar(40) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_series_product`
--

INSERT INTO `test_series_product` (`id`, `p_name`, `p_description`, `p_price`, `p_image`, `ts_id`, `test_month_limit`, `total_question`, `release_date`, `status`) VALUES
(1, 'OC Test Package - 1', 'reading only', '29', '/images/product-1697018430.png', 1, 3, 35, '2023-10-09', 1),
(2, 'selective Test Package - 2', 'adad', '29', '/images/product-1697045711.png', 1, 3, 35, '2023-10-10', 1),
(4, 'OC Package - 2', 'sssssss', '22', NULL, 1, 3, 35, '2023-10-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `test_series_purchases`
--

CREATE TABLE `test_series_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tsp_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `valid_from` varchar(50) NOT NULL,
  `valid_till` varchar(50) NOT NULL,
  `order_id` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_series_purchases`
--

INSERT INTO `test_series_purchases` (`id`, `tsp_id`, `user_id`, `valid_from`, `valid_till`, `order_id`, `status`) VALUES
(1, 1, 2, '2023-10-11', '2024-01-11', '', 1),
(10, 4, 2, '2023-10-14', '2024-01-14', '7DP80790SY834551P', 1);

-- --------------------------------------------------------

--
-- Table structure for table `test_series_topics`
--

CREATE TABLE `test_series_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `t_name` varchar(40) NOT NULL,
  `topic` varchar(40) NOT NULL,
  `tsc_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `nv_topic` tinyint(4) NOT NULL DEFAULT 0,
  `ts_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_series_topics`
--

INSERT INTO `test_series_topics` (`id`, `t_name`, `topic`, `tsc_id`, `status`, `nv_topic`, `ts_id`) VALUES
(1, 'Cube and Dice - 1', 'Cubes & Dice', 1, 1, 1, 1),
(2, 'cube and dice - 2', 'Cubes & Dice', 1, 1, 1, 1),
(5, 'Reading Easy 1', 'Reading Easy 1', 2, 1, 0, 1),
(6, 'Reading Easy 2', 'Reading', 2, 1, 0, 1),
(7, 'cube and dice - 4', 'Cubes & Dice', 1, 1, 1, 1),
(8, 'cube and dice 6', 'Cubes & Dice', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `test_status`
--

CREATE TABLE `test_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_status`
--

INSERT INTO `test_status` (`id`, `type`) VALUES
(1, 'Answered'),
(2, 'Not Answered'),
(3, 'Not Visited'),
(4, 'Marked for Review'),
(5, 'Answered & Marked for\n            Review');

-- --------------------------------------------------------

--
-- Table structure for table `tspc_set`
--

CREATE TABLE `tspc_set` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tspc_id` bigint(20) UNSIGNED NOT NULL,
  `set_number` int(11) DEFAULT NULL,
  `set_name` varchar(40) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tspc_set`
--

INSERT INTO `tspc_set` (`id`, `tspc_id`, `set_number`, `set_name`, `status`) VALUES
(1, 1, 1, 'OC Reading set - 1', 1),
(2, 2, 1, 'OC Maths set - 1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ts_pc_topics`
--

CREATE TABLE `ts_pc_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tspcs_id` bigint(20) UNSIGNED NOT NULL,
  `tst_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ts_pc_topics`
--

INSERT INTO `ts_pc_topics` (`id`, `tspcs_id`, `tst_id`) VALUES
(1, 1, 5),
(2, 2, 1),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ts_product_category`
--

CREATE TABLE `ts_product_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tsp_id` bigint(20) UNSIGNED NOT NULL,
  `tsc_id` bigint(20) UNSIGNED NOT NULL,
  `total_set` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ts_product_category`
--

INSERT INTO `ts_product_category` (`id`, `tsp_id`, `tsc_id`, `total_set`) VALUES
(1, 1, 2, 1),
(2, 2, 1, 1),
(4, 4, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `DOB` date DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `DOB`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dr. Esperanza Koelpin', 'abc29@g', '+1 (484) 461-6588', NULL, '2023-10-11 02:20:38', '$2y$10$ZkUyWGhv3Esc9F7F3DPOxeWqjlS3WchfRBHcH/StDXayXFDS9YLL2', 'pUzgJWvWg0', NULL, NULL),
(2, 'Susahnt Sushant', 'spoojari694@gmail.com', '8805778742', NULL, NULL, '$2y$10$vLCgZMP4fAjcUEX6/sOBXuLMaxpesLckAiDYCylpgNvvphHmryfgy', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_test_series`
--

CREATE TABLE `user_test_series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tsps_id` bigint(20) UNSIGNED NOT NULL,
  `set_id` bigint(20) UNSIGNED NOT NULL,
  `complete_status` tinyint(4) NOT NULL DEFAULT 0,
  `start_date` varchar(40) NOT NULL,
  `end_date` varchar(40) DEFAULT NULL,
  `time_taken` varchar(40) DEFAULT NULL,
  `current_timer` varchar(40) DEFAULT NULL,
  `percentage` int(11) DEFAULT 0,
  `total_marks` tinyint(4) DEFAULT 0,
  `total_answered` int(11) DEFAULT 0,
  `q_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_test_series`
--

INSERT INTO `user_test_series` (`id`, `tsps_id`, `set_id`, `complete_status`, `start_date`, `end_date`, `time_taken`, `current_timer`, `percentage`, `total_marks`, `total_answered`, `q_id`) VALUES
(1, 1, 1, 1, '11-10-2023', '11-10-2023', '45', NULL, 0, 0, 0, 2),
(2, 1, 1, 1, '11-10-2023', '12-10-2023', '41', NULL, 0, 0, 0, 7),
(5, 1, 1, 0, '12-10-2023', NULL, NULL, '11.59', 0, 0, 0, 82);

-- --------------------------------------------------------

--
-- Table structure for table `user_test_status`
--

CREATE TABLE `user_test_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `q_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL DEFAULT 3,
  `test_answer` varchar(255) DEFAULT NULL,
  `marks` tinyint(4) DEFAULT 0,
  `uts_id` bigint(20) UNSIGNED NOT NULL,
  `test_time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_test_status`
--

INSERT INTO `user_test_status` (`id`, `q_id`, `status_id`, `test_answer`, `marks`, `uts_id`, `test_time`) VALUES
(1, 76, 2, NULL, 0, 1, '0'),
(2, 77, 2, NULL, 0, 1, '0'),
(3, 78, 3, NULL, 0, 1, '0'),
(4, 79, 3, NULL, 0, 1, '0'),
(5, 80, 3, NULL, 0, 1, '0'),
(6, 76, 2, NULL, 0, 2, '0'),
(7, 77, 2, NULL, 0, 2, '0'),
(8, 78, 3, NULL, 0, 2, '0'),
(9, 79, 3, NULL, 0, 2, '0'),
(10, 80, 3, NULL, 0, 2, '0'),
(81, 76, 2, NULL, 0, 5, '0'),
(82, 77, 2, NULL, 0, 5, '0'),
(83, 78, 2, NULL, 0, 5, '0'),
(84, 79, 2, NULL, 0, 5, '0'),
(85, 80, 3, NULL, 0, 5, '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_email_unique` (`email`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_tsp_id_index` (`tsp_id`),
  ADD KEY `cart_user_id_index` (`user_id`);

--
-- Indexes for table `extra_question_field`
--
ALTER TABLE `extra_question_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extra_question_field_q_id_foreign` (`q_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_tsc_id_foreign` (`tsc_id`);

--
-- Indexes for table `images_names`
--
ALTER TABLE `images_names`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_names_image_id_foreign` (`image_id`);

--
-- Indexes for table `non_verbal_question`
--
ALTER TABLE `non_verbal_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `non_verbal_question_tst_id_index` (`tst_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_tst_id_index` (`tst_id`);

--
-- Indexes for table `question_image`
--
ALTER TABLE `question_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_image_q_id_foreign` (`q_id`);

--
-- Indexes for table `reading_question`
--
ALTER TABLE `reading_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reading_question_tst_id_index` (`tst_id`);

--
-- Indexes for table `set_question`
--
ALTER TABLE `set_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `set_question_q_id_foreign` (`q_id`),
  ADD KEY `set_question_set_id_index` (`set_id`);

--
-- Indexes for table `test_series`
--
ALTER TABLE `test_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_series_categories`
--
ALTER TABLE `test_series_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_series_product`
--
ALTER TABLE `test_series_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_series_product_ts_id_index` (`ts_id`);

--
-- Indexes for table `test_series_purchases`
--
ALTER TABLE `test_series_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_series_purchases_tsp_id_index` (`tsp_id`),
  ADD KEY `test_series_purchases_user_id_index` (`user_id`);

--
-- Indexes for table `test_series_topics`
--
ALTER TABLE `test_series_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_series_topics_tsc_id_index` (`tsc_id`),
  ADD KEY `test_series_topics_ts_id_index` (`ts_id`);

--
-- Indexes for table `test_status`
--
ALTER TABLE `test_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tspc_set`
--
ALTER TABLE `tspc_set`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tspc_set_tspc_id_index` (`tspc_id`);

--
-- Indexes for table `ts_pc_topics`
--
ALTER TABLE `ts_pc_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ts_pc_topics_tspcs_id_index` (`tspcs_id`),
  ADD KEY `ts_pc_topics_tst_id_index` (`tst_id`);

--
-- Indexes for table `ts_product_category`
--
ALTER TABLE `ts_product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ts_product_category_tsp_id_index` (`tsp_id`),
  ADD KEY `ts_product_category_tsc_id_index` (`tsc_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `user_test_series`
--
ALTER TABLE `user_test_series`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_test_series_tsps_id_index` (`tsps_id`),
  ADD KEY `user_test_series_set_id_index` (`set_id`);

--
-- Indexes for table `user_test_status`
--
ALTER TABLE `user_test_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_test_status_q_id_foreign` (`q_id`),
  ADD KEY `user_test_status_status_id_index` (`status_id`),
  ADD KEY `user_test_status_uts_id_index` (`uts_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `extra_question_field`
--
ALTER TABLE `extra_question_field`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images_names`
--
ALTER TABLE `images_names`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `non_verbal_question`
--
ALTER TABLE `non_verbal_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `question_image`
--
ALTER TABLE `question_image`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `reading_question`
--
ALTER TABLE `reading_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `set_question`
--
ALTER TABLE `set_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `test_series`
--
ALTER TABLE `test_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test_series_categories`
--
ALTER TABLE `test_series_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `test_series_product`
--
ALTER TABLE `test_series_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test_series_purchases`
--
ALTER TABLE `test_series_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `test_series_topics`
--
ALTER TABLE `test_series_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `test_status`
--
ALTER TABLE `test_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tspc_set`
--
ALTER TABLE `tspc_set`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ts_pc_topics`
--
ALTER TABLE `ts_pc_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ts_product_category`
--
ALTER TABLE `ts_product_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_test_series`
--
ALTER TABLE `user_test_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_test_status`
--
ALTER TABLE `user_test_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_tsp_id_foreign` FOREIGN KEY (`tsp_id`) REFERENCES `test_series_product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `extra_question_field`
--
ALTER TABLE `extra_question_field`
  ADD CONSTRAINT `extra_question_field_q_id_foreign` FOREIGN KEY (`q_id`) REFERENCES `question` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_tsc_id_foreign` FOREIGN KEY (`tsc_id`) REFERENCES `test_series_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `images_names`
--
ALTER TABLE `images_names`
  ADD CONSTRAINT `images_names_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `non_verbal_question`
--
ALTER TABLE `non_verbal_question`
  ADD CONSTRAINT `non_verbal_question_tst_id_foreign` FOREIGN KEY (`tst_id`) REFERENCES `test_series_topics` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_tst_id_foreign` FOREIGN KEY (`tst_id`) REFERENCES `test_series_topics` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_image`
--
ALTER TABLE `question_image`
  ADD CONSTRAINT `question_image_q_id_foreign` FOREIGN KEY (`q_id`) REFERENCES `question` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reading_question`
--
ALTER TABLE `reading_question`
  ADD CONSTRAINT `reading_question_tst_id_foreign` FOREIGN KEY (`tst_id`) REFERENCES `test_series_topics` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `set_question`
--
ALTER TABLE `set_question`
  ADD CONSTRAINT `set_question_q_id_foreign` FOREIGN KEY (`q_id`) REFERENCES `question` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `set_question_set_id_foreign` FOREIGN KEY (`set_id`) REFERENCES `tspc_set` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `test_series_product`
--
ALTER TABLE `test_series_product`
  ADD CONSTRAINT `test_series_product_ts_id_foreign` FOREIGN KEY (`ts_id`) REFERENCES `test_series` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `test_series_purchases`
--
ALTER TABLE `test_series_purchases`
  ADD CONSTRAINT `test_series_purchases_tsp_id_foreign` FOREIGN KEY (`tsp_id`) REFERENCES `test_series_product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `test_series_purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `test_series_topics`
--
ALTER TABLE `test_series_topics`
  ADD CONSTRAINT `test_series_topics_ts_id_foreign` FOREIGN KEY (`ts_id`) REFERENCES `test_series` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `test_series_topics_tsc_id_foreign` FOREIGN KEY (`tsc_id`) REFERENCES `test_series_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tspc_set`
--
ALTER TABLE `tspc_set`
  ADD CONSTRAINT `tspc_set_tspc_id_foreign` FOREIGN KEY (`tspc_id`) REFERENCES `ts_product_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ts_pc_topics`
--
ALTER TABLE `ts_pc_topics`
  ADD CONSTRAINT `ts_pc_topics_tspcs_id_foreign` FOREIGN KEY (`tspcs_id`) REFERENCES `tspc_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ts_pc_topics_tst_id_foreign` FOREIGN KEY (`tst_id`) REFERENCES `test_series_topics` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ts_product_category`
--
ALTER TABLE `ts_product_category`
  ADD CONSTRAINT `ts_product_category_tsc_id_foreign` FOREIGN KEY (`tsc_id`) REFERENCES `test_series_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ts_product_category_tsp_id_foreign` FOREIGN KEY (`tsp_id`) REFERENCES `test_series_product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_test_series`
--
ALTER TABLE `user_test_series`
  ADD CONSTRAINT `user_test_series_set_id_foreign` FOREIGN KEY (`set_id`) REFERENCES `tspc_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_test_series_tsps_id_foreign` FOREIGN KEY (`tsps_id`) REFERENCES `test_series_purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_test_status`
--
ALTER TABLE `user_test_status`
  ADD CONSTRAINT `user_test_status_q_id_foreign` FOREIGN KEY (`q_id`) REFERENCES `question` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_test_status_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `test_status` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_test_status_uts_id_foreign` FOREIGN KEY (`uts_id`) REFERENCES `user_test_series` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
