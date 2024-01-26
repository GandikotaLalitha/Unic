<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>
<%@ include file="adminHeader.jsp" %>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style type="text/css">
	body{
		background-color: #343a40;
	}
</style>
</head>
<body>
<br>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Product Added Successfully!</h3>
<%} %>
<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
<%
int id=1;
try{
	Connection con = ConnectionProvider.getConn();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select max(id) from products");
	while(rs.next()){
		id=rs.getInt(1);
		id=id+1;
		
	}
}
catch(Exception e){
	
}
%>
<form action="addNewProductAction.jsp" method="post">
<h3 style="color: yellow;">Product ID: <%out.println(id); %></h3>
<input type="hidden" name="id" value="<%out.println(id); %>" >
<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter name" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="category" placeholder="Enter Category" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="number" name="price" placeholder="Enter price" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Description</h3>
 <input class="input-style" type="text" name="desc" placeholder="Enter Description" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Ratings</h3>
 <input class="input-style" type="text" name="rating" placeholder="Enter Rating" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Ratings_No</h3>
 <input class="input-style" type="number" name="ratings_no" placeholder="Enter Ratings" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Image Path</h3>
 <input class="input-style" type="text" name="imageSrc" placeholder="images/id.jpg" required>
<hr>
</div>
 <button class="button">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>
