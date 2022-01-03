
<%@ include file="pagehead.jsp" %>
	<div class="container my-4">

		<h2>Votre panier contient : ${panier.size()} éléments</h2>
		<table class="table table-bordered  table-hover">
			<th>#</th>
			<th>Nom et description</th>
			<th>Quantité</th>
			<th>Prix unitaire</th>
			<th>Montant</th>
			<th>Edition</th>
			<c:set var="count" value="0" scope="page" />
			
			<c:forEach var="elt" items="${panier}">
				<tr id="${elt.getProduit().getId()}">
					<td><c:set var="count" value="${count + 1}" scope="page"/>${count }</td>
					<td>${elt.getProduit().getNom()}
					<span>${elt.getProduit().getDescription()}</span></td>
					<td name="${elt.getProduit().getId()}">
					 ${elt.getQuantite()}</td>
					<td><span id="prix${elt.getProduit().getId()}">${elt.getProduit().getPrix()}</span></td>
					<td><span id="montant${elt.getProduit().getId()}">${elt.getProduit().getPrix() * elt.getQuantite()}</span></td>
					<td>
					
					<select name="${elt.getProduit().getId()}" onchange=updateQuantity("${ elt.getProduit().getId()}") class="form-select form-select-lg p-1 mt-1 mr-2">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
					</select>
					<button class="btn btn-sm btn-danger" id="delete"  onclick=deleteProduct("${elt.getProduit().getId()}")>Supprimer <i class="fa fa-trash" aria-hidden="true"></i></button>
					
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="right">
				Total en euros : <span id="montanttotal">${total}</span>
				
				<td><a id="validate" href="register.jsp" class="btn btn-warning">Valider la commande <i class="fa fa-check-circle" aria-hidden="true"></i></a></td>
			</tr>
			
		</table>
	</div>
	<script>

	const updateQuantity = (id) => {
			console.log(id)
			value=$('select[name='+ id +']').val();
		    prix=$("#prix"+id).text();
		    $('td[name='+ id +']').html(""+value);
		    $("#montant"+id).html(""+Math.round((parseInt(value) * parseFloat(prix))*100)/100);
		    $.post('AjoutPanier',{ idProduit: id, quantite: value },function(data){
				$("#montanttotal").text(data)
				console.log(data);
			    })
		    .done(function(){console.log("Mise à jour effectuée avec succes")})
		    .fail(function(){console.log("Echec de mise à jour")});
		}
	
	const deleteProduct = (id) => {
		console.log(id)
		 value=$('select[name='+ id +']').val();
	    prix=$("#prix"+id).text();
	    console.log("deleting "+ id + prix + value);
	     $('tr[id='+ id +']').html("");
	     
	    $.post('RemoveItem',{ idProduit: id, quantite: value },function(data){
			$("#montanttotal").text(data)
		    })
	    .done(function(){console.log("Mise à jour effectuée avec succes")})
	    .fail(function(){console.log("Echec de mise à jour")});
		
		}
	</script>
</body>
</html>