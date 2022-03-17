<div class="modal fade" id="modalEdit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" >
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Actualizar Mascota</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="cerrar();"></button>
      </div>
      <div class="modal-body">
      <div id="resultados2"> </div>    
      <form method="post" name="formedit" id="formedit">
        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Nombre:</label>
            <input type="text" class="form-control" name="nombre" id="nombre" required>
            <input type="hidden" name="ID" id="ID">
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
        <button type="submit" class="btn btn-primary" id="guardar" onclick="reload();">Guardar</button>
        </form>
      </div>
    </div>
  </div>
</div>
<script>
    function reload(){
      cerrar();

      window.location="listar_dueno.php";
    }
    function OpenModal(ID){
        $.post("getDueno.php", {ID:ID}, function(datos){
          let obj = JSON.parse(datos);
              $('[name="ID"]').val(obj["ID"]);
              $('[name="nombre"]').val(obj["nombre"]);
              $('[name="apellidos"]').val(obj["apellidos"]);
              $('[name="telefono"]').val(obj["telefono"]);
              $('[name="correo"]').val(obj["correo"]);
              $('[name="direccion"]').val(obj["direccion"]);
        })
        $('#modalEdit').modal('show');
    }

    $('#formedit').submit(function(e){
      let parametros = $('#formedit').serialize();
      let salida = ""; 
          $.ajax({
            type:"POST", 
            url: "update_dueno.php", 
            data: parametros, 
            beforeSend:function () {
              $('#resultados2').show();
            }, 
            error: function(){
              $('#resultados2').html(salida);
            }, 
            success: function(datos){
              $('#resultados2').html(datos);
            }
          });
          e.preventDefault();
    })
</script>