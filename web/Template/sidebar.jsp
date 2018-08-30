<%-- 
    Document   : sidebar
    Created on : 24/08/2018, 03:50:36 PM
    Author     : John Wick Recargado
--%>

<!-- Sidebar  -->
<nav id="sidebar">
    <div class="sidebar-header">
        <a class="h3" href="/">Peluditos Pet's</a>
    </div>

    <ul class="list-unstyled components">
        <h4>Bruno Faoro</h4>
        <h4>Jesús Requena</h4>
        <li class="active ptt">
            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
            <ul class="collapse list-unstyled" id="homeSubmenu">
                <li>
                    <a href="/persona">Menú 1</a>
                </li>
                <li>
                    <a href="/mascota">Menú 2</a>
                </li>
            </ul>
        </li>
        <!--
            <li>
                <a href="#">About</a>
            </li>
        -->
        <li>
            <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Pages</a>
            <ul class="collapse list-unstyled" id="pageSubmenu">
                <li>
                    <a href="#">Page 1</a>
                </li>
                <li>
                    <a href="#">Page 2</a>
                </li>
                <li>
                    <a href="#">Page 3</a>
                </li>
            </ul>
        </li>
        <!--
            <li>
                <a href="#">Portfolio</a>
            </li>
            <li>
                <a href="#">Contact</a>
            </li>
        -->
    </ul>
</nav>
