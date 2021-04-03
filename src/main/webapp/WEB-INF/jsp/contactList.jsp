
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.util.*,java.lang.*"%>
<head>
<link href="${pageContext.request.contextPath}/resources/datatablecss/all.min.css"	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="${pageContext.request.contextPath}/resources/datatablecss/dataTables.bootstrap4.min.css" rel="stylesheet">


</head>

<style>
.loading {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	background: grey;
	opacity: 0.9;
	z-index: 99;
}

.loading:after {
	font-family: 'Lobster', cursive;
	font-size: 20px;
	letter-spacing: 1px;
	color: white;
	content: 'Loading...';
	width: 50px;
	height: 50px;
	position: absolute;
	top: 270px;
	right: 0;
	left: 0;
	bottom: 0;
	margin: auto;
}

.loading:before {
	font-family: 'Lobster', cursive;
	font-size: 20px;
	letter-spacing: 1px;
	color: white;
	top: 20%;
	content: url(/images/loading/loading26.gif);
	position: absolute;
	text-align: center;
	right: 0;
	left: 0;
	margin: auto;
}
</style>
<head>

<c:set var="scheme_code" value="${scheme_code}"></c:set>
<c:set var="billtype_code" value="${billtype_code}"></c:set>

<div class="loading" style="display: none;"></div>


<!-- Topbar
				<!-- End of Topbar -->

<!-- Begin Page Content -->
<form action="saveGpfLegacyForm" method="POST">
	<div class="container-fluid">

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Contact List</h6>
					
			
			<div>
		<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Sr No</th>
								<th>Contact Id</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Email</th>
								<th>Contact Number</th>
								<th>Status</th>
								<th>Update/Delete</th>
							</tr>
						</thead>

						<tbody>

							<c:set var="vo_rowNum" value="0"></c:set>
							<c:set var="hdnCounter" value="0" />

  					<c:forEach var="contact" items="${legacyDataList}" varStatus="status">
                <tr>
                    	<c:set var="vo_rowNum" value="${vo_rowNum+1}"></c:set>
                    <td>${vo_rowNum}</td>
                    <td>${contact.contactId}</td>
                    <td>${contact.fname}</td>
                    <td>${contact.lname}</td>
                    <td>${contact.email}</td>
                    <td>${contact.contact}</td>
                    <td>${contact.status}</td>
                    <td><a href="#" onclick="editFun(${contact.contactId});">Edit </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" onclick="deleteFun(${contact.contactId});">Delete</a>
                    </td>
                             
                </tr>
                </c:forEach> 
						</tbody>
					</table>

				</div>
			</div>
		</div>

		<!-- <div class="card shadow mb-4">

			<div class="card-body">
				<div class="text-center">

					<button type="button" onclick="back();"
						class="btn btn-primary btn-sm float-left">Back</button>
					<button type="button" id="saveAndForward"
						class="btn btn-primary btn-sm float-center">Generate Consolidate Bill</button>
				</div>
			</div>
		</div> -->

	</div>
	<input type="hidden" name="hdnCounter" value="${hdnCounter}"
		id="hdnCounter" /> <input type="hidden" name="gpfdata" id="gpfdata" />

</form>
<!-- /.container-fluid -->

</div>
<%@include file="footer.jsp"%>

<script type="text/javascript">

	
	
	function editFun(contactId){
//	alert(contactId);
		
		window.location.href = "editContact?id="+contactId;

	}

	function deleteFun(contactId){
//		alert(contactId);
			
			window.location.href = "deleteContact?id="+contactId;

		}

	

  
  </script>
</body>

</html>