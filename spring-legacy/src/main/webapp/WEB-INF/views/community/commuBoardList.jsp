<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%--  include head.jsp --%>
   	<jsp:include page="/WEB-INF/views/include/head.jsp" />

   	<style>
        /* *{
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 22px;
        } */

        .Board-font{
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
            <li class="nav-item">
              <a class="nav-link active btn-lg text-white text-center Board-font" href="#" style="background-color: rgb(189, 189, 189); border-color: rgb(189, 189, 189); color: black;"><h3>커뮤니티</h3></a>
            </li>
          </ul>
          <!-- end of Vertical Nav -->
        </div>
        <!-- end of Left Menu -->


        <!-- Right area -->
        <div class="col-sm-9">

          <!-- Contents area -->
          <div class="border border-secondary p-4 rounded">
            <div class = "row">
                <div class = "col-sm-6 ">
                    <h3 style="font-family: 'Noto Sans KR', sans-serif;">커뮤니티 <small>(글개수 : ${ pageMaker.totalCount })</small></h3>
                </div>
                <div class = "col-sm-6">
                    <!-- 새글쓰기 버튼 -->
                    <c:if test="${ not empty sessionScope.memberId }">
	                    <button type="button" class="btn btn-secondary btn-sm float-right my-3 " onclick="location.href = '/community/commuBoardWrite?pageNum=${ pageMaker.cri.pageNum }';">
	                    <i class="material-icons align-middle">create</i>
	                    <span class="align-middle Board-font">글쓰기</span>
	                    </button>
                    </c:if>
                </div>
            </div>

            <div class="clearfix"></div>

            <!-- 글목록 테이블 -->
            <table class="table table-hover" id="board">
              <thead>
                <tr>
                  <th scope="col" class="text-center">번호</th>
                  <th scope="col" class="text-center">제목</th>
                  <th scope="col" class="text-center">작성자</th>
                  <th scope="col" class="text-center">작성일</th>
                  <th scope="col" class="text-center">조회수</th>
                </tr>
              </thead>
              <tbody>
              	<c:choose>
              	<c:when test="${ pageMaker.totalCount gt 0}">              	
              			<c:forEach var="board" items="${ commuList }">
              				<tr>
              					<td class="text-center">${ board.boardNum }</td>
              					<td>
              						 <a class="align-middle" href="/community/commuBoardContent?boardId=${ board.boardId }&pageNum=${ pageMaker.cri.pageNum }">${ board.boardTitle }</a>
              					</td>
              					<td class="text-center">${ board.memberNickName }</td>
                        		<td class="text-center"><fmt:formatDate value="${ board.boardRegDate }" pattern="yyyy.MM.dd" /></td>
                        		<td class="text-center">${ board.boardReadCount }</td>
              				</tr>
              			</c:forEach>
              	</c:when>
              	<c:otherwise>
              		<tr>
              			<td colspan="5" class="text-center">게시판 글이 없습니다.</td>
              		</tr>
              	</c:otherwise>
              </c:choose>
              </tbody>
            </table>


            <!-- pagination area -->
            <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
            
				<!-- 이전 -->
                 <li class="page-item ${(pageMaker.prev) ? '': 'disabled'}">
                <a class="page-link" href="${(pageMaker.prev) ? '/community/commuBoardList?pageNum=' += (pageMaker.startPage - 1) += '&type=' += pageMaker.cri.type += '&keyword=' += pageMaker.cri.keyword : '' }#board" tabindex="-1" aria-disabled="true">Previous</a>
                </li> 
            	
            	<!-- 시작페이지 번호 ~ 끝 페이지 번호 -->
            	<c:forEach var="i" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }" step="1">
            		<li class="page-item ${ (pageMaker.cri.pageNum eq i) ? 'active': '' }">
            			<a class="page-link" href="/community/commuBoardList?pageNum=${ i }#board">${ i }</a>
            		</li>	
            	</c:forEach>
            	
            	<!-- 다음 -->
                 <li class="page-item ${(pageMaker.next) ? '': 'disabled'}">
                <a class="page-link" href="${(pageMaker.next) ? '/adopTemp/adopTempBoardList?pageNum=' += (pageMaker.endPage + 1) += '&type=' += pageMaker.cri.type += '&keyword=' += pageMaker.cri.keyword : '' }#board" tabindex="-1" aria-disabled="true">Previous</a>
                </li>
                
            </ul>
            </nav>
            <!-- end of pagination area -->

            <hr class="featurette-divider">

              
            <!-- Search area -->
            <form class="form-inline justify-content-center my-4">
          
              <div class="form-group mx-3">
                <label for="searchType">검색 조건</label>
                <select class="form-control mx-2" id="searchType" name="type">
                  <option value="" disabled selected>--</option>
                  <option value="T">제목</option>
                  <option value="C">내용</option>
                  <option value="W">작성자</option>
                </select>
              </div>

              <label for="searchKeyword">검색어</label>
              <input type="text" class="form-control mb-2 mr-sm-2 mx-2" id="searchKeyword" placeholder="검색어" name="keyword">

              <button type="submit" class="btn btn-secondary mb-2 text-white">
                <i class="material-icons align-middle">search</i>
                <span class="align-middle">검색</span>
              </button>
            </form>
            <!-- end of Search area -->
          </div>
          <!-- end of Contents area -->
        </div>
        <!-- end of Right area -->
      </div>
    </div>
    <!-- end of middle container -->

    <!-- a link container -->
    <div class="container-fluid" >
        <hr style="border: solid 2px lightgray">
        <div class="mx-5" >
            <a href="#!"  style="color: gray;">&ensp; 개식용 종식 &ensp;</a>
        | <a href="#!" style="color: gray;">&ensp; 케이지 프리 코리아 &ensp;</a>
        | <a href="#!" style="color: gray;">&ensp; 동물보호 관리시스템 &ensp;</a>
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

</body>
</html>