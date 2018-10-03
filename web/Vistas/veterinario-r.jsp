<%-- 
    Document   : veterinario-c
    Created on : 05/09/2018, 08:16:50 PM
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
                    <b>+</b> Añadir Veterinario
                </button>
                
                <%@include file="modal-veterinario-cu.jsp"%>
                
                <!-- Table -->
                <table id="fix-table" class="table table-bordered table-hover text-center table-responsive-sm table-responsive-md">
                    <thead>
                        <tr>
                            <th scope="col">Veterinario</th>
                            <th scope="col">Referencia</th>
                            <th scope="col">Especialista</th>
                            <th scope="col">Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <c:forEach var="veterinario" items="${lista}">
                                <tr>
                                    <td><c:out value="${veterinario.name} ${veterinario.lastname} (${veterinario.dni})"/></td>
                                    <td><a class="btn btn-default btn-outline-purple" href="${pageContext.request.contextPath}/veterinario?history=${veterinario.reference}"><c:out value="${veterinario.reference}"/></a></td>
                                    <%--<td><c:out value="${veterinario.reference}"/></td>--%>
                                    <td><c:out value="${veterinario.specialist}"/></td>
                                    <td class="text-center">
                                        <a class="btn btn-default btn-outline-purple" href="${pageContext.request.contextPath}/veterinario?reference=${veterinario.reference}">Editar</a>
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
