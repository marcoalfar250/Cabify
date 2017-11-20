
var map;
var apiKey = 'AIzaSyA5eCkq2I_5pcSxkdhKFhxQKUS38oTIStY';
var marker;

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
function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
}

function damenorthEast(numero){
    switch(numero) {
    case 1:
        var san1 = new google.maps.LatLng(9.94365627362426, -84.1066912561655);
        return san1;
        break;
    case 2:
        var her1 = new google.maps.LatLng(9.908063428265843, -84.04111761599779);
         return her1;
        break;
    case 3:
    var Alj1 = new google.maps.LatLng(10.019312992643002,-84.22659773379564);
    return Alj1;
    default:
       return 0;
} 
}

function damesouthWest(numero){
    switch(numero) {
    case 1:
       var san2 = new google.maps.LatLng(9.908063428265843, -84.04111761599779);
        return san2;
        break;
    case 2:
        var her2 = new google.maps.LatLng(9.97806427811739, -84.0881104208529);
         return her2;
        break;
    case 3:
    var Alj2 = new google.maps.LatLng(10.011495135900352,-84.18505618348718);
    return Alj2;
    default:
       return 0;
} 
}
function Maker(data) {
    if (data.estado === "Activo") {
        var ciudad = getRandomInt(1, 3);
        var northEast = damenorthEast(ciudad);
        var southWest = damesouthWest(ciudad);
        var lngSpan = northEast.lng() - southWest.lng();
        var latSpan = northEast.lat() - southWest.lat();
        var location = new google.maps.LatLng(southWest.lat() + latSpan * Math.random(), southWest.lng() + lngSpan * Math.random());
        var points = location.lat() + "," + location.lng();
        $.get('https://roads.googleapis.com/v1/nearestRoads?', {
            key: apiKey,
            points: points
        }, function (data) {
            for (var i = 0; i < data.snappedPoints.length; i++) {
                var latlng = new google.maps.LatLng(
                        data.snappedPoints[i].location.latitude,
                        data.snappedPoints[i].location.longitude);
                var marker = new google.maps.Marker({
                    position: latlng,
                    map: map
                });
            }
        });
    }
}

