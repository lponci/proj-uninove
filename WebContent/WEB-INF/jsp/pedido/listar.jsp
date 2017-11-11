<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="${request.contextPath}/menu" />

<div class="container">
	<c:url var="url" value="/pedido/filtrar" />
	<form:form action="${url}" method="get" modelAttribute="filtro">
		<div class="row">
			<div class="col-md-1">N�mero do Pedido:</div>
			<div class="col-md-2">
				<form:input maxlength="30" path="id" size="30"
					class="form-control" />
			</div>
			
			<div class="col-md-5">
				<input type="submit" value="Pesquisar" class="btn btn-primary">
			</div>
		</div>

	</form:form>
	
	
	<c:url var="url" value="/pedido/novo" />
	<a href="${url}" class="btn btn-primary">Novo</a> <br /> <br />
	<table class="table table-bordered">
		<tr>
			<td>N�mero</td>
			<td>Data</td>
			<td>Total</td>
			<td>Status</td>
			<td>Tipo</td>
			<td>A��es</td>
			
		</tr>

		<c:forEach items="${pedidos}" var="pedido">
			<tr>
				<td>${pedido.id}</td>
				<td>${pedido.data}</td>
				<td>${pedido.getTotal()}</td>
				<td>${pedido.status}</td>
				<td>Tradicional</td>
				
				<c:url var="url" value="/pedido/${pedido.id}" />
				<td><a href="${url}/detalharPedido" class="btn btn-primary">Detalhar</a>
					</td>
			</tr>
		</c:forEach>
	</table>
</div>
