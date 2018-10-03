<%-- 
    Document   : surgery-r
    Created on : 11/09/2018, 04:11:32 PM
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
                    <b>+</b> Añadir Cirugía
                </button>
                
                <%@include file="modal-surgery-cu.jsp"%>
                
                <!-- Table -->
                <table id="fix-table" class="table table-bordered table-hover text-center table-responsive-sm table-responsive-md">
                    <thead>
                        <tr>
                            <th scope="col">#ID</th>
                            <th scope="col">Mascota atendida:</th>
                            <th scope="col">Atendida por:</th>
                            <th scope="col">Referencia del Veterinario</th>
                            <th scope="col">Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <c:forEach var="surgery" items="${lista}">
                                <tr>
                                    <td><c:out value="${surgery.id}"/></td>
                                    <td><c:out value="${surgery.mascota.name} (${surgery.mascota.persona.name} ${surgery.mascota.persona.lastname} ${surgery.mascota.persona.dni})"/></td>
                                    <td><c:out value="${surgery.veterinario.name} ${surgery.veterinario.lastname} (${surgery.veterinario.dni})"/></td>
                                    <td><c:out value="${surgery.veterinario.reference}"/></td>
                                    <td class="text-center">
                                        <a class="btn btn-default btn-outline-purple" href="${pageContext.request.contextPath}/surgery?id=${surgery.id}">Editar</a>
                                        <a class="btn btn-default btn-outline-purple" href="">Borrar</a>
                                        <a class="btn btn-default btn-outline-success" href="${pageContext.request.contextPath}/history?id=${surgery.id}">Ya terminada</a>
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