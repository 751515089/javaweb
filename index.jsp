<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Insert title here</title>
</head>
<body>
Please select the item you want to buy.<br>
<form action="<%=request.getContextPath() %>/productServlet" method="post">
  Mobile phone(1000$)
  <input name="Product" type="radio" value="001" checked="checked"><br>
  Watch(100$)
  <input name="Product" type="radio" value="002"><br>
  please input the number!
  number:<input name="number" type="number"><br>
  <input type="submit" value="ok!">
</form>
</body>
</html>
