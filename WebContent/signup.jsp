<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup.css">
<title>Signup</title>
</head>
<body>
<h2 style="text-align:center; padding-top:20px;">Welcome to Wise Team Business Tracker</h2>
<div class="container">
	<div class="screen">
	<div class="errors" style="z-index: 1;
	position: relative;text-align:center;padding:10px;	">
  <%
  String msg = request.getParameter("msg");
  if("valid".equals(msg)){
  %>

<h1>Successfully Updated</h1>
<%} %>
<%
if("invalid".equals(msg)){
%>
<h1>The email address already exists</h1>
<%} %>
</div>
		<div class="screen__content">
			<form action="./Signup" method="post" class="login">
				<div class="login__field">
					<i class="login__icon fas fa-user"></i>
					<input type="text" class="login__input" name="name" placeholder="Enter Name" required>
				
				</div>
				<div class="login__field">
					<i class="login__icon fas fa-lock"></i>
					<input type="email" name="email" placeholder="Enter Email" class="login__input" required>
									</div>
				<div class="login__field">
					<i class="login__icon fas fa-lock"></i>
					<input type="text"  name="password" class="login__input" placeholder="Password"  required>
				</div>
				
  				<div class="login__field">
					<i class="login__icon fas fa-user"></i>
					<input type="text" name="location" placeholder="Address" class="login__input" required>
			
				</div>
				<div class="login__field">
					<i class="login__icon fas fa-user"></i>
					<input type="text" name="city" placeholder="city" class="login__input" required>
			
				</div>
				<div class="login__field">
				 <select style="padding: 5px 100px 5px 0px; border-radius:10px " name="gender" required>
				 <option value="#">Gender</option>
  				<option value="Female">Female</option>
  				 <option value="Male">Male</option>
  				</select>
  				</div>
  				<div class="login__field">
				<select  style="padding: 5px 100px 5px 0px; border-radius:10px " name="preference" required>
				<option value="#">Preference</option>
  				<option value="plastics">Plastics</option>
   				<option value="spices">Spices</option>
   				<option value="Detergents">Detergents</option>
    			<option value="Electronics">Electronics</option>
  </select>
  				</div>
				<button type="submit" name="submit" class="button login__submit">
					<span class="button__text">Sign Up Now</span>
					<i class="button__icon fas fa-chevron-right"></i>
				</button>				
			</form>
		<div class="errors" style="z-index: 1;
	position: relative;text-align:center;padding:10px;background:white	">
	<p>Already have an account?</p>
			 <h2><a href="login.jsp">Login</a></h2>
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