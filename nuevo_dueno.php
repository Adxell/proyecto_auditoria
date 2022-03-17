<div class="modal fade" id="modalNew" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" >
    <div class="modal-content">
      <div class="modal-header">
      
        <h5 class="modal-title" id="exampleModalLabel">Registro dueno</h5>
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
            <label for="recipient-name" class="col-form-label">Apellidos:</label>
            <input type="text" class="form-control" name="apellidos" id="apellidos" required>
        </div>

        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Telefono:</label>
            <input type="text" class="form-control" name="telefono" id="telefono" required>
        </div>
        
        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Correo:</label>
            <input type="text" class="form-control" name="correo" id="correo" required>
        </div>
        
        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Direccion:</label>
            <input type="text" class="form-control" name="direccion" id="direccion" required>
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
  window.location="listar_dueno.php";
  location.reload();
}


 $('#formnew').submit(function(event)
 {
    var parametros = $('#formnew').serialize();//obtiene todos los campos con sus datos
    console.log(parametros);
    var salida="";
         $.ajax({
                type: "POST",
                url: "guardar_dueno.php",
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