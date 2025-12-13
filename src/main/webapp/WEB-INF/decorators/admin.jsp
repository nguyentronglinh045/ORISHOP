<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <title>${title}</title>
            <!-- Bootstrap 5 Local -->
            <link href="<c:url value='/assets/lib/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
            <!-- Font Awesome 6 Local -->
            <link href="<c:url value='/assets/lib/fontawesome/css/all.min.css'/>" rel="stylesheet">
            <!-- DataTables CSS -->
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <!-- Google Fonts -->
            <link
                href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&family=Inter:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">
            <!-- ORISHOP Theme CSS -->
            <link href="<c:url value='/assets/css/orishop-theme.css'/>" rel="stylesheet">

            <style>
                /* Admin-specific styles */
                body {
                    display: flex;
                    flex-direction: column;
                    min-height: 100vh;
                    background: var(--light-gray);
                    overflow-x: hidden;
                }

                #layoutSidenav {
                    display: flex;
                    flex: 1;
                    overflow: hidden;
                }

                #layoutSidenav {
                    margin-top: 70px;
                }

                #layoutSidenav_nav {
                    position: fixed;
                    top: 70px;
                    left: 0;
                    bottom: 0;
                    width: 280px;
                    background: linear-gradient(180deg, #2d3436 0%, #1a1e21 100%);
                    color: var(--white);
                    box-shadow: 4px 0 20px rgba(0, 0, 0, 0.15);
                    overflow-y: auto;
                    z-index: 1020;
                    transition: transform 0.3s ease;
                }

                #layoutSidenav_content {
                    flex: 1;
                    margin-left: 280px;
                    overflow-y: auto;
                    max-height: calc(100vh - 70px);
                    background: var(--light-gray);
                }

                #layoutSidenav_content main {
                    padding: 30px;
                    min-height: calc(100vh - 150px);
                }

                /* Responsive Sidebar */
                @media (max-width: 992px) {
                    #layoutSidenav_nav {
                        transform: translateX(-100%);
                    }

                    #layoutSidenav_nav.show {
                        transform: translateX(0);
                    }

                    #layoutSidenav_content {
                        margin-left: 0;
                    }

                    #layoutSidenav_content main {
                        padding: 20px 16px;
                    }
                }

                @media (max-width: 576px) {
                    #layoutSidenav_nav {
                        width: 100%;
                        max-width: 280px;
                    }

                    #layoutSidenav_content main {
                        padding: 16px 12px;
                    }
                }

                /* Sidebar Overlay for Mobile */
                .sidebar-overlay {
                    display: none;
                    position: fixed;
                    top: 70px;
                    left: 0;
                    right: 0;
                    bottom: 0;
                    background: rgba(0, 0, 0, 0.5);
                    z-index: 1010;
                }

                @media (max-width: 992px) {
                    .sidebar-overlay.show {
                        display: block;
                    }
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
                    width: 100%;
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
                    padding: 12px 24px;
                    position: fixed;
                    top: 0;
                    left: 0;
                    right: 0;
                    z-index: 1030;
                    height: 70px;
                }

                .navbar-brand {
                    font-family: 'Quicksand', sans-serif;
                    font-weight: 700;
                    font-size: 1.3rem;
                    color: var(--white) !important;
                    letter-spacing: 1px;
                    display: flex;
                    align-items: center;
                }

                .navbar-toggler {
                    border: none;
                    background: rgba(255, 255, 255, 0.1);
                    color: var(--white);
                    padding: 8px 12px;
                    border-radius: var(--radius-sm);
                    cursor: pointer;
                }

                .navbar-toggler:hover {
                    background: rgba(255, 255, 255, 0.2);
                }

                /* Hide sidebar toggle on desktop */
                @media (min-width: 993px) {
                    #sidebarToggle {
                        display: none;
                    }
                }

                .navbar-nav {
                    display: flex;
                    flex-direction: row;
                    align-items: center;
                    gap: 8px;
                }

                .navbar-nav .nav-link {
                    color: var(--white) !important;
                    border: none;
                    padding: 8px 16px;
                    margin: 0;
                    border-radius: var(--radius-sm);
                    transition: var(--transition-fast);
                    white-space: nowrap;
                }

                .navbar-nav .nav-link:hover {
                    background: rgba(255, 255, 255, 0.15);
                    transform: none;
                }

                /* Responsive Navbar */
                @media (max-width: 768px) {
                    .navbar {
                        padding: 12px 16px;
                    }

                    .navbar-toggler {
                        display: block;
                    }

                    .navbar-brand {
                        font-size: 1.1rem;
                    }

                    .navbar-brand i {
                        font-size: 1rem;
                    }

                    .navbar-nav {
                        position: fixed;
                        top: 70px;
                        right: -100%;
                        width: 250px;
                        height: calc(100vh - 70px);
                        background: linear-gradient(180deg, #ff6b9d 0%, #e84a7f 100%);
                        flex-direction: column;
                        align-items: stretch;
                        padding: 20px;
                        gap: 12px;
                        box-shadow: -4px 0 20px rgba(0, 0, 0, 0.2);
                        transition: right 0.3s ease;
                    }

                    .navbar-nav.show {
                        right: 0;
                    }

                    .navbar-nav .nav-link {
                        padding: 12px 16px;
                        border-radius: var(--radius-md);
                    }
                }
            </style>
            ${head}
        </head>

        <body>
            <!-- Top Navbar -->
            <nav class="navbar navbar-dark">
                <div class="d-flex align-items-center gap-3">
                    <button class="navbar-toggler" id="sidebarToggle" type="button">
                        <i class="fas fa-bars"></i>
                    </button>
                    <a class="navbar-brand mb-0" href="<c:url value='/admin/home'/>">
                        <i class="fas fa-crown me-2"></i>OriShop Admin
                    </a>
                </div>
                <button class="navbar-toggler d-md-none" id="navbarToggle" type="button">
                    <i class="fas fa-ellipsis-v"></i>
                </button>
                <ul class="navbar-nav ms-auto" id="navbarNav">
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

            <!-- Sidebar Overlay -->
            <div class="sidebar-overlay" id="sidebarOverlay"></div>

            <div id="layoutSidenav">
                <!-- Sidebar -->
                <div id="layoutSidenav_nav">
                    <nav class="sb-sidenav accordion" id="sidenavAccordion">
                        <div class="sb-sidenav-menu">
                            <div class="nav">
                                <div class="sb-sidenav-menu-heading">Quản lý chính</div>
                                <a class="nav-link" href="<c:url value='/admin/home'/>">
                                    <div class="sb-nav-link-icon"><i class="fas fa-chart-line"></i></div>
                                    Dashboard
                                </a>
                                <a class="nav-link" href="<c:url value='/admin/categories'/>">
                                    <div class="sb-nav-link-icon"><i class="fas fa-layer-group"></i></div>
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

            <!-- Mobile Menu Toggle Scripts -->
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    const sidebarToggle = document.getElementById('sidebarToggle');
                    const navbarToggle = document.getElementById('navbarToggle');
                    const sidebar = document.getElementById('layoutSidenav_nav');
                    const navbarNav = document.getElementById('navbarNav');
                    const overlay = document.getElementById('sidebarOverlay');

                    // Sidebar Toggle
                    if (sidebarToggle) {
                        sidebarToggle.addEventListener('click', function () {
                            sidebar.classList.toggle('show');
                            overlay.classList.toggle('show');
                        });
                    }

                    // Navbar Mobile Toggle
                    if (navbarToggle) {
                        navbarToggle.addEventListener('click', function () {
                            navbarNav.classList.toggle('show');
                        });
                    }

                    // Close sidebar when clicking overlay
                    if (overlay) {
                        overlay.addEventListener('click', function () {
                            sidebar.classList.remove('show');
                            overlay.classList.remove('show');
                        });
                    }

                    // Close menus when window resizes to desktop
                    window.addEventListener('resize', function () {
                        if (window.innerWidth > 992) {
                            sidebar.classList.remove('show');
                            overlay.classList.remove('show');
                        }
                        if (window.innerWidth > 768) {
                            navbarNav.classList.remove('show');
                        }
                    });
                });
            </script>

            <!-- Custom Admin Scripts -->
            ${page.properties['page.script']}
        </body>

        </html>