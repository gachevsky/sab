<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head profile="http://www.w3.org/2005/10/profile">
        <meta charset="utf-8">
        <title>Gamasoft - GamApp</title>

        <!-- Browser Tab and Favorites icon -->
        <link rel="shortcut icon" href="<c:url value='assets/images/gama/isologo-32x32.png' />">

        <jsp:include page="generic-css-includes.jsp" />
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="assets/js/libs/html5shiv.js"></script>
        <![endif]-->
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
            google.load('visualization', '1.0', {'packages': ['corechart']});
        </script>
    </head>
    <body>
        <!-- Menu -->
        <jsp:include page="menu.jsp" />

        <!-- Main page -->
        <div id="acuitasMain"></div>

        <!-- View templates -->
        <jsp:include page="templates/client-template.jsp" />
        <jsp:include page="templates/user-templates.jsp" />
        <jsp:include page="templates/filter-templates.jsp" />

        <!-- Here we set the requirejs root -->
        <jsp:include page="generic-js-includes.jsp" />

        <!-- footer -->
        <hr/>
        <div>
            <footer>
                <p class="container-fluid pull-left">Gamasoft 2013
                </p>
                <p class="container-fluid pull-right">Powered by
                    <img src="<c:url value='assets/images/Logo_Gamasoft_grey.png' />"/>
                </p>
            </footer>
        </div>
        <!-- end footer -->
    </body>
</html>
