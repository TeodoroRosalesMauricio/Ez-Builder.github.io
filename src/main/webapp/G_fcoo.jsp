<%-- 
    Document   : G_fcoo
    Created on : 31 mar. 2022, 14:39:12
    Author     : usuario1
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
        <div class="basecoo">

            <!-- Div Titulo-->
            <div class="espaciocpu"></div>
            <center>
                Publicar nuevo Cooler
            </center>
            <!-- Div Formulario-->
            <div class="formulariocpu">

                <div class="espaciombo"></div>

                <center>
                    Información específica
                </center>
                <br>

                <form action="G_fcoo_A.jsp" method="post" name="f2">



                    <div class="espaciombo"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Marca">Marca</label>
                        </div>

                        <div class="barra">

                            <input type="text" id="Marca" name="marca"
                                   maxlength="20" required class="input" style="width: 70%"> 

                        </div>
                    </div>



                    <div class="espaciombo"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Modelo">Modelo</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Modelo" name="modelo"
                                   maxlength="20" required class="input" style="width: 70%">
                        </div>
                    </div>



                    <div class="espaciombo"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Socket">Sockets compatibles</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Socket" name="socket"
                                   maxlength="16777215" required class="input" style="width: 90%">
                        </div>
                    </div>



                    <div class="espaciombo"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Medidas">Medidas del disipador</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Medidas" name="medidas"
                                   maxlength="60" required class="input" style="width: 90%">
                        </div>
                    </div>



                    <div class="espaciombo"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Nfan">Número de ventiladores del disipador</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Nfan" name="nfan" 
                                   maxlength="30" required class="input" style="width: 80%">
                        </div>
                    </div>



                    <div class="espaciombo"></div>
                    <div class="rectangulo" style="margin-top: 20px">

                        <div class="texto">
                            <label for="Confan">Tipo de conector del disipador</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Confan" name="confan"
                                   maxlength="20" required class="input" style="width: 70%">
                        </div>
                    </div>



                    <div class="espaciombo"></div>
                    <div class="rectangulo" style="margin-top: 20px">

                        <div class="texto">
                            <label for="Rpmfan">Número de RPM del ventilador del disipador</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Rpmfan" name="rpmfan" onkeypress="return numeros(event)"
                                   maxlength="8" required class="input" style="width: 30%">
                        </div>
                    </div>



                    <div class="espaciombo"></div>
                    <div class="rectangulo" style="margin-top: 20px">

                        <div class="texto">
                            <label for="Airmax">Máximo flujo de aire</label>
                        </div>

                        <div class="barra">

                            <input type="text" id="Airmax" name="airmax" onkeypress="return precio(event)"
                                   maxlength="20" required class="input" style="width: 35%"> 

                        </div>
                    </div>



                    <div class="espaciombo"></div>
                    <div class="rectangulo">

                        <div class="texto">
                            <label for="Energ">Consumo energético del disipador</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Energ" name="energ" onkeypress="return precio(event)"
                                   maxlength="8" required class="input" style="width: 35%">
                        </div>
                    </div>



                    <div class="espaciombo"></div>
                    <div class="rectangulo" style="margin-top: 20px">

                        <div class="texto">
                            <label for="Ruido">Nivel de ruido del disipador</label>
                        </div>

                        <div class="barra">
                            <input type="text" id="Ruido" name="ruido" onkeypress="return precio(event)"
                                   maxlength="8" required class="input" style="width: 35%">
                        </div>
                    </div>


                    <br>
                    <div class="espaciombo"></div>


                    <!-- Div Boton-->

                    <div class="botonc">
                        <input type="submit" class="carritob" value="Continuar">                       
                    </div>


                </form>

            </div>

        </div>

    </body>
</html>

