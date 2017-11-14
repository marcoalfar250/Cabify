<%-- 
    Document   : Principal
    Created on : 25/10/2017, 11:52:07 AM
    Author     : Marco Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html>
    <head>
        <title>Cabify</title>
        <meta charset="utf-8">
        <%@ include file="Imports.jspf" %>
        <link href="css/LoginStyle.css" rel="stylesheet" type="text/css"/>
        <script src="js/particles.min.js" type="text/javascript"></script>
        <script src="js/ParJs.js" type="text/javascript"></script>
        <script src="js/LoginJs.js" type="text/javascript"></script>
        
    </head>
    <body>
        
        <div class="modal fade" id="ModalRegistroUsuario" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="myModalTitle">Registrarse</h4>
                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <form role="form" onsubmit="return false;" id="formConductores">
                            <div class="form-group" id="groupCedula">
                                <label for="cedula">Cedula:</label>
                                <input type="text" class="form-control" id="cedula" autofocus="true" placeholder="Cedula">
                            </div>

                            <div class="form-group" id="groupNombre">
                                <label for="nombre">Nombre:</label>
                                <input type="text" class="form-control" id="nombre" placeholder="Nombre" >
                            </div>

                            <div class="form-group" id="groupApellidos">
                                <label for="apellidos">Apellidos:</label>
                                <input type="text" class="form-control" id="apellidos" placeholder="Apellidos">
                            </div>

                            <div class="form-group" id="groupCorreo">
                                <label for="Correo">Correo:</label>
                                <input type="text" class="form-control" id="Correo" placeholder="Correo Electronico">
                            </div>

                            <div class="form-group" id="groupPassWord">
                                <label for="password">Contraseña:</label>
                                <input type="password" class="form-control" id="password" placeholder="Contraseña">
                            </div>

                            <div class="form-group" id="groupFechaNacimiento">
                                <label for="dpFechaNacimiento">Fecha Nacimiento:</label>
                                <div id="dpFechaNacimiento" class="input-group date form_date" data-date="" data-date-format="dd/mm/yyyy" data-link-field="dtp_input2" data-link-format="dd/mm/yyyy">
                                    <input class="form-control" type="text" value="" readonly placeholder="dd/mm/aaaa" id="dpFechaNacimientoText">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>

                            <div class="form-group" id="groupDirreción">
                                <label for="Dirreción">Dirreción:</label>
                                <textarea class="form-control" rows="3" id="Dirreción"></textarea>
                            </div>

                            <div class="form-group" id="groupTelefono">
                                <label for="Telefono">Telefono:</label>
                                <input type="text" class="form-control" id="Telefono" placeholder="Telefono">
                            </div>

                            <div class="form-group" id="groupTipoLic">
                                <label for="Telefono">Tipo Usuario:</label>
                                <div class="selectContainer form-control">
                                    <select id="comboTipos" class="form-control" name="tipos">
                                        <option value="">Escoja una opción</option>
                                        <option value="normal" selected>Usuario Normal</option>
                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <input type="hidden" value="agregarUsuario" id="UsuariosAction"/>
                                <button type="submit" class="btn btn-primary" id="enviar">Guardar</button>
                                <button type="reset" class="btn btn-danger" id="cancelar">Cancelar</button>
                            </div>

                            <div class="form-group height25" >
                                <div class="alert alert-success hiddenDiv" id="mesajeResult">
                                    <strong id="mesajeResultNeg">¡Que tenga un buen día!</strong> 
                                    <span id="mesajeResultText">Gracias por registrarse a nuestros servicios</span>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        
        <div class="modal face" id="Login1">
    
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h1 class="logo-caption" aling="center"><span class="tweak">Iniciar </span>Sesión</h1>
                    </div>
                    
                    <div class="modal-body">
                    
                            <form role="form" onsubmit="return false;" id="formLogin">
                                <div class="form-group" id="groupUsario">
                                    <input id="usuario" type="text" name="username" placeholder="Username" class="form-control" />
                                </div>
                                <div class="form-group" id="groupPassword">
                                    <input id="PasswordLogin" type="password" name="username" placeholder="Password" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <button type="button" class="btn btn-default btn-block btn-custom" id="loginButton">Iniciar Sesión</button>
                                    <button type="button" class="btn btn-default btn-block btn-custom" id="cancelar">Cancelar</button>
                                </div>
                            </form>
                    </div>
                </div>  
            </div>  
            
        </div>

        <div class="modal fade" id="myModalMantenimientos" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="myModalTitle">Selecione el Mantenimiento
                    </div>

                    <div class="modal-body" id="myModalMan">
                        <a href="UsuarioMante.jsp" class="btn btn-primary">Mantenimiento Usuarios</a> 
                        <a href="VehiculosMante.jsp" class="btn btn-primary">Mantenimiento Vehiculo</a>
                        <a href="ConducorMante.jsp" class="btn btn-primary" >Mantenimiento Conductor</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="loader"></div>
        <div id="myDiv">
            <!--HEADER .l.>-->
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
            <!--/ HEADER-->
            <!---->
            <%-- if (sesion.equals(null) && nombre.equals("")) { --%> 
            
           <!--  <section id="Login">
                <div class="container">
                    <div id="login-box">
                        <div class="controls">
                            <h1 class="logo-caption"><span class="tweak">L</span>ogin</h1>
                            <form role="form" onsubmit="return false;" id="formLogin">
                                <div class="form-group" id="groupUsario">
                                    <input id="usuario" type="text" name="username" placeholder="Username" class="form-control" />
                                </div>
                                <div class="form-group" id="groupPassword">
                                    <input id="password" type="password" name="username" placeholder="Password" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <button type="button" class="btn btn-default btn-block btn-custom" id="loginButton">Login</button>
                                    <button type="button" class="btn btn-default btn-block btn-custom" id="cancelar">Cancelar</button>
                                </div>
                            </form>
                        </div><!-- /.controls -->
                    <!--</div><!-- /#login-box -->
                <!--</div><!-- /.container -->
                <div id="particles-js"></div>
           <!-- </section> -->
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
            <section id="feature" class="section-padding wow fadeIn delay-05s">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="wrap-item text-center">
                                <div class="item-img">
                                    <img src="img/ser05.png" alt=""/>
                                </div>
                                <h3 class="pad-bt15">Servicio A+</h3>
                                <p>Coches de alta gama con todo tipo de detalles, como agua o tu propia selección de música. Todo lo que necesites para disfrutar del viaje.</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="wrap-item text-center">
                                <div class="item-img">
                                    <img src="img/ser06.png" alt=""/>
                                </div>
                                <h3 class="pad-bt15">Soporte Local</h3>
                                <p>En todas nuestras ciudades disponemos de servicio de atención al cliente. Estamos aquí para lo que necesites. Cuándo y dónde quieras.</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="wrap-item text-center">
                                <div class="item-img">
                                    <img src="img/ser03.png">
                                </div>
                                <h3 class="pad-bt15">Barato</h3>
                                <p>No podras creer la barato que es viajar con Cambify, con solo unos pocos colones podras viajar con tus amigos donde quieras y cuando quieras.</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="wrap-item text-center">
                                <div class="item-img">
                                    <img src="img/ser04.png">
                                </div>
                                <h3 class="pad-bt15">Seguro</h3>
                                <p>Conductores elegidos uno a uno con la formación necesaria. Comparte tu viaje para que tus amigos sepan dónde estás.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!---->
            <!---->
            <section id="service" class="section-padding wow fadeInUp delay-05s">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <h2 class="service-title pad-bt15">Sobre Nosotros</h2>
                            <p class="sub-title pad-bt15">La empresa Cabify es de carácter internacional y nació en España, cuando el creador de la idea viajó al sudeste asiático y se dio cuenta que tenía problemas al pagar un taxi, se le ocurrió desarrollar una marca global de taxis, que pudiera ser generalizada y que tuviera la posibilidad de desarrollar mediante internet o teléfonos móviles.</p>
                            <hr class="bottom-line">
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="service-item">
                                <h3><span>F</span>undador</h3>
                                <p>Agustín Guilisasti tiene 28 años y es un emprendedor en el mundo del transporte de los vehículos de lujo. El junto a su amigo, Ignacio Gutiérrez, crearon Cabify un servicio de taxis que tiene la particularidad de transporte de autos de lujo.</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="service-item">
                                <h3><span>C</span>abify&nbsp;<span>S</span>tar</h3>
                                <p>Cabify Star es nuestra manera de recompensar a nuestros usuarios. Con este programa de fidelización podrás acceder a múltiples beneficios: reducir los tiempos de espera al solicitar un Cabify, conseguir ventajas exclusivas… Cabify Star sólo está disponible para cuentas personales, no corporativas.</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="service-item">
                                <h3><span>P</span>ropina?</h3>
                                <p>No, nuestros conductores no esperan propina.</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="service-item">
                                <h3><span>U</span>netenos!</h3>
                                <p>Siempre estamos buscando a nuevos conductores que quieran formar parte de nuestro equipo; es una gran oportunidad para obtener ingresos estables mientras conduces para clientes de las mejores empresas del mundo.<br>¿Qué tienes que hacer para trabajar con nosotros? Es muy sencillo. Dirígete a nuestra sección para conductores, rellena el formulario correspondiente y nos pondremos en contacto contigo.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!---->
            <!---->
            <!---->
            <!---->
            <section id="portfolio" class="section-padding wow fadeInUp delay-05s">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <h2 class="service-title pad-bt15">Un pequeño recorrido</h2>
                            <p class="sub-title pad-bt15">Mira nuestro albun de experiencias que puedes tener<br>compartiendo tus viajes con Cabify</p>
                            <hr class="bottom-line">
                        </div>
                        <div class="col-md-4 col-sm-6 col-xs-12 portfolio-item padding-right-zero mr-btn-15">
                            <figure>
                                <img src="img/baby_filter.jpg" class="img-responsive"/>
                                <figcaption>
                                    <h2>Con tus amigos</h2>
                                    <p>Pide Cabify guntos con tus amigos para que sus experiencias sean unicas!</p>
                                </figcaption>
                            </figure>
                        </div>
                        <div class="col-md-4 col-sm-6 col-xs-12 portfolio-item padding-right-zero mr-btn-15">
                            <figure>
                                <img src="img/girls_filter.jpg" class="img-responsive"/>
                                <figcaption>
                                    <h2>Con esas personas importantes</h2>
                                    <p>Con Cabify puedes viajar de forma segura, para darle las mayor seguridad a tus seres queridos!</p>
                                </figcaption>
                            </figure>
                        </div>
                        <div class="col-md-4 col-sm-6 col-xs-12 portfolio-item padding-right-zero mr-btn-15">
                            <figure>
                                <img src="img/cabify-carro.jpg" class="img-responsive"/>
                                <figcaption>
                                    <h2>Escoge tu conductor</h2>
                                    <p>En Cabify tenemos una amplia gama de conductores y veiculos, que tu simplemente date el lijo de escoger<br>asi de sencillo!!</p>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                </div>
            </section>
            <!---->
            <!---->

            <!---->
            <!--<section id="blog" class="section-padding wow fadeInUp delay-05s">
              <div class="container">
                <div class="row">
                  <div class="col-md-12 text-center">
                    <h2 class="service-title pad-bt15">Latest from our blog</h2>
                    <p class="sub-title pad-bt15">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod<br>tempor incididunt ut labore et dolore magna aliqua.</p>
                    <hr class="bottom-line">
                  </div>
                  <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="blog-sec">
                      <div class="blog-img">
                        <a href="">
                          <img src="img/blog01.jpg" class="img-responsive">
                        </a>
                      </div>
                      <div class="blog-info">
                        <h2>This is Lorem ipsum heading.</h2>
                        <div class="blog-comment">
                            <p>Posted In: <span>Legal Advice</span></p>
                            <p>
                              <span><a href="#"><i class="fa fa-comments"></i></a> 15</span>
                              <span><a href="#"><i class="fa fa-eye"></i></a> 11</span></p>
                        </div>
                        <p>We cannot expect people to have respect for laws and orders until we teach respect to those we have entrusted to enforce those laws all the time. we always want to help people cordially.</p>
                        <a href="" class="read-more">Read more →</a>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="blog-sec">
                      <div class="blog-img">
                        <a href="">
                          <img src="img/blog02.jpg" class="img-responsive">
                        </a>
                      </div>
                      <div class="blog-info">
                        <h2>This is Lorem ipsum heading.</h2>
                        <div class="blog-comment">
                            <p>Posted In: <span>Legal Advice</span></p>
                            <p>
                              <span><a href="#"><i class="fa fa-comments"></i></a> 15</span>
                              <span><a href="#"><i class="fa fa-eye"></i></a> 11</span></p>
                        </div>
                        <p>We cannot expect people to have respect for laws and orders until we teach respect to those we have entrusted to enforce those laws all the time. we always want to help people cordially.</p>
                        <a href="" class="read-more">Read more →</a>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="blog-sec">
                      <div class="blog-img">
                        <a href="">
                          <img src="img/blog03.jpg" class="img-responsive">
                        </a>
                      </div>
                      <div class="blog-info">
                        <h2>This is Lorem ipsum heading.</h2>
                        <div class="blog-comment">
                            <p>Posted In: <span>Legal Advice</span></p>
                            <p>
                              <span><a href="#"><i class="fa fa-comments"></i></a> 15</span>
                              <span><a href="#"><i class="fa fa-eye"></i></a> 11</span></p>
                        </div>
                        <p>We cannot expect people to have respect for laws and orders until we teach respect to those we have entrusted to enforce those laws all the time. we always want to help people cordially.</p>
                        <a href="" class="read-more">Read more →</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </section>-->
            <!---->
            <section id="contact" class="section-padding wow fadeInUp delay-05s">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center white">
                            <h2 class="service-title pad-bt15">Contactenos</h2>
                            <p class="sub-title pad-bt15">Quieres ayudarnos a mejorar<br>Nos interesa saber sus opiniones</p>
                            <hr class="bottom-line white-bg">
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="loction-info white">
                                <p>Campus Benjamín Núñez Heredia Costa Rica, Lagunilla de Heredia<i class="fa fa-map-marker pull-left fa-2x"><br></i></p>
                                <p><i class="fa fa-hand-o-right pull-left fa-2x " ></i>cabify@info.com</p>
                                <p><i class="fa fa-phone fa-fw pull-left fa-2x"></i>+506 2277 0596</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="contact-form">
                                <div id="sendmessage">Su mensaje ha sido enviado,¡Muchas Gracias</div>
                                <div id="errormessage"></div>
                                <form action="" method="post" role="form" class="contactForm">
                                    <div class="col-md-6 padding-right-zero">
                                        <div class="form-group">
                                            <input type="text" name="name" class="form-control" id="name" placeholder="Nombre" data-rule="minlen:4" data-msg="Por favor dígite al menos 4 caracteres" />
                                            <div class="validation"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="email" class="form-control" name="email" id="email" placeholder="Correo Electronico" data-rule="email" data-msg="Por favor valide su correo electronico" />
                                            <div class="validation"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="subject" id="subject" placeholder="tema" data-rule="minlen:4" data-msg="Por favor dígite al menos 8 caracteres" />
                                            <div class="validation"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Mensaje"></textarea>
                                            <div class="validation"></div>
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-submit">Enviar</button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!---->
            <!---->
            <footer id="footer">
                <div class="container">
                    <div class="row text-center">
                        <p>&copy; Cabify Company. All Rights Reserved.</p>
                        <div class="credits">
                            <!-- 
                                All the links in the footer should remain intact. 
                                You can delete the links only if you purchased the pro version.
                                Licensing information: https://bootstrapmade.com/license/
                                Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Baker
                            -->
                            Designed  by UNA Students
                        </div>
                    </div>
                </div>
            </footer>
            <!---->
            <script src="js/custom.js" type="text/javascript"></script>
        </div>
    </body>
</html>
