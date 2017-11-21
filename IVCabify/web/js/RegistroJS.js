$(function () {
    //Genera el datapicker
    $('#dpFechaNacimiento').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });

    //agrega los eventos las capas necesarias
    $("#enviar").click(function () {
      enviar();
    });

    //agrega los eventos las capas necesarias
   $("#cancelar2").click(function () {
        limpiarForm();
      $("#ModalRegistroUsuario").modal("hide");
    });
    
    $("#btMostarFormUsuario").click(function () {
        limpiarForm();
    });
    
});

function enviar() {
    if (validar()) {
        //Se envia la información por ajax
        $.ajax({
            url: 'UsuarioServlet',
            data: {
                accion: $("#UsuariosAction").val(),
                cedula: $("#cedula").val(),
                nombre: $("#nombre").val(),
                apellidos: $("#apellidos").val(),
                password: $("#password").val(),
                Correo: $("#Correo").val(),
                fechaN: $("#dpFechaNacimiento").data('date'),
                direccion: $("#Dirreción").val(),
                telefono: $("#Telefono").val(),
                tipoUsuario:$("#comboTipos").val()
            },
            error: function () { //si existe un error en la respuesta del ajax
                mostrarMensaje("alert alert-danger", "Se genero un error, contacte al administrador (Error del ajax)", "Error!");
            },
            success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                var respuestaTxt = data.substring(2);
                var tipoRespuesta = data.substring(0, 2);
                if (tipoRespuesta === "C~") {
                    mostrarMensaje("alert alert-success", respuestaTxt, "Correcto!");
                    $("#myModalUsuarios").modal("hide");
                    consultarUsuarios();
                } else {
                    if (tipoRespuesta === "E~") {
                        mostrarMensaje("alert alert-danger", respuestaTxt, "Error!");
                    } else {
                        mostrarMensaje("alert alert-danger", "Se genero un error, contacte al administrador", "Error!");
                    }
                }

            },
            type: 'POST'
        });
    } else {
        mostrarMensaje("alert alert-danger", "Debe digitar los campos del formulario", "Error!");
    }
}

function mostrarMensaje(classCss, msg, neg) {
    //se le eliminan los estilos al mensaje
    $("#mesajeResult").removeClass();

    //se setean los estilos
    $("#mesajeResult").addClass(classCss);

    //se muestra la capa del mensaje con los parametros del metodo
    $("#mesajeResult").fadeIn("slow");
    $("#mesajeResultNeg").html(neg);
    $("#mesajeResultText").html(msg);
    $("#mesajeResultText").html(msg);
}

function limpiarForm() {
    //setea el focus del formulario
    $('#cedula').focus();
    $("#cedula").removeAttr("readonly"); //elimina el atributo de solo lectura
    
    //se cambia la accion por agregarPersona
    $("#UsuariosAction").val("agregarUsuario"); 

    //esconde el div del mensaje
    mostrarMensaje("hiddenDiv", "", "");

    //Resetear el formulario
    $('#formRegistro').trigger("reset");
}

function validar() {
    var validacion = true;

    //Elimina estilo de error en los css
    //notese que es sobre el grupo que contienen el input
    $("#groupCedula").removeClass("has-error");
    $("#groupNombre").removeClass("has-error");
    $("#groupApellidos").removeClass("has-error");
    $("#groupCorreo").removeClass("has-error");
    $("#groupPassWord").removeClass("has-error");
    $("#groupFechaNacimiento").removeClass("has-error");
    $("#groupTipo").removeClass("has-error");
    $("#groupDirreción").removeClass("has-error");
    $("#groupTelefono").removeClass("has-error");
   
    //valida cada uno de los campos del formulario
    //Nota: Solo si fueron digitados
    if ($("#cedula").val() === "") {
        $("#groupCedula").addClass("has-error");
        validacion = false;
    }
    if ($("#nombre").val() === "") {
        $("#groupNombre").addClass("has-error");
        validacion = false;
    }
    if ($("#apellidos").val() === "") {
        $("#groupApellidos").addClass("has-error");
        validacion = false;
    }
    if ($("#Correo").val() === "") {
        $("#groupCorreo").addClass("has-error");
        validacion = false;
    }
    if ($("#password").val() === "") {
        $("#groupPassWord").addClass("has-error");
        validacion = false;
    }
    if ($("#dpFechaNacimiento").data('date') === "") {
        $("#groupFechaNacimiento").addClass("has-error");
        validacion = false;
    }
    
    if ($("#Dirreción").val() === "") {
        $("#groupDirreción").addClass("has-error");
        validacion = false;
    }
    
    if ($("#Dirreción").val() === "") {
        $("#groupDirreción").addClass("has-error");
        validacion = false;
    }
    
    if ($("#comboTipos").val() === "") {
        $("#groupTipo").addClass("has-error");
        validacion = false;
    }
    
    if ($("#Telefono").val() === "") {
        $("#groupTelefono").addClass("has-error");
        validacion = false;
    }

    return validacion;
}

function validarFiltro(){
    var validacion = true;
    $("#groupIDFiltro").removeClass("has-error");
    if ($("#CampoFiltro").val() === "") {
        $("#groupIDFiltro").addClass("has-error");
        validacion = false;
    }
    return validacion;
}