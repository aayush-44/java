<%@page import="com.dao.Cartdao"%>
<%@page import="com.bean.Cart"%>
<%@page import="java.util.List"%>
<%
      Cart c = new Cart();
      c.setPid(Integer.parseInt(request.getParameter("pid")));
      c.setUid(Integer.parseInt(request.getParameter("uid")));
      Cartdao.RemoveFromCart(c);
      List<Cart> list = Cartdao.getcartByUser(c.getUid());
	  session.setAttribute("cart_count", list.size());
		
      response.sendRedirect("product.jsp");
      



%>