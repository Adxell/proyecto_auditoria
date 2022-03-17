<div class="modal fade" id="modalNew" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" >
    <div class="modal-content">
      <div class="modal-header">
      
        <h5 class="modal-title" id="exampleModalLabel">Registro de mascotas</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="cerrar();"></button>
      </div>
      <div class="modal-body">
      <div id="resultados"> </div>    
      <form method="post" name="formnew" id="formnew">
        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Nombre:</label>
            <input type="text" class="form-control" name="nombre" id="nombre" required>
        </div>

        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Edad:</label>
            <input type="number" class="form-control" name="edad" id="edad" required>
        </div>

        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Especie:</label>
            <input type="text" class="form-control" name="especie" id="especie" required>
        </div>
        
        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Raza:</label>
            <input type="text" class="form-control" name="raza" id="raza" required>
        </div>
        
        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Color:</label>
            <input type="text" class="form-control" name="color" id="color" required>
        </div>

        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Fecha Nacimiento:</label>
            <input type="date" class="form-control" name="fechanac" id="fechanac" required>
        </div>
       
        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Dueño:</label>
                <select  class="from-control" name="dueno" id="dueno">
                    <option value="#">Escoger dueno</option>
                <?php
                include('conexion.php');
                $consulta="select * from dueno";
                $result=$mysqli->query($consulta);
                while($row=mysqli_fetch_assoc($result)){
                ?>
                    <option value="<?php echo $row['ID'];?>"><?php echo $row['nombre'].' '. $row['apellidos'];?></option>
            <?php
            }
            ?>
            </select>
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="cerrar();">Cerrar</button>
        <button type="submit" class="btn btn-primary" id="save">Guardar</button>
        </form>
      </div>
    </div>
  </div>
</div>
<script>

function cerrar()
{
  window.location="listar_mascotas.php";
  location.reload();
}


 $('#formnew').submit(function(event)
 {
    var parametros = $('#formnew').serialize();//obtiene todos los campos con sus datos
    console.log(parametros);
    var salida="";
         $.ajax({
                type: "POST",
                url: "guardar_mascota.php",
                data: parametros,
                beforeSend: function() {
                  $('#resultados').show();
                 },
                error: function() {
                 $('#resultados').html(salida);
                  },
                success: function(datos){
                  $('#resultados').html(datos);
            }
        });
        event.preventDefault();

  })
</script>