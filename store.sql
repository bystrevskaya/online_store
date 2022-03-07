-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 07 2022 г., 21:21
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `image_id` int NOT NULL,
  `url` text NOT NULL,
  `alt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `image`
--

INSERT INTO `image` (`image_id`, `url`, `alt`) VALUES
(1, 'https://a.lmcdn.ru/img600x866/I/X/IX001XW0174U_15355041_1_v1.jpeg', 'Рубашка белая'),
(2, 'https://a.lmcdn.ru/img600x866/I/X/IX001XW0174U_15355039_3_v1.jpeg', 'Рубашка белая сзади'),
(3, 'https://a.lmcdn.ru/img600x866/M/P/MP002XB01A54_15348498_1_v1.jpeg', 'Джинсы детские спереди'),
(4, 'https://a.lmcdn.ru/img600x866/M/P/MP002XB01A54_15348499_2_v1.jpeg', 'Джинсы детские сзади'),
(5, 'https://a.lmcdn.ru/img600x866/M/P/MP002XM1RHEX_14961417_2_v11.jpg', 'Кроссовки'),
(6, 'https://a.lmcdn.ru/img600x866/M/P/MP002XW0B8SE_16160427_2_v1_2x.jpeg', 'Девушка в джинсах'),
(7, 'https://a.lmcdn.ru/img600x866/M/P/MP002XW0B8SE_16160429_4_v1_2x.jpeg', 'Джинсы женские'),
(8, 'https://a.lmcdn.ru/img600x866/R/T/RTLABG054601_16596366_2_v1_2x.jpg', 'Парень в рубашке'),
(9, 'https://a.lmcdn.ru/img600x866/R/T/RTLABG054601_16596367_3_v1_2x.jpg', 'Рубашка сзади'),
(10, 'https://a.lmcdn.ru/img600x866/R/T/RTLABG054601_16596368_4_v1_2x.jpg', 'Рубашка вблизи'),
(11, 'https://a.lmcdn.ru/img600x866/N/I/NI464EWLYXS1_13073916_1_v1_2x.jpg', 'Футболка Nike'),
(12, 'https://a.lmcdn.ru/img600x866/N/I/NI464EWLYXS1_13073917_2_v1_2x.jpg', 'Девушка в футболке в полный рост'),
(13, 'https://a.lmcdn.ru/img600x866/N/I/NI464EWLYXS1_13073919_4_v1_2x.jpg', 'Футболка Nike вблизи'),
(14, 'https://a.lmcdn.ru/img600x866/M/P/MP002XG02BGU_16637439_1_v1.jpg', 'Рубашка DeFacto спереди'),
(15, 'https://a.lmcdn.ru/img600x866/M/P/MP002XG02BGU_16650530_2_v1.jpg', 'Рубашка DeFacto сзади'),
(16, 'https://a.lmcdn.ru/img600x866/R/T/RTLABE134501_16450240_1_v1.jpg', 'Сланцы adidas'),
(17, 'https://a.lmcdn.ru/img600x866/R/T/RTLABE134501_16450241_2_v1.jpg', 'Сланцы adidas вблизи'),
(18, 'https://a.lmcdn.ru/img600x866/R/T/RTLAAK276901_14412763_1_v2.jpg', 'Футболки 2 шт'),
(19, 'https://a.lmcdn.ru/img600x866/R/T/RTLAAK276901_14412764_2_v2_2x.jpg', 'Футболка Levi\'c');

-- --------------------------------------------------------

--
-- Структура таблицы `item`
--

CREATE TABLE `item` (
  `item_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `old_price` int DEFAULT NULL,
  `promo_price` int DEFAULT NULL,
  `quantity_in_stock` int NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `item`
--

