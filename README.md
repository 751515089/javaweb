jsp实现简单的购物车
登录页面
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="UTF-8"%>
<html>
<head>
    <title>login</title>
</head>
<body>
<!-- <p1>test!</p1> -->
<h2 align="center">欢迎登录</h2>
<form name=loginForm action="shop.jsp" method=post>
    <table align="center">
        <tr>
            <td>用户名：</td><td><input type=text name=username /></td>
        </tr>
        <tr>
            <td>密码：</td><td><input type=password name=pwd /></td>
        <tr/>
        <tr>
            <td colspan="2",align="center">
                <input type="submit" value="submit" />
                <input type="reset" value="reset" />
            </td>
        </tr>
    </table>

</form>
</body>
</html>
购物页面
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>购物页面</title>
</head>
<body>
<form action="" method="post" name="form">
    水果：<br />
    <input type="checkbox" name="sec" value="apple" />apple<br />
    <input type="checkbox" name="sec" value="Banana" />Banana<br />
    <input type="checkbox" name="sec" value="pear" />pear<br />
    <input type="checkbox" name="sec" value="peach" />peach<br />
    <input type="submit" name="gouwu" value="购物">
    <br />
    <br />
    <a href="count.jsp">欢迎查看购物车！</a>
        <%
	request.setCharacterEncoding("UTF-8");
	String sec[] = request.getParameterValues("sec");
	if (sec!=null && sec.length!= 0) {
	for (int i=0;i<sec.length;i++) {
		session.setAttribute(sec[i],sec[i]);
	}
	}
			%>
</body>
</html>
结账页面
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>查看购物车商品页面</title>
</head>
<body>
<h3>这里是结账柜台，请确认以下信息。</h3>
<br />
<%

    String id=(String) session.getAttribute("id");
    out.println("您的账户：" + id);
    Enumeration enumsec= session.getAttributeNames();
    out.println("<br>购物车中的商品清单：<br>");
    while (enumsec.hasMoreElements()) {
        String ser=(String)enumsec.nextElement();
        String scr=(String)session.getAttribute(ser);
        if (!(scr.equals(id))) {
            out.println("  " + scr + "<br>");
            session.removeAttribute(ser);
        }
    }
%>
<a href="food.jsp"> 水果店</a>
</body>
</html>
导购页面
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>导购页面</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String name=request.getParameter("username");
    String pwd = request.getParameter("pwd");
    if(name.equals("admin")&&pwd.equals("123")){
        session.setAttribute("id",name);
        // out.print("欢迎光临");
        pageContext.forward("join.jsp");
    }
    else{
        out.print("账户或密码错误");
    }

%><br>
<%--<a href="food.jsp">请选择你要的水果：</a><br/>--%>
</body>
</html>
