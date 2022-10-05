<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/common.css"> 
<link rel="stylesheet" href="/css/customer/one2one.css"> 

    <div class="wrap">
        <table class="custoTable viewTable" border="1">
            <tr>
                <td>제목</td>
                <td>${ dto.one2one_title }</td>
            </tr>
            <tr>
                <td colspan="2">문의 내용</td>
            </tr>
            <tr>
                <td colspan="2">${ dto.one2one_content }</td>
            </tr>
        </table>
    </div>