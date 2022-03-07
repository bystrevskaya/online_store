<?php

    $host='localhost';
    $database='store';
    $user='root';
    $password='';
    $mysqli = mysqli_connect($host, $user, $password, $database) or die("Ошибка " . mysqli_error($mysqli));

?>