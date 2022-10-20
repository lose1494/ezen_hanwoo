<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>
<link rel="stylesheet" href="/css/common.css"> 
<link rel="stylesheet" href="/css/customer/one2one.css"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 


    <div class="wrap">
        <h1>1:1 문의</h1>
        <form action="one2oneWrite" method="post" enctype="multipart/form-data" class="one2oneForm">
            <table class="custoTable" border="1">
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="one2one_name" value="${ member.users_name }" readonly></td>
                </tr>               
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="one2one_title"></td>
                </tr>               
                <tr>
                    <td>문의 내용</td>
                    <td><textarea name="one2one_content" id="editor"></textarea></td>
                </tr>
                <tr>
                    <td>파일첨부</td>
                    <td>
                        <input type="file" accept="image/jpeg" name="image">
                    </td>
                </tr> 
                <tr>
                    <td>답변 알림</td>
                    <td>
                        <input type="checkbox" id="emCheck"><span>이메일</span>
                        <input type="checkbox" id="poCheck"><span>휴대폰</span>
                    </td>
                </tr>
                <tr id="email">
                    <td>이메일</td>
                    <td><input type="text" name="one2one_email"></td>
                </tr>
                <tr id="phone">
                    <td>전화번호</td>
                    <td><input type="text" name="one2one_phone"></td>
                </tr>              
            </table>
            <button type="submit" class="dark">작성하기</button>
            <button class="bright" type="button" onclick="javascript:history.back();">취소</button>
        </form>
    </div>

    <script>
        ClassicEditor.create( document.querySelector( '#editor' ), {
            removePlugins: ['CKFinderUploadAdapter', 'CKFinder', 'EasyImage', 'Image', 'ImageCaption', 'ImageStyle', 'ImageToolbar', 'ImageUpload', 'MediaEmbed'],
            enterMode : 1
        })
        
        $(function() {
            $('#email, #phone').addClass('hide');
        })

        $('input[type=checkbox]').eq(0).click( function() {
            $('#email').toggleClass('hide');
        })
        $('input[type=checkbox]').eq(1).click( function() {
            $('#phone').toggleClass('hide');
        })      
    </script>