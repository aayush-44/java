<%@page import="com.bean.Product"%>
<%@page import="com.dao.Productdao"%>
<%@page import="com.dao.Cartdao"%>
<%@page import="com.bean.Cart"%>
<%@page import="java.util.List"%>
<%
      Cart c = new Cart();
      c.setPid(Integer.parseInt(request.getParameter("pid")));
      c.setUid(Integer.parseInt(request.getParameter("uid")));
      Product p = Productdao.getProductByPid(c.getPid());
      c.setProduct_price(p.getProduct_price());
      c.setProduct_qty(1);
      c.setTotal_price(p.getProduct_price());
      c.setUid(p.getUid());
      c.setPid(p.getPid());
      c.setProduct_price(p.getProduct_price());
      
      Cartdao.addToCart(c);
      List<Cart> list1 = Cartdao.getcartByUser(c.getUid());
	  session.setAttribute("cart_count", list1.size());
      response.sendRedirect("cart.jsp");
%>