<%-- 
    Document   : mascota-c
    Created on : 22/08/2018, 10:23:41 PM
    Author     : John Wick Recargado
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Models.Persona"%>
<%@page import="DAO.PersonaDAO"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <title>Hello PetShop Lili's</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS, Project Pet CSS & Other's -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/styles.css" type="text/css">
    </head>
    <body>
        <!-- /////////////////////// -->

        <!--
          <h1>Hello, are u there?</h1>
          <h2>Preparing to Git...</h2>
          <h3>Hi, im index.jsp</h3>
        -->
        
        <!--
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">#DNI</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Apellido</th>
                    <th scope="col">Teléfono</th>
                  </tr>
                </thead>
                <tbody>
                    <tr>
                        <c:forEach var="persona" items="${lista}">
                            <tr>
                                <td><c:out value="${persona.dni}"/></td>
                                <td><c:out value="${persona.name}"/></td>
                                <td><c:out value="${persona.lastname}"/></td>
                                <td><c:out value="${persona.phone}"/></td>				
                            </tr>
                        </c:forEach>
                    </tr>
                </tbody>
            </table>
        -->
        
        <%
            PersonaDAO pdao = new PersonaDAO();
            List<Persona> p = pdao.read();
            //  request.setAttribute("persona", p);
        %>
        
        <section id="form-bootstrap">
            <div class="container">
                <div class="row">
                    <div id="cube" class="col-md-12">
                        <form action="http://localhost:8080/mascota" method="post" autocomplete="off">
                            <h4 class="text-center pb-3">Agregar Mascota</h1>
                            <div class="form-group">
                                <select class="form-control form-control-lg custom-select" id="dni" name="dni">
                                    <option selected disabled>Elige un titular</option>
                                    <% for(int i = 0; i < p.size(); i++) { %>
                                        <option value="<% out.print(p.get(i).getDni()); %>"><% out.print(p.get(i).getName() + " " + p.get(i).getLastname()); %></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-lg" id="name" name="name" placeholder="Nombre">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-lg" id="species" name="species" placeholder="Especie">
                            </div>
                            <button type="submit" class="btn btn-outline-success btn-lg btn-block">Agregar mascota</button>
                            <button type="submit" class="btn btn-outline-danger btn-lg btn-block">Cancelar</button>
                        </form>                   
                    </div>
                </div>
            </div>
        </section>
                                
        <!--                     
            <c:forEach var="persona" items="${persona}">
                <tr>
                    <td><c:out value="${persona.name}"/></td>		
                </tr>
            </c:forEach>
        -->
        
        <!-- /////////////////////// -->
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>