INSERT INTO `item` (`item_id`, `name`, `price`, `old_price`, `promo_price`, `quantity_in_stock`, `description`) VALUES
(1, 'Рубашка Pull&Bear', 2499, 2999, 1999, 20, 'Состав: Хлопок - 100% Сезон: мульти Цвет: белый Узор: однотонный'),
(2, 'Кроссовки Pierre Cardin', 2399, 2899, 2099, 30, 'Материал верха: резина, текстиль Внутренний материал: текстиль Материал подошвы: этиленвинилацетат Материал стельки: текстиль Сезон: демисезон'),
(3, 'Джинсы Gloria Jeans', 899, 2199, 749, 12, 'Сезон: мульти Цвет: синий Узор: однотонный '),
(4, 'Джинсы Zarina', 1799, 2399, 1619, 5, 'Состав: Хлопок - 70%, Полиэстер - 28%, Эластан - 2% Материал подкладки: Без подкладки Сезон: мульти Цвет: голубой Узор: однотонный'),
(5, 'Рубашка United Colors of Benetton', 3999, 4599, 2879, 34, 'Состав: Хлопок - 100% Сезон: мульти Цвет: красный Узор: полоска Тип силуэта: прямой'),
(6, 'Футболка Nike', 2699, NULL, 2099, 30, 'Данный товар является частью проекта Lamoda planet - специального раздела нашего каталога, где мы собрали экологичные, этичные и благотворительные товары. Органический хлопок в составе товара изготовлен без применения химических веществ и подтвержден сертификатом. Отдавая предпочтение товарам с натуральным и органическим составом, вы проявляете заботу о себе и бережете планету.'),
(7, 'Рубашка DeFacto', 799, 1099, 549, 14, 'Состав: Хлопок - 100% Сезон: мульти Цвет: розовый Узор: однотонный Застежка: пуговицы'),
(8, 'Сланцы adidas', 3699, NULL, 3199, 5, 'Материал верха: полимер Внутренний материал: полимер Материал подошвы: полимер Материал стельки: полимер Сезон: мульти Цвет: черный Вид спорта: спорт стиль'),
(9, 'Футболки 2 шт. Levi\'s®', 3315, 3900, 3000, 34, 'Данный товар является частью проекта Lamoda planet - специального раздела нашего каталога, где мы собрали экологичные, этичные и благотворительные товары. Компания Levi Strauss & Co. поддерживает социальные проекты и оказывает целевую помощь по всему миру в рамках Фонда Леви Страусса (Levi Strauss Foundation). Особое внимание уделяется теме ВИЧ/СПИД, защите прав людей в трудной жизненной ситуации, а также обеспечению достойных условий труда и социальной справедливости. Выбирая этот товар, вы поддерживаете компанию, считающую благотворительность своим приоритетом.');

-- --------------------------------------------------------

--
-- Структура таблицы `item_image`
--

CREATE TABLE `item_image` (
  `item_id` int NOT NULL,
  `image_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `item_image`
--

INSERT INTO `item_image` (`item_id`, `image_id`) VALUES
(1, 1),
(1, 2),
(3, 3),
(3, 4),
(2, 5),
(4, 6),
(4, 7),
(5, 8),
(5, 9),
(5, 10),
(6, 12),
(6, 11),
(6, 13),
(9, 18),
(9, 19),
(7, 14),
(7, 15),
(8, 16),
(8, 17),
(6, 19);

-- --------------------------------------------------------

--
-- Структура таблицы `section`
--

CREATE TABLE `section` (
  `section_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `section`
--

INSERT INTO `section` (`section_id`, `name`, `description`) VALUES
(1, 'Женщинам', 'Товары для женщин'),
(2, 'Мужчинам', 'Товары для мужчин'),
(3, 'Детям', 'Товары для детей'),
(4, 'Распродажа', 'Выгодные цены здесь'),
(5, 'Рубашки', 'Большой выбор рубашек'),
(6, 'Джинсы', 'Широкий ассортимент'),
(7, 'Обувь', 'Обувь'),
(8, 'Футболки', 'Качественные футболки от известных брендов');

-- --------------------------------------------------------

--
-- Структура таблицы `section_item`
--

CREATE TABLE `section_item` (
  `section_id` int NOT NULL,
  `item_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `section_item`
--

INSERT INTO `section_item` (`section_id`, `item_id`) VALUES
(1, 1),
(5, 1),
(2, 2),
(7, 2),
(3, 3),
(6, 3),
(4, 3),
(1, 4),
(6, 4),
(2, 5),
(5, 5),
(8, 6),
(1, 6),
(3, 8),
(4, 8),
(7, 8),
(3, 7),
(5, 7),
(2, 9),
(8, 9),
(4, 9),
(1, 6),
(8, 6);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`);

--
-- Индексы таблицы `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Индексы таблицы `item_image`
--
ALTER TABLE `item_image`
  ADD KEY `item_id` (`item_id`),
  ADD KEY `image_id` (`image_id`);

--
-- Индексы таблицы `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`);

--
-- Индексы таблицы `section_item`
--
ALTER TABLE `section_item`
  ADD KEY `section_id` (`section_id`),
  ADD KEY `item_id` (`item_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `image`
--
ALTER TABLE `image`
  MODIFY `image_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `item_image`
--
ALTER TABLE `item_image`
  ADD CONSTRAINT `item_image_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `item_image_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`);

--
-- Ограничения внешнего ключа таблицы `section_item`
--
ALTER TABLE `section_item`
  ADD CONSTRAINT `section_item_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`),
  ADD CONSTRAINT `section_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
