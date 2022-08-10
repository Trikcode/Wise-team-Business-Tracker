
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup.css">
<title>Login</title>
</head>
<body>
<h2 style="text-align:center; padding-top:20px;">Welcome to Wise Team Business Tracker</h2>
<div class="container" style="min-height: 100vh;">
	<div class="screen" style="height: 500px;">
	<div class="errors" style="z-index: 1;
	position: relative;text-align:center;padding:10px;	">
  <%
  String message = request.getParameter("msg");
  if("notexist".equals(message)){	 
  %>
  <h4 style="color:red">Incorrect Email or Password</h4>
  <%} %>
  <%
  if("invalid".equals(message)){
	  %> 
<h4 style="color:red">Check credentials and Try Again !</h4>
  <% 
  }
  %>
   <%
   if("logout".equals(message)){	 
  %>
 <h4><font color="Red">You are Sucessfully logged out...</font></h4>
  <%} %>
  
    <%
   if("adminaccess".equals(message)){	 
  %>
 <h4><font color="Red">You must login to access admin page!</font></h4>
  <%} %>
  
 
    <%
   if("cartaccess".equals(message)){	 
  %>
 <h4><font color="Red">You must login to add items to the cart!</font></h4>
  <%} %>
</div>
		<div class="screen__content">
			<form action="./Signin" method="post" class="login">
				<div class="login__field">
					<i class="login__icon fas fa-user"></i>
					<input type="email" name="email"  class="login__input" placeholder="User name / Email" required>
				</div>
				<div class="login__field">
					<i class="login__icon fas fa-lock"></i>
					<input type="text"  name="password" class="login__input" placeholder="Password"  required>
				</div>
				<button type="submit" name="submit" class="button login__submit">
					<span class="button__text">Log In Now</span>
					<i class="button__icon fas fa-chevron-right"></i>
				</button>				
			</form>
		<div class="errors" style="z-index: 1;
	position: relative;text-align:center;padding:10px;background:white	">
	<p>No account yet?</p>
			 <h2><a href="signup.jsp">SignUp</a></h2>
	</div>
		</div>
		<div class="screen__background">
			<span class="screen__background__shape screen__background__shape4"></span>
			<span class="screen__background__shape screen__background__shape3"></span>		
			<span class="screen__background__shape screen__background__shape2"></span>
			<span class="screen__background__shape screen__background__shape1"></span>
		</div>		
	</div>
</div>

</body>
</html>