<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <form action="./Signup" method="post">
  <input type="text" name="name" placeholder="Enter Name" required />
  <input type="email" name="email" placeholder="Enter Email" required />
  <input type="text" name="password" placeholder="Enter Password" required />
  <select name="gender" required>
  <option value="Female">Female</option>
   <option value="Male">Male</option>
  </select>
  <select name="preference" required>
  <option value="long-term-products">Long term products</option>
   <option value="Mid-term-products">Mid term products</option>
    <option value="Short-term-products">Short term products</option>
  </select>
  <input type="text" name="location" placeholder="location">
  <input type="submit" name="submit" value="Submit"/>
  </form>
    
      <h2><a href="">Login</a></h2>
  </div>
  <div class='whysign'>
  <%
  String msg = request.getParameter("msg");
  if("valid".equals(msg)){
  %>

<h1>Successfully Updated</h1>
<%} %>
<%
if("invalid".equals(msg)){
%>
<h1>please check your credentials</h1>
<%} %>
    <h2>Business Re-engineering</h2>
    <p>Keep Track of all your business activities</p>
  </div>
</div>

</body>
</html>