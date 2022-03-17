<?php

    include('conexion.php');

    $row= null; 

    if(isset($_POST['IDMAS'])){
        $id = $_POST['IDMAS'];
        $sql = 'select * from mascota where IDMAS ='.$id;
        $result=$mysqli->query($sql);
        $row=mysqli_fetch_assoc($result);
    }
    echo json_encode($row);
?>