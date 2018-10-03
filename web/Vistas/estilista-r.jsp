<%-- 
    Document   : estilista-r
    Created on : 05/09/2018, 10:35:55 PM
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
                    <b>+</b> Añadir Estilista
                </button>
                
                <%@include file="modal-estilista-cu.jsp"%>
                
                <!-- Table -->
                <table id="fix-table" class="table table-bordered table-hover text-center table-responsive-sm table-responsive-md">
                    <thead>
                        <tr>
                            <th scope="col">Estilista</th>
                            <th scope="col">Referencia</th>
                            <th scope="col">Especialista</th>
                            <th scope="col">Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <c:forEach var="estilista" items="${lista}">
                                <tr>
                                    <td><c:out value="${estilista.name} ${estilista.lastname} (${estilista.dni})"/></td>
                                    <td><c:out value="${estilista.reference}"/></td>
                                    <td><c:out value="${estilista.specialist}"/></td>
                                    <td class="text-center">
                                        <a class="btn btn-default btn-outline-purple" href="${pageContext.request.contextPath}/estilista?reference=${estilista.reference}">Editar</a>
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

