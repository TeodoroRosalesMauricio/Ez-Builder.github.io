<%-- 
    Document   : principal
    Created on : 4 nov. 2021, 12:45:52
    Author     : omarc
--%>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                <%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Publicar</title>
        <link rel="stylesheet" type="text/css" href="estilos/dropdown/default.css" />
        <link rel="stylesheet" type="text/css" href="estilos/dropdown/component.css" />
        <script src="scripts/dropdown/modernizr.custom.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="estilos/barra.css">
        <link rel="stylesheet" href="estilos/principal.css">
        <link rel="stylesheet" href="estilos/gestion_f.css">
        <link rel="shortcut icon" href="imgs/gabinete_white.png">
        <script src="scripts/validaciones.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <script src="https://kit.fontawesome.com/40eeeaf3f3.js" crossorigin="anonymous"></script>
    <body>

        <%
            HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
            int id = (int) (miSessiondelUsuario.getAttribute("id") == null ? 0 : miSessiondelUsuario.getAttribute("id"));
        %>

        <!-- Barra superior -->
        <header>

            <!-- Barra superior -->
            <div class="div_header">

                <!-- partial:index.partial.html -->
                <header class="barra_sip">

                    <!-- Logo -->
                    <div class="logo">
                        <a title="Inicio" href="principal_ven.jsp"><img src="iconos\logo_blanco.png" alt="Inicio" /></a>
                    </div>

                    <!-- Barra de búsqueda -->
                    <div class="div_barra">
                        <form name="barra" method="post" action="busqueda_ven.jsp">
                            <div class="div_barra2">
                                <input type="search" name="busqueda" id="search" class="barra_busqueda" placeholder="¿Qué vamos a comprar hoy?">
                                <button type="submit" class="boton_barra">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </form>
                    </div>

                    <div id="categ_menu">
                        <div class="main">
                            <nav class="cbp-hsmenu-wrapper" id="cbp-hsmenu-wrapper">
                                <div class="cbp-hsinner">
                                    <ul class="cbp-hsmenu">

                                        <li>
                                            <a href="#">Componentes</a>
                                            <ul class="cbp-hssubmenu cbp-hssub-rows">
                                                <li><a href="busqueda_cpu_ven.jsp"><img src="iconos\cpu.png" alt="xd"/><span>Procesadores</span></a></li>
                                                <li><a href="busqueda_gpu_ven.jsp"><img src="iconos\gpu.png" alt="xd"/><span>Tarjetas Gráficas</span></a></li>
                                                <li><a href="busqueda_ram_ven.jsp"><img src="iconos\ram.png" alt="xd"/><span>Memorias RAM</span></a></li>
                                                <li><a href="busqueda_mobo_ven.jsp"><img src="iconos\motherboard.png" alt="xd"/><span>Tarjetas Madre</span></a></li>
                                                <li><a href="busqueda_hdd_ven.jsp"><img src="iconos\hdd.png" alt="xd"/><span>Discos Duros</span></a></li>
                                                <li><a href="busqueda_ssd_ven.jsp"><img src="iconos\ssd.png" alt="xd"/><span>Unidades de Estado Sólido</span></a></li>
                                                <li><a href="busqueda_psu_ven.jsp"><img src="iconos\pws.png" alt="xd"/><span>Fuentes de Poder</span></a></li>
                                            </ul>
                                        </li>

                                        <li><a href="busqueda_pc_ven.jsp">PC's de escritorio</a></li>

                                        <li><a href="busqueda_laptop_ven.jsp">Laptops</a></li>

                                        <li>
                                            <a href="#">Periféricos</a>
                                            <ul class="cbp-hssubmenu cbp-hssub-rows">
                                                <li><a href="busqueda_case_ven.jsp"><img src="iconos\gabinete2.png" alt="xd"/><span>Gabinetes</span></a></li>
                                                <li><a href="busqueda_cooler_ven.jsp"><img src="iconos\cooler_2.png" alt="xd"/><span>Disipadores</span></a></li>
                                            </ul>
                                        </li>

                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                    <script src="scripts/dropdown/cbpHorizontalSlideOutMenu.min.js"></script>
                    <script>
                        var menu = new cbpHorizontalSlideOutMenu(document.getElementById('cbp-hsmenu-wrapper'));
                    </script>

            </div>


            <!-- Dorpdown de Mi cuenta -->
            <div class="dropdown2">
                <div class="dropdown">
                    <button title="Mi cuenta Vendedor" class="dropbtn"></button>
                    <div class="dropdown-content">
                        <a href="gestion_ven.jsp">Mi cuenta</a>
                        <a href="GestionP_ven.jsp">Gestión de productos</a>
                        <a href="cerrar_sesion.jsp">Cerrar Sesión</a>
                    </div>
                </div>
            </div>

        </header>



        <!-- Div General-->
        <div class="basembo">

            <!-- Div Titulo-->
            <div class="espaciocpu"></div>
            <div class="espaciocpu"></div>
            <center>
                Publicar nueva MotherBoard
            </center>
            <!-- Div Formulario-->
            <div class="formulariocpu">

                <div class="espaciocpu"></div>
                <div class="espaciocpu"></div>

                <center>
                    Información específica
                </center>
                <br>


                <form action="G_fmbo_A.jsp" method="post" name="f2">



                    <div class="espaciocpu"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Marca">Marca</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Marca" name="marca"
                                   maxlength="20" required class="input" style="width: 70%">
                        </div>
                    </div>



                    <div class="espaciocpu"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Modelo">Modelo</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Modelo" name="modelo"
                                   maxlength="20" required class="input" style="width: 70%">
                        </div>
                    </div>



                    <div class="espaciocpu"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Plataforma">Plataforma</label>
                        </div>

                        <div class="barra">

                            <div class="box">

                                <select id="Plataforma" name="plataforma" required>

                                    <option value="", disabled selected>Elige una opción</option>
                                    <option>Intel</option>
                                    <option>AMD</option>

                                </select>

                            </div>

                        </div>
                    </div>



                    <div class="espaciocpu"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Socket">Socket</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Socket" name="socket"
                                   maxlength="20" required class="input" style="width: 70%">
                        </div>
                    </div>



                    <div class="espaciocpu"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Chipset">Chipset</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Chipset" name="chipset"
                                   maxlength="20" required class="input" style="width: 70%">
                        </div>
                    </div>



                    <div class="espaciocpu"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Forma">Factor de forma</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Forma" name="forma"
                                   maxlength="20" required class="input" style="width: 70%">
                        </div>
                    </div>



                    <div class="espaciocpu"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Ramcomp">Tipo de memoria RAM</label>
                        </div>

                        <div class="barra">

                            <div class="box">

                                <select id="Ramcomp" name="ramcomp" required>

                                    <option value="", disabled selected>Elige una opción</option>
                                    <option>DDR4</option>

                                </select>   

                            </div>

                        </div>
                    </div>



                    <div class="espaciocpu"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Nram">Numero de ranuras para memoria RAM</label>
                        </div>

                        <div class="barra">

                            <div class="box">
                                <select id="Nram" name="nram" required>

                                    <option value="", disabled selected>Elige una opción</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>4</option>
                                    <option>8</option>

                                </select> 
                            </div>

                        </div>
                    </div>



                    <div class="espaciombo"></div>
                    <div class="rectangulo" style="margin-top: 20px">

                        <div class="texto">
                            <label for="Maxram">Cantidad maxima de memoria RAM soportada</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Maxram" name="maxram" onkeypress="return numeros(event)"
                                   maxlength="3" required class="input" style="width: 25%">
                        </div>
                    </div>



                    <div class="espaciombo"></div>
                    <div class="rectangulo" style="margin-top: 40px">

                        <div class="texto">
                            <label for="Ramfrec">Frecuencias de memoria RAM soportadas</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Ramfrec" name="ramfrec"
                                   maxlength="16777215" required class="input" style="width: 90%">
                        </div>
                    </div>



                    <div class="espaciombo"></div>
                    <div class="rectangulo" style="margin-top: 40px">

                        <div class="texto">
                            <label for="Arqgram">Arquitectura de memoria RAM</label>
                        </div>


                        <div class="barra">
                            <div class="box">

                                <select id="Arqgram" name="arqgram" required>

                                    <option value="", disabled selected>Elige una opción</option>
                                    <option>Dual-Channel</option>
                                    <option>Quad-Channel</option>
                                    <option>Cuadrangulo</option>

                                </select> 
                            </div>

                        </div>
                    </div>



                    <div class="espaciocpu"></div>
                    <div class="rectangulo"style="margin-top: 20px">

                        <div class="texto">
                            <label for="Puertos">Puertos traseros</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Puertos" name="puertos"
                                   maxlength="16777215" required class="input" style="width: 90%">
                        </div>
                    </div>



                    <div class="espaciocpu"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Conectores">Conectores internos</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Conectores" name="conectores"
                                   maxlength="16777215" required class="input" style="width: 90%">
                        </div>
                    </div>



                    <div class="espaciocpu"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Pcie">Puertos PCIe</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Pcie" name="pcie"
                                   maxlength="255" required class="input" style="width: 90%">
                        </div>
                    </div>



                    <div class="espaciocpu"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="M2con">Conectores M.2</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="M2con" name="m2con"
                                   maxlength="255" required class="input" style="width: 90%">
                        </div>
                    </div>



                    <div class="espaciocpu"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Sata">Conectores SATA</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Sata" name="sata"
                                   maxlength="50" required class="input" style="width: 70%">
                        </div>
                    </div>



                    <div class="espaciocpu"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Sound">Chip de sonido</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Sound" name="sound"
                                   maxlength="30" required class="input" style="width: 70%">
                        </div>
                    </div>



                    <div class="espaciocpu"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Ethernet">Conector ethernet</label>
                        </div>

                        <div class="barra">
                            <div class="box">

                                <select id="Ethernet" name="ethernet" required>

                                    <option value="", disabled selected>Elige una opción</option>
                                    <option>Si incluye</option>
                                    <option>No incluye</option>

                                </select> 
                            </div>

                        </div>
                    </div>



                    <div class="espaciocpu"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Wifi">Conectividad wifi</label>
                        </div>

                        <div class="barra">

                            <div class="box">
                                <select id="Wifi" name="wifi" required>

                                    <option value="", disabled selected>Elige una opción</option>
                                    <option>Si incluye</option>
                                    <option>No incluye</option>

                                </select> 
                            </div>

                        </div>
                    </div>



                    <div class="espaciocpu"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Bluetooth">Conectividad bluetooth</label>
                        </div>

                        <div class="barra">

                            <div class="box">
                                <select id="Bluetooth" name="bluetooth" required>

                                    <option value="", disabled selected>Elige una opción</option>
                                    <option>Si incluye</option>
                                    <option>No incluye</option>

                                </select> 
                            </div>
                        </div>
                    </div>


                    <br>
                    <div class="espaciocpu"></div>




                    <!-- Div Boton-->

                    <div class="botonc">
                        <input type="submit" class="carritob" value="Continuar">                       
                    </div>

                </form>

            </div>

        </div>

    </body>
</html>

