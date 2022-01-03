
<%@ include file="pagehead.jsp" %>
<%@ page import="java.util.*" %>
	<div class="container my-5">
		<h1 class="my-2">Catégorie : ${categorie}</h1>
		<h3 class="my-2">Nombre de produits disponibles :
			${ListProduits.size()}</h3>
		<table class="table table-hover">
		<thead class="thead-light">
			<tr>
				<th>Nom Produit</th>
				<th>Prix Unitaire</th>
				<th>Date Ajout</th>
				<th>Ajouer au panier</th>
			</tr>
		</thead>
			<c:forEach var="produit" items="${ListProduits}">
				<tr>
					<td>${produit.getNom() } 
					<small class="form-text text-muted">
							${produit.getDescription() } 
							</small>
					</td>
					<td>${produit.getPrix() }</td>
					
					<td>${ produit.getDernierMaj() }</td>
					<td><a
						href="AjoutPanier?idProduit=${produit.getId()}&quantite=1"
						class="btn btn-dark">Ajouter au panier</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>