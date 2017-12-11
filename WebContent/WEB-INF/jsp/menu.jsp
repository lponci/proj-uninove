<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gerenciar restaurantes</title>

<link href="<c:url value ='/css/bootstrap.min.css'/>" rel="stylesheet"
	type="text/css" />
<script src="<c:url value ='/js/bootstrap.min.js'/>" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

  <link rel="stylesheet" href="https://unpkg.com/sweetalert/dist/sweetalert.min.js">
  <link href='https://fonts.googleapis.com/css?family=Condiment' rel='stylesheet'>
	

</head>
<body>
	<script type="text/javascript"  src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">
     		$(document).ready(function() {
         		// get current URL path and assign 'active' class
         		var pathname = window.location.pathname;
         		$('.nav > li > a[href="'+pathname+'"]').parent().addClass('active');
         	});     		
	</script>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="col-md-3">
    <div class="navbar-header">
      <a class="navbar-brand" href="/Restaurante/cardapio/listar">Restaurante Web</a>
    </div>
    </div>
     	<script>
     		$(document).ready(function() {
         		// get current URL path and assign 'active' class
         		var pathname = window.location.pathname;
         		$('.nav > li > a[href="'+pathname+'"]').parent().addClass('active');
         	});     		
	</script>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" >
      <ul class="nav navbar-nav">
        <li><a href="<c:url value='/cliente/listar' />"> Clientes</a></li>
        <li><a href="<c:url value='/categoria/listar' />">Categoria</a></li>
        <li><a href="<c:url value='/cardapio/listar' />">Cardápio</a></li>
        <li><a href="<c:url value='/pedido/listar' />">Pedidos</a></li>
        <li><a href="<c:url value='/funcionario/listar' />"> Funcionários</a></li>
        <li><a href="<c:url value='/mesa/listar' />">Mesas</a></li>
        <li><a href="<c:url value='/reserva/listar' />">Reservas</a></li>
        <li><a href="<c:url value='/delivery/listar' />">Delivery</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<c:url value='/logout' />">Sair</a></li>
      </ul>
 
    </div>
  </div>
</nav>