<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
System.out.println(id+" "+name+" "+category+" "+price);
try{
	Connection con = ConnectionProvider.getConn();
	Statement st = con.createStatement();
	st.executeUpdate("update products set name='"+name+"',category='"+category+"',price='"+price+"' where id='"+id+"' ");
	
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>