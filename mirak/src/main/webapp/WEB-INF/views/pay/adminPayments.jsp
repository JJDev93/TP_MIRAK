<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/admin_hd.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
<script type="text/javascript" src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<style>
.detail-row .hidden-row {
	display: none;
}

.thead-custom {
	color: #fff;
	background-color: #6c757d;
	border-color: #6c757d;
}

tr .tr-custom {
	background-color: #000;
}

.table-hover tbody .detail-row:nth-child(even):hover {
	background-color: initial;
}
</style>
<div class="ftco-section">
	<div class="justify-content-center mb-3 pb-3">
		<div class="heading-section text-center">
			<h2>결제관리</h2>
			<p>결제관리 리스트 페이지 입니다.</p>
		</div>
	</div>
	<div class="container-fluid">
		<div class="bd-example-snippet bd-code-snippet">
			<div class="bd-example">
				<table
					class="table table-striped table-hover table-bordered table-sm">
					<thead class="thead-custom">
						<tr>
							<th scope="col">주문번호</th>
							<th scope="col">상품명</th>
							<th scope="col">도시락 종류</th>
							<th scope="col">총 가격</th>
							<th scope="col">주문자이름</th>
							<th scope="col">전화번호</th>
							<th scope="col">배송지주소</th>
							<th scope="col">요청사항</th>
							<th scope="col">결제일</th>
							<th scope="col">주문상태</th>
							<th scope="col">상세정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="payList" items="${payList}">
							<tr class="tr-custom">
								<td>${payList.group_id}</td>
								<td><c:choose>
										<c:when test="${payList.cart_cnt == 1}">
                        ${payList.pro_name}
                    </c:when>
										<c:otherwise>
                        ${payList.pro_name}외 ${payList.cart_cnt-1}종
                    </c:otherwise>
									</c:choose></td>
								<td>${payList.cart_cnt}</td>
								<td>${payList.totalPrice}</td>
								<td>${payList.mem_name}</td>
								<td>${payList.mem_phone}</td>
								<td>${payList.mem_add1} ${payList.mem_add2}</td>
								<td>${payList.pay_req}</td>
								<td>${payList.pay_date}</td>
								<td>${payList.status}</td>
								<td>
									<div class="accordion">
										<button class="detail_btn btn btn-secondary" type="button"
											data-toggle="collapse"
											data-target="#collapse-${payList.group_id}"
											aria-expanded="false"
											aria-controls="collapse-${payList.group_id}"
											data-group_id="${payList.group_id}">
											상세보기<i class='fas fa-angle-down'></i>
										</button>
									</div>
								</td>
							</tr>
							<tr class="detail-row">
								<td class="detail-col" style="padding: 2px;" colspan="11">
									<div class="collapse" id="collapse-${payList.group_id}">
										<div class="table-responsive"
											style="width: 90%; float: right;">
											<table class="table table-hover table-striped table-bordered">
												<thead class="thead-custom">
													<tr>
														<th>상품명</th>
														<th>수량</th>
														<th>가격</th>
														<th>희망요일</th>
														<th>배송시작일</th>
														<th>주문상태</th>
														<th>배송상태</th>
													</tr>
												</thead>
												<tbody id="accordianBody-${payList.group_id}"></tbody>
											</table>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row mt-5">
                  <div class="col text-center">
                     <div class="block-27">
                        <!-- 각 번호 페이지 버튼 -->
                        <table>
                           <tr>
                              <!-- 이전페이지 버튼 -->
                              <c:if test="${pageMaker.prev}">
                                 <ul>
                                    <li class="pageInfo_btn previous">
                                       <a href="javascript:acyncMovePage('/admin/pays?pageNum= ${pageMaker.startPage-1}');">&lt;</a>
                                    </li>
                                 </ul>
                              </c:if>
                              <c:forEach var="num" begin="${pageMaker.startPage}"
                                 end="${pageMaker.endPage}">
                                 <ul style="text-align: center;">
                                    <li class="pageInfo_btn"><a href="javascript:acyncMovePage('/admin/pays?pageNum=${num}');">${num}</a></li>
                                 </ul>
                              </c:forEach>
                              <!-- 다음페이지 버튼 -->
                              <c:if test="${pageMaker.next}">
                                 <ul>
                                    <li class="pageInfo_btn next">
                                       <a href="javascript:acyncMovePage('/admin/pays?pageNum=${pageMaker.endPage + 1 }');">&gt;</a>
                                    </li>
                                 </ul>
                              </c:if>
                           </tr>
                        </table>
                     </div>
                  </div>
               </div>
			</div>
		</div>
		<div class="row mt-5">
            <div class="col text-center">
               <div class="block-27"></div>
            </div>
         </div>
	</div>
