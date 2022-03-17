<?php
    include('index.php');
?>
<body>
    <?php include('conexion.php');?>
    <br><br>
    <div class="container">
  <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#modalNew" data-bs-whatever="@mdo">
  <i class="fa fa-user-plus" aria-hidden="true"></i> Nuevo Mascota   
  </button>
        <table class="table mt-4 table-hover">
            <thead>
                <tr>
                    <th>NOMBRE</th>
                    <th>EDAD</th>
                    <th>ESPECIE</th>
                    <th>RAZA</th>
                    <th>COLOR</th>
                    <th>FECHA DE NACIMENTO</th>
                    <th>PROPIETARIO</th>
                    <th>OPCIONES</th>
                </tr>
            </thead>
            <tbody>
                <?php include('conexion.php');?>
                <?php
                 $sql= "CAll GetAllAnimals()";
                 $result = $mysqli->query($sql);
                 while($row=mysqli_fetch_assoc($result)){
                ?>
                        <tr>
                            <td title="<?php echo $row["nombre"]?>"><?php echo $row["nombre"]?></td>
                            <td title="<?php echo $row["edad"]?>"><?php echo $row["edad"]?></td>
                            <td title="<?php echo $row["especie"]?>"><?php echo $row["especie"]?></td>
                            <td title="<?php echo $row["raza"]?>"><?php echo $row["raza"]?></td>
                            <td title="<?php echo $row["color"]?>"><?php echo $row["color"]?></td>
                            <td title="<?php echo $row["fechanac"]?>"><?php echo $row["fechanac"]?></td>
                                <?php
                                    include('conexion.php');
                                    $q="select * from dueno where ID=".$row['dueno'];
                                    $rs=$mysqli->query($q);
                                    while($fila=mysqli_fetch_assoc($rs)){
                                ?>
                                    <td title="<?php echo $fila['nombre'].' '.$fila['apellidos'];?>">
                                        <?php echo $fila['nombre'].' '.$fila['apellidos'];?>
                                    </td>
                                <?php
                                }
                                ?>
                            <td>
                                <button title="Editar" type="button" class="btn btn-info" onclick="OpenModal(<?=$row['IDMAS'];?>);">
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
                    <th>EDAD</th>
                    <th>ESPECIE</th>
                    <th>RAZA</th>
                    <th>COLOR</th>
                    <th>FECHA DE NACIMENTO</th>
                    <th>PROPIETARIO</th>
                    <th>OPCIONES</th>
                </tr>
            </tfoot>
        </table>
    </div>
    <?php include('editar_mascota.php');?>
    <?php include('nueva_mascota.php');?>
</body>
