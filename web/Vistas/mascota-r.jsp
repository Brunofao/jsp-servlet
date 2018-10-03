<%-- 
    Document   : mascota-c
    Created on : 22/08/2018, 01:04:57 AM
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
                    <b>+</b> Añadir Mascota
                </button>
                
                <%@include file="modal-mascota-cu.jsp"%>
                
                <!-- Table -->
                <table id="fix-table" class="table table-bordered table-hover text-center table-responsive-sm table-responsive-md">
                    <thead>
                        <tr>
                            <th scope="col">Titular</th>
                            <th scope="col">#ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Especie</th>
                            <%-- <th scope="col">Historial</th> --%>
                            <th scope="col">Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <c:forEach var="mascota" items="${lista}">
                                <tr>
                                    <td><c:out value="${mascota.persona.name} ${mascota.persona.lastname} (${mascota.persona.dni})"/></td>
                                    <%-- <td><c:out value="${mascota.id}"/></td> --%>
                                    <td><a class="btn btn-default btn-outline-purple" href="${pageContext.request.contextPath}/mascota?history=${mascota.id}"><c:out value="${mascota.id}"/></a></td>
                                    <td><c:out value="${mascota.name}"/></td>
                                    <td><c:out value="${mascota.species}"/></td>
                                    <%-- <td><c:out value="${mascota.history.veterinario.name}"/></td> --%>
                                    <%-- <td><c:out value="${mascota.history}"/></td> --%>
                                    <td class="text-center">
                                        <a class="btn btn-default btn-outline-purple" href="${pageContext.request.contextPath}/mascota?id=${mascota.id}">Editar</a>
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