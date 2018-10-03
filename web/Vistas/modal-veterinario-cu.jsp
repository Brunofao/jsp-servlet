<%-- 
    Document   : modal-estilista-cu
    Created on : 11/09/2018, 08:44:47 AM
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
                                <form action="http://localhost:8080/veterinario" method="post" autocomplete="off">
                                    <h4 class="text-center pb-3">Agregar Veterinario</h1>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-lg" id="dni" name="dni" placeholder="DNI" />
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-lg" id="name" name="name" placeholder="Nombre" />
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-lg" id="lastname" name="lastname" placeholder="Apellido" />
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-lg" id="phone" name="phone" placeholder="Teléfono" />
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-lg" id="specialist" name="specialist" placeholder="Especialidad" />
                                    </div>
                                    <div class="form-group d-flex justify-content-center">
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
