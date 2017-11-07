/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function () {
    $("#btMostarFormVeiculo").click(function () {
        limpiarForm();
        cargarConductores();
    });
    $("#colorES").spectrum({
        showPaletteOnly: true,
        togglePaletteOnly: true,
        togglePaletteMoreText: 'more',
        togglePaletteLessText: 'less',
        color: 'blanchedalmond',
        palette: [
            ["#000", "#444", "#666", "#999", "#ccc", "#eee", "#f3f3f3", "#fff"],
            ["#f00", "#f90", "#ff0", "#0f0", "#0ff", "#00f", "#90f", "#f0f"],
            ["#f4cccc", "#fce5cd", "#fff2cc", "#d9ead3", "#d0e0e3", "#cfe2f3", "#d9d2e9", "#ead1dc"],
            ["#ea9999", "#f9cb9c", "#ffe599", "#b6d7a8", "#a2c4c9", "#9fc5e8", "#b4a7d6", "#d5a6bd"],
            ["#e06666", "#f6b26b", "#ffd966", "#93c47d", "#76a5af", "#6fa8dc", "#8e7cc3", "#c27ba0"],
            ["#c00", "#e69138", "#f1c232", "#6aa84f", "#45818e", "#3d85c6", "#674ea7", "#a64d79"],
            ["#900", "#b45f06", "#bf9000", "#38761d", "#134f5c", "#0b5394", "#351c75", "#741b47"],
            ["#600", "#783f04", "#7f6000", "#274e13", "#0c343d", "#073763", "#20124d", "#4c1130"]
        ]
    });

    $("#cancelar").click(function () {
        limpiarForm();
        $("#myModalVeiculo").modal("hide");
    });

    $("#enviar").click(function () {
        enviar();
    });
    
    $("#btBuscarVeiculo").click(function () {
        BuscarVehiculo();
    });
});

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
    $('#placa').focus();
    $("#placa").removeAttr("readonly"); //elimina el atributo de solo lectura

    //se cambia la accion por agregarPersona
    $("#VeiculosAction").val("agregarVehiculo");

    //esconde el div del mensaje
    mostrarMensaje("hiddenDiv", "", "");

    //Resetear el formulario
    $('#formVeiculo').trigger("reset");
}
$(document).ready(function () {
    consultarVehiculos();
});

function cargarConductores() {
    $.ajax({
        url: 'ConductorServlet',
        data: {
            accion: "consultarConductores"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de los conductores en el comboBox");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            for (i = 0; i < data.length; i++) {
                $('#selectBox option[value='+data.id+']').remove();
            }
            for (var i = 0; i < data.length; i++) {
                $(function () {
                    $('#comboVConductor').append(new Option(data[i].nombre, data[i].id));
                });
            }

        },
        type: 'POST',
        dataType: "json"
    });
}

