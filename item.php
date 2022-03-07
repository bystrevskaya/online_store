<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php 
        require "connect.php";
        $id = $_GET['id'];
        $result = mysqli_query($mysqli, 'select i.name, i.price, i.old_price, i.promo_price, i.description from item i 
                                where i.item_id = ' . $id);
        if ($result == false) {
            $item = "Произошла ошибка при выполнении запроса: " . $result;
        } else {
            $item = mysqli_fetch_all($result, MYSQLI_ASSOC)[0];
        }
        if (empty($item)) {
            header("Location: 404.php");
            exit( );
        }
     ?>
    <title><?php echo $item[name]?></title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="item_style.css">
</head>
<body>
    <header>
        <?php 
            $s_id = $_GET['s_id'];
            $s_name = $mysqli->query('select s.name from section s where s.section_id = '.$s_id);
            $s_name = $s_name->fetch_array();
            $s_name = $s_name[name];
        ?>
        <div class="breadcrumbs">
            <a class="breadcrumb" href="index.php">Главная</a>
            <a class="breadcrumb" href="category.php?id=<?php echo $s_id ?>"><?php echo $s_name ?></a>
            <p class="breadcrumb"><?php echo $item[name] ?></p>
        </div>
    </header>
    <main>
    <div class="layout">
        <div class="product">
            <div class="product__images">
                <?php $images = $mysqli->query('select im.url, im.alt from image im
                                                join item_image ii on im.image_id = ii.image_id
                                                join item i on ii.item_id = i.item_id
                                                where i.item_id = '.$id);
                ?>
                <aside class="product__images-aside">
                    <?php foreach ($images as $image): ?>
                        <img class="product__images-small" src="<?php echo $image[url] ?>" alt="<?php echo $image[alt] ?>">
                    <?php endforeach; ?>
                    <button class="product__images-button">
                        <img class="product__images-next" src="img/next.png">
                    </button>
                </aside>
                <?php $first_img = $images->fetch_array(); ?>
                <img class="product__images-main" src="">
            </div>
            <div class="product__info">
                <h1 class="product__info-header"><?php echo $item[name] ?></h1>
                <div class="product__info-links">
                    <?php $categories = $mysqli->query('select s.section_id, s.name from section s
                                                        join section_item si on s.section_id = si.section_id
                                                        join item i on si.item_id = i.item_id
                                                        where i.item_id = '.$id);
                    foreach ($categories as $category): ?>
                    <a href="category.php?id=<?php echo $category[section_id] ?>" class="product__info-link"><?php echo $category[name] ?></a>
                    <?php endforeach; ?>
                </div>
                <div class="product__info-prices">
                    <p class="product__info-price old_price"><?php echo $item[old_price] ?></p>
                    <p class="product__info-price actual_price"><?php echo $item[price] ?></p>
                    <p class="product__info-price promo_price"><?php echo $item[promo_price] ?></p>
                    <p class="product__info-promo">- с промокодом</p>
                </div>
                <div class="product__info-options">
                    <div class="product__info-option">
                        <img src="img/tick.png">
                        <p>В наличии в магазине <a href="#">Lamoda</a></p>
                    </div>
                    <div  class="product__info-option">
                        <img src="img/truck.png">
                        <p>Бесплатная доставка</p>
                    </div>
                </div>
                <div class="product__info-buttons">
                    <button class="product__info-button blue_button">Купить</button>
                    <button class="product__info-button">В избранное</button>
                </div>
                <p class="product__info-decription"><?php echo $item[description] ?></p>
                <div  class="product__info-share">
                <p class="product__info-share">Поделиться:</p>
                <img class="product__info-media" src="img/vk.png">
                <img class="product__info-media" src="img/google+.png">
                <img class="product__info-media" src="img/facebook.png">
                <img class="product__info-media" src="img/twitter.png">
                </div>
            </div>
        </div>
    </div>
    <script src="script.js"></script>
    </main>
    <footer>
        <button class="backbutton"  onClick='location.href="category.php?id=<?php echo $s_id ?>"'>Назад</button>
    </footer>
</body>
</html>