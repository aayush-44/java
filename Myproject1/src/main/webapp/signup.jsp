<!DOCTYPE html>
<html>
<head>
<script>
	var request = new XMLHttpRequest();
	function searchInfo() {
		var name = document.myform.email.value;
		var url = "AjaxSearch2.jsp?val=" + name;
		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('tops').innerHTML = val;
					/* if(val.includes("Used"))
					{
						alert(val);
						document.getElementById("submit").disabled="true";	
					}
					else if(val.includes("Available"))
					{
						alert(val);
						document.getElementById("submit").disabled="";
					} */
				}
			}
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajax Example</title>
</head>
<body class="sub_page">
	<div class="hero_area">
		<%@ include file="header.jsp"%>

	</div>
	<!-- inner page section -->
	<section class="inner_page_head">
		<div class="container_fuild">
			<div class="row">
				<div class="col-md-12">
					<div class="full">
						<h3>Signup</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end inner page section -->
	<!-- why section -->
	<section class="why_section layout_padding">
		<div class="container">

			<div class="row">
				<div class="col-lg-8 offset-lg-2">
					<div class="full">
						<%
						if (request.getAttribute("msg") != null) {
							out.print(request.getAttribute("msg"));
						}
						%>
							<form name="myform" method="post" action="UserController">
							<fieldset>
								<select name="usertype">
									<option>----Select User Type---</option>
									<option value="user">User</option>
									<option value="seller">Seller</option>

								</select> <input type="text" placeholder="Enter First Name " name="fname"
									required /> <input type="text" placeholder="Enter Last Name "
									name="lname" required /> 	
								Enter Email Id  : <input type="text" name="email" onkeyup="searchInfo()"> 
								
							<span id="tops"></span>
									<input
									type="text" placeholder="Enter Mobile Number " name="mobile"
									required />
								<textarea placeholder="Enter Address" name="address" required></textarea>
								<input type="password" placeholder="Enter Password"
									name="password" required /> <input type="password"
									placeholder="Enter Confirm Password " name="cpassword" required />
								<input type="submit" name="action" value="Signup" />
							</fieldset>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end why section -->
	<!-- arrival section -->
	<section class="arrival_section">
		<div class="container">
			<div class="box">
				<div class="arrival_bg_box">
					<img src="images/arrival-bg.png" alt="">
				</div>
				<div class="row">
					<div class="col-md-6 ml-auto">
						<div class="heading_container remove_line_bt">
							<h2>#NewArrivals</h2>
						</div>
						<p style="margin-top: 20px; margin-bottom: 30px;">Vitae fugiat
							laboriosam officia perferendis provident aliquid voluptatibus
							dolorem, fugit ullam sit earum id eaque nisi hic? Tenetur
							commodi, nisi rem vel, ea eaque ab ipsa, autem similique ex unde!
						</p>
						<a href=""> Shop Now </a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end arrival section -->
	<!-- footer section -->
	<footer class="footer_section">
		<div class="container">
			<div class="row">
				<div class="col-md-4 footer-col">
					<div class="footer_contact">
						<h4>Reach at..</h4>
						<div class="contact_link_box">
							<a href=""> <i class="fa fa-map-marker" aria-hidden="true"></i>
								<span> Location </span>
							</a> <a href=""> <i class="fa fa-phone" aria-hidden="true"></i> <span>
									Call +01 1234567890 </span>
							</a> <a href=""> <i class="fa fa-envelope" aria-hidden="true"></i>
								<span> demo@gmail.com </span>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 footer-col">
					<div class="footer_detail">
						<a href="index.jsp" class="footer-logo"> Famms </a>
						<p>Necessary, making this the first true generator on the
							Internet. It uses a dictionary of over 200 Latin words, combined
							with</p>
						<div class="footer_social">
							<a href=""> <i class="fa fa-facebook" aria-hidden="true"></i>
							</a> <a href=""> <i class="fa fa-twitter" aria-hidden="true"></i>
							</a> <a href=""> <i class="fa fa-linkedin" aria-hidden="true"></i>
							</a> <a href=""> <i class="fa fa-instagram" aria-hidden="true"></i>
							</a> <a href=""> <i class="fa fa-pinterest" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 footer-col">
					<div class="map_container">
						<div class="map">
							<div id="googleMap"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-info">
				<div class="col-lg-7 mx-auto px-0">
					<p>
						&copy; <span id="displayYear"></span> All Rights Reserved By <a
							href="https://html.design/">Free Html Templates</a><br>

						Distributed By <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- footer section -->
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