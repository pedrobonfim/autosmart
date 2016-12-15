<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    <title>SMART PARKING - Automação de estacionamentos prediais</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="/resources//css/main.css" />
	<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/index.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
	<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources//js/jquery.scrolly.min.js"></script>
	<script src="/resources//js/jquery.scrollzer.min.js"></script>
	<script src="/resources//js/skel.min.js"></script>
	<script src="/resources//js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/resources//js/main.js"></script>
	
    <script type="text/javascript" src="resources/js/login.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        
        <form method="POST" action="${contextPath}/edit" id="editUser">
        	<input type="hidden" id="userName" name="${pageContext.request.userPrincipal.name}" value="${pageContext.request.userPrincipal.name}"/>
        	<input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

    <!-- Header -->
			<div id="header">

				<div class="top">

					<!-- Logo -->
						<div id="logo">
							<a href="#editarUsuario" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-user"><h1 id="title">${pageContext.request.userPrincipal.name}</h1></span></a>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="#top" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-car">Reservar vaga</span></a></li>
								<li><a href="#portfolio" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-credit-card">Fazer pagamento</span></a></li>
								<li><a href="#about" id="about-link" class="skel-layers-ignoreHref"><span class="icon fa-history">Consultar histórico</span></a></li>
								<li><a href="#editarUsuario" id="contact-link" class="skel-layers-ignoreHref"><span onClick="finalizarAgora()" class="icon fa-user">Editar dados pessoais</span></a></li>
								<li><a href="#sobre" id="contact-link" class="skel-layers-ignoreHref"><span data-toggle="modal" data-target="#modalQuemSomos" class="icon fa-exclamation-circle">Quem somos</span></a></li>
								<li><a href="#sobre" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-sign-out" onclick="document.forms['logoutForm'].submit()">Logout</span></a></li>
							</ul>
						</nav>

				</div>

			</div>


		<!-- Modal Quem Somos -->

		<div class="modal fade" id="modalQuemSomos" role="dialog">
                <div class="modal-dialog">
                
                  <!-- Modal content-->
                  <div class="modal-content">
                    <button class="close" data-dismiss="modal">×</button>
                    <p align="center" style="margin-bottom: -5px;"><img src="resources/images/logoSPE-31.png" width="140" height="130"></p>
                    <div class="modal-body">
                    
                        <h2>Artur e Pedro Os fodoes</h2>
                        <h3>Tá tudo dominado</h3>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}"
                        value="${_csrf.token}" />
                  </div>
                </div>
              </div>

		<!-- Main -->
			<div id="main">

				<!-- Intro -->
					<section id="top" class="one dark cover">
						<div class="container">

							<header>
								<h2 class="alt">Olá, ${pageContext.request.userPrincipal.name}, seja bem vindo ao SMART PARKING 
								</header>

							<footer>
								<a class="button scrolly">Reservar vaga</a>
							</footer>

						</div>
					</section>

				<!-- Portfolio -->
			<!-- 		<section id="portfolio" class="two">
						<div class="container">

							<header>
								<h2>Portfolio</h2>
							</header>

							<p>Vitae natoque dictum etiam semper magnis enim feugiat convallis convallis
							egestas rhoncus ridiculus in quis risus amet curabitur tempor orci penatibus.
							Tellus erat mauris ipsum fermentum etiam vivamus eget. Nunc nibh morbi quis
							fusce hendrerit lacus ridiculus.</p>

							<div class="row">
								<div class="4u 12u$(mobile)">
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic02.jpg" alt="" /></a>
										<header>
											<h3>Ipsum Feugiat</h3>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic03.jpg" alt="" /></a>
										<header>
											<h3>Rhoncus Semper</h3>
										</header>
									</article>
								</div>
								<div class="4u 12u$(mobile)">
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic04.jpg" alt="" /></a>
										<header>
											<h3>Magna Nullam</h3>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic05.jpg" alt="" /></a>
										<header>
											<h3>Natoque Vitae</h3>
										</header>
									</article>
								</div>
								<div class="4u$ 12u$(mobile)">
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic06.jpg" alt="" /></a>
										<header>
											<h3>Dolor Penatibus</h3>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic07.jpg" alt="" /></a>
										<header>
											<h3>Orci Convallis</h3>
										</header>
									</article>
								</div>
							</div>

						</div>
					</section>
					-->

				<!-- About Me -->
				<!-- <section id="about" class="three">
						<div class="container">

							<header>
								<h2>About Me</h2>
							</header>

							<a href="#" class="image featured"><img src="images/pic08.jpg" alt="" /></a>

							<p>Tincidunt eu elit diam magnis pretium accumsan etiam id urna. Ridiculus
							ultricies curae quis et rhoncus velit. Lobortis elementum aliquet nec vitae
							laoreet eget cubilia quam non etiam odio tincidunt montes. Elementum sem
							parturient nulla quam placerat viverra mauris non cum elit tempus ullamcorper
							dolor. Libero rutrum ut lacinia donec curae mus vel quisque sociis nec
							ornare iaculis.</p>

						</div>
					</section>
					
					-->

				<!-- Contact -->
					<section id="#editarUsuario" class="four">
						<div class="container">

								<header>
									<h2>Editar Usuário</h2>
								</header>
	
							  <label for="inputEmail" class="sr-only">Email</label>
                              <input type="text" id="email" name="email" class="form-control" placeholder="Email" required>
                              
                              <label for="inputRG" class="sr-only">RG</label>
                              <input type=text name="rG" class="form-control" id="rG"
                              		   maxlength="12" onKeyPress="MascaraRG(rG);"
                              		   placeholder="RG" required>
                              
                              <label for="inputCPF" class="sr-only">CPF</label>
                              <input type="text" name="cPF" id="cPF" class="form-control" 
			                            onBlur="ValidarCPF(cPF);" 
										onKeyPress="MascaraCPF(cPF);" maxlength="14"
			                            placeholder="CPF" required>
                              
                              <label for="inputTelefone" class="sr-only">Telefone</label>
                              <input type="text" name="telefone" class="form-control" if="telefone" 
                              			onKeyPress="MascaraTelefone(telefone)" maxlength="15" placeholder="Telefone"><br>
                              			
                              <input type="submit" onClick="alterarUsuario()" value="Editar Usuario" class="btn btn-lg btn-primary btn-block btnLogar" />

						</div>
						  <input type="hidden" name="${_csrf.parameterName}"
                        value="${_csrf.token}" />
					</section>

			</div>

		<!-- Footer -->
			<div id="footer">

				<!-- Copyright -->
					<ul class="copyright">
						<li>&copy; AutoSmartPark. All rights reserved.</li>
					</ul>

			</div>
			
     </c:if>

<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
