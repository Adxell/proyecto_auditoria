<?php
 include('conexion.php');
 if(isset($_POST['ID']))
 {
    $id=$_POST['ID'];  
    $telefono=$_POST['telefono'];
    $correo=$_POST['correo'];
    $direccion=$_POST['direccion'];
    $sql="CALL updateDueno('$id', '$telefono', '$correo','$direccion')";
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