<%-- 
    Document   : persona-c
    Created on : 22/08/2018, 12:10:33 AM
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
                
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-default btn-outline-purple mb-3" data-toggle="modal" data-target="#exampleModal">
                    <b>+</b> Añadir Persona
                </button>
                
                <%@include file="modal-persona-cu.jsp"%>
                
                <table id="fix-table" class="table table-bordered table-hover text-center table-responsive-sm table-responsive-md">
                    <thead>
                        <tr>
                            <th scope="col">#DNI</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Apellido</th>
                            <th scope="col">Teléfono</th>
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
         <%@include file="/Template/js.jsp"%>
    </body>
</html>