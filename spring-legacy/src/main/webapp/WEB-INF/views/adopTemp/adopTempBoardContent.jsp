<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%-- include head.jsp --%>
<jsp:include page="/WEB-INF/views/include/head.jsp" />

<style>
/* *{
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 22px;
        } */
.Board-font {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 22px;
}
</style>
</head>
<body>
	<!--  include topNavbar.jsp  -->
	<jsp:include page="/WEB-INF/views/include/topNavbar.jsp" />

	<!-- middle container -->
	<div class="container mt-4">
		<div class="row">

			<!-- Left Menu -->
			<div class="col-sm-3 Board-font">

				<!-- Vertical Nav -->
				<ul class="nav flex-column nav-pills">
					<li class="nav-item"><a
						class="nav-link active btn-lg text-white text-center Board-font"
						href="#"
						style="background-color: rgb(41, 128, 185); color: black;"><h3>입양
								| 임보</h3></a></li>
				</ul>
				<!-- end of Vertical Nav -->
			</div>
			<!-- end of Left Menu -->


			<!-- Right area -->
			<div class="col-sm-9">

				<!-- Contents area -->
				<div id="comment" class="border border-primary p-3">
					<br>
					<h3 class="text-center">제목 : ${ adopTempContent.boardTitle }</h3>

					<!-- 글 상세보기 영역 -->
					<table class="table">
						<tr>
							<th scope="row" class="text-center">작성자</th>
							<td>${ adopTempContent.memberNickName }</td>
							<th scope="row" class="text-center">작성일</th>
							<td><fmt:formatDate
									value="${ adopTempContent.boardRegDate }" pattern="yyyy.MM.dd" /></td>
							<th scope="row" class="text-center"></th>
							<th scope="row" class="text-center">조회수</th>
							<td>${ adopTempContent.boardReadCount }</td>
							<td></td>
						</tr>

						<tr style="height: 300px">
							<th scope="row" class="text-center">내용</th>
							<td colspan="5"><pre>${ adopTempContent.boardContent}</pre>

							</td>
						</tr>
						<tr>
							<th scope="row" class="text-center">첨부파일</th>
							<td colspan="5">
								<ul>
									<li>첨부파일1</li>
									<li>첨부파일2</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th scope="row" class="text-center"></th>
							<td colspan="5"></td>
						</tr>
					</table>

					<br>
					<div class="text-center">
						<%-- 로그인 사용자일때 --%>
						<c:if test="${not empty sessionScope.memberId }">
							<button type="button" class="btn btn-primary btn-lg"
								onclick="check('${ adopTempContent.boardId}', '${adopTempContent.memberId }', 'Y')">
								<i class="material-icons align-middle">thumb_up_off_alt</i>
								<i class="material-icons align-middle">thumb_up_alt</i>
								<span class="align-middle">추천</span>
							</button>

							<button type="button" class="btn btn-secondary btn-lg ml-3"
								onclick="check('${ adopTempContent.boardId}', '${adopTempContent.memberId }', 'N')">
								<i class="material-icons align-middle">thumb_down_off_alt</i>
								<i class="material-icons align-middle">thumb_down_alt</i> <span
									class="align-middle">비추천</span>
							</button>
							<button type="button" class="btn btn-danger btn-lg ml-3"
								onclick="waring('${ adopTempContent.boardId}', '${adopTempContent.memberId }')">
								<i class="material-icons align-middle">dangerous</i> <span
									class="align-middle">신고</span>
							</button>
						</c:if>
					</div>
					<br> <br> <br>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-2">
						<button type="button" class="btn btn-secondary btn-sm "
							onclick="location.href = '/adopTemp/adopTempBoardList?pageNum=${ pageNum }';">
							<i class="material-icons align-middle">list</i> <span
								class="align-middle">글목록</span>
						</button>
					</div>

					<div class="col-sm-10 text-right">
						<%-- 로그인 사용자일때 --%>
						<c:if test="${not empty sessionScope.memberId }">
							<%-- 로그인 사용자 닉네임과 글작성자 닉네임이  같을때 --%>
							<c:if
								test="${ sessionScope.memberNic eq adopTempContent.memberNickName }">

								<button type="button" class="btn btn-primary text-white btn-sm"
									onclick="location.href = '/adopTemp/adopTempBoardModify?boardId=${ adopTempContent.boardId }&pageNum=${ pageNum }';">
									<i class="material-icons align-middle">edit</i> <span
										class="align-middle">글수정</span>
								</button>
								<button type="button" class="btn btn-danger btn-sm ml-3"
									onclick="remove(event);">
									<i class="material-icons align-middle">delete</i> <span
										class="align-middle">글삭제</span>
								</button>
							</c:if>
							<button type="button" class="btn btn-danger btn-sm ml-3">
								<i class="material-icons align-middle">reply</i> <span
									class="align-middle">답글쓰기</span>
							</button>
						</c:if>
					</div>
				</div>


				<!-- Comment -->
				<div id="comment" class="border border-secondary mt-2 p-3">
					<i class="material-icons">forum</i> 댓글

					<hr class="featurette-divider">

					<ul class="list-unstyled mt-4">
						<li class="media mb-2"><img
							src="/resources/images/kirby1.jpg" width="50" height="50"
							class="mr-3 rounded-circle">
							<div class="media-body">
								<div class="row">
									<div class="col-md-4">
										<h6>홍길동 (user1)</h6>
									</div>
									<div class="col-md-8">
										<div class="text-right text-secondary">
											<time class="comment-date">2021-07-23 15:07:24</time>
											| <a href="#!">삭제</a> | <a href="#!">수정</a> | <a href="#!">답글</a>
										</div>
									</div>
								</div>
								<p>All my girls vintage Chanel baby. So you can have your
									cake. Tonight, tonight, tonight, I'm walking on air. Slowly
									swallowing down my fear, yeah yeah. Growing fast into a bolt of
									lightning. So hot and heavy, 'Til dawn. That fairy tale ending
									with a knight in shining armor. Heavy is the head that wears
									the crown.</p>
							</div></li>

						<li class="media mb-2"><img
							src="/resources/images/kirby2.jpg" width="50" height="50"
							class="mr-3 rounded-circle">
							<div class="media-body">
								<div class="row">
									<div class="col-md-4">
										<h6>성춘향 (user2)</h6>
									</div>
									<div class="col-md-8">
										<div class="text-right text-secondary">
											<time class="comment-date">2021-07-23 15:07:24</time>
											| <a href="#!">삭제</a> | <a href="#!">수정</a> | <a href="#!">답글</a>
										</div>
									</div>
								</div>
								<p>Maybe a reason why all the doors are closed. Cause once
									you’re mine, once you’re mine. Be your teenage dream tonight.
									Heavy is the head that wears the crown. It's not even a
									holiday, nothing to celebrate. A perfect storm, perfect storm.</p>
							</div></li>

						<li class="media mb-2" style="margin-left: 40px;"><i
							class="material-icons">subdirectory_arrow_right</i> <img
							src="/resources/images/kirby4.jpg" width="50" height="50"
							class="mr-3 rounded-circle">
							<div class="media-body">
								<div class="row">
									<div class="col-md-4">
										<h6>이몽룡 (user3)</h6>
									</div>
									<div class="col-md-8">
										<div class="text-right text-secondary">
											<time class="comment-date">2021-07-23 15:07:24</time>
											| <a href="#!">삭제</a> | <a href="#!">수정</a> | <a href="#!">답글</a>
										</div>
									</div>
								</div>
								<p>Are you brave enough to let me see your peacock? There’s
									no going back. This is the last time you say, after the last
									line you break. At the eh-end of it all.</p>
							</div></li>

						<!-- modify comment -->
						<li class="media mb-2" style="margin-left: 40px;"><i
							class="material-icons">subdirectory_arrow_right</i>
							<div class="media-body">
								<form action="" method="post">
									<div class="row">
										<div class="col-10">
											<div class="form-group">
												<label>댓글 수정</label>
												<textarea class="form-control" rows="3"></textarea>
											</div>
										</div>
										<div class="col-2 align-self-center">
											<button type="submit" class="btn btn-info btn-sm">수정</button>
										</div>
									</div>
								</form>
							</div></li>
						<!-- end of modify comment -->

						<!-- write reply comment -->
						<li class="media mb-2" style="margin-left: 80px;"><i
							class="material-icons">subdirectory_arrow_right</i>
							<div class="media-body">
								<form action="" method="post">
									<div class="row">
										<div class="col-10">
											<div class="form-group">
												<label>답댓글 작성</label>
												<textarea class="form-control" rows="3"></textarea>
											</div>
										</div>
										<div class="col-2 align-self-center">
											<button type="submit" class="btn btn-info btn-sm">작성</button>
										</div>
									</div>
								</form>
							</div></li>
						<!-- end of write reply comment -->
					</ul>


					<hr class="featurette-divider">


					<form action="" method="post">
						<div class="row my-4">
							<div class="col-10">
								<div class="form-group">
									<label for="exampleFormControlTextarea1">새댓글 작성</label>
									<textarea class="form-control" id="exampleFormControlTextarea1"
										rows="3"></textarea>
								</div>
							</div>
							<div class="col-2 align-self-center">
								<button type="submit" class="btn btn-info btn-sm">작성</button>
							</div>
						</div>
					</form>
					<!-- end of write new comment -->
				</div>
				<!-- end of Comment -->
			</div>
			<!-- end of Contents area -->
		</div>
		<!-- end of Right area -->
	</div>

	<!-- end of middle container -->

	<!-- a link container -->
	<div class="container-fluid">
		<hr style="border: solid 2px lightgray">
		<div class="mx-5">
			<a href="#!" style="color: gray;">&ensp; 개식용 종식 &ensp;</a> | <a
				href="#!" style="color: gray;">&ensp; 케이지 프리 코리아 &ensp;</a> | <a
				href="#!" style="color: gray;">&ensp; 동물보호 관리시스템 &ensp;</a>
		</div>
		<hr style="border: solid 2px lightgray">
	</div>
	<!-- end of a link container -->
	<!-- a link container -->


	<%--  include footer.jsp --%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />



	<!-- JavaScript -->
	<script src="/resources/js/jquery-3.6.0.js"></script>
	<script src="/resources/js/bootstrap.js"></script>

	<script>
		// 글삭제 버튼을 클릭했을 때 호출되는 함수
		function remove(event) {
			// 이벤트 소스(이벤트가 발생한 오브젝트)의 기본동작을 못하게 만듬
			// 기본동작을 가진 대표적인 두 태그 : a 태그(클릭 못하게), form 태그(submit 못하게) 
			event.preventDefault();

			let isRemove = confirm('이 글을 정말 삭제하시겠습니까?');
			if (isRemove == true) {
				location.href = '/adopTemp/adopTempBoardRemove?boardId=${ adopTempContent.boardId }&pageNum=${ pageNum }';
			}
		}

		// 추천 버튼 클릭 시 호출되는 함수
		// ajax 함수 호출	
		function check(boardId, memberId, goodOrNot) {
			var RestAdopCommVO = {
				"boardId" : boardId,
				"memberId" : memberId,
				"goodOrNot" : goodOrNot,
			};
			
			$.ajax({
				url : '/api/adopCommBoardCheck.json',
				method : 'PUT',
				data : JSON.stringify(RestAdopCommVO),
				contentType : 'application/json; charset=UTF-8',
				success : function(data) {
					 			console.log(typeof data);  // object
					 			console.log(data);  // {}

				},
				error : function(request, status, error) {
					alert('code: ' + request.status + '\n message: '
							+ request.responseText + '\n error: ' + error);
				}
			});
		}

		// 신고 버튼을 클릭했을 때 호출되는 함수
		function waring(boardId, memberId) {
			var RestAdopCommVO = {
				"boardId" : boardId,
				"memberId" : memberId
			};
			$.ajax({
				url : '/api/adopTempBoardWaring.json',
				method : 'POST',
				data : JSON.stringify(RestAdopCommVO),
				contentType : 'application/json; charset=UTF-8',
				success : function(data) {
					// 			console.log(typeof data);  // object
					// 			console.log(data);  // {}
					// 			showData(data);

				},
				error : function(request, status, error) {
					alert('code: ' + request.status + '\n message: '
							+ request.responseText + '\n error: ' + error);
				}
			});
		}
	</script>


</body>
</html>