<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="./common/client_hd.jsp"></jsp:include>
<div class="hero-wrap hero-bread" style="background-image: url('${path}/resources/images/bg_1.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span>
				</p>
				<h1 class="mb-0 bread">My Cart</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
				<div class="cart-list">
					<table class="table">
						<thead class="thead-primary">
							<tr class="text-center">
								<th>&nbsp;</th>
								<th>&nbsp;</th>
								<th>상품명</th>
								<th>가격</th>
								<th>갯수</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<tr class="text-center">
								<td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
								<td class="image-prod"><div class="img" style="background-image: url(${path}/resources/images/product-3.jpg);"></div></td>
								<td class="product-name">
									<h3>Bell Pepper</h3>
									<p>Far far away, behind the word mountains, far from the countries</p>
								</td>
								<td class="price">$4.90</td>
								<td class="quantity">
									<div class="input-group mb-3">
										<input type="text" name="quantity" class="quantity form-control input-number" value="1" min="1" max="100">
									</div>
								</td>
								<td class="total">$4.90</td>
							</tr>
							<!-- END TR-->

							<tr class="text-center">
								<td class="product-remove"><input type="checkbox"></td>
								<td class="image-prod"><div class="img" style="background-image: url(${path}/resources/images/product-4.jpg);"></div></td>
								<td class="product-name">
									<h3>Bell Pepper</h3>
									<p>Far far away, behind the word mountains, far from the countries</p>
								</td>
								<td class="price">34442</td>
								<td class="quantity">
									<div class="input-group mb-3">
										<input type="button" onclick='count("plus")' value="+">
										<input type="button" onclick='count("minus")' value="-">
										<div id="result">1</div>
									</div>
								</td>
								<td class="total">$15.70</td>
							</tr>
							
							
							<tr class="text-center">
							<c:forEach items="${cartList }" var="cart" varStatus="status">
								<td class="product-name">${cart.cart_code }</td>
							</c:forEach>
							</tr>
							
							
							<!-- END TR-->
						</tbody>
					</table>
				</div>
			</div>
		</div>
			<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
				<div class="cart-total mb-3">
					<h3>Cart Totals</h3>
					<p class="d-flex">
						<span>Subtotal</span> <span>$20.60</span>
					</p>
					<p class="d-flex">
						<span>Delivery</span> <span>$0.00</span>
					</p>
					<p class="d-flex">
						<span>Discount</span> <span>$3.00</span>
					</p>
					<hr>
					<p class="d-flex total-price">
						<span>Total</span> <span>$17.60</span>
					</p>
				</div>
				<p>
					<a href="checkout.html" class="btn btn-primary py-3 px-4">Proceed to Checkout</a>
				</p>
			</div>
		</div>
	</div>
</section>

<jsp:include page="./common/client_ft.jsp"></jsp:include>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
		</svg>
</div>

<script src="${path}/resources/js/jquery.min.js"></script>
<script src="${path}/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${path}/resources/js/bootstrap.min.js"></script>
<script src="${path}/resources/js/jquery.easing.1.3.js"></script>
<script src="${path}/resources/js/jquery.waypoints.min.js"></script>
<script src="${path}/resources/js/jquery.stellar.min.js"></script>
<script src="${path}/resources/js/owl.carousel.min.js"></script>
<script src="${path}/resources/js/jquery.magnific-popup.min.js"></script>
<script src="${path}/resources/js/aos.js"></script>
<script src="${path}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${path}/resources/js/scrollax.min.js"></script>
</body>
</html>
<script src="${path}/resources/js/main.js"></script>

<script>
function count(type)  {
	  // 결과를 표시할 element
	  const resultElement = document.getElementById('result');
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText;
	  
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus')  {
	    number = parseInt(number) - 1;
	  }
	  
	  // 결과 출력
	  resultElement.innerText = number;
	}
</script>
