package com.controller;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Cart;
import com.bean.User;
import com.bean.Wishlist;
import com.dao.Cartdao;
import com.dao.Userdao;
import com.dao.Wishlistdao;
import com.service.Services;
 @WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
  	String action = request.getParameter("action");
  	if(action.equalsIgnoreCase("signup"))
  	{
  		boolean flag =Userdao.Checkemail(request.getParameter("email"));
  		if(flag==false) {
  		if(request.getParameter("password").equals(request.getParameter("cpassword"))) {
  			User u = new User();
  			u.setFname(request.getParameter("fname"));
  			u.setLname(request.getParameter("lname"));
  			u.setEmail(request.getParameter("email"));
  			u.setMobile(request.getParameter("mobile"));
  			u.setAddress(request.getParameter("address"));
  			u.setPassword(request.getParameter("password"));
  			u.setUsertype(request.getParameter("usertype"));
            Userdao.Signup(u);
            request.setAttribute("msg", "user sign up successful");
            request.getRequestDispatcher("login.jsp").forward(request, response);  	
            }
  		else {
  			request.setAttribute("msg", "Password and confirm password does not match	");
            request.getRequestDispatcher("signup.jsp").forward(request, response);  	
  		}
        
  		}
  		else {
  			request.setAttribute("msg", "Email already registered ");
            request.getRequestDispatcher("login.jsp").forward(request, response);  	
  		}
  	}
  	else if(action.equalsIgnoreCase("login")) {
  	     User u = Userdao.login(request.getParameter("email"), request.getParameter("password"));
  		if(u==null)
  		{
  			request.setAttribute("msg", "Email or Password Is Incorrect");
  			request.getRequestDispatcher("login.jsp").forward(request, response);
  		}
  		else if(u.getUsertype().equals("user"))
  		{
  			HttpSession session= request.getSession();
  			List<Wishlist> list = Wishlistdao.getWishlistByUser(u.getId());
  			session.setAttribute("wishlist_count", list.size());
  			List<Cart> list1 = Cartdao.getcartByUser(u.getId());
  			session.setAttribute("cart_count", list1.size());
  			session.setAttribute("u", u);
  			request.getRequestDispatcher("index.jsp").forward(request, response);
  		}  
  		else 
  		{

  			HttpSession session= request.getSession();
  			session.setAttribute("u", u);
  			request.getRequestDispatcher("seller_index.jsp").forward(request, response);
  		
  		}
  	}
  	else if(action.equalsIgnoreCase("change password")){
  		HttpSession session = request.getSession();
  		User u = (User)session.getAttribute("u");
  		if(u.getUsertype().equals("user"))
  		{
  		if(u.getPassword().equals(request.getParameter("old_password"))) {
  			if(request.getParameter("new_password").equals(request.getParameter("cnew_password"))) {
  				Userdao.changePassword(u.getEmail(),request.getParameter("new_password"));
  				response.sendRedirect("logout.jsp");
  			}
  			else {
  				request.setAttribute("msg", "Password & Confirm New Password Does Not Match");
  				request.getRequestDispatcher("changepassword.jsp").forward(request, response);
  			}
  		}
  		else {

				request.setAttribute("msg", "Old Password Is Incorrect");
				request.getRequestDispatcher("changepassword.jsp").forward(request, response);
  		}
  		}
  		else
  		{
  			if(u.getPassword().equals(request.getParameter("old_password"))) {
  	  			if(request.getParameter("new_password").equals(request.getParameter("cnew_password"))) {
  	  				Userdao.changePassword(u.getEmail(),request.getParameter("new_password"));
  	  				response.sendRedirect("logout.jsp");
  	  			}
  	  			else {
  	  				request.setAttribute("msg", "Password & Confirm New Password Does Not Match");
  	  				request.getRequestDispatcher("seller_changepassword.jsp").forward(request, response);
  	  			}
  	  		}
  	  		else {

  					request.setAttribute("msg", "Old Password Is Incorrect");
  					request.getRequestDispatcher("seller_changepassword.jsp").forward(request, response);
  	  		}
  	  		
  		}
  	}
  	
  	else if(action.equalsIgnoreCase("send otp"))
  	{
  		boolean flag = Userdao.Checkemail(request.getParameter("email"));
  		if(flag==true)
  		{
  			Random t = new Random();
  			int minRange= 1000, maxRange = 9999;
  			int otp = t.nextInt(maxRange - minRange)+ minRange;
  			Services.sendMail(request.getParameter("email"), otp);
  			
  		    request.setAttribute("otp", otp);
  		    request.setAttribute("email", request.getParameter("email"));
  		    request.getRequestDispatcher("otp.jsp").forward(request, response);
  		
  		}
  		else 
  		{
  			request.setAttribute("msg", " Email Not Registered");
			request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
  		}
  	}
  	else if(action.equalsIgnoreCase("verify otp")) {
  		String email = request.getParameter("email");
  		int otp = Integer.parseInt(request.getParameter("otp"));
  		int uotp =Integer.parseInt(request.getParameter("uotp"));
  		
  		if(otp==uotp)
  		{

  		    request.setAttribute("email", email);
  		    request.getRequestDispatcher("newpassword.jsp").forward(request, response);
  		 
  		}
  		else 
  		{

  		    request.setAttribute("otp", otp);
  		    request.setAttribute("email",email);
  		    request.setAttribute("msg", "Invalid OTP");
  		    request.getRequestDispatcher("otp.jsp").forward(request, response);
  		
  		}
  	}
  	else if(action.equalsIgnoreCase("update password"))
  	{
  		String email = request.getParameter("email");
  		String np = request.getParameter("new_password");
  		String cnp =request.getParameter("cnew_password");
  		if(np.equals(cnp))
  		{
  			Userdao.changePassword(email, np);
  			response.sendRedirect("login.jsp");
  		}
  		else 
  		{
  			request.setAttribute("email", email);
  			request.setAttribute("msg","New Password & Confirm Password does Not Matched");
  			request.getRequestDispatcher("newpassword.jsp").forward(request, response);
  		}
  	}
}
}