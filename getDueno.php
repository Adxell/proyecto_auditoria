<?php

    include('conexion.php');

    $row= null; 

    if(isset($_POST['ID'])){
        $id = $_POST['ID'];
        $sql = 'select * from dueno where ID ='.$id;
        $result=$mysqli->query($sql);
        $row=mysqli_fetch_assoc($result);
    }
    echo json_encode($row);
?>