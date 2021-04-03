<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cpTr"%>
<cpTr:set var="contextPathTr" value="${pageContext.request.contextPath}"/>
  
<li class="nav-item active">			
		<a class="nav-link" href="${contextPathTr }/contact/contactList" >
		 <span>List Contact</span></a> 
		 <a class="nav-link" href="${contextPathTr }/contact/addContact" >
		 <span>Add Contact</span></a> 
		
		 
</li>



