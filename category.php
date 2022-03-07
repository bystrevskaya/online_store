<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php 
        require "connect.php";
        $id = $_GET['id'];
        $section = $mysqli->query('select s.name, s.description from section s
                                    where s.section_id = ' .  $id);
        $section = $section->fetch_array();
    ?>
    <title><?php echo $section[name] ?></title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <?php
        $items = $mysqli->query('select i.item_id, i.name, im.url, s.name as section_name from item i
                                    join section_item si on i.item_id = si.item_id
                                    join section s on si.section_id = s.section_id
                                    join item_image ii on i.item_id = ii.item_id
                                    join image im on ii.image_id = im.image_id
                                    where s.section_id = ' .  $id . ' and i.quantity_in_stock > 0
                                    group by i.name');
        if (empty($items->fetch_array())) {
            header("Location: 404.php");
            exit( );
        }
     ?>
    <header>
        <div class="header">
            <?php
                echo '<h1>'.$section[name].'</h1>';
                echo '<p>'.$section[description].'</p>';
            ?>
        </div>
        <div class="breadcrumbs">
            <a class="breadcrumb" href="index.php">Главная</a>
            <p class="breadcrumb"><?php echo $section[name] ?></p>
        </div>
    </header>
    <main>
        <div class="list">
            <?php 
            foreach ($items as $item):
            ?>
            <div class="list__item">
                <a class="list__item-link" href="item.php?id=<?php echo $item[item_id] ?>&s_id=<?php echo $id ?>">
                    <p class="list__item-section"><?php echo $item[section_name] ?></p>
                    <p class="list__item-name"><?php echo $item[name] ?></p>
                    <img class="list__item-img" src="<?php echo $item[url] ?>">
                </a>
            </div>
            <?php endforeach; ?>
        </div>
    </main>
    <footer>
        <button class="backbutton"  onClick='location.href="http://store/index.php"'>Назад</button>
    </footer>
</body>
</html>