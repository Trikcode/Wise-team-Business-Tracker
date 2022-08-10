
<%@page import="com.project.DbConnection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script src="https://kit.fontawesome.com/3beab63c5d.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="../css/style.css" />
<title>ADMIN-Business Tracker</title>
<style>
h1
{
color: white;
text-align: center;
font-size: 100px;
}
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row box-1" style="width: 100px;">

      <div class="icon icon-1">
        <a href="index.html">
          <i class="fas fa-home"></i>
          <h5>Business Tracker</h5>
        </a>
      </div>
      <br>
      <div class="icon icon-2">
        <a href="addNewProduct.jsp">
          <i class="fas fa-plus"></i>
          <h5>Add Product</h5>
        </a>
      </div>
      <br>
      <div class="icon icon-3">
        <a href="allProductEditProduct.jsp">
          <i class="fas fa-eye"></i>
          <h5>View Products</h5>
        </a>
      </div>
      <br>
      <div class="icon icon-5">
        <a href="deliveredOrdersAction.jsp">
          <i class="fas fa-shopping-cart"></i>
          <h5>View Orders</h5>
        </a>
      </div>
      <br>
      <div class="icon icon-6">
        <a href="specifyNumberOfProducts.jsp">
          <i class="fas fa-edit"></i>
          <h5>Add Specifications</h5>
          </a>
      </div>
          
      <div> 
            <%
    		if (session.getAttribute("email") == null || session.getAttribute("email").equals("")){
    			response.sendRedirect("../login.jsp?msg=adminaccess");
    		}
    		%>
    		<br><br><br><br>
       	  <a href="../LogoutAction.jsp"><i class='fas fa-share-square'></i> <br>Logout </a>
            	       
           	</div>
    </div>
    <div class="row box-2">
      <!-- first-row -->
      <div class="middle-container">
        <div class="middle md-1">
          <div class="credit">
            <i class="fas fa-credit-card"></i>
          </div>
          <div class="desc">
            <h3>Our Customers</h3>
            <h4>The great support</h4>
            <div class="messages">
                <h5>
                <a href="viewCustomers.jsp"><span class="details">view customer Base</span></a>                
              </h5>
            </div>
          </div>
        </div>
        <!-- messages available -->
        <div class="middle md-2">
          <div class="credit">
            <i class="fas fa-comment-dots"></i>
          </div>
           <div class="desc">
            <h3>Most Liked Products</h3>
            <h4>Highly Demanded</h4>
            <div class="messages">
                <h5>
                <a href="viewMostLikedProducts.jsp"><span class="details">View Most Liked</span></a>                
              </h5>
            </div>
          </div>
        </div>
        <!-- keywords -->
        <div class="middle md-3">
          <div class="credit">
            <i class="fas fa-key"></i>
          </div>
          <div class="desc">
            <h3>Daily Specifications</h3>
            <h4>Keep up to date</h4>
            <div class="messages">
                <h5>
                <a href="viewDailySpecifications.jsp"><span class="details">View Daily Specifications</span></a>                
              </h5>
            </div>
          </div>
        </div>
      </div>
      <!-- second-row -->
      <div class="middle-container">
        <!-- subscribers -->
        <div class="middle md-1 lst">
          <i class="fas fa-user one"></i>
          <div class="desc">
            <h3 class="unique1">5</h3>
            <h4 class="unique1">products</h4>
            <h5 class="desc1">5 people subscribed this month</h5>
          </div>
        </div>
        <!-- messages-sent -->
        <div class="middle md-2 lst">
          <i class="fas fa-paper-plane twoo"></i>
          <div class="desc">
            <h3 class="unique2">12</h3>
            <h4 class="unique2">total  sent</h4>
            <h5 class="desc2">12  sent this month</h5>
          </div>
        </div>
        <!-- messages-deliveredd -->
        <div class="middle md-3 lst">
          <i class="fas fa-check three"></i>

          <div class="desc">
            <h3 class="unique3">10</h3>
            <h4 class="unique3">total  delivered</h4>
            <h5 class="desc3">10  delivered this month</h5>
          </div>
        </div>
      </div>

      <!-- actvity report -->
      <div class="activity-page">
        <div class="top-line">
          <div class="report">
            <h5>Activity Report</h5>
          </div>
          <div class="daily">
            <h5>
              Daily <span> <i class="fas fa-caret-down"></i></span>
            </h5>
          </div>
        </div>
        <div class="chart" style="display: flex; justify-content: center">
         <table id="customers">
        <thead>
          <tr>
           
            <th scope="col">Number of Users</th>
            <th scope="col">Product Sales</th>
            <th scope="col">Pending Orders</th>
              <th scope="col">Total Product Likes</th>
                <th scope="col">Staff Number</th>
          </tr>
        </thead>
        <tbody>	
        <%
      
        try{
        Connection con = DbConnection.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select count(*) from users");
		rs.next();
		int count = rs.getInt(1);
		ResultSet rs1 = st.executeQuery("select count(*) from cart where status='delivered'");
		rs1.next();
		int salescount = rs1.getInt(1);
		ResultSet rs2 = st.executeQuery("select count(*) from cart where status='bill'");
		rs2.next();
		int orderscount = rs2.getInt(1);
		ResultSet rs3 = st.executeQuery("select sum(liked) from product");
		rs3.next();
		int sumlikes = rs3.getInt(1);
		ResultSet rs4 = st.executeQuery("select sum(shortstafft)+sum(midtermstaff)+sum(longtermstaff) from specification");
		rs4.next();
		int staffcount = rs4.getInt(1);
		
		 %>	
      
       
          <tr>
             <td><%= count%></td>  
            <td><%= salescount%></td>  
             <td><%= orderscount%></td>
              <td><%= sumlikes%></td>
               <td><%= staffcount%></td>
          
           
              
          </tr>
<%  } catch(Exception e){
	System.out.println(e);
	
} %>
        </tbody>
      </table>
        </div>
      </div>
     
    </div>

  </div>
  
</body>
</html>