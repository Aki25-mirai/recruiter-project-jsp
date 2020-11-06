<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Company List</title>
<jsp:include page="resources/common.jsp"></jsp:include>
</head>
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
        <div class="sidebar-brand-text mx-3"> Admin </div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
     
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
      <c:url value="/company" var="company"></c:url>
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

         
           <h1 class="h3 mb-2 text-gray-800">Company List</h1>

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
        
         <div class="container-fluid">

          <!-- Page Heading -->
         
          <c:url value="/companylist" var="add"></c:url>
				<a href="${add }" class="btn btn-success"><i class="fas fa-plus fa-sm text-white-50"></i> Add New Company</a>

          <!-- DataTales Example -->
          <div class="card shadow my-4">
           
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Id</th>
                      <th>Name</th>
                      <th>Phone1</th>
                      <th>Phone2</th>
                      <th>Email</th>
                      <th>Township</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach items="${companies }" var="c">
                		<tr>
	                		<td>${c.id }</td>
	                		<td>${c.name }</td>
	                		<td>${c.phone1 }</td>
	                		<td>${c.phone2 }</td>
	                		<td>${c.email }</td>
	                		<td>${c.township.name }</td>
	                	</tr>
	                </c:forEach>
                  </tbody>
                  </table>
                  </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
       <%--  <div class="container-fluid">

          <!-- Page Heading -->
          <c:url value="/company-add.jsp" var="add"></c:url>
				<a href="${add }" class="btn btn-success">Add New Company</a>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Company Table</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                    
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${company }" var="c">
                		<tr>
	                		<td>${c.id }</td>
	                		<td>${c.name }</td>
	                		<td>${c.phone1 }</td>
	                		<td>${c.phone2 }</td>
	                		<td>${c.email }</td>
	                		<td>${c.website }</td>
	                		<td>${c.ownername }</td>
	                		<td>${c.address }</td>
	                		<td>${c.township.name }</td>
	                		<td>${c.entryBy }</td>
	                		<td>${c.entryDate }</td>
	                		<td>${c.modifyBy }</td>
	                		<td>${c.modifyDate }</td>
	                		<td>${c.remark }</td>
	                		<td>
							<c:url var="edit" value="/company-edit">
								<c:param name="id">${c.id }</c:param>
							</c:url>
							<a href="${edit }" class="btn btn-outline-warning">Edit</a>
						
							<a href="#" class="btn btn-outline-danger">Delete</a>
						</td>
                	</tr>
                	</c:forEach>
                </tbody>
               </table>
              </div>
            </div>
          </div>
        </div>
             --%>
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
          <a class="btn btn-primary" href="/index.jsp">Logout</a>
        </div>
      </div>
    </div>
  </div>

  
</body>
</html>