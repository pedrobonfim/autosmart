<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Log in with your account</title>

    <script type="text/javascript" src="resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <script type="text/javascript" src="resources/js/login.js"></script>

    <title>Smart Parking</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <!-- Bootstrap core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    
    <script type="text/javascript" src="resources/js/login.js"></script>

    <!-- Custom styles for this template -->
    <link href="resources/css/index.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div class="container">

 			<form class="form-signin">
                <p align="center" style="padding-bottom: 40px;"><img src="resources/images/logoSPE-31.png" width="140" height="130" /></p>
                <div class="row">
                    <div class="col-xs-6 col-md-6">
                    <button class="btn btn-primary btn-block btnLogar" type="button" data-toggle="modal" data-target="#modalLogin">Entrar</button>
                    </div>
                    <div class="col-xs-6 col-md-6">
                    <button class="btn btn-primary btn-block btnLogar" type="button" data-toggle="modal" data-target="#modalRegister">Registrar</button>
                    </div>
                </div><!-- FIM ROW FORM -->
                <p align="center" style="margin-top: 1px;"><a href="#" class="esqueceuSenha">Esqueceu a senha?</a></p>
            </form>

            <!-- Modal -->
            
            <form method="POST" action="${contextPath}/login" class="form-signin">
              <div class="modal fade" id="modalLogin" role="dialog">
                <div class="modal-dialog">
                
                  <!-- Modal content-->
                  <div class="modal-content">
                    <button class="close" data-dismiss="modal">×</button>
                    <p align="center" style="margin-bottom: -5px;"><img src="resources/images/logoSPE-31.png" width="140" height="130"></p>
                    <div class="modal-body">
                    
                        <label for="inputEmail" class="sr-only">Email</label>
                        <input type="text" class="style-4 form-control" name="username" placeholder="Usuário" required autofocus/>

                        <label for="inputPassword" class="sr-only ">Senha</label>
                        <input type="password" class="form-control" name="password" placeholder="Senha" required/>
                        
                        <input type="submit" value="Login" class="btn btn-lg btn-primary btn-block btnLogar" />
                        
                        <br>
                        <c:if test="${param.error ne null}">
                            <div class="alert alert-danger">${error}</div>
                        </c:if>
                        <c:if test="${param.logout ne null}">
                            <div class="alert alert-info">${message}</div>
                        </c:if>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}"
                        value="${_csrf.token}" />
                  </div>
                </div>
              </div>
            </form>

            <form method="POST" action="${contextPath}/registration" class="form-signin">
                <div class="modal fade" id="modalRegister" role="dialog"> 
                  <div class="modal-dialog">   
                      <div class="modal-content">   
                          <button class="close" data-dismiss="modal">×</button>
                          <p align="center" style="margin-bottom: -5px;"><img src="resources/images/logoSPE-31.png" width="140" height="130"></p>
                          <div class="modal-body"> 
                
                              <label for="inputEmail" class="sr-only">Email</label>
                              <input type="text" name="email" class="form-control" placeholder="Email" required autofocus>
                              
                              <label for="inputUserName" class="sr-only">Nome</label>
                              <input type="text" name="username" class="form-control" placeholder="Nome" required autofocus>
                              
                              <label for="inputPassword" class="sr-only">Senha</label>
                              <input type="password" name="password" class="form-control" placeholder="Senha" required>
                              
                              <label for="inputPassword" class="sr-only">Confirmar senha</label>
                              <input type="password" name="passwordConfirm" class="form-control" placeholder="Confirmar Senha" required>
                              
                              <label for="inputRG" class="sr-only">RG</label>
                              <input type=text name="rg" class="form-control"
                              		   maxlength="12" onKeyPress="MascaraRG(rg);"
                              		   placeholder="RG" required autofocus>
                              
                              <label for="inputCPF" class="sr-only">CPF</label>
                              <input type="text" name="cpf" class="form-control" 
			                            onBlur="ValidarCPF(cpf);" 
										onKeyPress="MascaraCPF(cpf);" maxlength="14"
			                            placeholder="CPF" required autofocus>
                              
                              <label for="inputTelefone" class="sr-only">Telefone</label>
                              <input type="text" name="telefone" class="form-control" 
                              			onKeyPress="MascaraTelefone(telefone)" maxlength="11" placeholder="Telefone"><br>
                              
                              <input type="submit" class="btn btn-lg btn-primary btn-block btnLogar" />
                              
                              <br>
	                             <div class="alert alert-danger">${error}</div>
                          </div>
                          <input type="hidden" name="${_csrf.parameterName}"
                        value="${_csrf.token}" />
                      </div>
                  </div>
                </div>
            </form>


    <!-- <form method="POST" action="${contextPath}/login" class="form-signin">
        <h2 class="form-heading">Log in</h2>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <input name="username" type="text" class="form-control" placeholder="Username"
                   autofocus="true"/>
            <input name="password" type="password" class="form-control" placeholder="Password"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
            <h4 class="text-center"><a href="${contextPath}/registration">Create an account</a></h4>
        </div>

    </form> -->

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
