
<%@ include file="pagehead.jsp" %>

<div
	class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
	<h1 class="display-4">E-Commerce</h1>
	<p class="lead">Site Internet d'Ecommerce, dans lequel vous
pourrez visualiser les produits d'une boutique en ligne. La boutique comprend des categories
qui permettent d'organiser les produits. Les produits que nous vendons sont des
livres, des DVDs, des CDs de musique..</p>
</div>
<div class="container">
	<div class="card-deck mb-3 text-center">
	
		<div class="card mb-4 shadow-sm">
			<div class="card-header">
				<h4 class="my-0 font-weight-normal">CD</h4>
			</div>
			<div class="card-body">
				
				  <img src="resources/cd.png" class="card-img-top" alt="Cd image loading...">
				
				<ul class="list-unstyled mt-3 mb-4">
					<li>Musique Orientale</li>
					<li>Musique POP</li>
					<li>Musique ROCK</li>
					<li>Hip Hop & RNB</li>
				</ul>
				<a href="Produit?idCategorie=1"
					class="btn btn-lg btn-block btn-primary">Visiter</a>
			</div>
		</div>
		<div class="card mb-4 shadow-sm">
			<div class="card-header">
				<h4 class="my-0 font-weight-normal">Livre</h4>
			</div>
			<div class="card-body">
				  <img src="resources/open-book.png" class="card-img-top" alt="Book image loading...">

				<ul class="list-unstyled mt-3 mb-4">
					<li>Litterature française</li>
					<li>Romans d'histoire</li>
					<li>Litterature anglaise</li>
					<li>Histoires policiers</li>
				</ul>
				<a href="Produit?idCategorie=2"
					class="btn btn-lg btn-block btn-secondary">Visiter</a>
			</div>
		</div>
		<div class="card mb-4 shadow-sm">
			<div class="card-header">
				<h4 class="my-0 font-weight-normal">DVD</h4>
			</div>
			<div class="card-body">
			<img src="resources/dvd.png" class="card-img-top" alt="Dvd image loading...">

				<ul class="list-unstyled mt-3 mb-4">
					<li>Films Americains</li>
					<li>Films français</li>
					<li>Films Animés</li>
					<li>Documentaires</li>
				</ul>
				<a href="Produit?idCategorie=3"
					class="btn btn-lg btn-block btn-warning">Visiter</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>