<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cph"%>
<cph:set var="contextPathHdr" value="${pageContext.request.contextPath}"/>
<span id="ctxHdrPath" style="display:none;">${pageContext.request.contextPath}</span>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <!-- <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">  -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Welcome</title>
  <!-- Custom fonts for this template-->
  <link href="${contextPathHdr }/css/style.css" rel="stylesheet"/>
  <link href="${contextPathHdr }/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
<link href="${contextPathHdr }/css/sb-admin-2.min.css" rel="stylesheet">

<!-- <link href="${contextPathHdr }/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"> -->

<link rel="stylesheet" type="text/css" href="${contextPathHdr }/css/select2.min.css">
<link rel="stylesheet" type="text/css" href="${contextPathHdr }/css/dtpckr.css">

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.6.3/css/buttons.dataTables.min.css">

</head>


<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${contextPathHdr }/">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Home<sup></sup></div>
      </a>
	
      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <%-- <li class="nav-item active">
        <a class="nav-link" href="${contextPathHdr }/">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li> --%>

      <!-- Divider -->
      <hr class="sidebar-divider">
		
      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>
	 
     <jsp:include page="/WEB-INF/jsp/TransactionSideMenu.jsp" />

     
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          

          <!-- Topbar Navbar -->
          

        </nav>
        <!-- End of Topbar -->
		
        <!-- Begin Page Content -->
		<div class="container-fluid">
        
        
        
