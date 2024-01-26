<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String rating = request.getParameter("rating");
String ratings_no = request.getParameter("ratings_no");
String desc = request.getParameter("desc");
String img = request.getParameter("imageSrc");

try{
	Connection con = ConnectionProvider.getConn();
	PreparedStatement ps = con.prepareStatement("insert into products(id,name,category,price,rating,ratings_no,description,image) values(?,?,?,?,?,?,?,?)");
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3, category);
	ps.setString(4,price);
	ps.setString(5,rating);
	ps.setString(6,ratings_no);
	ps.setString(7, desc);
	ps.setString(8, img);
	ps.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("addNewProduct.jsp?msg=wrong");
}
%>