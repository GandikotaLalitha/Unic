<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>
<%@ include file="adminHeader.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="../css/home.css">
<style>
h3
{
	color: yellow;
	text-align: center;
}
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
<div style="color: white; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
<br><br>
<%
String msg = request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Product Successfully Updated!</h3>
<%} %>
<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>
<div class="container">
	<div class="row">
		<%
		try{
			Connection con = ConnectionProvider.getConn();
			Statement st = con.createStatement();
			ResultSet rs= st.executeQuery("select * from products");
			while(rs.next()){
				String imageSrc = rs.getString("image");
		%>
		<div class="col-md-3 col-sm-6">
			<div class="card">
				<img class="card-img-top" src="../<%=imageSrc%>">
				<div class="card-body">
					<h5 class="card-title"><b><%=rs.getString("name") %></b></h5>
					<p class="card-text"><b>Category: </b><%=rs.getString("category") %></p>
					<p class="card-text"><b>Price: </b><%=rs.getString("price") %></p>
					<p class="card-text"><b>Description: </b><%=rs.getString("description") %></p>
					<p class="card-text"><b>Ratings: </b><%=rs.getString("rating") %> (<%=rs.getString("ratings_no") %>)</p>
				</div>
				<div style="display:flex; justify-content:center;font-weight:600">
					<a href="editProduct.jsp?id=<%=rs.getString("id") %>" class="card-link" style="color:white"><button class="btn btn-secondary" >Edit</button></a>
				</div>
				<br>
			</div>
			<br>
		</div>
		
		<%
			}
		}
			catch(Exception e){
				System.out.println(e);
			}
		%>
	</div>
</div>
  <!-- Include Bootstrap JS (optional) -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
