<%-- 
    Document   : js
    Created on : 01/10/2018, 07:12:06 AM
    Author     : John Wick Recargado
--%>

<script src="JS/jquery.min.js"></script>
<script src="JS/popper.min.js"></script>
<script src="JS/bootstrap.min.js"></script>
<script src="JS/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="JS/solid.js"></script>
<script src="JS/fontawesome.js"></script>
<script type="text/javascript">
    $( document ).ready(function () {
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

