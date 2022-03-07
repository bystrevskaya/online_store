<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Главная</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <?php require "connect.php" ?>
    <header>
        <div class="header">
            <h1>Категории товаров</h1>
        </div>
    </header>
    <main>
        <div class="list">
            <?php 
            $categories = $mysqli->query('select s.section_id, s.name, count(i.name) from section s
                                        join section_item si on s.section_id = si.section_id
                                        join item i on si.item_id = i.item_id
                                        group by s.name
                                        having count(i.name) > 0
                                        order by count(i.name) desc');
            foreach ($categories as $category):
            ?>
            <div class="list__category">
                <a class="list__category-link" href="category.php?id=<?php echo $category[section_id] ?>">
                    <p class="list__category-name"><?php echo $category[name] ?></p>
                    <p class="list__category-count"><?php echo $category['count(i.name)'] ?></p>
                </a>
            </div>
            <?php endforeach; ?>
        </div>
    </main>
</body>
</html>