<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="cancel";
try{
	Connection con = ConnectionProvider.getConn();
	Statement st = con.createStatement();
	st.executeUpdate("update cart set status='"+status+"' where product_id='"+id+"' ");
	response.sendRedirect("ordersReceived.jsp?msg=cancel");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("ordersReceived.jsp?msg=invalid");
}
%>