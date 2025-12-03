<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title><sitemesh:write property="title" default="Admin OriShop"/></title>
        <!-- Bootstrap 5 & FontAwesome -->
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        
        <style>
            body { display: flex; flex-direction: column; min-height: 100vh; }
            #layoutSidenav { display: flex; flex: 1; }
            #layoutSidenav_nav { width: 250px; background: #212529; color: white; }
            #layoutSidenav_content { flex: 1; padding: 20px; background: #f8f9fa; }
            .nav-link { color: rgba(255,255,255,0.7); text-decoration: none; display: block; padding: 10px 20px; }
            .nav-link:hover { color: white; background: rgba(255,255,255,0.1); }
            .sb-sidenav-menu-heading { padding: 20px 20px 10px; font-size: 0.8em; text-transform: uppercase; color: rgba(255,255,255,0.5); }
        </style>
        <sitemesh:write property="head"/>
    </head>
    <body>
        <!-- Top Navbar -->
        <nav class="navbar navbar-dark bg-dark px-3">
            <a class="navbar-brand ps-3" href="<c:url value='/admin/home'/>">OriShop Admin</a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/logout'/>">Đăng xuất <i class="fas fa-sign-out-alt"></i></a>
                </li>
            </ul>
        </nav>

        <div id="layoutSidenav">
            <!-- Sidebar -->
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Quản lý chính</div>
                            <a class="nav-link" href="<c:url value='/admin/categories'/>">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Quản lý Danh mục
                            </a>
                            <a class="nav-link" href="<c:url value='/admin/products'/>">
                                <div class="sb-nav-link-icon"><i class="fas fa-box"></i></div>
                                Quản lý Sản phẩm
                            </a>
                            <a class="nav-link" href="<c:url value='/admin/users'/>">
                                <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                                Quản lý Người dùng
                            </a>
                             <a class="nav-link" href="<c:url value='/admin/orders'/>">
                                <div class="sb-nav-link-icon"><i class="fas fa-shopping-cart"></i></div>
                                Quản lý Đơn hàng
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            
            <!-- Main Content -->
            <div id="layoutSidenav_content">
                <main>
                    <!-- Nội dung của từng trang con sẽ được ốp vào đây -->
                    <sitemesh:write property="body"/>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; OriShop 2025</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>