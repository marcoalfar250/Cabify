/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
   $("#cancelar").click(function () {
        limpiarForm();
      $("#myModalUsuarios").modal("hide");
    });
    
    $("#btMostarFormUsuario").click(function () {
        limpiarForm();
    });
    
    $("#btBuscarUsuario").click(function () {
        BuscarUsuario()();
    });
    
    
});

$(document).ready(function () {
    consultarUsuarios();
});

function consultarUsuarios() {
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de usuarios en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: 'UsuarioServlet',
        data: {
            accion: "consultarUsuarios"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de los usuarios en la base de datos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            dibujarTabla(data);
            // se oculta el modal esta funcion se encuentra en el utils.js
            ocultarModal("myModal");

        },
        type: 'POST',
        dataType: "json"
    });
}

function BuscarUsuario(){
    if(validarFiltro()){
        $.ajax({
        url: 'UsuarioServlet',
        data: {
            accion: "BuscarUsuario",
            idUsuario: $("#CampoFiltro").val()
        },
        error: function () { //si existe un error en la respuesta del ajax
            cambiarMensajeModal("myModal","Resultado acción","Se presento un error, contactar al administador");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
             dibujarTabla(data);
            // se oculta el modal esta funcion se encuentra en el utils.js
            ocultarModal("myModal");
        },
        type: 'POST',
        dataType: "json"
    });
    }else{
        consultarUsuarios();
    }
}

function dibujarTabla(dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaUsuarios").html(""); 
    
    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaUsuarios").append(head); 
    row.append($("<th><b>CEDULA</b></th>"));
    row.append($("<th><b>NOMBRE</b></th>"));
    row.append($("<th><b>APELLIDOS</b></th>"));
    row.append($("<th><b>CORREO</b></th>"));
    row.append($("<th><b>PASSWORD</b></th>"));
    row.append($("<th><b>FECHA.N</th>"));
    row.append($("<th><b>DIREC</th>"));
    row.append($("<th><b>TELEF</th>"));
    row.append($("<th><b>TIPO.USUA</th>"));
    row.append($("<th><b>ULTIMA.MOD</th>"));
    row.append($("<th><b>ULTIMO.USC</th>"));
    
    //carga la tabla con el json devuelto
    for (var i = 0; i < dataJson.length; i++) {
        dibujarFila(dataJson[i]);
    }
}
function dibujarFila(rowData) {
    //Cuando dibuja la tabla en cada boton se le agrega la funcionalidad de cargar o eliminar la informacion
    //de una persona
    
    var row = $("<tr />");
    $("#tablaUsuarios").append(row); 
    row.append($("<td>" + rowData.id + "</td>"));
    row.append($("<td>" + rowData.nombre + "</td>"));
    row.append($("<td>" + rowData.apellidos + "</td>"));
    row.append($("<td>" + rowData.correo + "</td>"));
    row.append($("<td>" + rowData.password + "</td>"));
    row.append($("<td>" + rowData.fechaN + "</td>"));
    row.append($("<td>" + rowData.direccion + "</td>"));
    row.append($("<td>" + rowData.telefono + "</td>"));
    row.append($("<td>" + rowData.tipoUsuario + "</td>"));
    row.append($("<td>" + rowData.ultimaMod + "</td>"));
    row.append($("<td>" + rowData.ultModUs + "</td>"));
    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="consultarUsuarioByID('+rowData.id+');">'+
                        '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>'+
                    '</button>'+
                    '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="eliminarUsuario('+rowData.id+');">'+
                        '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>'+
                    '</button></td>'));
}

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

function eliminarUsuario(idUsuario) {
    mostrarModal("myModal", "Espere por favor..", "Se esta eliminando al usuario seleccionado");
    //Se envia la información por ajax
    $.ajax({
        url: 'UsuarioServlet',
        data: {
            accion: "eliminarUsuarios",
            idUsuario: idUsuario
        },
        error: function () { //si existe un error en la respuesta del ajax
            cambiarMensajeModal("myModal","Resultado acción","Se presento un error, contactar al administador");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            // se cambia el mensaje del modal por la respuesta del ajax
            var respuestaTxt = data.substring(2);
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "E~") {
                cambiarMensajeModal("myModal","Resultado acción",respuestaTxt);
            }else{
                setTimeout(consultarUsuarios, 3000);// hace una pausa y consulta la información de la base de datos
            }
        },
        type: 'POST',
        dataType: "text"
    });
}

function consultarUsuarioByID(idUsuario) {
    mostrarModal("myModal", "Espere por favor..", "Consultando el usuario seleccionado");
    //Se envia la información por ajax
    $.ajax({
        url: 'UsuarioServlet',
        data: {
            accion: "consultarUsuariosByID",
            idUsuario: idUsuario
        },
        error: function () { //si existe un error en la respuesta del ajax
            cambiarMensajeModal("myModal","Resultado acción","Se presento un error, contactar al administador");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            // se oculta el mensaje de espera
            ocultarModal("myModal");
            limpiarForm();
            //se muestra el formulario
            
            
            $("#myModalUsuarios").modal();
            //************************************************************************
            //carga información de la persona en el formulario
            //************************************************************************
            //se indicar que la cédula es solo readOnly
            $("#cedula").attr('readonly', 'readonly');
            
            //se modificar el hidden que indicar el tipo de accion que se esta realizando
            $("#UsuariosAction").val("modificarUsuario"); 
            
            //se carga la información en el formulario
            $("#cedula").val(data.id);
            $("#nombre").val(data.nombre);
            $("#apellidos").val(data.apellidos);
            $("#password").val(data.password);
            $("#Correo").val(data.correo);
            
            //carga de fecha
            var fecha = new Date(data.fechaN);
            
            
            var fechatxt = fecha.getDate() +"/" +fecha.getMonth()+1 + "/" + fecha.getFullYear();
            $("#dpFechaNacimiento").data({date: fechatxt});
            $("#dpFechaNacimientoText").val(fechatxt);
            
            //$("#dpFechaNacimiento")$('.datepicker').datepicker('update', new Date(2011, 2, 5));
            $("#Dirreción").val(data. direccion);
            $("#Telefono").val(data.telefono);
            $("#comboTipos").val(data.tipoUsuario);
        },
        type: 'POST',
        dataType: "json"
    });
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
    $('#formUsuarios').trigger("reset");
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
