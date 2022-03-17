<?php
 include('conexion.php');
 if(isset($_POST['IDMAS']))
 {
    $id=$_POST['IDMAS'];  
    $nombre=$_POST['nombre'];
    $edad=$_POST['edad'];
    $color=$_POST['color'];
    $sql="CALL EditMascota('$id', '$nombre', '$edad','$color')";
    $result=$mysqli->query($sql);
     $msg='';
     if($mysqli->affected_rows >0)
       {
        $msg='<div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Ok!</strong> Registro actualizado.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>';
       }
        else{
            $msg='<div class="alert alert-warning alert-dismissible fade show" role="alert">
            <strong>Error!</strong> No se pudo guardar.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </div>';
        }
       echo $msg;
 }
?>