<%-- 
    Document   : persona-c
    Created on : 22/08/2018, 12:10:33 AM
    Author     : John Wick Recargado
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <!-- Required meta tags -->
    <title>Hello PetShop Lili's</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap CSS, Project Pet CSS & Other's -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/styles.css" type="text/css">
    <link rel="stylesheet" href="CSS/styles2.css" type="text/css">
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
  </head>
  <body>
        <!-- /////////////////////// -->
        <!--
            <h1>Hello, are u there?</h1>
            <h2>Preparing to Git...</h2>
            <h3>Hi, im index.jsp</h3>
        -->
        
        <div class="wrapper">
            <!-- call Sidebar -->
            <%@include file="/Template/sidebar.jsp"%>
            <!-- call Nav-content -->
            <div id="content">
                <%@include file="/Template/nav-content.jsp"%>
                
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-default btn-outline-purple mb-3" data-toggle="modal" data-target="#exampleModal">
                    <b>+</b> A�adir Persona
                </button>
                
                <%@include file="modal-persona-cu.jsp"%>
                
                <table id="fix-table" class="table table-bordered table-hover text-center table-responsive-sm table-responsive-md">
                    <thead>
                        <tr>
                            <th scope="col">#DNI</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Apellido</th>
                            <th scope="col">Tel�fono</th>
                            <th scope="col">Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <c:forEach var="persona" items="${lista}">
                                <tr>
                                    <td><c:out value="${persona.dni}"/></td>
                                    <td><c:out value="${persona.name}"/></td>
                                    <c:if test = "${!(persona.lastname == null)}">
                                        <td><c:out value="${persona.lastname}"/></td>
                                    </c:if>
                                    <c:if test = "${(persona.lastname == null)}">
                                        <td><c:out value="/////"/></td>
                                    </c:if>
                                    <c:if test = "${!(persona.phone == null)}">
                                        <td><c:out value="${persona.phone}"/></td>
                                    </c:if>
                                    <c:if test = "${(persona.phone == null)}">
                                        <td><c:out value="/////"/></td>
                                    </c:if>
                                    <td class="text-center">
                                        <a class="btn btn-default btn-outline-purple" href="${pageContext.request.contextPath}/persona?dni=${persona.dni}">Editar</a>
                                        <a class="btn btn-default btn-outline-purple" href="">Borrar</a> 
                                    </td>
                                </tr>
                            </c:forEach>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- /////////////////////// -->
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
    <!-- Scrollbar & SidebarCollapse -->
    <script type="text/javascript">
        $(document).ready(function () {
            $("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar, #content').toggleClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });
        });
    </script>
  </body>
</html>