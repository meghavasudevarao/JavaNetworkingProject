<%--@elvariable id="discussion" type="com.wrox.site.entity.Discussion"--%>
<%--@elvariable id="replies" type="java.util.List<com.wrox.site.entity.Reply>"--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Discussion: <c:out value="${discussion.subject}" /></title>
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
	
	<div class="text-primary">
			<h1> 
			<p class="text-primary">Discussion: <c:out value="${discussion.subject}"/> </p>
			</h1>	
		</div>  
	<table class="table table-hover text-center">
		<thead>
			<th class="text-center">Topic</th>
			<th class="text-center">Message</th>
			<th class="text-center">Created By</th>
			<th class="text-center">Created On</th>
		</thead>
		<tbody>
		<tr>
			<td><c:out value="${discussion.subject}"/></td>
			<td><c:out value="${discussion.message}" /></td>
			<td><c:out value="${discussion.user}" /></td>
			<td><c:out value="${discussion.created}" /></td>
		</tr>
		</tbody>
	</table>
	<c:choose>
            <c:when test="${fn:length(replies) > 0}">
            <div class="text-primary">
			<h1> 
			<p class="text-primary">Replies: </p>
			</h1>	
		</div>
                <table class="table  table-hover text-center">
				<thead>
					<th class="text-center">No.</th>
					<th class="text-center">Message</th>
					<th class="text-center">Reply From</th>
					<th class="text-center">Replied On</th>
				</thead>
				<tbody>
                <c:forEach items="${replies}" var="reply" varStatus="i">
                	<tr>
                	<td>${i.count}</td>
					<td><c:out value="${reply.message}" /></td>
					<td><c:out value="${reply.user}"/></td>
					<td><c:out value="${reply.created}" /></td>
					</tr>
				</c:forEach>
                </tbody>
                </table>
            </c:when>
            <c:otherwise>
            <div class="text-primary">
			<h1> 
			<p class="text-primary">There are no replies for this discussion</p>
			</h1>	
		</div>  
            </c:otherwise>
        </c:choose>
        <div class="text-primary">
			<h1> 
			<p class="text-primary">Post a Reply</p>
			</h1>	
		</div>  
        <c:set var="action"><c:url value="/discussion/${discussion.id}/reply" /></c:set>
        <form:form method="post" action="${action}" modelAttribute="replyForm" onsubmit="return validateForm2();" id="form2">
            <form:label path="user">Your Email</form:label>
            <form:input path="user" class="form-control" type="email" id="email2" placeholder="abc@example.com" />
            <form:label path="message">Message</form:label>
            <form:textarea path="message" class="form-control" cols="40" rows="5" id="message2" placeholder="Add reply message here" />
            <br />
            <input type="submit" class="btn btn-primary" value="Submit" />
            <a href="<c:url value="/discussion/list" />" input type="button" class="btn btn-primary"> Return to List </a>
            <br/><br/>
        </form:form>
        </div>
    </body>
   <script>
function validateForm2() {
    var email = document.forms["form2"]["email2"].value;
    var message = document.forms["form2"]["message2"].value;
    if (email == "" || message == "") {
        alert("Please fill all feilds");
        return false;
    }
}
</script>
</html>
