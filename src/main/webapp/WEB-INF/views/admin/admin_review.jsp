<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/admin/admin_review.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
   <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
   <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
   <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    
   
<div class= "bg_admin text-center">
<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>관리자페이지>리뷰 관리</p>
	</div>
</div> 

<div class="main_div">

	<div class="admin_list">
	<p>관리자 페이지 </p>
		<ul> 
			<li><a href="/admin/admin_main">회원목록 조회</a></li>
			<li><a href="/admin/admin_item">상품 관리</a></li>
			<li><a href="/admin/admin_order">주문 관리</a></li>
			<li><a href="/admin/admin_review">리뷰 관리</a></li>
			<li><a href="/admin/admin_inquiry">상품문의 관리</a></li>
			<li><a href="/admin/admin_notice">공지사항 관리</a></li>
			<li><a href="/admin/admin_faq">자주하는 질문</a></li>		
			<li><a href="/admin/admin_one2one">1:1문의 관리</a></li>
		</ul>
	</div>
	
	<div class="admin_div">
	<form name="searchForm">
	<div class="select_list">
		<select id="searchType" name="searchType">
		<option value="review_idx">주문번호</option>
		<option value="product_idx">상품코드</option>
		<option value="review_id">ID</option>
		<option value="product_name">상품명</option>
		</select>
		<input type="text" id="searchKeyword" name="searchKeyword" style="width:600px; height: 40px;">
	 <input type="submit" value="조회" id="review_btn1">
	 </div>	
    
	     <!-- search -->
	<table class="searchBox">
      <colgroup>
         <col width="123px">
         <col width="*">
      </colgroup>
        <tbody>
         <tr>
             <th>조회기간</th>
             <td>
                 <ul class="searchDate">
                     <li>
                         <span class="chkbox2">
                             <input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
                             <label for="dateType1">당일</label>
                         </span>
                     </li>
                     <li>
                         <span class="chkbox2">
                             <input type="radio" name="dateType" id="dateType2" onclick="setSearchDate('1m')"/>
                             <label for="dateType2">1개월</label>
                         </span>
                     </li>
                     <li>
                         <span class="chkbox2">
                             <input type="radio" name="dateType" id="dateType3" onclick="setSearchDate('3m')"/>
                             <label for="dateType3">3개월</label>
                         </span>
                     </li>
                     <li>
                         <span class="chkbox2">
                             <input type="radio" name="dateType" id="dateType4" onclick="setSearchDate('6m')"/>
                             <label for="dateType4">6개월</label>
                         </span>
                     </li>
                 </ul>
                   </td>
                   <td>
                   <!-- calendar -->
                    <div class="clearfix"> 
                        <span class="dset">
                            <input type="text" class="datepicker inpType" name="fromDate" id="fromDate" >
                          <a href="#none" class="btncalendar dateclick"><img alt="" src="/img/admin/calendar.png" style="width:20px; height:20px;"></a>
                        </span>
                        <span class="demi">~</span>
                        <span class="dset">
                            <input type="text" class="datepicker inpType" name="toDate" id="toDate" >
                            <a href="#none" class="btncalendar dateclick"><img alt="" src="/img/admin/calendar.png" style="width:20px; height:20px;"></a>
                        </span>
                        
                       
                        
                    </div>    
	                 </td>
	             </tr>
	         </tbody>
	     </table>
	  </form>
	 	
	 <form name="review_search">
	 <div class="bar">
	 <p id="order_bar">주문 ${ review_count } 건</p>
	 <select id="select_bar">
	 	<option>최신순</option>
	 	<option>오래된순</option>
	 </select>
	 </div>	 
	 <table class="member_table">	 	 
	 <tr>
	 	<th>작성일</th>
	 	<th>주문번호</th>
	 	<th>ID</th>
	 	<th>상품명</th>
	 	<th>상품코드</th>
	 	<th>상품평</th>
	 	<th>내용</th>
	 	<th>평점</th>
	 </tr>
	<c:forEach var="dto" items="${ review_result }" varStatus="status">
	 <tr>
 
	 	<td> <fmt:formatDate value="${dto.review_date}" pattern="yyyy/MM/dd" /> </td>
	 	<td>${ dto.review_idx }</td>
	 	<td>${ dto.review_id }</td>
	 	<td>${ dto.product_name}</td>
		<td>${ dto.product_idx }</td>
		<td>${ dto.review_title }</td>
		<td>${dto.review_content }</td>
		<td>${dto.review_star_rating }</td>
	
	 </tr>
	 </c:forEach>
	 </table>
	 </form>
	 </div>
	 
