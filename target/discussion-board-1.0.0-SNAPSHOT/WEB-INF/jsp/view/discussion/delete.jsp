<!DOCTYPE html>
<html>
    <head>
        <title>Deletion</title>
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
	<font class="text-primary"  size="8">Message: Discussion Deleted!</font>

			<p class="text-primary">The discussion was deleted Successfully</p>	
		</div> 
        <a href="<c:url value="/discussion/list" />" input type="button" class="btn btn-primary"> Return to List </a>
     </div>
    </body>
</html>
