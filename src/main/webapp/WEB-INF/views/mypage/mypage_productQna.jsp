<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./mypage/mypage_menu.jsp" />

<link rel="stylesheet" href="/css/mypage/mypage.css">

    <div class="wrap">
        <h3>상품 문의 내역</h3>
        <div class="backgroundDiv">
            <table class="mypageTable">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <!-- <th>분류</th> -->
                    <th>상품명</th>
                    <th>답변</th>
                    <th>작성일</th>
                    <th></th>
                </tr>
                <c:forEach var="qna" items="${ qnaList }" varStatus="status">
                <form action="deleteQna" method="post">
                    <tr>
                    	<input type="hidden" name="qna_idx" value="${ qna.qna_idx }" >
                        <td>${ qnaCount - status.index - (( page-1 ) * 5 ) }</td>
                        <td class="qnaClick">${ qna.qna_title }</td>
                        <!-- <td>기타</td> -->
                        <td></td>                       
                        <td>${ qna.qna_status }</td>
                        <td><fmt:formatDate value="${ qna.qna_date }" pattern = "yyyy-MM-dd"/></td>
                        <td>
                            <button class="dark">삭제</button>
                        </td>
                    </tr>
                    <tr>
	                    <td colspan="5" class="hide">
	                        <div class="productQ">                                      
	                            <i class="fa-solid fa-circle-question"></i>
	                            ${ qna.qna_content }
	                        </div>  
	                        <div class="productA">                                      
	                            <i class="fa-solid fa-circle-info"></i>
	                            안녕하세요 이젠한우입니다. <br>
	                            문의 주신 상품의 배송은 9월 22일로 예정되어 있습니다. <br>
	                            이용해주셔서 감사합니다!
	                        </div>                       
	                    </td>
	                </tr>
                </form>
                </c:forEach>
            </table>
        </div>
       
        <div class="pageNav">
       		<a href="/mypage/mypage_productQna?page=1">처음</a>
       		<a href="/mypage/mypage_productQna?page=${ page-1 }">이전</a>
       		<c:forEach var="pageNum" begin="1" end="${ pageNum }">
       			<a href="/mypage/mypage_productQna?page=${ pageNum }">${ pageNum }</a>
       		</c:forEach>
            <a href="/mypage/mypage_productQna?page=${ page+1 }">다음</a>
            <a href="/mypage/mypage_productQna?page=${ pageNum }">마지막</a>
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
        });

        // 문의 본문 열고닫기
        $('.qnaClick').each( function(index, item) {
            $(this).click( function() {
                if($('.productQ').eq(index).parents('td').hasClass('hide') === true) {
                    $('.productQ').parents('td').addClass('hide');
                    $('.productQ').eq(index).parents('td').removeClass('hide'); 
                }else {
                    $('.productQ').eq(index).parents('td').addClass('hide'); 
                }
                
            })
        });
    </script>