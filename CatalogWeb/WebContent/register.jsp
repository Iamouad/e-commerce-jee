
<%@ include file="pagehead.jsp" %>
	<div class="container my-4">
		<h1 class=" my-2">Enregistrement client</h1>
		<form action="Client" method="post">
			<div class="form-group row">
				<label for="customerName" class="col-2 col-form-label">Nom</label>
				<div class="col-10">
					<input required class="form-control" type="text" placeholder="Type your full name"
						id="customerName" name="customerName" >
				</div>
			</div>
			<div class="form-group row">
				<label for="customerEmail" class="col-2 col-form-label">Email</label>
				<div class="col-10">
					<input required class="form-control" type="email"
						placeholder="Type your email" id="customerEmail"
						name="customerEmail">
				</div>
			</div>
			<div class="form-group row">
				<label for="customerAdress" class="col-2 col-form-label">Adresse</label>
				<div class="col-10">
					<input required class="form-control" type="text"
						placeholder="Type your address" id="customerAdress" name="customerAdress">
				</div>
			</div>
			<div class="form-group row">
				<label for="example-tel-input" class="col-2 col-form-label">Telephone</label>
				<div class="col-10">
					<input required class="form-control" type="tel"
						placeholder="Type yout phone number" id="customerPhone" name="customerPhone" >
				</div>
			</div>
			<input type="reset" value="Effacer" class="btn btn-secondary" /> <input
				type="submit" value="Valider" class="btn btn-primary" />
		</form>
	</div>
	
</body>
</html>