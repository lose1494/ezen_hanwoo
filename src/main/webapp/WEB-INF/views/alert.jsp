<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script>
    var msg = "<c:out value='${alert}'/>";
    var url = "<c:out value='${url}'/>";
    var windowCheck = "<c:out value='${windowCheck}'/>";
    
    console.log(document.referrer);
    if( windowCheck == 'popup' ) {
    	alert(msg);
    	opener.document.location.href= url;
    	self.close();
    } else {
    	alert(msg);
   	    location.href = url;
    }
   
</script>