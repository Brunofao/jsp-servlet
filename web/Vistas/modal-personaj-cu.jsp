<%-- 
    Document   : modal-personaj-cu
    Created on : 25/09/2018, 02:25:06 AM
    Author     : John Wick Recargado
--%>

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
                                <form action="http://localhost:8080/personaJ" method="post" autocomplete="off">
                                    <h4 class="text-center pb-3">Agregar Persona Jurídica</h1>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-lg" id="dni" name="dni" placeholder="Nº de Documento de Identidad" value="<c:out value="${personita.dni}"/>"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-lg" id="name" name="name" placeholder="Nombre" value="<c:out value="${personita.name}"/>"/>
                                    </div>
                                    <div class="form-group d-flex justify-content-center">
                                        <button type="submit" class="btn btn-outline-success btn-lg mr-1">Agregar persona jurídica</button>
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
