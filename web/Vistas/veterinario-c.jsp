<%-- 
    Document   : veterinario-c
    Created on : 18/09/2018, 12:04:59 PM
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
            <div class="modal-dialog" role="document">
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
                                        <form action="http://localhost:8080/veterinario" method="post" autocomplete="off">
                                            <h4 class="text-center pb-3">Agregar Veterinario</h1>
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-lg" id="dni" name="dni" placeholder="N� de Documento de Identidad" value="<c:out value="${veterinario.dni}"/>"/>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-lg" id="name" name="name" placeholder="Nombre" value="<c:out value="${veterinario.name}"/>"/>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-lg" id="lastname" name="lastname" placeholder="Apellido" value="<c:out value="${veterinario.lastname}"/>"/>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-lg" id="phone" name="phone" placeholder="Tel�fono" value="<c:out value="${veterinario.phone}"/>"/>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-lg" id="specialist" name="specialist" placeholder="Especialidad" value="<c:out value="${veterinario.specialist}"/>"/>
                                            </div>
                                            <div class="form-group d-flex justify-content-center">
                                                <c:if test="${not empty veterinario.dni}">
                                                    <input type="hidden" name="id" value="${veterinario.reference}" />
                                                </c:if>
                                                <button type="submit" class="btn btn-outline-success btn-lg mr-1">Agregar veterinario</button>
                                                <button type="button" class="btn btn-outline-danger btn-lg ml-1" data-dismiss="modal">Close</button> 
                                            </div>
                                        </form>                   
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
