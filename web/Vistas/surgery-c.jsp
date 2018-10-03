<%-- 
    Document   : surgery-c
    Created on : 19/09/2018, 11:15:51 AM
    Author     : John Wick Recargado
--%>

<%@page import="Models.Veterinario"%>
<%@page import="Models.Mascota"%>
<%@page import="java.util.List"%>
<%@page import="DAO.MascotaDAO"%>
<%@page import="DAO.VeterinarioDAO"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <%@include file="/Template/css.jsp"%>
    </head>
    <body>
        <%
            VeterinarioDAO vdao = new VeterinarioDAO();
            MascotaDAO mdao = new MascotaDAO();
            List<Veterinario> v = vdao.read();
            List<Mascota> m = mdao.read();
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
                                            <form action="http://localhost:8080/surgery" method="post" autocomplete="off">
                                                <h4 class="text-center pb-3">Agregar Veterinario</h1>
                                                <div class="form-group">
                                                    <select class="form-control form-control-lg custom-select" id="dni" name="dni">
                                                        <option selected disabled>Elige a un veterinario</option>
                                                        <option value="<c:out value="${surgery.veterinario.dni}"/>" selected>${surgery.veterinario.name} ${surgery.veterinario.lastname}</option>
                                                        <% for(int i = 0; i < v.size(); i++) { %>
                                                            <option value="<% out.print(v.get(i).getDni()); %>"><% out.print(v.get(i).getName() + " " + v.get(i).getLastname()); %></option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <select class="form-control form-control-lg custom-select" id="mascota" name="mascota">
                                                    <option selected disabled>Elige a una mascota</option>
                                                    <option value="<c:out value="${surgery.mascota.id}"/>" selected>${surgery.mascota.name} ${surgery.mascota.species}</option>
                                                    <% for(int i = 0; i < m.size(); i++) { %>
                                                        <option value="<% out.print(m.get(i).getId()); %>"><% out.print(m.get(i).getName() + " " + m.get(i).getSpecies()); %></option>
                                                    <%}%>
                                                </select>
                                                </div>
                                                <div class="form-group d-flex justify-content-center">
                                                    <c:if test="${not empty surgery.id}">
                                                        <input type="hidden" name="id" value="${surgery.id}" />
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
        </div>
        <%@include file="/Template/js.jsp"%>
    </body>
</html>