</div>

<jsp:include page="/common/admin_ft.jsp"></jsp:include>
<script>
function updateStatus(pay_code, group_id, statusTd) {
	  $.ajax({
	    url: "/admin/pays/" + pay_code + "/" + group_id + "/updateStatus",
	    method: "PUT",
	    success: function (data) {
	      alert("배송 상태가 업데이트 되었습니다.");
	      statusTd.text(data.status);
	      // 테이블 업데이트
	      $.ajax({
	        url: "/admin/pays/" + group_id,
	        method: "GET",
	        success: function (data) {
	          updateTable(data, group_id);
	        },
	        error: function () {
	          alert("데이터를 가져올 수 없습니다.");
	        },
	      });
	    },
	    error: function () {
	      alert("배송 상태 업데이트에 실패하였습니다.");
	    },
	  });
	}
	function updateTable(data, group_id) {
	  var tbody = $("#accordianBody-" + group_id);
	  tbody.empty();

	  data.forEach(function (item) {
		var date = new Date(item.cart_start);
		var cart_start = date.toISOString().substring(0, 10);  
	    var statusBtn = $("<button>")
	      .addClass("btn btn-secondary")
	      .attr("type", "button")
	      .text("배송시작")
	      .on("click", function () {
	        var statusBtn = $(this);
	        updateStatus(item.pay_code, group_id, statusBtn);
	      });
	    if (item.status === "배송중") {
	      statusBtn.prop("disabled", true);
	    }

	    tbody.append(
	      $("<tr>").append(
	        $("<td>").text(item.pro_name),
	        $("<td>").text(item.cart_cnt),
	        $("<td>").text(item.totalPrice),
	        $("<td>").text(item.cart_day),
	        $("<td>").text(cart_start),
	        $("<td>").addClass("status-td").text(item.status), // status-td 클래스 추가
	        $("<td>").append(statusBtn)
	      )
	    );
	  });
	}
	$(document).on("click", ".detail_btn", function () {
	  var open_collapse = $(".collapse.show");
	  if (open_collapse.length > 0) {
	    open_collapse.each(function () {
	      $(this).collapse("hide");
	    });
	  }

	  var group_id = $(this).data("group_id");
	  var tbody = $("#accordianBody-" + group_id);
	  var detail_btn = $('.detail_btn[data-group_id="' + group_id + '"]');

	  $.ajax({
	    url: "/admin/pays/" + group_id,
	    method: "GET",
	    success: function (data) {
	      updateTable(data, group_id);
	    },
	    error: function () {
	      alert("데이터를 가져올 수 없습니다.");
	    },
	  });
	});

	$(".collapse").on("hidden.bs.collapse", function () {
	  var group_id = $(this).attr("id").split("-")[1];
	  var detailBtn = $('.detail_btn[data-group_id="' + group_id + '"]');
	  detailBtn.html("상세보기<i class='fas fa-angle-down'></i>");
	});

	$(".collapse").on("shown.bs.collapse", function () {
	  var group_id = $(this).attr("id").split("-")[1];
	  var detailBtn = $('.detail_btn[data-group_id="' + group_id + '"]');
	  detailBtn.html("닫기<i class='fas fa-angle-up'></i>");
	});
	
	   function acyncMovePage(url) {
		      // ajax option
		      var ajaxOption = {
		         url : url,
		         async : true,
		         type : "POST",
		         dataType : "html",
		         cache : false
		      };

		      $.ajax(ajaxOption).done(function(data) {
		         // Contents 영역 삭제
		         $('#test').children().remove();
		         // Contents 영역 교체
		         $('#test').html(data);
		      });
		   };
</script>