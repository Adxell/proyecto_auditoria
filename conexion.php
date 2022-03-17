<?php
    date_default_timezone_set('America/Bogota');
    $user = 'root'; 
    $password = ''; 
    $data_base = 'vetapp'; 
    $host = 'localhost'; 
    $mysqli = new mysqli($host, $user, $password, $data_base); 
    if($mysqli->connect_error){
        echo "<h1> Error al conectar la base de datos: </h1>". $mysqli->connect_error; 
    }
?>