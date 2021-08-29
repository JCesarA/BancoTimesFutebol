<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>MyTeam</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>		
		<style>			
			body { 
				background-color:#0A2A12;
				background-image: url('img/CAMPO.jpg');
				background-position: center;		/* Center and scale the image nicely */
				background-repeat: no-repeat;
				background-size: cover;				/* Sets background image to cover entire element */
				background-position: 50% -5%;      	/* Sets reference point to scale from */
			}
			  
			#f1 {
			  	color: White;
			  	font-weight: bold;
			  	font-size: 30px;			  	
			}
			
			.label1 {
			  	color: White;
			  	font-weight: bold;
			  	font-size: 20px;			  	
			}
		</style>		
	</head>
	<body>				
		<c:import url="/WEB-INF/jsp/menu.jsp"></c:import>		
		
		<c:set var="titulo" value="CADASTRAMENTO DE TIMES"/>
		<c:set var="rota" value="/time/incluir"/>
		<c:set var="metodo" value="post"/>
		<c:set var="botao" value="Cadastrar"/>				

		<c:if test="${not empty meuTime}">
			<c:set var="titulo" value="CONSULTA DE TIME"/>
			<c:set var="rota" value="/voltar"/>
			<c:set var="metodo" value="get"/>
			<c:set var="botao" value="Voltar"/>		
		</c:if>		
		
		<div class="container">
			<br>
			<p id="f1">${titulo}</p>			
			<br>
			<form action="${rota}" method="${metodo}">
			
				<div class="form-group">
					<label class = "label1">Nome:</label>
					<input id="focusedInput" type="text" class="form-control" value = "${meuTime.nome}" placeholder="Digite aqui o nome do time" name="nome">
				</div>
				
				<div class="form-group">
					<label class = "label1">Ano de fundação:</label>
					<input id="focusedInput" type="text" class="form-control" value = "${meuTime.anoFundacao}" placeholder="Digite aqui o ano de fundação do time" name="anoFundacao">
				</div>				

				<button type="submit" class="btn btn-default">${botao}</button>
			</form>				  
		</div>	
	</body>
</html>