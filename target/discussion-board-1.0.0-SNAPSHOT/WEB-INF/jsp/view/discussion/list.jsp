<%--@elvariable id="discussions" type="java.util.List<com.wrox.site.entity.Discussion>"--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Discussion List</title>
       	<style><%@ include file="bootstrap.css"%></style>
        <script> <%@ include file="jquery.min.js"%>></script>
        
    </head>
    <body>
	    <div class="container-fluid">
	        <div class="navbar-header"></div>
	        <div class="navbar-collapse collapse homeback" id="menu-bar-items" background-color= "aliceblue">
	                
	                    <a href="<c:url value="/discussion/list" />" >
	                    <button type="button" class="btn btn-info" style="float: left;">Discussion Board</button>
						</a>
						
	         </div>
	    </div>
	<div class="container">
	<p align="center">
	<a href="<c:url value="/discussion/list" />" >
	                    <button type="button" class="btn btn-primary" style="float: center;">Discussions</button>
						</a>
						</p>
	<br/>	
	<a href="<c:url value="/discussion/create" />" input type="button" class="btn btn-primary" >Create Discussion</a>
	<br/><br/>
	<table class="table table-hover text-center">
	   <c:choose>
        <c:when test="${fn:length(discussions) > 0}">
	        <thead>
				<th class="text-center" width="20%">Number</th>	
				<th class="text-center" width="50%">Discussion Topic</th>
				<th class="text-center" width="30%">Created By</th>
				<th class="text-center" width="20%">Action</th>	
			</thead>
			<tbody>
                <c:forEach items="${discussions}" var="discussion">
                <tr>
                <td>
	                 <c:out value="${discussion.id}" />
	            </td>
                <td>
                    <a href="<c:url value="/discussion/${discussion.id}/${discussion.uriSafeSubject}" />">
                        <c:out value="${discussion.subject}" /></a>
                 </td>
                 <td><c:out value="${discussion.user}" /></td>
                 
                 <td>
	                 <a href="<c:url value="/discussion/delete?"/>id=<c:out value="${discussion.id}"/>" input type="submit" class="btn btn-warning"> Delete </a>
	            </td>
                 </tr>
                </c:forEach>    
            </c:when>
            <c:otherwise>
            <div class="text-primary">
			<h1> 
			<p class="text-primary">There are no discussions yet.</p>
			</h1>	
		</div>     
            </c:otherwise>
        </c:choose>
		</tbody>		
	</table>
	</div>
    </body>
    
</html>