</div>	

<script>                
         $(document).ready(function() {
            $.datepicker.setDefaults($.datepicker.regional['ko']); //한국어설정     
            $(".datepicker").datepicker({ 					 	   //Calendar DatePicker
                showButtonPanel: true,                             //오늘/닫기 버튼 true
                dateFormat: "yy-mm-dd",                            //날짜형태
                onClose : function ( selectedDate ) {
                
                    var eleId = $(this).attr("id");                //eleId = id 속성값 불러온다.
                    var optionName = "";                           //option = null 선언

                    if(eleId.indexOf("StartDate") > 0) {           //StartDate의 인덱스값이 0보다 크면
                        eleId = eleId.replace("StartDate", "EndDate"); //EndDate로 대체
                        optionName = "minDate";                        //optionName = minDate 선언;
                    } else {
                        eleId = eleId.replace("EndDate", "StartDate");
                        optionName = "maxDate"; 
                    }

                    $("#"+eleId).datepicker( "option", optionName, selectedDate );        
                    $(".searchDate").find(".chkbox2").removeClass("on");  //searchDate클래스의 chkbox2 클래스
                }
            }); 

            $(".dateclick").dateclick();    //달력 클릭 시 작동된다.
            $(".searchDate").schDate();     // searchDate
            
        });

        // Search Date
        jQuery.fn.schDate = function(){
            var $obj = $(this);
            var $chk = $obj.find("input[type=radio]");
            $chk.click(function(){                
                $('input:not(:checked)').parent(".chkbox2").removeClass("on");
                $('input:checked').parent(".chkbox2").addClass("on");                    
            });
        };

        // DateClick
        jQuery.fn.dateclick = function(){
            var $obj = $(this);
            $obj.click(function(){
                $(this).parent().find("input").focus();
            });
        }    

        
        function setSearchDate(start){

            var num = start.substring(0,1);
            var str = start.substring(1,2);

            var today = new Date();
            //var year = today.getFullYear();
            //var month = today.getMonth() + 1;
            //var day = today.getDate();
            
            var endDate = $.datepicker.formatDate('yy-mm-dd', today);
            $('#toDate').val(endDate);
            
            if(str == 'd'){
                today.setDate(today.getDate() - num);
            }else if (str == 'w'){
                today.setDate(today.getDate() - (num*7));
            }else if (str == 'm'){
                today.setMonth(today.getMonth() - num);
                today.setDate(today.getDate() + 1);
            }

            var startDate = $.datepicker.formatDate('yy-mm-dd', today);
            $('#fromDate').val(startDate);
            // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
            $("#toDate").datepicker( "option", "minDate", startDate );
            // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
            $("#fromDate").datepicker( "option", "maxDate", endDate );
        } 
/* 
    	function serarchBtn(){
    		$.ajax({
    				async : true,
    				type: 'POST',
    				url: "/admin/reviewSearch",
    				data : $( "form[name=searchForm]").serialize(),
    				success: function(result){
    					$('#member_table').empty();
    					if(result.length>=1){
    						result.forEach(function(data){
    							str='<tr>'
 								str+= "<td>"+data.review_idx+"</td>";
 								str+="<td>"+data.review_id+"</td>";
 								str+="<td>"+data.review_title+"</td>";
 								str+="<td>"+data.product_idx+"</td>";
 								str+="<td>"+data.product_name+"</td>";
 								str+="<td>"+data.review_content+"</td>";
 								str+="<td>"+data.review_star_rating+"</td>";
 								str+="</tr>"
 								$('#member_table').append(str);
    						})				 
    					}
    				}
    			})
    		}
         */
        </script>