<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script language="JavaScript" src="${contextPath }/js/common.js" type="text/javascript"></script>
<script language="JavaScript" src="${contextPath }/js/prototype.js" type="text/javascript"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.js" type="text/javascript"></script><!-- 
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js.map" type="text/javascript"></script> -->

<spring:url value="#" var="generateURL" />

<form:form >
	
	<h2 >
	Contact App Form
	</h2>
	
	<div class="card">	
		<jsp:include page="../jsp/SaveResult.jsp" />
			<div class="row">
				<div class="col-md-10"><div class="description" style="margin-left: 10px;padding-top:7px;">Fields marked with <span class="requiredField">*</span> are mandatory.</div>
				<br>
				</div>
			</div>
			
		 	<div class="col-lg-12 mb-12">
			<div class="row">
		  		
		  			<div class="col-lg-3 mb-3">
					<div class="form-group required">
						<label>First Name <span class="requiredField">*</span></label>
						<input type="text" id="fName" name="fName"  class="form-control" path="fname" value="${contact.fname}">
							<input type="hidden" id="id" name="id"  class="form-control"  value="${contact.contactId}">
						</div>
					</div>
				
					<div class="col-lg-3 mb-3">
					<div class="form-group required">
						<label>Last Name <span class="requiredField">*</span></label>
						<input type="text" id="lName" name="lName"  class="form-control" path="lname" value="${contact.lname}">
						</div>
					</div>
					
					<div class="col-lg-3 mb-3">
					<div class="form-group required">
						<label>Email Id <span class="requiredField">*</span></label>
						<input type="text" id="email" name="email" class="form-control" onblur="ValidateEmail();" value="${contact.email}">
						</div>
					</div>
					
					
						<div class="col-lg-3 mb-3">
					<div class="form-group required">
						<label>Mobile No <span class="requiredField">*</span></label>
						<input type="text" id="mobile" name="mobile" class="form-control" onblur="ValidateContact();" value="${contact.contact}">
						</div>
					</div>
					
					
					<div class="col-lg-3 mb-3">
							<label>Status </label>
							 <select id="status" name="status"   class="form-control">
								<option value="${contact.status}" label="--SELECT--">${contact.status}</option>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
							</select>
					</div>
			
					
					
			</div>
			</div>
			<div class="col-lg-12 mb-12">
			<div class="row">
				<div class="col-lg-3 mb-3">
					
				<button type="button"  class="btn btn-primary searchbtn" value="Generate" id="btnGenerate" onclick="demo();" >Save Contact</button>&nbsp;
				
				</div>
			</div>
			</div>
			
		
	</div>					

</form:form>

<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
<script type="text/javascript">



	function demo(){
		var contactId = document.getElementById("id").value;
		var fname = document.getElementById("fName").value;
		var lname = document.getElementById("lName").value;
		var email = document.getElementById("email").value;
		var contact = document.getElementById("mobile").value;
		var status = document.getElementById("status").value;
		
		var developerData = {};
		developerData["contactId"] = contactId;
		developerData["fname"] = fname;
		developerData["lname"] = lname
		developerData["email"] = email;
		developerData["contact"] = contact;
		developerData["status"] = status;
		
		
		 if(fname==''){
			 alert("enter first name");
			 return false;
		 }

		 if(lname==''){
			 alert("enter last name");
			 return false;
		 }

		 if(email==''){
			 alert("enter email ");
			 return false;
		 }
		 if(contact==''){
			 alert("enter mobile number");
			 return false;
		 }

		
		  $.ajax({
			    url: "/contact/saveContact",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(developerData),
				dataType : 'json',				
			    success: function (resp) {
			    	var obj = JSON.parse(JSON.stringify(resp));
			    	var res=obj.fname;
			    	if(res=="PASS"){
			    		alert("Record Save successully");	
			    		window.location.href = "contactList";
			    	}else{
			    		alert("Record Not Saved");
			    	}
			       },
			    error: function(e) {
			    	alert(e);
			    }  
			});
			
	}
	
	function ValidateEmail() 
	{
		var email = document.getElementById("email").value;
	 if (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(email))
	  {
	    return (true)
	  }
	    alert("You have entered an invalid email address!")
	    return (false)
	}
	
	
	function ValidateContact()
    {
		var y = document.getElementById("mobile").value;
	       if(isNaN(y)||y.indexOf(" ")!=-1)
       {
          alert("Enter numeric value")
          document.getElementById("mobile").value="";
          return false; 
       }
       if (y.length>10)
       {
            alert("enter 10 characters");
            document.getElementById("mobile").value="";
            return false;
       }
       
    }
	
</script>