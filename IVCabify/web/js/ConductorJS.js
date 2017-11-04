/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function () {
    $('#dpFechaNacimiento').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });

    $('#dpFechaVencimiento').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });

    //agrega los eventos las capas necesarias
    //$("#enviar").click(function () {
    // enviar();
    //});

    //agrega los eventos las capas necesarias
    $("#cancelar").click(function () {
        // limpiarForm();
        $("#myModalConductor").modal("hide");
    });

    $("#btMostarFormConductor").click(function () {
        limpiarForm();
    });
});

$(document).ready(function () {
    consultarConductores();
});

function consultarConductores() {
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de conductores en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: 'ConductorServlet',
        data: {
            accion: "consultarConductores"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de los conductores en la base de datos");
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

function dibujarTabla(dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaConductor").html(""); 
    
    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaConductor").append(head); 
    row.append($("<th><b>CEDULA</b></th>"));
    row.append($("<th><b>NOMBRE</b></th>"));
    row.append($("<th><b>APELLIDOS</b></th>"));
    row.append($("<th><b>PASSWORD</b></th>"));
    row.append($("<th><b>FECHA.N</th>"));
    row.append($("<th><b>FECHA.VL</th>"));
    row.append($("<th><b>VEHICULO</th>"));
    row.append($("<th><b>TIPO.CONDC</th>"));
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
    $("#tablaConductor").append(row); 
    row.append($("<td>" + rowData.id + "</td>"));
    row.append($("<td>" + rowData.nombre + "</td>"));
    row.append($("<td>" + rowData.apellidos + "</td>"));
    row.append($("<td>" + rowData.password + "</td>"));
    row.append($("<td>" + rowData.fechaN + "</td>"));
    row.append($("<td>" + rowData.fechaVl + "</td>"));
    row.append($("<td>" + rowData.vehiculoActual + "</td>"));
    row.append($("<td>" + rowData.tipoConductor + "</td>"));
    row.append($("<td>" + rowData.ultimaMod + "</td>"));
    row.append($("<td>" + rowData.ultModUs + "</td>"));
    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="consultarConductorByID('+rowData.id+');">'+
                        '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>'+
                    '</button>'+
                    '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="eliminarConductor('+rowData.id+');">'+
                        '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>'+
                    '</button></td>'));
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
    //$("#UsuariosAction").val("agregarUsuario"); 

    //esconde el div del mensaje
    mostrarMensaje("hiddenDiv", "", "");

    //Resetear el formulario
    $('#formConductores').trigger("reset");
}