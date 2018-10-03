<%-- 
    Document   : spa-r
    Created on : 11/09/2018, 11:22:13 AM
    Author     : John Wick Recargado
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html lang="es">
    <head>
          <%@include file="/Template/css.jsp"%>
    </head>
    <body>
        <div class="wrapper">
            <!-- call Sidebar -->
            <%@include file="/Template/sidebar.jsp"%>
            <!-- call Nav-content -->
            <div id="content">
                <%@include file="/Template/nav-content.jsp"%>
                
                <%--
                    <c:out value="${mascotica.id}"/>
                --%>
                
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-default btn-outline-purple mb-3" data-toggle="modal" data-target="#exampleModal">
                    <b>+</b> Añadir SPA
                </button>
                
                <%@include file="modal-spa-cu.jsp"%>
                
                <!-- Table -->
                <table id="fix-table" class="table table-bordered table-hover text-center table-responsive-sm table-responsive-md">
                    <thead>
                        <tr>
                            <th scope="col">#ID</th>
                            <th scope="col">Mascota atendida:</th>
                            <th scope="col">Atendida por:</th>
                            <th scope="col">Referencia del Estilista:</th>
                            <th scope="col">Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <c:forEach var="spa" items="${lista}">
                                <tr>
                                    <td><c:out value="${spa.id}"/></td>
                                    <td><c:out value="${spa.mascota.name} (${spa.mascota.persona.name} ${spa.mascota.persona.lastname} ${spa.mascota.persona.dni})"/></td>
                                    <td><c:out value="${spa.estilista.name} ${spa.estilista.lastname} (${spa.estilista.dni})"/></td>
                                    <td><c:out value="${spa.estilista.reference}"/></td>
                                    <td class="text-center">
                                        <a class="btn btn-default btn-outline-purple" href="${pageContext.request.contextPath}/spa?id=${spa.id}">Editar</a>
                                        <a class="btn btn-default btn-outline-purple" href="">Borrar</a> 
                                    </td>
                                </tr>
                            </c:forEach>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <%@include file="/Template/js.jsp"%>
    </body>
</html>
