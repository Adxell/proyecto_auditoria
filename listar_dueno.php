<?php
    include('index.php');
?>

  <?php include('conexion.php');?>
    <br><br>
    <div class="container">
  <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#modalNew" data-bs-whatever="@mdo">
  <i class="fa fa-user-plus" aria-hidden="true"></i> Nuevo dueno   
  </button>
        <table class="table mt-4 table-hover">
            <thead>
                <tr>
                    <th>NOMBRE</th>
                    <th>APELLIDOS</th>
                    <th>TELEFONO</th>
                    <th>CORREO</th>
                    <th>DIRECCION</th>
                    <th>OPCIONES</th>
                </tr>
            </thead>
            <tbody>
                <?php include('conexion.php');?>
                <?php
                 $sql= "select * from dueno";
                 $result = $mysqli->query($sql);
                 while($row=mysqli_fetch_assoc($result)){
                ?>
                        <tr>
                            <td title="<?php echo $row["nombre"]?>"><?php echo $row["nombre"]?></td>
                            <td title="<?php echo $row["apellidos"]?>"><?php echo $row["apellidos"]?></td>
                            <td title="<?php echo $row["telefono"]?>"><?php echo $row["telefono"]?></td>
                            <td title="<?php echo $row["correo"]?>"><?php echo $row["correo"]?></td>
                            <td title="<?php echo $row["direccion"]?>"><?php echo $row["direccion"]?></td>
                            <td>
                                <button title="Editar" type="button" class="btn btn-info" onclick="OpenModal(<?=$row['ID'];?>);">
                                    <i class="fa fa-pencil-square-o" aria-hidden="true" style="font-size:24px"></i>
                                </button>   
                            </td>
                        </tr>
                <?php
                }
                ?>
            </tbody>
            <tfoot>
                <tr>
                    <th>NOMBRE</th>
                    <th>APELLIDOS</th>
                    <th>TELEFONO</th>
                    <th>CORREO</th>
                    <th>DIRECCION</th>
                    <th>OPCIONES</th>
                </tr>
            </tfoot>
        </table>
    </div>
    <?php include('editar_dueno.php');?>
    <?php include('nuevo_dueno.php');?>
</body>