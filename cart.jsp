<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/7/9
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@
        page import="Beans.Cart"
%>
<%@
        page import="Beans.CartItem"
%>
<%@
        page import="Beans.Product"
%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>

<% Cart cart=(Cart)request.getSession().getAttribute("cart");
    if(cart==null) {
%>
<p>It is nothing!</p>
<%
}
else{
    HashMap<String, CartItem> cartItems=cart.getCartItems();
    double total=cart.getTotal();
%>
Your product list:<br>
<%
    Set<String> keys=cartItems.keySet();
    Iterator<String> iter = keys.iterator();
    while(iter.hasNext()){
        String key= iter.next();
        CartItem cartItem=cartItems.get(key);
        Product product=cartItem.getProduct();
        out.print(product.getName()+" ") ;
        out.println("price:"+product.getPrice()+"$") ;
        out.println("number:"+cartItem.getBuyNum());
    };
%>
<br>
<%
        out.print("    total:"+total+"$");
    }
%>



</body>
</html>
