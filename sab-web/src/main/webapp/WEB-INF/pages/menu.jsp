<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="http://www.globant.com/" target="_blank"></a>
            <c:if test="${not empty username}">
                <div class="nav-collapse collapse">
                    <!-- Tasks menu -->
                    <ul class="nav pull-left">
                        <li class="active"><a href="#dashboards">Facturacion</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" 
                               data-toggle="dropdown">Administracion Factura <b class="caret"></b></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#administration/users">Nueva Factura</a></li>
                                <li><a href="#administration/roles">Buscar Factura</a></li>
                                <li class="divider"></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- User profile menu -->
                    <ul class="nav pull-right">
                        <li class="userLoggedIn"><a href="#"><i class="icon-user icon-white"></i>${username}</a></li>
                        <li><a href="<c:url value="/j_spring_security_logout" />">
                                <i class="icon-off icon-white"></i> Salir</a>
                        </li>
                    </ul>
                </div>
            </c:if>
        </div>
    </div>
</div>