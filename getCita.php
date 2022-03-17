<?php
    include('conexion.php');
    $row= null; 
    if(isset($_POST['IDCITA'])){
        $id = $_POST['IDCITA'];
        $sql = 'select * from cita where IDCITA ='.$id;
        $result=$mysqli->query($sql);
        $row=mysqli_fetch_assoc($result);
    }
    echo json_encode($row);
?>