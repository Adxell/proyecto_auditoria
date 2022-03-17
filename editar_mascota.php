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
            <input type="hidden" name="IDMAS" id="IDMAS">
        </div>

        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Edad:</label>
            <input type="text" class="form-control" name="edad" id="edad" required>
        </div>

        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Color:</label>
            <input type="text" class="form-control" name="color" id="color" required>
        </div>

        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Especie:</label>
            <input type="text" class="form-control" name="especie" id="especie" required disabled>
        </div>

        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Raza:</label>
            <input type="text" class="form-control" name="raza" id="raza" required disabled>
        </div>

        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Fecha de nacimiento:</label>
            <input type="date" class="form-control" name="fechanac" id="fechanac" required disabled>
        </div>

        <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Propietario:</label>
            <input type="text" class="form-control" name="dueno" id="dueno" required disabled>
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

      window.location="listar_mascotas.php";
    }
    function OpenModal(IDMAS){
        $.post("getMascota.php", {IDMAS:IDMAS}, function(datos){
          let obj = JSON.parse(datos);
              $('[name="IDMAS"]').val(obj["IDMAS"]);
              $('[name="nombre"]').val(obj["nombre"]);
              $('[name="edad"]').val(obj["edad"]);
              $('[name="color"]').val(obj["color"]);
              $('[name="especie"]').val(obj["especie"]);
              $('[name="raza"]').val(obj["raza"]);
              $('[name="fechanac"]').val(obj["fechanac"]);
              $('[name="dueno"]').val(obj['dueno']);
        })
        $('#modalEdit').modal('show');
    }

    $('#formedit').submit(function(e){
      let parametros = $('#formedit').serialize();
      let salida = ""; 
          $.ajax({
            type:"POST", 
            url: "update_mascota.php", 
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