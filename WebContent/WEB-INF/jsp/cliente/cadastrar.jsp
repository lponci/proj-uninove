<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="<c:url value ='/css/bootstrap.min.css'/>" rel="stylesheet"
	type="text/css" />
<script src="<c:url value ='/js/bootstrap.min.js'/>"
	type="text/javascript"></script>

<div class="container" style="margin-top: 50px;">
<div class="panel panel-info col-md-8 col-md-offset-2" style="padding-left: 0px;padding-right: 0px;">
	<div class="panel-heading" >
					<div class="panel-title">Cadastro</div>
					
				</div>
		<div style="padding-top: 30px" class="panel-body">

			<c:url var="url" value="/cliente/confirmarcadastro" />

			<form:form action="${url}" method="post" modelAttribute="cliente">

				<form:hidden cssStyle="width:250px" maxlength="30" path="id"
					size="30" class="form-control" />
				<div class="row">
					<div class="form-group col-md-5">
						<label for="login">Login:</label>
						<form:input cssStyle="width:250px" maxlength="30" path="login"
							size="30" class="form-control" />
					</div>
					<div class="form-group col-md-3">
						<label for="senha">Senha:</label>
						<form:input cssStyle="width:250px" maxlength="30" path="senha"
							size="30" class="form-control" />
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-5">
						<label for="nome">Nome:</label>
						<form:input cssStyle="width:250px" maxlength="30" path="nome"
							size="30" class="form-control" />
						<form:errors path="nome" />
					</div>
					<div class="form-group col-md-3">
					<label for="email">E-mail:</label>
						
						<form:input cssStyle="width:250px" maxlength="30" path="telefone"
							size="30" class="form-control" />
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-1">
						<label for="telefone">Telefone:</label>
						<form:input cssStyle="width:250px" maxlength="30" path="email"
							size="30" class="form-control" />
					</div>
				</div>
				
				<div class="row">
					<div class="form-group col-md-5">
						<label for="rua">Rua:</label>
						<form:input cssStyle="width:250px" maxlength="30"
							path="endereco.rua" size="30" class="form-control" />
					</div>
					<div class="form-group col-md-2">
						<label for="rua">Número:</label>
						<form:input cssStyle="width:60px" maxlength="30"
							path="endereco.numero" size="30" class="form-control" />
					</div>
						<div class="form-group col-md-3">
						<label for="complemento">Complemento:</label>
						<form:input cssStyle="width:250px" maxlength="30"
							path="endereco.complemento" size="30" class="form-control" />
					</div>
				</div>
								
				<div class="row">
					<div class="form-group col-md-5">
						<label for="bairro">Bairro:</label>
						<form:input cssStyle="width:250px" maxlength="30"
							path="endereco.bairro" size="30" class="form-control" />
					</div>
						<div class="form-group col-md-2">
						<label for="cep">Cep:</label>
						<form:input cssStyle="width:100px" maxlength="30"
							path="endereco.cep" size="30" class="form-control" />
					</div>
				</div>
					<div class="row">
						<div class="form-group col-md-4">
							<label for="nome"></label> <input type="submit" value="Enviar"
								class="btn btn-primary"> <a
								href="http://localhost:8080/Restaurante" class="btn btn-primary">Voltar</a>
						</div>
					</div>
			</form:form>

		</div>
		</div>
	</div>