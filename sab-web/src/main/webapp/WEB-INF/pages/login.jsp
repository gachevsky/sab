<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Sab :: Login Page</title>
<jsp:include page="generic-css-includes.jsp" />
<link rel="stylesheet" type="text/css" href="<c:url value='assets/css/form-elements.css' />" >
<link rel="stylesheet" type="text/css" href="<c:url value='assets/css/login.css' />" >
</head>
<body onload='document.f.j_username.focus();' id="login">
	<jsp:include page="menu.jsp" />
	
	<div class="row-fluid">
		<div class="span4"></div>
		<div class="span4">
			<div class="well">
				<form name='f' action="<c:url value='j_spring_security_check' />" method='POST'>
					<div class="page-header" >Bienvenido</div>
					<c:if test="${not empty error}">
						<div class="alert alert-error">
						  Fallo en la autenticacion, intente de nuevo.<br /> 
						  <!-- Caused by: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} -->
						</div>	
					</c:if>
				
					<div class="form-field">
							<label for="usr_name">Email:</label>
							<input type='text' name='j_username' id="usr_name" value='' class="span10" placeholder="Email">
					</div>	
					<div class="form-field">
							<label for="pwd">Password:</label>
							<input type='password' name='j_password' id="pwd" class="span10" placeholder="Password" />
					</div>
					<div class="form-footer">
						<input name="reset" type="reset" class="btn" value="Reset" />
						<input class="btn btn-primary pull-right" name="submit" type="submit" value="Login" />
					</div>
				</form>
			</div>
		</div>
		<div class="span4"></div>
	</div>
</body>
</html>
