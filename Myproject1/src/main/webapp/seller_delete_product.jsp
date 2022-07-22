 <%@page import="com.dao.Productdao"%>
<%
    int pid = Integer.parseInt(request.getParameter("pid"));
    Productdao.deleteProductByPid(pid);
    response.sendRedirect("seller_view_product.jsp");
 
 %>