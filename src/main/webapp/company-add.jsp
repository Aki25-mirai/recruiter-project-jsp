<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<jsp:include page="resources/common.jsp"></jsp:include>
</head>
<body>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">SB Admin </div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <c:url value="/company" var="company"></c:url>
      <c:url value="/recruiter" var="recruiter"></c:url>
      
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

    
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" >
          <i class="fas fa-fw fa-briefcase"></i>
          <span>Job Order</span>
        </a>
      </li>

     
      <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="fas fa-fw fa-users"></i>
          <span>Candidates</span>
        </a>
      </li>
      
       <li class="nav-item">
        <a class="nav-link collapsed" href="${company }" >
          <i class="fas fa-fw fa-building"></i>
          <span>Company</span>
        </a>
      </li>
      
      
      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Addons
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="${recruiter }">
          <i class="fas fa-fw fa-building"></i>
          <span>Recruiter</span>
        </a>
      </li>

     <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="fas fa-fw fa-list-alt"></i>
          <span>Activities</span>
        </a>
      </li>


     

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

           <h1 class="h3 mb-2 text-gray-800">Add New Company</h1>
          

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">
            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${loginuser != null ? loginuser.name : '' }</span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container ">
        	<div class="row mt-3">
        		<div class="col-12">
				<c:url value="/company-add" var="save"></c:url>
				<form action="${save }" class="form col-12" method="post">
				
				<input type="hidden" name="id" value="${companies.id }" >
				<input type="hidden" name="entryby" value="${loginuser.name }" >
				
				<div class="row">
				<div class="col-6">
				<div class="form-group">
					<input type="text" value="${companies.name }" name="name" class="form-control" placeholder="Enter company name" required="required" />
				</div>
				<div class="form-group">
					<input type="text" value="${companies.phone1 }" name="phone1" class="form-control" placeholder="Enter phone 1" required="required" />
				</div>
				<div class="form-group">
					<input type="text" value="${companies.phone2 }" name="phone2" class="form-control" placeholder="Enter phone 2" required="required" />
				</div>
				<div class="form-group">
					<input type="text" value="${companies.email }" name="email" class="form-control" placeholder="Enter company email" required="required" />
				</div>
				</div>
				<div class="col-6">
				<div class="form-group">
					<input type="text" value="${companies.website }" name="website" class="form-control" placeholder="Enter company website" required="required" />
				</div>
				<div class="form-group">
					<input type="text" value="${companies.ownerName }" name="onwername" class="form-control" placeholder="Enter company owner name" required="required" />
				</div>
				<div class="form-group">
					<input type="text" value="${companies.address }" name="address" class="form-control" placeholder="Enter company address" required="required" />
				</div>
				<div class="form-group">
					<select name="townshipid" class="form-control">
					<c:forEach items="${township}" var="t">
					<option value="${t.id }" ${companies.township.id==t.id?'selected':'' }>${t.name }</option>
					</c:forEach>
					</select>
				</div>
					<%-- <label>Entry By</label>
					<select name="recruiterid" class="form-control col-6">
					<c:forEach items="${recruiters}" var="r">
					<option value="${r.id }" ${companies.recruiters.id==r.id?'selected':'' }>${r.name }</option>
					</c:forEach>
					</select>
					
					<label>Entry Date</label>
					<input type="date" value="${companies.entryDate}" name="entrydate" class="form-control" required="required" />
					
					<label>Modify By</label>
					<select name="recruiterid" class="form-control col-6">
					<c:forEach items="${recruiters}" var="r">
					<option value="${r.id }" ${companies.recruiters.id==r.id?'selected':'' }>${r.name }</option>
					</c:forEach>
					</select>
					
					<label>Modify Date</label>
					<input type="date" value="${companies.modifyDate}" name="modifydate" class="form-control" required="required" />
					  --%>
				<div class="form-group">
					<input type="text" value="${companies.remark}" name="remark" class="form-control" required="required" placeholder="Enter Remark"/>
				</div>
				
					
					<button type="submit" class="btn btn-success">Save</button>
					<button type="reset" class="btn btn-danger">Clear</button>
				</div>
				</div>
				
					
		</form>
	</div>
	</div>
	</div>
	</div>
	
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  
</body>
</html>