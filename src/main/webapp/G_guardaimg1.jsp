<%-- 
    Document   : A guarda img 1
    Created on : 28/05/2021, 01:18:01 PM
    Author     : Ez-Builder
--%>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.InputStream"%>
<%@page import="conexion.Base"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>jelou guorld</h1>
        <%

            HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
            int id = (int) (miSessiondelUsuario.getAttribute("idPerAct") == null ? 0 : miSessiondelUsuario.getAttribute("idPerAct"));

            int MAX_SIZE = 102400 * 102400;
            String rootPath;

            DataInputStream in = null;
            FileOutputStream fileOut = null;

            String remoteAddr = request.getRemoteAddr();
            String serverName = request.getServerName();
            // Dirección MaxGOD: "C:\Users\Romeo\Documents\NetBeansProjects\EZ-Builder\src\main\webapp\imgs\productos"
            // Dirección Omar: "C:\\Users\\omarc\\Documents\\NetBeansProjects\\EZ-Builder\\src\\main\\webapp\\imgs\\productos\\";
            // Dirección ElYorch: "C:\\Users\\usuario1\\Documents\\NetBeansProjects\\OraSi\\EZ-Builder\\src\\main\\webapp\\imgs\\productos\\";
            // Dirección Usb: "C:\\Users\\omarc\\Documents\\NetBeansProjects\\EZ-Builder\\src\\main\\webapp\\imgs\\productos\\";
            String realPath = "C:\\Users\\usuario1\\Documents\\NetBeansProjects\\OraSi\\EZ-Builder\\src\\main\\webapp\\imgs\\productos\\";

            rootPath = realPath;
            String contentType = request.getContentType();
            String saveFile = "";

            try {
                if (contentType.indexOf("multipart/form-data") >= 0) {
                    in = new DataInputStream(request.getInputStream());
                    int formDataLength = request.getContentLength();

                    if (formDataLength > MAX_SIZE) {
                        out.println("<p> El archivo de carga máxima no puede acceder " + MAX_SIZE + "</p>");
                        return;
                    }

                    byte dataBytes[] = new byte[formDataLength];
                    int byteRead = 0;
                    int totalBytesRead = 0;

                    while (totalBytesRead < formDataLength) {
                        byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                        totalBytesRead += byteRead;
                    }

                    String file = new String(dataBytes, "UTF-8");
                    saveFile = file.substring(file.indexOf("filename=\"") + 10);
                    saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                    saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
                    int lastIndex = contentType.lastIndexOf("=");

                    String boundary = contentType.substring(lastIndex + 1, contentType.length());

                    String fileName = rootPath + saveFile;
                    int pos;
                    pos = file.indexOf("filename=\"");
                    pos = file.indexOf("\n", pos) + 1;
                    pos = file.indexOf("\n", pos) + 1;
                    pos = file.indexOf("\n", pos) + 1;
                    int boundaryLocation = file.indexOf(boundary, pos) - 4;

                    int startPos = ((file.substring(0, pos)).getBytes()).length;
                    int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

                    File fileDir = new File(rootPath);
                    if (!fileDir.exists()) {
                        fileDir.mkdirs();
                    }

                    fileOut = new FileOutputStream(fileName);

                    fileOut.write(dataBytes, startPos, (endPos - startPos));
                    fileOut.close();
                } else {
                    String content = request.getContentType();
                    out.println("<p> El tipo de datos cargado no es multipart / form-data </p>");
                }
            } catch (Exception ex) {
                throw new ServletException(ex.getMessage());
            }

            Base bd = new Base();

            //String strQry2 = "select id_prod from producto order by id_prod desc limit 1;";
            //ResultSet rs = null;
            //rs = bd.consulta(strQry2);    
            //int idprod;
            //rs.next();
            //idprod = Integer.parseInt(rs.getString(1));
            String idprod = request.getParameter("idprod");
            String img = request.getParameter("img");
            String tform = request.getParameter("tfomr");

            try {
                bd.conectar();
                String strQry = "update producto set img" + img + "_prod = '" + saveFile + "' where id_prod = '" + idprod + "' ;";
                //String strQry = "insert into usuarioImg(idPersona, imagen2) values ( '"+id+"' , '"+saveFile+"' );";
                bd.edita(strQry);

                String strQry2 = "select img_prod, img1_prod, img2_prod, img3_prod from producto where id_prod = '" + idprod + "' ;";

                ResultSet rs2 = null;
                rs2 = bd.consulta(strQry2);
                while (rs2.next()) {

                    System.out.println("");

                    //out.print(idprod);
                    //System.out.println(img);
                    //out.println(saveFile);
                    //System.out.println(rs2.getString(1));
                    //  System.out.println(rs2.getString(2));
                    //System.out.println(rs2.getString(3));
                    //System.out.println(rs2.getString(4));

        %>

        <%=idprod%><br>
        <%=img%><br>
        <%=saveFile%><br>
        <%=rs2.getString(1)%><br>
        <%=rs2.getString(2)%><br>
        <%=rs2.getString(3)%><br>
        <%=rs2.getString(4)%><br>


        <%
                }

            } catch (Exception XD) {
                out.print(XD.getMessage());
            }

            response.sendRedirect(tform);
        %>
    </body>
</html>

