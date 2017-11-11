<%-- 
    Document   : VehiculosMante
    Created on : 05/11/2017, 02:40:21 PM
    Author     : Marco Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Vehiculos</title>
        <%@ include file="Imports.jspf" %>
        <script src="js/spectrum.js" type="text/javascript"></script>
        <link href="css/spectrum.css" rel="stylesheet" type="text/css"/>
        <script src="js/VeiculoJS.js" type="text/javascript"></script>
    </head>
    <body>

        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="myModalTitle">Modal Header</h4>
                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <p>This is a small modal.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="myModalVeiculo" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="myModalTitle">Insertar / Modificar Conductores
                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <form role="form" onsubmit="return false;" id="formVeiculo">
                            <div class="form-group" id="groupPlaca">
                                <label for="Placa">Placa:</label>
                                <input type="text" class="form-control" id="placa" autofocus="true" placeholder="Placa">
                            </div>

                            <div class="form-group" id="groupVehiConductores">
                                <label for="Conductores">Conductor:</label>
                                <div class="selectContainer form-control">
                                    <select id="comboVConductor" class="form-control" name="conductores">
                                        <option value="">Escoja una opción</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group" id="groupModelo">
                                <label for="Modelo">Modelo:</label>
                                <input type="text" class="form-control" id="modelo" placeholder="Modelo">
                            </div>
                            
                            <div class="form-group" id="groupPasajeros">
                                <label for="CantidadPasajeros">Cantidad de pasajeros</label>
                                <input type="number" id="CantidadPasajeros" class="form-control bfh-number" value="0" min="0" max="60">
                            </div>

                            <div class="form-group" id="groupMarca">
                                <label for="Marca">Marca:</label>
                                <div class="selectContainer form-control">
                                    <select id="comboMarca" class="form-control" name="Marcas">
                                    <option value="" selected="">Escoga una opcion </option>
                                    <option value="Acura">Acura</option>
                                    <option value="Alfa Romeo">Alfa Romeo</option>
                                    <option value="68">AMC</option>                            
                                    <option value="AMC">Aro</option>                               
                                    <option value="Asia">Asia</option>                               
                                    <option value="Aston Martin">Aston Martin</option>                               
                                    <option value="Audi">Audi</option>                               
                                    <option value="Austin">Austin</option>                               
                                    <option value="Avanti">Avanti</option>                              
                                    <option value="Bentley">Bentley</option>                              
                                    <option value="Bluebird">Bluebird</option>                              
                                    <option value="BMW">BMW</option>                             
                                    <option value="61">Buick</option>                              
                                    <option value="Buick">BYD</option>                               
                                    <option value="Cadillac">Cadillac</option>                               
                                    <option value="Chana">Chana</option>                               
                                    <option value="Changan">Changan</option>                               
                                    <option value="Chery">Chery</option>                              
                                    <option value="Chevrolet">Chevrolet</option>                               
                                    <option value="Chrysler">Chrysler</option>                              
                                    <option value="Citroen">Citroen</option>                              
                                    <option value="Dacia">Dacia</option>                             
                                    <option value="Daewoo">Daewoo</option>                             
                                    <option value="Daihatsu">Daihatsu</option>                             
                                    <option value="Datsun">Datsun</option>                             
                                    <option value="Dodge RAM">Dodge RAM</option>                              
                                    <option value="Donfeng (ZNA)">Donfeng (ZNA)</option>                              
                                    <option value="Eagle">Eagle</option>                              
                                    <option value="Faw">Faw</option>                              
                                    <option value="Ferrari">Ferrari</option>                              
                                    <option value="Fiat">Fiat</option>                              
                                    <option value="Ford">Ford</option>                        
                                    <option value="Foton">Foton</option>                          
                                    <option value="Freightliner">Freightliner</option>                              
                                    <option value="Geely">Geely</option>                              
                                    <option value="Geo">Geo</option>                              
                                    <option value="GMC">GMC</option>                              
                                    <option value="Gonow">Gonow</option>                               
                                    <option value="Great Wall">Great Wall</option>                               
                                    <option value="Hafei">Hafei</option>                               
                                    <option value="Heibao">Heibao</option>                              
                                    <option value="Higer">Higer</option>                              
                                    <option value="Hino">Hino</option>                             
                                    <option value="Honda">Honda</option>                              
                                    <option value="Hummer">Hummer</option>                              
                                    <option value="Hyundai">Hyundai</option>                              
                                    <option value="Infiniti">Infiniti</option>                             
                                    <option value="International">International</option>                             
                                    <option value="Isuzu">Isuzu</option>                             
                                    <option value="Iveco">Iveco</option>                              
                                    <option value="JAC">JAC</option>                              
                                    <option value="Jaguar">Jaguar</option>                           
                                    <option value="Jeep">Jeep</option>                           
                                    <option value="76">Jinbei</option>                          
                                    <option value="Jinbei">JMC</option>                           
                                    <option value="Kenworth">Kenworth</option>                          
                                    <option value="Kia">Kia</option>                              
                                    <option value="Lada">Lada</option>                             
                                    <option value="Lamborghini">Lamborghini</option>
                                    <option value="Lancia">Lancia</option>
                                    <option value="Land Rover">Land Rover</option>
                                    <option value="Lexus">Lexus</option>
                                    <option value="Lifan">Lifan</option>
                                    <option value="Lincoln">Lincoln</option>
                                    <option value="Lotus">Lotus</option>
                                    <option value="Mack">Mack</option>
                                    <option value="Magiruz">Magiruz</option>
                                    <option value="Mahindra">Mahindra</option>
                                    <option value="Maserati">Maserati</option>
                                    <option value="Mazda">Mazda</option>
                                    <option value="Mercedes Benz">Mercedes Benz</option>
                                    <option value="Mercury">Mercury</option>
                                    <option value="MG">MG</option>
                                    <option value="Mini">Mini</option>
                                    <option value="Mitsubishi">Mitsubishi</option>
                                    <option value="Nissan">Nissan</option>
                                    <option value="Oldsmobile">Oldsmobile</option>
                                    <option value="Opel">Opel</option>
                                    <option value="Peterbilt">Peterbilt</option>
                                    <option value="Peugeot">Peugeot</option>
                                    <option value="Plymouth">Plymouth</option>
                                    <option value="Polarsun">Polarsun</option>
                                    <option value="Pontiac">Pontiac</option>
                                    <option value="Porsche">Porsche</option>
                                    <option value="Proton">Proton</option>
                                    <option value="Rambler">Rambler</option>
                                    <option value="Renault">Renault</option>
                                    <option value="Reva">Reva</option>
                                    <option value="Rolls Royce">Rolls Royce</option>
                                    <option value="Rover">Rover</option>
                                    <option value="Saab">Saab</option>
                                    <option value="Samsung">Samsung</option>
                                    <option value="Saturn">Saturn</option>
                                    <option value="Scania">Scania</option>
                                    <option value="Scion">Scion</option>
                                    <option value="Seat">Seat</option>
                                    <option value="Skoda">Skoda</option>
                                    <option value="Smart">Smart</option>
                                    <option value="Ssang Yong">Ssang Yong</option>
                                    <option value="Subaru">Subaru</option>
                                    <option value="Suzuki">Suzuki</option>
                                    <option value="Tianma">Tianma</option>
                                    <option value="Tiger Truck">Tiger Truck</option>
                                    <option value="Toyota">Toyota</option>
                                    <option value="Volkswagen">Volkswagen</option>
                                    <option value="Volvo">Volvo</option>
                                    <option value="Western Star">Western Star</option>
                                    <option value="Yugo">Yugo</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group" id="groupAnho">
                                <label for="Año">Año:</label>
                                <div class="selectContainer form-control">
                                    <select id="comboAño" class="form-control" name="años">
                                        <option value="">Escoja una opción</option>
                                        <option value="2018" selected="">2018</option>
                                        <option value="2017">2017</option>
                                        <option value="2016">2016</option>
                                        <option value="2015">2015</option>
                                        <option value="2014">2014</option>
                                        <option value="2013">2013</option>
                                        <option value="2012">2012</option>
                                        <option value="2011">2011</option>
                                        <option value="2010">2010</option>
                                        <option value="2009">2009</option>
                                        <option value="2008">2008</option>
                                        <option value="2007">2007</option>
                                        <option value="2006">2006</option>
                                        <option value="2005">2005</option>
                                        <option value="2004">2004</option>
                                        <option value="2003">2003</option>
                                        <option value="2002">2002</option>
                                        <option value="2001">2001</option>
                                        <option value="2000">2000</option>
                                        <option value="1999">1999</option>
                                        <option value="1998">1998</option>
                                        <option value="1997">1997</option>
                                        <option value="1996">1996</option>
                                        <option value="1995">1995</option>
                                        <option value="1994">1994</option>
                                        <option value="1993">1993</option>
                                        <option value="1992">1992</option>
                                        <option value="1991">1991</option>
                                        <option value="1990">1990</option>
                                        <option value="1989">1989</option>
                                        <option value="1988">1988</option>
                                        <option value="1987">1987</option>
                                        <option value="1986">1986</option>
                                        <option value="1985">1985</option>
                                        <option value="1984">1984</option>
                                        <option value="1983">1983</option>
                                        <option value="1982">1982</option>
                                        <option value="1981">1981</option>
                                        <option value="1980">1980</option>
                                        <option value="1979">1979</option>
                                        <option value="1978">1978</option>
                                        <option value="1977">1977</option>
                                        <option value="1976">1976</option>
                                        <option value="1975">1975</option>
                                        <option value="1974">1974</option>
                                        <option value="1973">1973</option>
                                        <option value="1972">1972</option>
                                        <option value="1971">1971</option>
                                        <option value="1970">1970</option>
                                        <option value="1969">1969</option>
                                        <option value="1968">1968</option>
                                        <option value="1967">1967</option>
                                        <option value="1966">1966</option>
                                        <option value="1965">1965</option>
                                        <option value="1964">1964</option>
                                        <option value="1963">1963</option>
                                        <option value="1962">1962</option>
                                        <option value="1961">1961</option>
                                        <option value="1960">1960</option>
                                    </select>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group" id="groupColor">
                                <label for="Color">Color:</label>
                                <input type="text" class="form-control" id="colorES" autofocus="true" placeholder="color">
                            </div>

                            <div class="form-group" id="groupEstadoVeiculo">
                                <label for="Estados">Vehiculo:</label>
                                <div class="selectContainer form-control">
                                    <select id="comboEstadoVehiculo" class="form-control" name="Estados">
                                        <option value="">Escoja una opción</option>
                                        <option value="Activo">Activo</option>
                                        <option value="Inactivo">Inactivo</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <input type="hidden" value="agregarVeiculo" id="VeiculosAction"/>
                                <button type="submit" class="btn btn-primary" id="enviar">Guardar</button>
                                <button type="reset" class="btn btn-danger" id="cancelar">Cancelar</button>
                            </div>

                            <div class="form-group height25" >
                                <div class="alert alert-success hiddenDiv" id="mesajeResult">
                                    <strong id="mesajeResultNeg">Info!</strong> 
                                    <span id="mesajeResultText">This alert box could indicate a neutral informative change or action.</span>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div id="myDiv">
            <!--HEADER-->
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
                                    <a class="navbar-brand" href="#">Man<span class="logo-dec">tenimientos</span></a>
                                </div>
                                <div class="collapse navbar-collapse" id="myNavbar">

                                    <ul class="nav navbar-nav navbar-right">
                                        <li class=""><a href="Principal.jsp">Inicio</a></li>
                                        <li class=""><a href="UsuarioMante.jsp">Usuarios</a></li>
                                        <li class="active"><a href="VehiculosMante.jsp">Vehiculos</a></li>
                                        <li class=""><a href="ConducorMante.jsp">Conductores</a></li>
                                    </ul>

                                </div>
                            </div>
                        </nav>
                    </header>
                    <div class="wrapper">
                        <div class="container">
                            <div class="row">
                                <div class="banner-info text-center wow fadeIn delay-05s">
                                    <h1 class="bnr-title">Bienvenido Administardor</h1>
                                    <h2 class="bnr-sub-title">Nombre Admin</h2>
                                    <p class="bnr-para">Ingresaste a la zona de mantenimientos de <span class="logo-dec">Cabify</span><br>Seleciona un elemento <br>para modificar o editar</p>
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

            <section id="ManVeiculo" class="section-padding wow fadeInUp delay-05s">
                <div class="container">
                    <div class="row">
                        <div class="container">
                            <div class="page-header">
                                <h1><small><span class="logo-dec"></span>Sistema para la administración</small></h1>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        <!-- ********************************************************** -->
                                        <!-- COLUMNA DEL MENU -->
                                        <!-- ********************************************************** -->
                                        <div class="col-md-4">
                                            <div class="dropdown">
                                                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Mantenimientos
                                                    <span class="caret"></span></button>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Mantenimiento Usuarios</a></li>
                                                    <li><a href="#">Mantenimiento Vehiculos</a></li>
                                                    <li><a href="#">Mantenimiento Conductores</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="Logout">Cerrar Sesión</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- ********************************************************** -->
                                        <!-- COLUMNA DEL MENU -->
                                        <!-- ********************************************************** -->

                                        <!-- ********************************************************** -->
                                        <!-- COLUMNA DEL BOTON DE CERRAR SESION -->
                                        <!-- ********************************************************** -->
                                        <div class="col-md-4" style="text-align: right;">
                                            <a class="btn btn-warning" href="Logout" role="button">
                                                <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>
                                                Cerrar Sesión
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading"><h3>Mantenimiento de Vehiculos</h3></div>
                                <div class="panel-body">
                                    <center>
                                        <button type="button" class="btn btn-primary centered" data-toggle="modal" data-target="#myModalVeiculo" id="btMostarFormVeiculo">Insertar Vehiculo</button>
                                    </center><br>
                                    <!-- ********************************************************** -->
                                    <div class="col-sm-12">
                                        <form role="form" onsubmit="return false;" id="formConductor" class="form-horizontal centered">
                                            <div class="form-group" id="groupFiltroVeiculo">
                                                <div class="col-sm-4" style="text-align: right; vertical-align: middle;">
                                                    <p><b>Buscar por placa del vehiculo</b></p>
                                                </div>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" id="FiltroVeiculo" placeholder="Digite la placa del vehiculo">
                                                </div>
                                                <div class="col-sm-4">
                                                    <button type="button" class="btn btn-info centered" data-toggle="modal" data-target="" id="btBuscarVeiculo">
                                                        Buscar <span class="glyphicon glyphicon-search"></span>
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- ********************************************************** -->

                                    <table class="table table-hover table-condensed" id="tablaVeiculos"></table>

                                </div>
                                <div class="panel-footer">Nota: Acciones validas dependeran del rol del usuario</div>
                            </div>
                        </div> 
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
