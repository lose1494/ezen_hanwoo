<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <link rel="stylesheet" href="/css/notice/notice.css">
  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>    
    
    <div class="wrap">

    <h1>공지사항</h1>

    <form action="notice_Action" method="get">
    <table  class="Notice_table" >
        <thead>
        <tr class="Notice_tr1">
            <th id="number">번호</t>
            <th id="title">제목</th>
            <th id="writer">작성자</th>
            <th id="date">작성일</th>
            <th id="hitter">조회수</th>
        </tr>
    </thead>
    <tbody>
        <tr onclick="location.href='/Notice/notice_view'" style="cursor:pointer;" >
            <td id="number">[공지]</td>
            <td id="title">배송지연안내</td>
            <td id="writer">관리자</td>
            <td id="date">2022-09-14</td>
            <td id="hitter">1</td>
        </tr>
    </tbody>
    </table>

    <div class="search">
         <select name="" id="select1">
            <option>제목</option>
            <option>내용</option>
            <option>작성자</option>
         </select>

         <input type="text" value="검색어를 입력하세요." id="box1">
        
        <div id="img"> <input type="image" src="/img/notice/search.png" id="button1"> </div>
  </div>
  
  <div class="pageNav">
                <a href="#">처음</a>
                <a href="#">이전</a>
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">다음</a>
                <a href="#">마지막</a>
            </div>

</div>