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
            <input type="hidden" name="IDCITA" id="IDCITA">
        </div>

        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Fecha:</label>
            <input type="date" class="form-control" name="fecha" id="fecha" required>
        </div>

        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Tipo cita:</label>
            <input type="text" class="form-control" name="tipocita" id="tipocita" required>
        </div>

        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Motivo:</label>
            <input type="text" class="form-control" name="motivo" id="motivo" required disabled>
        </div>

        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Valor:</label>
            <input type="text" class="form-control" name="valor" id="valor" required disabled>
        </div>

        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Veterinario:</label>
            <input type="text" class="form-control" name="veterinario" id="veterinario" required disabled>
        </div>
        
        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Mascota:</label>
            <input type="text" class="form-control" name="mascota" id="mascota" required disabled>
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
      window.location="listar_citas.php";
    }
    function OpenModal(IDCITA){
        $.post("getCita.php", {IDCITA:IDCITA}, function(datos){
          let obj = JSON.parse(datos);
              $('[name="IDCITA"]').val(obj["IDCITA"]);
              $('[name="fecha"]').val(obj["fecha"]);
              $('[name="tipocita"]').val(obj["tipocita"]);
              $('[name="motivo"]').val(obj["motivo"]);
              $('[name="valor"]').val(obj["valor"]);
              $('[name="estado"]').val(obj["estado"]);
              $('[name="veterinario"]').val(obj["veterinario"]);
              $('[name="mascota"]').val(obj['mascota']);
        })
        $('#modalEdit').modal('show');
    }

    $('#formedit').submit(function(e){
      let parametros = $('#formedit').serialize();
      let salida = ""; 
          $.ajax({
            type:"POST", 
            url: "update_cita.php", 
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