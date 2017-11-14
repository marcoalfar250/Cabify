<%-- 
    Document   : Viaje.jsp
    Created on : 14/11/2017, 03:05:13 PM
    Author     : Marco Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="Imports.jspf" %>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDs3rRQanjB7aZXgeWa6HY5iQrQ_Zn50MM &callback=initMap"
        async defer></script>
        <script src="js/Maps.js" type="text/javascript"></script>
        <link href="css/Maps.css" rel="stylesheet" type="text/css"/>
        <title>Realizar un Viaje</title>
    </head>
    <body>
        <div id="myDiv">
            <div class="header">
                <div class="bg-color">
                    <header id="main-header">
                        <nav class="navbar navbar-default navbar-fixed-top">
                            <div class="container">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                    <a class="navbar-brand" href="#">Ca<span class="logo-dec">bify</span></a>
                                </div>
                                <div class="collapse navbar-collapse" id="myNavbar">

                                    <ul class="nav navbar-nav navbar-right">
                                        <li class="active"><a href="#main-header">Inicio</a></li> <!--data-target="#myModalUsuarios"-->
                                        <li class=""><a href="#ModalRegistroUsuario" type="button"  id="MostrarUsuarioP" class="btn btn-link" data-toggle="modal">Registrarse</a> </li>
                                        <li class=""><a href="#feature">Acerca</a></li>
                                        <li class=""><a href="#service">Servicios</a></li>
                                        <li class=""><a href="#service">Historia</a></li>
                                        <li class=""><a href="#portfolio">Galeria</a></li>
                                        <li class=""><a href="#testimonial">Testimonios</a></li>
                                        <li class=""><a href="#myModalMantenimientos" class="btn btn-link btn-lg" data-toggle="modal">Mantenimientos</a> </li>
                                        <li class=""><a href="#contact">Contactenos</a></li>
                                        <li class=""><a href="#Login1" id="Login" data-toggle="modal">Iniciar Sesión</a></li>
                                    </ul>

                                </div>
                            </div>
                        </nav>
                    </header>
                    <div class="wrapper">
                        <div class="container">
                            <div class="row">
                                <div class="banner-info text-center wow fadeIn delay-05s">
                                    <h1 class="bnr-title">Estas listo para...</h1>
                                    <h2 class="bnr-sub-title">Disfrutar el viaje</h2>
                                    <p class="bnr-para">¿Vas a algún sitio? Deja que Cabify te lleve.<br> Solicita un vehículo y un conductor privado te <br> recogerá en unos minutos. </p>
                                    <div class="overlay-detail">
                                        <a href="#feature"><i class="fa fa-angle-down"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <section id="mapa">
                <div id="map"></div>
            </section>

            <section id="testimonial" class="wow fadeInUp delay-05s">
                <div class="bg-testicolor">
                    <div class="container section-padding">
                        <div class="row">
                            <div class="testimonial-item">
                                <ul class="bxslider">
                                    <li>
                                        <blockquote>
                                            <img src="img/thumb.png" class="img-responsive">
                                            <p>Estoy muy contento con Cabify. El servicio en general es muy bueno y me gusta su filosofía de negocio.</p>
                                        </blockquote>
                                        <small>Shaun Paul, Client</small>
                                    </li>
                                    <li>
                                        <blockquote>
                                            <img src="img/thumb1.png" class="img-responsive">
                                            <p>Exelente viaje, el conductor muy amable. El auto estaba muy limpio y cuidado, demasiado barato!! </p>
                                        </blockquote>
                                        <small>Will Smith, Client</small>
                                    </li>
                                    <li>
                                        <blockquote>
                                            <img src="img/thumb2.png" class="img-responsive">
                                            <p>Tuve que pedir un viaje con Cabify por urgencia y la experiencia fue grandiosa, el conductor muy amable demasiado atento conducia como un profecional, con gusto segire usando Cabify.</p>
                                        </blockquote>
                                        <small>Vivek Singh, Client</small>
                                    </li>
                                    <li>
                                        <blockquote>
                                            <img src="img/thumb3.png" class="img-responsive">
                                            <p>Una experiencia excelente.</p>
                                        </blockquote>
                                        <small>John Doe, Client</small>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <script src="js/custom.js" type="text/javascript"></script>
        </div>
    </body>
</html>
