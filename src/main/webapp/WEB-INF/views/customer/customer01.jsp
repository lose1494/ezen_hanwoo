<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>
<link rel="stylesheet" href="/css/customer/customer01.css">  


    <div class="wrap">
        <h1>1:1 문의</h1>
        <form action="" class="one2oneForm">
            <table class="custoTable" border="1">
                <tr>
                    <td>이름</td>
                    <td><input type="text"></td>
                </tr>               
                <tr>
                    <td>제목</td>
                    <td><input type="text"></td>
                </tr>               
                <tr>
                    <td>문의 내용</td>
                    <td><textarea name="" id="editor"></textarea></td>
                </tr>
                <tr>
                    <td>파일첨부</td>
                    <td>
                        <input type="text">
                        <button>파일찾기</button>
                    </td>
                </tr> 
                <tr>
                    <td>답변 알림</td>
                    <td>
                        <input type="checkbox" name="" id=""><span>이메일</span>
                        <input type="checkbox" name="" id=""><span>휴대폰</span>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="text">
                    </td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text"></td>
                </tr>              
            </table>
            <button class="dark">작성하기</button>
            <button class="bright">취소</button>
        </form>
    </div>

    <script>
        ClassicEditor.create( document.querySelector( '#editor' ), {
            removePlugins: ['CKFinderUploadAdapter', 'CKFinder', 'EasyImage', 'Image', 'ImageCaption', 'ImageStyle', 'ImageToolbar', 'ImageUpload', 'MediaEmbed']
            })
          
      </script>