<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/mypage/mypage.css">

	<div class="wrap">
        <h3>1:1 문의</h3>
        <div class="backgroundDiv">
            <table class="mypageTable">
                <tr>
                    <th>번호</th>
                    <th>문의상태</th>
                    <!-- <th>분류</th> -->
                    <th>제목</th>
                    <th>작성일</th>
                </tr>
                <c:forEach var="one2one" items="${ one2oneList }" varStatus="status">
                <tr>
                    <td><c:out value="${ status.count }" /></td>
                    <td>${ one2one.one2one_status }</td>
                    <!-- <td>기타</td> -->
                    <td> <a href="/customer/one2oneView?one2one_idx=${ one2one.one2one_idx}">
                        ${ one2one.one2one_title }</a></td>
                    <td><fmt:formatDate value="${ one2one.one2one_date }" pattern = "yyyy-MM-dd"/></td>
                </tr>
                </c:forEach>
            </table>
        </div>
        <div class="mypageButton">              
            <button onclick="location.href='/customer/one2one'" class="dark">글쓰기</button>
        </div>
        <div class="pageNav">
       		<a href="/mypage/mypage_one2one?page=1">처음</a>
       		<a href="/mypage/mypage_one2one?page=${ page-1 }">이전</a>
       		<c:forEach var="pageNum" begin="1" end="${ pageNum }">
       			<a href="/mypage/mypage_one2one?page=${ pageNum }">${ pageNum }</a>
       		</c:forEach>
            <a href="/mypage/mypage_one2one?page=${ page+1 }">다음</a>
            <a href="/mypage/mypage_one2one?page=${ pageNum }">마지막</a>
        </div>
    </div>
    
    <script>
        $(function() {
            $('.pageNav a').each(function() {
            	console.log($(this).text());
            	if($(this).text() == '이전' && "${page}" == 1) {
            		$(this).removeAttr('href');
            	}
            	if($(this).text() == '다음' && "${page}" == "${pageNum}") {
            		$(this).removeAttr('href');
            	}
                if($(this).text() == "${ page }" ) {
                    $(this).removeAttr('href');
                }
            })
        })
    </script>