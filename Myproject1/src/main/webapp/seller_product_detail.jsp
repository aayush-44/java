<!DOCTYPE html>
<%@page import="com.dao.Productdao"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>
<html>
   <head>
   </head>
   <body> 
          
          <%@ include file ="seller_header.jsp" %>
       <!-- product section -->
      <section class="product_section layout_padding">
         <div class="container">
            <div class="heading_container heading_center">
               <h2>
                 <span>Product Detail</span>
               </h2>
            </div>
            <div class="row">
            <%
            int pid= Integer.parseInt(request.getParameter("pid"));
            Product p = Productdao.getProductByPid(pid);
            %>
               <div class="col-sm-6 col-md-12 col-lg-12">
                  <div class="box">
                     <div class="option_container">
                        <div class="options"> 
                           <a href="seller_delete_product.jsp?pid=<%=p.getPid() %>" class="option2"> Delete </a>
                        </div>
                     </div>
                     <div class="img-box">
                        <img src="product_image/<%=p.getProduct_image() %>" alt="">
                     </div>
                     <div class="detail-box">
                        <h5>
                           <%=p.getProduct_category() %><%=p.getProduct_name() %>
                        </h5>
                        <br>
                        <h6>
                        Price:   <%=p.getProduct_price()%>
                        </h6><br>
                        
                        <h7>
                           Detail: <%=p.getProduct_desc()%>
                        </h7>
                        <br>
                        
                     </div>
                  </div>
               </div>
             
             
             
               </div>
         </div>
      </section>
      <!-- end product section -->

       <!-- footer start -->
      <footer>
         <div class="container">
            <div class="row">
               <div class="col-md-4">
                   <div class="full">
                      <div class="logo_footer">
                        <a href="#"><img width="210" src="images/logo.png" alt="#" /></a>
                      </div>
                      <div class="information_f">
                        <p><strong>ADDRESS:</strong> 28 White tower, Street Name New York City, USA</p>
                        <p><strong>TELEPHONE:</strong> +91 987 654 3210</p>
                        <p><strong>EMAIL:</strong> yourmain@gmail.com</p>
                      </div>
                   </div>
               </div>
               <div class="col-md-8">
                  <div class="row">
                  <div class="col-md-7">
                     <div class="row">
                        <div class="col-md-6">
                     <div class="widget_menu">
                        <h3>Menu</h3>
                        <ul>
                           <li><a href="#">Home</a></li>
                           <li><a href="#">About</a></li>
                           <li><a href="#">Services</a></li>
                           <li><a href="#">Testimonial</a></li>
                           <li><a href="#">Blog</a></li>
                           <li><a href="#">Contact</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div class="widget_menu">
                        <h3>Account</h3>
                        <ul>
                           <li><a href="#">Account</a></li>
                           <li><a href="#">Checkout</a></li>
                           <li><a href="#">Login</a></li>
                           <li><a href="#">Register</a></li>
                           <li><a href="#">Shopping</a></li>
                           <li><a href="#">Widget</a></li>
                        </ul>
                     </div>
                  </div>
                     </div>
                  </div>     
                  <div class="col-md-5">
                     <div class="widget_menu">
                        <h3>Newsletter</h3>
                        <div class="information_f">
                          <p>Subscribe by our newsletter and get update protidin.</p>
                        </div>
                        <div class="form_sub">
                           <form>
                              <fieldset>
                                 <div class="field">
                                    <input type="email" placeholder="Enter Your Mail" name="email" />
                                    <input type="submit" value="Subscribe" />
                                 </div>
                              </fieldset>
                           </form>
                        </div>
                     </div>
                  </div>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!-- footer end -->
      <div class="cpy_">
         <p class="mx-auto">© 2021 All Rights Reserved By <a href="https://html.design/">Free Html Templates</a><br>
         
            Distributed By <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
         
         </p>
      </div>
      <!-- jQery -->
      <script src="js/jquery-3.4.1.min.js"></script>
      <!-- popper js -->
      <script src="js/popper.min.js"></script>
      <!-- bootstrap js -->
      <script src="js/bootstrap.js"></script>
      <!-- custom js -->
      <script src="js/custom.js"></script>
   </body>
</html>