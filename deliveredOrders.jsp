<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>
<%@ include file="adminHeader.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.fix,.footer{
	z-index:1;
}
a:hover{
	text-decoration:none;
}
body{
	background-color: #343a40;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Delivered Orders <i class='fas fa-dolly'></i></div>
<div class="container">
	<div class="row">
<%
try{
	Connection con = ConnectionProvider.getConn();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from cart inner join products where cart.product_id=products.id and cart.orderDate is not null and cart.status='delivered'");
	while(rs.next()){
		String imageSrc=rs.getString("image");
%>
		<div class="col-md-4 col-sm-6">
			<div class="card">
				<img class="card-img-top" src="<%=imageSrc%>">
				<div class="card-body">
					<h5 class="card-title"><center><b><%=rs.getString("name") %></b></center></h5>
					<p class="card-text"><b>Quantity: </b> <%=rs.getString("quantity") %></p>
					<p class="card-text"><b>Total: </b> <i class="fa fa-inr"></i><%=rs.getString("total") %></p>
					<p class="card-text"><b>Mobile Number: </b><%=rs.getString("number") %></p>
					<p class="card-text"><b>Address: </b>
						<%=rs.getString("address") %>,<%=rs.getString("city") %> <br>
						<%=rs.getString("state") %>,<%=rs.getString("country") %><br>
					</p>
					<p class="card-text"><b>Ordered Date: </b><%=rs.getString("orderDate") %></p>
					<p class="card-text"><b>Delivery Date: </b><%=rs.getString("deliveryDate") %>(Exp)</p>
					<p class="card-text"><b>Payment Method: </b><%=rs.getString("paymentMethod") %></p>
					<p class="card-text"><b>Transaction ID: <%=rs.getString("transactionId") %></b></p>
					<p class="card-text"><b>Status: <%=rs.getString("status") %></b></p>
				</div>
				<br>
			</div>
			<br>
		</div>
		 <%
 }
}
catch(Exception e){
	
}
%>
  	</div>     
</div>


  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>