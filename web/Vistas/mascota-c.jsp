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
        <%@include file="/Template/css.jsp"%>
    </head>
    <body>
        
        <%
            PersonaDAO pdao = new PersonaDAO();
            List<Persona> p = pdao.read();
            //  request.setAttribute("persona", p);
        %>
        
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
                                        <form action="http://localhost:8080/mascota" method="post" autocomplete="off">
                                            <h4 class="text-center pb-3">Agregar Mascota</h1>
                                            <div class="form-group">
                                                <select class="form-control form-control-lg custom-select" id="dni" name="dni">
                                                    <option value="<c:out value="${mascotica.persona.dni}"/>">${mascotica.persona.name} ${mascotica.persona.lastname}</option>
                                                    <% for(int i = 0; i < p.size(); i++) { %>
                                                        <option value="<% out.print(p.get(i).getDni()); %>"><% out.print(p.get(i).getName() + " " + p.get(i).getLastname()); %><% out.print(" " + (p.get(i).getDni())); %></option>
                                                    <%}%>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-lg" id="name" name="name" placeholder="Nombre" value="<c:out value="${mascotica.name}"/>" required/>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-lg" id="species" name="species" placeholder="Especie" value="<c:out value="${mascotica.species}"/>"required/>
                                            </div>
                                            <div class="form-group d-flex justify-content-center">
                                                <c:if test="${not empty mascotica.id}">
                                                    <input type="hidden" name="id" value="${mascotica.id}" />
                                                </c:if>
                                                <button type="submit" class="btn btn-outline-success btn-lg mr-1">Agregar mascota</button>
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
