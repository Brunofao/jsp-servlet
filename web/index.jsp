<%-- 
    Document   : index
    Created on : 21/08/2018, 11:09:23 PM
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
              <%@include file="Template/sidebar.jsp"%>
              <!-- call Nav-content -->
              <div id="content">
                  <%@include file="Template/nav-content.jsp"%>
                  <!-- write here -->
              </div>
          </div>
          <%@include file="/Template/js.jsp"%>
    </body>
</html>