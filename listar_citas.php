<?php
    include('index.php');
?>
<body>
    <div class="w-100 container">
        <button class="w-25 mt-4 btn btn-primary" >
            Agregar Cita
        </button>
        <table class="table mt-4 table-hover">
            <thead>
                <tr>
                    <th>FECHA</th>
                    <th>TIPO DE CITA</th>
                    <th>MOTIVO</th>
                    <th>VALOR</th>
                    <th>ESTADO</th>
                    <th>VETERINARIO</th>
                    <th>MASCOTA</th>
                    <th>OPCIONES</th>
                </tr>
            </thead>
            <tbody>
                <?php include('conexion.php');?>
                <?php
                 $sql= "CAll GetAllCitas()";
                 $result = $mysqli->query($sql);
                 while($row=mysqli_fetch_assoc($result)){
                ?>
                        <tr>
                            <td title="<?php echo $row["fecha"]?>"><?php echo $row["fecha"]?></td>
                            <td title="<?php echo $row["tipocita"]?>"><?php echo $row["tipocita"]?></td>
                            <td title="<?php echo $row["motivo"]?>"><?php echo $row["motivo"]?></td>
                            <td title="<?php echo $row["valor"]?>"><?php echo $row["valor"]?></td>
                            <td title="<?php echo $row["estado"]?>"><?php echo $row["estado"]?></td>
                            <!-- <td title="<?php echo $row["mascota"]?>"><?php echo $row["mascota"]?></td> -->
                                <?php
                                    include('conexion.php');
                                    $consulta="select * from veterinario where IDVET=".$row['IDCITA'];
                                    $repuesta=$mysqli->query($consulta);
                                    while($filas=mysqli_fetch_assoc($repuesta)){
                                        ?>
                                    <td title="<?php echo $filas['nombre'].' '.$filas['apellidos'];?>">
                                        <?php echo $filas['nombre'].' '.$filas['apellidos'];?>
                                    </td>
                                <?php
                                }
                                ?>
                                <?php
                                    include('conexion.php');
                                    $q="select * from mascota where IDMAS=".$row['IDCITA'];
                                    $rs=$mysqli->query($q);
                                    while($fila=mysqli_fetch_assoc($rs)){
                                ?>
                                    <td title="<?php echo $fila['nombre'];?>">
                                        <?php echo $fila['nombre'];?>
                                    </td>
                                <?php
                                }
                                ?>
                            <td>
                                <button title="Editar" type="button" class="btn btn-info" onclick="OpenModal(<?=$row['IDCITA'];?>);">
                                    <i class="fa fa-pencil-square-o" aria-hidden="true" style="font-size:24px"></i>
                                </button>   
                                <a href="eliminar.php?id=<?=$row['IDCITA'];?>" title="Eliminar">
                                    <button type="button" class="btn btn-danger"> 
                                        <i class="fa fa-trash-o" aria-hidden="true" style="font-size:24px"></i>
                                    </button>    
                                </a>
                            </td>
                        </tr>
                <?php
                }
                ?>
            </tbody>
            <tfoot>
                <tr>
                    <th>FECHA</th>
                    <th>TIPO DE CITA</th>
                    <th>MOTIVO</th>
                    <th>VALOR</th>
                    <th>ESTADO</th>
                    <th>VETERINARIO</th>
                    <th>MASCOTA</th>
                    <th>OPCIONES</th>
                </tr>
            </tfoot>
        </table>
    </div>

    <?php include('editar_cita.php')?>
    <?php include('editar_cita.php')?>
</body>