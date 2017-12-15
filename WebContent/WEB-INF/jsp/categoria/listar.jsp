<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="${request.contextPath}/menu" />

<div class="container" id="divName">

	<c:url var="url" value="/categoria/filtrar" />
	<form:form action="${url}" method="get" modelAttribute="filtro">
		<div class="row">
			<div class="col-md-1">Categoria:</div>
			<div class="col-md-2">
				<form:input maxlength="30" path="nome" size="30"
					class="form-control" />
			</div>
			<div class="col-md-3">
				<input type="submit" value="Pesquisar" class="btn btn-primary">
			</div>
		</div>

	</form:form>
	<br />
	<table id="tname" class="table table-bordered">
		<tr>
			<td></td>
			<td>Nome</td>
			<td>Status</td>
		</tr>

		<c:forEach items="${categorias}" var="categoria">
			<tr>
				<td width="10"><input type="radio" name="radioButton" value="${categoria.id}" /></td>
				<td>${categoria.nome}</td>
				<td id="catStatus">${categoria.status}</td>

			</tr>
		</c:forEach>
	</table>
	<c:url var="url" value="/categoria/novo" />
	<a href="${url}" class="btn btn-primary" >Novo</a>
	<script>
		function findSelection(field) {
			var test = document.getElementsByName(field);
			var sizes = test.length;

			for (i = 0; i < sizes; i++) {
				if (test[i].checked == true) {
					//alert(test[i].value);
					return test[i].value;
				}
			}
		}

		function removeForm() {
			swal({
				title : "Voce irá deletar permanetemente!",
				text : "Deseja deletar?",
				icon : "warning",
				buttons : true,
				dangerMode: true,
				buttons : ["Não","Sim"]
			})
			.then((willDelete) =>{
				if (willDelete){
					var rb = findSelection("radioButton");
					if (typeof rb !== 'undefined') {
							var updateUrl = "/Restaurante/categoria/" + rb + "/remove";
							window.location.href = updateUrl;
							//alert(updateUrl);	
							return false
						}
					}
				});
			}

		function updateForm() {

			var rb = findSelection("radioButton");
			if (typeof rb !== 'undefined') {
				var updateUrl = "/Restaurante/categoria/" + rb + "/updateForm";
				window.location.href = updateUrl;
				//alert(updateUrl);	
				return false;
			}

		}
		
		function desativarReg() {
			var rb = findSelection("radioButton");
			//alert(rb);

			var status = document.getElementById("catStatus").innerText;
			if (status === 'Ativo') {
				swal({
						text:"Registro inativado com sucesso!", 
						icon : "success",
						buttons : false,
						timer: 1500
						}).then((inativar)=>
				{
				var updateUrl = "/Restaurante/categoria/" + rb + "/desativar";
				window.location.href = updateUrl;
				return false;
				})
			} else{
				swal({
					text:"Registro já inativo!", 
					icon : "error",
					buttons : false,
					timer: 1500,
					})
				return false;
			}
		}
		function ativarReg() {
			var rb = findSelection("radioButton");
			//alert(rb);

			var status = document.getElementById("catStatus").innerText;
			if (status !== 'Ativo') {
				swal({
				text:"Registro ativado com sucesso!", 
				icon : "success",
				buttons : false,
				timer: 1500
				}).then((ativar)=>
		{
				var updateUrl = "/Restaurante/categoria/" + rb + "/ativar";
				window.location.href = updateUrl;
				return false;
		})
			} else{
				swal({
					text:"Registro já ativo!", 
					icon : "error",
					buttons : false,
					timer: 1500,
					})
				
				return false;
			}
		}
	</script>

	<c:url var="url" value="/categoria/${categoria.id}" />
	<a href="" onclick="return updateForm()" class="btn btn-primary">Atualizar</a>
	<button onclick="return removeForm()" class="btn btn-danger">Deletar</button>
	<button onclick="return ativarReg()" class="btn btn-primary">Ativar</button>
	<button onclick="return desativarReg()" class="btn btn-primary">Desativar</button>
	

</div>
