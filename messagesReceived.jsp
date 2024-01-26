<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>
<%@ include file="adminHeader.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<div class="container">
	<div class="row">
  <%
  try{
	  Connection con = ConnectionProvider.getConn();
	  Statement st = con.createStatement();
	  ResultSet rs = st.executeQuery("select * from message");
	  while(rs.next()){
	  
  %>
          <div class="col-md-6">
          	<div class="card-header">
          		<h4><%=rs.getString(2) %>
          			<a href="deleteMessage.jsp?msg=<%=rs.getString("id") %>" class="delete-icon" style="margin-left:100px">
              			<i class="fas fa-trash-alt"></i>
            		</a>
            	</h4>
          	</div>
          	<div class="card-body">
          		<h4 class="card-title" style="color:brown"><%=rs.getString("subject") %></h4>
          		<p class="card-text"><%=rs.getString("body") %></p>
          	</div>
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
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</body>
</html>
