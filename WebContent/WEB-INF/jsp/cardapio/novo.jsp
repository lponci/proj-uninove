<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="${request.contextPath}/menu" />

<div class="container" >
<div class="box box-warning">
	<div class="box-header">
		<h3 class="box-title">Cadastro de Cardápios</h3>
	</div>
	<div class="box-body">
	
		<c:url var="url" value="/cardapio/salvar" />
		
		<form:form action="${url}" method="get" modelAttribute="cardapio">
		
		    <form:hidden cssStyle="width:250px" maxlength="30" path="id" size="30" class="form-control" />
			
			<div class="row">
				<div class="form-group col-md-2">
					<label for="nome">Categoria:</label>
					<form:select class="form-control" items="${selectDeCategoria}"  length="30" path="categoria.id" />
				</div>
			</div>
			
			<div class="row">
				<div class="form-group col-md-2">
					<label for="nome">Nome:</label>
					<form:input cssStyle="width:250px" maxlength="30" path="nome" size="30" class="form-control" />
					<form:errors path="nome" />
				</div>
			</div>
			
			<div class="row">
				<div class="form-group col-md-2">
					<label for="nome">Preço:</label>
					<form:input cssStyle="width:250px" maxlength="30" path="preco" size="30" class="form-control" />
					<form:errors path="nome" />
				</div>
			</div>	
			
			<div class="row">
				<div class="form-group col-md-2">
					<label for="nome">Status:</label>
					<form:select class="form-control" items="${selectDeStatus}"  length="30" path="status" />
				</div>
			</div>
		   
		   <div class="row">
				<div class="form-group col-md-2">
					<label for="nome"></label>
					<input type="submit" value="Enviar" class="btn btn-primary">
					<a href="/Restaurante/cardapio/listar" class="btn btn-primary">Voltar</a>
				</div>
		   </div>	
		   
			
		</form:form>

	</div>
</div>
</div>