function BuscarVehiculo(){
    if(validarFiltro()){
        $.ajax({
        url: 'VehiculosServlet',
        data: {
            accion: "BuscarVehiculo",
            PlacaVehiculo: $("#FiltroVeiculo").val()
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
        consultarVehiculos();
    }
}

function consultarVehiculos() {
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de vehiculos en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: 'VehiculosServlet',
        data: {
            accion: "consultarVehiculos"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de los vehiculos en la base de datos");
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

function enviar() {
    if (validar()) {
        //Se envia la información por ajax
        $.ajax({
            url: 'VehiculosServlet',
            data: {
                accion: $("#VeiculosAction").val(),
                placa: $("#placa").val(),
                conductor: $("#comboVConductor").val(),
                marca:$("#comboMarca").val(),
                cantidadPasa:$("#CantidadPasajeros").val(),
                modelo: $("#modelo").val(),
                ahno: $("#comboAño").val(),
                color: $("#colorES").val(),
                estado: $("#comboEstadoVehiculo").val()

            },
            error: function () { //si existe un error en la respuesta del ajax
                mostrarMensaje("alert alert-danger", "Se genero un error, contacte al administrador (Error del ajax)", "Error!");
            },
            success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                var respuestaTxt = data.substring(2);
                var tipoRespuesta = data.substring(0, 2);
                if (tipoRespuesta === "C~") {
                    mostrarMensaje("alert alert-success", respuestaTxt, "Correcto!");
                    $("#myModalVeiculo").modal("hide");
                    consultarVehiculos();
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

function dibujarTabla(dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaVeiculos").html("");

    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaVeiculos").append(head);
    row.append($("<th><b>PLACA</b></th>"));
    row.append($("<th><b>CONDUCTOR</b></th>"));
    row.append($("<th><b>MARCA</b></th>"));
    row.append($("<th><b>MODELO</b></th>"));
    row.append($("<th><b>AÑO</b></th>"));
    row.append($("<th><b>COLOR</b></th>"));
    row.append($("<th><b>ESTADO</th>"));
    row.append($("<th><b>CANT.PASAJ</th>"));
    row.append($("<th><b>ULTIMA_MOD</th>"));
    row.append($("<th><b>ULTIMO_USUARIO</th>"));

    //carga la tabla con el json devuelto
    for (var i = 0; i < dataJson.length; i++) {
        dibujarFila(dataJson[i]);
    }

    for (var i = 0; i < dataJson.length; i++) {
        $(function () {
            $('#' + dataJson[i].placa + '').spectrum({
                color: dataJson[i].color,
                disabled: true
            });
        });
    }
}

function dibujarFila(rowData) {
    //Cuando dibuja la tabla en cada boton se le agrega la funcionalidad de cargar o eliminar la informacion
    //de una persona

    var row = $("<tr />");
    $("#tablaVeiculos").append(row);
    row.append($("<td>" + rowData.placa + "</td>"));
    row.append($("<td>" + rowData.conductor.nombre + "</td>"));
    row.append($("<td>" + rowData.marca + "</td>"));
    row.append($("<td>" + rowData.modelo + "</td>"));
    row.append($("<td>" + rowData.ahno + "</td>"));
    row.append($("<td>" + '<input type="text" id="' + rowData.placa + '"/>' + "</td>"));
    row.append($("<td>" + rowData.estado + "</td>"));
    row.append($("<td>" + rowData.capPasaj + "</td>"));
    row.append($("<td>" + rowData.ultimaMod + "</td>"));
    row.append($("<td>" + rowData.ultModUs + "</td>"));
    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="consultarVehiculoByID(' + rowData.placa + ');">' +
            '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>' +
            '</button>' +
            '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="eliminarVehiculo(' + rowData.placa + ');">' +
            '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>' +
            '</button></td>'));
}

function validar() {
    var validacion = true;

    //Elimina estilo de error en los css
    //notese que es sobre el grupo que contienen el input
    $("#groupPlaca").removeClass("has-error");
    $("#groupVehiConductores").removeClass("has-error");
    $("#groupModelo").removeClass("has-error");
    $("#groupAnho").removeClass("has-error");
    $("#groupEstadoVeiculo").removeClass("has-error");



    //valida cada uno de los campos del formulario
    //Nota: Solo si fueron digitados
    if ($("#Placa").val() === "") {
        $("#groupPlaca").addClass("has-error");
        validacion = false;
    }
    if ($("#nombre").val() === "") {
        $("#groupNombre").addClass("has-error");
        validacion = false;
    }
    if ($("#comboVConductor").val() === "") {
        $("#groupVehiConductores").addClass("has-error");
        validacion = false;
    }
    
    if ($("#CantidadPasajeros").val() === "") {
        $("#groupPasajeros").addClass("has-error");
        validacion = false;
    }

    if ($("#modelo").val() === "") {
        $("#groupModelo").addClass("has-error");
        validacion = false;
    }
    if ($("#comboMarca").val() === "") {
        $("#groupMarca").addClass("has-error");
        validacion = false;
    }
    if ($("#comboAño").val() === "") {
        $("#groupAnho").addClass("has-error");
        validacion = false;
    }

    if ($("#comboTiposLic").val() === "") {
        $("#groupTipoLic").addClass("has-error");
        validacion = false;
    }

    if ($("#comboEstadoVehiculo").val() === "") {
        $("#groupEstadoVeiculo").addClass("has-error");
        validacion = false;
    }

    return validacion;
}

function validarFiltro(){
    var validacion = true;
    $("#groupFiltroVeiculo").removeClass("has-error");
    
    
    if ($("#FiltroConductor").val() === "") {
        $("#groupFiltroVeiculo").addClass("has-error");
        validacion = false;
    }
    return validacion;
}