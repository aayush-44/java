<%@page import="java.util.List"%>
<%@page import="com.dao.Wishlistdao"%>
<%@page import="com.bean.Wishlist"%>
<%
      Wishlist w = new Wishlist();
      w.setPid(Integer.parseInt(request.getParameter("pid")));
      w.setUid(Integer.parseInt(request.getParameter("uid")));
      Wishlistdao.AddToWishlist(w);
      List<Wishlist> list = Wishlistdao.getWishlistByUser(w.getUid());
	  session.setAttribute("wishlist_count", list.size());
		
      response.sendRedirect("wishlist.jsp");
%>