<%-- 
    Document   : history-r
    Created on : 20/09/2018, 09:03:15 PM
    Author     : John Wick Recargado
--%>
                                                        
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <%@include file="/Template/css.jsp"%>
    </head>
    <body>
        <div class="modal fade" id="exampleModalUpdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-xxl" role="document">
                <div class="modal-content">
                    <div class="modal-header no-border">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">                           
                        <section id="">
                            <div class="container">
                                <div class="row">
                                    <div class="p-4 col-12">
                                        <h4 class="text-center pb-3">Historial Clínico</h4>
                                        <!-- Table -->
                                        <table id="fix-table" class="table table-bordered table-hover text-center table-responsive-sm table-responsive-md">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#ID</th>
                                                    <th scope="col">Nombre de la Mascota</th>
                                                    <th scope="col">Dueño</th>
                                                    <th scope="col">Veterinario tratante:</th>
                                                    <th scope="col">Diagnóstico</th>
                                                    <th scope="col">Tratamiento</th>
                                                    <th scope="col">Precio</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <c:forEach var="historiax" items="${historietica}">
                                                        <tr>
                                                            <td><c:out value="${historiax.mascota.id}"/></td>
                                                            <td><c:out value="${historiax.mascota.name}"/></td>
                                                            <td><c:out value="${historiax.mascota.persona.name} ${historiax.mascota.persona.lastname} (${historiax.mascota.persona.dni})"/></td>
                                                            <td><c:out value="${historiax.veterinario.name} ${historiax.veterinario.lastname} (${historiax.veterinario.dni})"/></td>
                                                            <td class="wr"><c:out value="${historiax.diagnostic}"/></td>
                                                            <td class="wr"><c:out value="${historiax.treatment}"/></td>
                                                            <td class="wr"><c:out value="${historiax.price}"/></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="d-flex justify-content-sm-center justify-content-md-end">
                                            <button type="submit" class="btn btn-outline-primary btn-lg mr-1">Imprimir</button>
                                            <button type="button" class="btn btn-outline-danger btn-lg" data-dismiss="modal">Atrás</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section> 
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/Template/js.jsp"%>
    </body>
</html>