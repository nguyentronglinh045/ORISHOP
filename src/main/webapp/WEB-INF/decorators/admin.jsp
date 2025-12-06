<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="sitemesh" uri="http://www.sitemesh.org/sitemesh-decorator" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>
                    <sitemesh:write property="title" />
                </title>
                <!-- Bootstrap 5 Local -->
                <link href="<c:url value='/assets/lib/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
                <!-- Font Awesome 6 Local -->
                <link href="<c:url value='/assets/lib/fontawesome/css/all.min.css'/>" rel="stylesheet">
                <!-- DataTables CSS -->
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <!-- Google Fonts -->
                <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
                <!-- ORISHOP Theme CSS -->
                <link href="<c:url value='/assets/css/orishop-theme.css'/>" rel="stylesheet">

                <style>
                    /* Admin-specific styles */
                    body {
                        display: flex;
                        flex-direction: column;
                        min-height: 100vh;
                        background: var(--light-gray);
                    }

                    #layoutSidenav {
                        display: flex;
                        flex: 1;
                    }

                    #layoutSidenav_nav {
                        width: 280px;
                        background: linear-gradient(180deg, #2d3436 0%, #1a1e21 100%);
                        color: var(--white);
                        box-shadow: 4px 0 20px rgba(0, 0, 0, 0.15);
                    }

                    #layoutSidenav_content {
                        flex: 1;
                        padding: 30px;
                        background: var(--light-gray);
                    }

                    .nav-link {
                        color: rgba(255, 255, 255, 0.75);
                        text-decoration: none;
                        display: flex;
                        align-items: center;
                        padding: 14px 24px;
                        transition: all var(--transition-base);
                        border-left: 4px solid transparent;
                        font-weight: 500;
                        margin: 4px 12px;
                        border-radius: var(--radius-md);
                    }

                    .nav-link:hover {
                        color: var(--white);
                        background: rgba(255, 107, 157, 0.15);
                        border-left-color: var(--primary);
                        padding-left: 28px;
                        transform: translateX(5px);
                    }

                    .nav-link.active {
                        color: var(--white);
                        background: rgba(255, 107, 157, 0.25);
                        border-left-color: var(--primary);
                        box-shadow: var(--shadow-sm);
                    }

                    .sb-nav-link-icon {
                        width: 32px;
                        text-align: center;
                        font-size: 1.2rem;
                        margin-right: 12px;
                    }

                    .sb-sidenav-menu-heading {
                        padding: 24px 24px 12px;
                        font-family: 'Quicksand', sans-serif;
                        font-size: 0.75em;
                        text-transform: uppercase;
                        color: rgba(255, 255, 255, 0.5);
                        font-weight: 700;
                        letter-spacing: 1.5px;
                    }

                    .navbar {
                        background: var(--gradient-primary) !important;
                        box-shadow: var(--shadow-md);
                        padding: 15px 20px;
                    }

                    .navbar-brand {
                        font-family: 'Quicksand', sans-serif;
                        font-weight: 700;
                        font-size: 1.3rem;
                        color: var(--white) !important;
                        letter-spacing: 1px;
                    }

                    .navbar-nav .nav-link {
                        color: var(--white) !important;
                        border: none;
                        padding: 8px 16px;
                        margin: 0;
                    }

                    .navbar-nav .nav-link:hover {
                        background: rgba(255, 255, 255, 0.15);
                        transform: none;
                    }
                </style>
                <sitemesh:write property="head" />
            </head>

            <body>
                <!-- Top Navbar -->
                <nav class="navbar navbar-dark px-4">
                    <a class="navbar-brand" href="<c:url value='/admin/home'/>">
                        <i class="fas fa-crown me-2"></i>OriShop Admin
                    </a>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/home'/>" title="Về trang chủ">
                                <i class="fas fa-home me-2"></i>Trang chủ
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/logout'/>" title="Đăng xuất">
                                <i class="fas fa-sign-out-alt me-2"></i>Đăng xuất
                            </a>
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
                            <sitemesh:write property="body" />
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

                <!-- Bootstrap Bundle JS Local (includes Popper) -->
                <script src="<c:url value='/assets/lib/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
                <!-- Simple DataTables JS -->
                <script
                    src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
                <!-- Custom Admin Scripts -->
                <sitemesh:write property="script" />
            </body>

            </html>