<!DOCTYPE html>
<html>
    <head>
        <title>Create Discussion</title>
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
			<p class="text-primary">Create new discussion</p>
			</h1>	
		</div>        
        <form:form method="post" modelAttribute="discussionForm" onsubmit="return validateForm1();" id="form1">
          <form:label path="user">Email</form:label>
          <form:input path="user" type="email"  id="email" class="form-control" placeholder="abc@example.com" />
          <form:label path="subject">Subject</form:label>
     	  <form:input path="subject" id="subject" class="form-control" placeholder="Add Subject here" />
    	  <form:label path="message">Message</form:label>
    	  <form:textarea path="message" class="form-control"  id="message" cols="40" rows="5" placeholder="Add message here"></form:textarea>
    	  <br/>
    	  <input type="submit" class="btn btn-primary" />
          <a href="<c:url value="/discussion/list" />" input type="button" class="btn btn-primary">Return to List</a>
        </form:form>
       </div>
    </body>
<script>
function validateForm1() {
    var email = document.forms["form1"]["email"].value;
    var subject = document.forms["form1"]["subject"].value;
    var message = document.forms["form1"]["message"].value;
    if (email == "" || subject == "" || message == "") {
    	alert("Please fill all fields");
        return false;
    }
}
</script>
</html>
