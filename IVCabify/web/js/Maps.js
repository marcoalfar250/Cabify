
var map;

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 9.998141, lng: -84.119764},
        zoom: 12
    });
}
$(document).ready(function () {
    CargarVehiculos();
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

function CargarVehiculos() {
    mostrarModal("myModal", "Espere por favor..", "Cargando los vehiculos al mapa");
    //Se envia la información por ajax
    $.ajax({
        url: 'VehiculosServlet',
        data: {
            accion: "consultarVehiculos"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar los vehiculos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            MakeMarker(data);


        },
        type: 'POST',
        dataType: "json"
    });
}

function MakeMarker(dataJson) {
    for (var i = 0; i < dataJson.length; i++) {
        Maker(dataJson[i]);
    }
}
function Maker(data) {
    if (data.estado === "Activo") {
    var northEast = new google.maps.LatLng(10.649811055745865, -84.5491075515747);
    var southWest = new google.maps.LatLng(9.752370139173285, -83.9009141921997);
    var lngSpan = northEast.lng() - southWest.lng();
    var latSpan = northEast.lat() - southWest.lat();
    var markers = [];
    var location = new google.maps.LatLng(southWest.lat() + latSpan * Math.random(), southWest.lng() + lngSpan * Math.random());
    marker = new google.maps.Marker({
        position: location,
        map: map
    });
    markers.push(marker);
    }
}

