<%-- 
    Document   : modal-spa-cu
    Created on : 11/09/2018, 06:26:13 PM
    Author     : John Wick Recargado
--%>

<%@page import="Models.Mascota"%>
<%@page import="DAO.MascotaDAO"%>
<%@page import="Models.Estilista"%>
<%@page import="java.util.List"%>
<%@page import="DAO.EstilistaDAO"%>
<%
    EstilistaDAO edao = new EstilistaDAO();
    MascotaDAO mdao = new MascotaDAO();
    List<Estilista> e = edao.read();
    List<Mascota> m = mdao.read();
    //  request.setAttribute("persona", p);
%>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                <form action="http://localhost:8080/spa" method="post" autocomplete="off">
                                    <h4 class="text-center pb-3">Agregar SPA</h1>
                                    <div class="form-group">
                                        <select class="form-control form-control-lg custom-select" id="dni" name="dni">
                                            <option selected disabled>Elige a un estilista</option>
                                            <% for(int i = 0; i < e.size(); i++) { %>
                                                <option value="<% out.print(e.get(i).getDni()); %>"><% out.print(e.get(i).getName() + " " + e.get(i).getLastname()); %></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-control form-control-lg custom-select" id="mascota" name="mascota">
                                        <option selected disabled>Elige a una mascota</option>
                                        <% for(int i = 0; i < m.size(); i++) { %>
                                            <option value="<% out.print(m.get(i).getId()); %>"><% out.print(m.get(i).getName() + " " + m.get(i).getSpecies()); %></option>
                                        <%}%>
                                    </select>
                                    </div>
                                    <div class="form-group d-flex justify-content-center">
                                        <button type="submit" class="btn btn-outline-success btn-lg mr-1">Agregar spa</button>
                                        <button type="button" class="btn btn-outline-danger btn-lg ml-1" data-dismiss="modal">Close</button> 
                                    </div>
                                </form>                   
                            </div>
                        </div>
                    </div>
                </section> 
            </div>
            <div class="modal-footer no-border justify-content-center">
                <!--
                    <button type="submit" class="btn btn-outline-success btn-lg">Agregar mascota</button>
                    <button type="button" class="btn btn-outline-danger btn-lg" data-dismiss="modal">Close</button>
                -->
            </div>
        </div>
    </div>
</div>
