<?php
    include('index.php')
?>

  <?php include('conexion.php');?>
    <br><br>
    <div class="container">
        <table class="table mt-4 table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>ACCION</th>
                    <th>FECHA</th>
                    <th>USUARIO</th>
                </tr>
            </thead>
            <tbody>
                <?php include('conexion.php');?>
                <?php
                 $sql= "select * from auditoria";
                 $result = $mysqli->query($sql);
                 while($row=mysqli_fetch_assoc($result)){
                ?>
                        <tr>
                            <td title="<?php echo $row["IDREGISTRO"]?>"><?php echo $row["IDREGISTRO"]?></td>
                            <td title="<?php echo $row["accion"]?>"><?php echo $row["accion"]?></td>
                            <td title="<?php echo $row["fecha"]?>"><?php echo $row["fecha"]?></td>
                            <td title="<?php echo $row["usuario"]?>"><?php echo $row["usuario"]?></td>
                        </tr>
                <?php
                }
                ?>
            </tbody>
            <tfoot>
                <tr>
                    <th>ID</th>
                    <th>ACCION</th>
                    <th>FECHA</th>
                    <th>USUARIO</th>
                </tr>
            </tfoot>
        </table>
    </div>
</body>