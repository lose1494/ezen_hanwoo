<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/product/product_popup.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<div class="wrap">
    <p><img alt="" src="${ product.product_image }"> <span>${ product.product_name }</span></p>
    <form action="qnaWrite" method="post">
        <input type="hidden" name="product_idx" value="${ product.product_idx }"> 
        <input type="text" name="qna_title" placeholder="제목"> <br>
        <textarea name="qna_content" id="" cols="30" rows="10"></textarea> <br>
        <input type="checkbox" name="qna_secret" value=1><label class="checkLabel"> 비밀글 설정</label> <br>
        <input type="password" name="qna_pw" class="hide" placeholder="비밀번호">
        <div>
            <button class="dark">문의하기</button>
            <button type="button" class="bright" onclick="javascript:window.close();">취소</button>
        </div>
    </form>
</div>

<script>

    $(function() {
        $('input[type=checkbox]').click( function() {
            if( $(this).is(':checked') == true ) {
                $('input[type=password]').removeClass('hide');
                $(this).attr('value');
                console.log($(this).attr('value'));
            } else {
                $('input[type=password]').addClass('hide');
            }
        })
    })

</script>