<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="/css/admin/admin_noticeEdit.css">
    <script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
    
    <div class= "bg_admin text-center">
<div>
	<p id="title">관리자 페이지</p>
	<img src="/img/admin/background.png" style="width: 100%; height: 100%;">
	<p id="title1">>관리자페이지>공지사항>공지사항수정</p>
	</div>
</div> 

<div class="admin_div">
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
	
	<div class="editor_whole main_div">
	
  <div class="write_container">

   	 <input type="hidden" value="${ dto.notice_idx }" name="notice_idx" id="notice_idx"/> 
     <input type="text" value="${ dto.notice_title }" id="notice_title" name="notice_title"> 

    <div id="editor">${ dto.notice_content }</div>
    <div style="margin-top: 10px;">
      <input id="uploadImage" type="file"  accept="image/jped,image/gif,image/png" />
      <c:choose>
      			<c:when test="${ dto.notice_img eq ''}"></c:when>
      			<c:otherwise><img id="notice_img" src="${ dto.notice_img}" name="notice_img"/></c:otherwise>
      </c:choose>
      
    </div>
    <div class="btn_wrap">
      <button id="confirm_btn">글쓰기</button>
    </div>

  </div>


</div>

</div>

<script>
/* console.log('${dto}'); */

CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
    toolbar: {
      items: [
        //'exportPDF', 'exportWord', '|',
        'findAndReplace', 'selectAll', '|',
        'heading', '|',
        'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
        'bulletedList', 'numberedList', 'todoList', '|',
        'outdent', 'indent', '|',
        'undo', 'redo', '|',
        'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
        'alignment', '|',
        'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
        'specialCharacters', 'horizontalLine', 'pageBreak', '|',
        'textPartLanguage', '|',
        'sourceEditing'
      ],
      shouldNotGroupWhenFull: true
    },
    list: {
      properties: {
        styles: true,
        startIndex: true,
        reversed: true
      }
    },
    heading: {
      options: [
        { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
        { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
        { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
        { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
        { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
        { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
        { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
      ]
    },
    fontFamily: {
      options: [
        'default',
        'Arial, Helvetica, sans-serif',
        'Courier New, Courier, monospace',
        'Georgia, serif',
        'Lucida Sans Unicode, Lucida Grande, sans-serif',
        'Tahoma, Geneva, sans-serif',
        'Times New Roman, Times, serif',
        'Trebuchet MS, Helvetica, sans-serif',
        'Verdana, Geneva, sans-serif'
      ],
      supportAllValues: true
    },
    fontSize: {
      options: [10, 12, 14, 'default', 18, 20, 22],
      supportAllValues: true
    },
    htmlSupport: {
      allow: [
        {
          name: /.*/,
          attributes: true,
          classes: true,
          styles: true
        }
      ]
    },
    htmlEmbed: {
      showPreviews: true
    },
    link: {
      decorators: {
        addTargetToExternalLinks: true,
        defaultProtocol: 'https://',
        toggleDownloadable: {
          mode: 'manual',
          label: 'Downloadable',
          attributes: {
            download: 'file'
          }
        }
      }
    },
    mention: {
      feeds: [
        {
          marker: '@',
          feed: [
            '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
            '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
            '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
            '@sugar', '@sweet', '@topping', '@wafer'
          ],
          minimumCharacters: 1
        }
      ]
    },
    removePlugins: [
      'ExportPdf',
      'ExportWord',
      'CKBox',
      'CKFinder',
      'EasyImage',
      'RealTimeCollaborativeComments',
      'RealTimeCollaborativeTrackChanges',
      'RealTimeCollaborativeRevisionHistory',
      'PresenceList',
      'Comments',
      'TrackChanges',
      'TrackChangesData',
      'RevisionHistory',
      'Pagination',
      'WProofreader',
      'MathType'
    ]
  });
  
var imgData;
$('#uploadImage').on('change', function(e) {
	var fileData = e.currentTarget.files[0];
	var previewTargetId = "notice_img";
	var previewTarget = document.getElementById(previewTargetId);
	PreviewImage(fileData, previewTarget, previewTargetId);
});

function PreviewImage(fileData, preview, previewTargetId) {
    var oFReader = new FileReader();
    oFReader.readAsDataURL(fileData);
    oFReader.onload = function (oFReader) {
        document.getElementById("notice_img").src = oFReader.target.result;
        imgData = oFReader.target.result;
    	}
    };

$("#confirm_btn").click(function() {
	var noticeIdx=$("#notice_idx").val();
  	var noticeTitle = $("#notice_title").val();
    var noticeContent = $(".ck .ck-editor__main").find('p')[0].innerText;

  
  var data = {
    "notice_title": noticeTitle,
    "notice_content": noticeContent,
    "notice_img" : imgData,
    "notice_idx" : noticeIdx
  };
 console.log(data);
    $.ajax({
    async : true,
    type : 'POST',
    data : JSON.stringify(data),
    url : "/admin/noticeEdit",
    contentType : "application/json; charset-UTF-8",
    success : function(data) {
      console.log("success", data);
      alert("수정되었습니다."); 	
      location.href='/admin/admin_notice';
    },
    error : function(error) {
      console.log("error", error);
      alert("다시 시도해주세요.");
    },
  });
  
 });  
</script>