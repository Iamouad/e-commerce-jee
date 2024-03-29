
<%@ include file="pagehead.jsp" %>
	<div class="container my-5">

		<h2>Informations Personnelles</h2>
		<table class="table table-hover">
			<thead>
				<th>Nom</th>
				<th>Email</th>
				<th>Téléphone</th>
				<th>Adresse</th>
			</thead>
			<tr>
				<td>${customer.getNom() }</td>
				<td>${customer.getEmail() }</td>
				<td>${customer.getTelephone() }</td>
				<td>${customer.getAdresse() }</td>
			</tr>
		</table>
		<h2>Récapitulatif de commande :</h2>
		<table class="table table-bordered">
			<thead>
				<th>Nom et description</th>
				<th>Quantité</th>
				<th>Prix unitaire</th>
			</thead>
			<tbody>
				<c:forEach var="elt" items="${panier}">
					<tr>
						<td>${elt.getProduit().getNom()}
						<small class="form-text text-muted">${elt.getProduit().getDescription()}</small></td>
						<td>${elt.getQuantite()}</td>
						<td>${elt.getProduit().getPrix()}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3" align="right">Total de votre Achat ${total}
					</td>
				</tr>
			</tbody>
		</table>
		<a href="ValiderCommande" class="btn btn-primary">Valider la commande</a>
		<c:if test="${success == true }">
			<div class="alert alert-light">
				<p>${result } </p>
			</div>
		</c:if>
		<c:if test="${success == false }">
			<div class="alert alert-light">
				<p>${result } </p>
			</div>
		</c:if>
	</div>
</body>
</html>