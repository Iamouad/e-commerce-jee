
 <%@ include file="pagehead.jsp" %>

	<div class="container">
	<h1 class="my-4">Admin Page</h1>
	
	<div id="login-row" class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">             
                   <form class="form" method="POST" action="Management">
                       <div class="form-group">
                           <label for="username">Username:</label><br>
                           <input placeholder="Type your username" type="text" name="username" id="username" class="form-control">
                       </div>
                       <div class="form-group">
                           <label for="password">Password:</label><br>
                           <input placeholder="Type your password" type="password" name="password" id="password" class="form-control">
                       </div>
                       <div class="form-group">
                           <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
                       </div>
                   </form>
                </div>
            </div>
        </div>
	</div>
</body>
</html>