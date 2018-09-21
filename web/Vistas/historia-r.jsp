<%-- 
    Document   : history-r
    Created on : 20/09/2018, 09:03:15 PM
    Author     : John Wick Recargado
--%>
                                                        
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <!-- Required meta tags -->
    <title>Hello PetShop Lili's</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap CSS, Project Pet CSS & Other's -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/styles.css" type="text/css">
    <link rel="stylesheet" href="CSS/styles2.css" type="text/css">
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
  </head>
  <body>
        <!-- /////////////////////// -->
        <!--
            <h1>Hello, are u there?</h1>
            <h2>Preparing to Git...</h2>
            <h3>Hi, im index.jsp</h3>
        -->
        
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
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <c:forEach var="historiax" items="${historia}">
                                                        <tr>
                                                            <td><c:out value="${historiax.id}"/></td>
                                                            <td><c:out value="${mascotica.name}"/></td>
                                                            <td><c:out value="${mascotica.persona.name} ${mascotica.persona.lastname} (${mascotica.persona.dni})"/></td>
                                                            <td><c:out value="${historiax.veterinario.name} ${historiax.veterinario.lastname} (${historiax.veterinario.dni})"/></td>
                                                            <td class="wr"><c:out value="${historiax.diagnostic}"/></td>
                                                            <td class="wr"><c:out value="${historiax.treatment}"/></td>
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
                    <div class="modal-footer no-border justify-content-center">
                        <!--
                            <button type="submit" class="btn btn-outline-success btn-lg">Agregar mascota</button>
                            <button type="button" class="btn btn-outline-danger btn-lg" data-dismiss="modal">Close</button>
                        -->
                    </div>
                </div>
            </div>
        </div>
        <%--   
            <c:forEach var="mascotica" items="${mascota}">
                <tr>
                    <td><c:out value="${mascotica}"/></td>		
                </tr>
            </c:forEach>
        --%>
        <!-- /////////////////////// -->
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
    <!-- Scrollbar & SidebarCollapse -->
    <script type="text/javascript">
        $(document).ready(function () {
            $("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar, #content').toggleClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });
            
            /*
                $('#modal-edit').on('click', function () {
                    $(this).attr('data-toggle', "modal");
                    $(this).attr('data-target', "#exampleModal");
                });
            */
           $('#exampleModalUpdate').modal('show');
        });
    </script>
  </body>
</html>