<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property="title" default="OriShop - Mỹ phẩm chính hãng"/></title>
    
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- Google Fonts: Inter (Hiện đại, dễ đọc) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            /* BẢNG MÀU ORISHOP */
            --primary-color: #dc3545;       /* Đỏ thương hiệu */
            --primary-hover: #bb2d3b;       /* Đỏ đậm khi hover */
            --text-main: #333333;           /* Chữ chính */
            --text-light: #6c757d;          /* Chữ phụ */
            --bg-light: #f8f9fa;            /* Nền sáng */
            --border-color: #e9ecef;        /* Màu viền */
        }
        
        body { 
            font-family: 'Inter', sans-serif; 
            color: var(--text-main); 
            background-color: #fff;
            font-size: 15px;
            line-height: 1.6;
        }
        
        a { text-decoration: none; transition: all 0.3s ease; }

        /* --- 1. TOP BAR (Thông báo) --- */
        .top-bar {
            background-color: var(--text-main);
            color: #fff;
            padding: 8px 0;
            font-size: 13px;
        }
        .top-bar a { color: #fff; margin-left: 15px; opacity: 0.8; }
        .top-bar a:hover { opacity: 1; }

        /* --- 2. MAIN HEADER (Sticky) --- */
        .main-header {
            background: #fff;
            box-shadow: 0 2px 15px rgba(0,0,0,0.05);
            position: sticky;
            top: 0;
            z-index: 1020;
            padding: 15px 0;
        }

        /* Logo */
        .brand-logo {
            font-size: 24px;
            font-weight: 800;
            color: var(--primary-color);
            text-transform: uppercase;
            letter-spacing: 1px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .brand-logo:hover { color: var(--primary-hover); }

        /* Search Bar */
        .search-container {
            position: relative;
            max-width: 500px;
            width: 100%;
        }
        .search-input {
            width: 100%;
            padding: 10px 45px 10px 20px;
            border: 2px solid var(--border-color);
            border-radius: 50px;
            background-color: var(--bg-light);
            transition: all 0.3s;
        }
        .search-input:focus {
            outline: none;
            border-color: var(--primary-color);
            background-color: #fff;
            box-shadow: 0 0 0 4px rgba(220, 53, 69, 0.1);
        }
        .search-btn {
            position: absolute;
            right: 5px;
            top: 50%;
            transform: translateY(-50%);
            border: none;
            background: var(--primary-color);
            color: white;
            width: 34px;
            height: 34px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: 0.3s;
        }
        .search-btn:hover { background-color: var(--primary-hover); }

        /* Header Icons (User, Cart) */
        .header-actions {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .action-btn {
            position: relative;
            color: var(--text-main);
            font-size: 20px;
            padding: 5px;
        }
        .action-btn:hover { color: var(--primary-color); }
        
        .cart-badge {
            position: absolute;
            top: -5px;
            right: -8px;
            background-color: var(--primary-color);
            color: white;
            font-size: 10px;
            font-weight: 700;
            min-width: 18px;
            height: 18px;
            border-radius: 9px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid #fff;
        }

        /* --- 3. NAVIGATION MENU --- */
        .navbar-custom {
            padding: 0;
            margin-top: 15px;
            border-top: 1px solid var(--border-color);
        }
        .nav-link {
            font-weight: 600;
            text-transform: uppercase;
            color: var(--text-main) !important;
            padding: 15px 20px !important;
            font-size: 14px;
            position: relative;
        }
        .nav-link:hover, .nav-link.active { color: var(--primary-color) !important; }
        
        /* Hiệu ứng gạch chân khi hover menu */
        .nav-link::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 3px;
            background-color: var(--primary-color);
            transition: width 0.3s ease;
        }
        .nav-link:hover::after { width: 100%; }

        /* Dropdown Menu Đa cấp */
        .dropdown-menu {
            border: none;
            border-top: 3px solid var(--primary-color);
            border-radius: 0 0 8px 8px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 10px 0;
            margin-top: 0;
        }
        .dropdown-item {
            font-size: 14px;
            padding: 8px 25px;
            color: #555;
            font-weight: 500;
        }
        .dropdown-item:hover {
            background-color: var(--bg-light);
            color: var(--primary-color);
            padding-left: 30px; /* Hiệu ứng đẩy chữ sang phải */
        }
        
        /* Logic CSS cho Menu con (Submenu) */
        .dropdown-menu li { position: relative; }
        .dropdown-menu .submenu { 
            display: none;
            position: absolute;
            left: 100%; top: -10px;
            background: #fff;
            min-width: 220px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            border-radius: 4px;
            padding: 10px 0;
            list-style: none;
        }
        .dropdown-menu > li:hover > .submenu { display: block; }
        
        /* Mũi tên chỉ sang phải */
        .has-child::after {
            content: "\f0da"; /* FontAwesome arrow */
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            position: absolute;
            right: 15px;
            color: #ccc;
            font-size: 12px;
            top: 50%;
            transform: translateY(-50%);
        }

        /* --- FOOTER --- */
        footer {
            background-color: #212529;
            color: #adb5bd;
            padding: 70px 0 30px;
            margin-top: auto;
        }
        .footer-heading {
            color: #fff;
            font-size: 16px;
            font-weight: 700;
            text-transform: uppercase;
            margin-bottom: 25px;
            position: relative;
            padding-bottom: 10px;
        }
        .footer-heading::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 40px;
            height: 2px;
            background-color: var(--primary-color);
        }
        .footer-link {
            display: block;
            color: #adb5bd;
            margin-bottom: 12px;
            font-size: 14px;
        }
        .footer-link:hover { color: #fff; text-decoration: underline; }
        
        .social-icon {
            display: inline-flex;
            width: 36px; height: 36px;
            background: rgba(255,255,255,0.1);
            color: #fff;
            border-radius: 50%;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            transition: 0.3s;
        }
        .social-icon:hover { background: var(--primary-color); transform: translateY(-3px); }

        /* Responsive Mobile */
        @media (max-width: 991px) {
            .navbar-custom { display: none; } /* Ẩn menu ngang trên mobile */
            .header-actions span { display: none; } /* Ẩn chữ Login/Cart */
            .logo-text { font-size: 20px; }
        }
    </style>
    
    <sitemesh:write property="head"/>
</head>
<body>

    <!-- 1. TOP BAR -->
    <div class="top-bar">
        <div class="container d-flex justify-content-between align-items-center">
            <span><i class="fas fa-truck me-2"></i>Miễn phí vận chuyển đơn từ 500K</span>
            <div class="d-none d-md-block">
                <a href="#"><i class="fab fa-facebook"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="mailto:support@orishop.vn"><i class="fas fa-envelope me-1"></i> support@orishop.vn</a>
            </div>
        </div>
    </div>

    <!-- 2. HEADER CHÍNH -->
    <header class="main-header">
        <div class="container">
            <div class="row align-items-center">
                
                <!-- Logo -->
                <div class="col-md-3 col-6">
                    <a href="<c:url value='/home'/>" class="brand-logo">
                        <i class="fas fa-shopping-bag"></i> ORISHOP
                    </a>
                </div>

                <!-- Search Bar (Ẩn trên mobile, hiện trên desktop) -->
                <div class="col-md-5 d-none d-md-block">
                    <form action="<c:url value='/product/search'/>" class="search-container">
                        <input type="text" class="search-input" name="keyword" placeholder="Bạn đang tìm sản phẩm gì..." value="${param.keyword}">
                        <button type="submit" class="search-btn">
                            <i class="fas fa-search"></i>
                        </button>
                    </form>
                </div>

                <!-- Actions -->
                <div class="col-md-4 col-6">
                    <div class="header-actions justify-content-end">
                        
                        <!-- Account -->
                        <c:if test="${sessionScope.account == null}">
                            <a href="<c:url value='/login'/>" class="action-btn" title="Đăng nhập">
                                <i class="far fa-user"></i>
                            </a>
                        </c:if>
                        
                        <c:if test="${sessionScope.account != null}">
                            <div class="dropdown">
                                <a href="#" class="action-btn" data-bs-toggle="dropdown" title="Tài khoản">
                                    <i class="fas fa-user-circle text-danger"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li><span class="dropdown-item-text fw-bold text-muted">Xin chào, ${sessionScope.account.fullname}</span></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <c:if test="${sessionScope.account.role == 1}">
                                        <li><a class="dropdown-item" href="<c:url value='/admin/home'/>"><i class="fas fa-cogs me-2"></i>Quản trị</a></li>
                                    </c:if>
                                    <li><a class="dropdown-item" href="<c:url value='/order/history'/>"><i class="fas fa-box-open me-2"></i>Đơn hàng</a></li>
                                    <li><a class="dropdown-item" href="<c:url value='/logout'/>"><i class="fas fa-sign-out-alt me-2"></i>Đăng xuất</a></li>
                                </ul>
                            </div>
                        </c:if>

                        <!-- Cart -->
                        <a href="<c:url value='/cart'/>" class="action-btn" title="Giỏ hàng">
                            <i class="fas fa-shopping-cart"></i>
                            <span class="cart-badge">${sessionScope.cart != null ? sessionScope.cart.size() : 0}</span>
                        </a>
                        
                        <!-- Mobile Menu Button -->
                        <button class="btn d-md-none border-0 p-0 ms-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#mobileMenu">
                            <i class="fas fa-bars fa-lg"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- 3. NAVIGATION MENU (Desktop Only) -->
            <ul class="nav justify-content-center navbar-custom d-none d-md-flex">
                <li class="nav-item">
                    <a class="nav-link active" href="<c:url value='/home'/>">Trang chủ</a>
                </li>
                
                <!-- Menu Đa cấp -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Sản phẩm</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item fw-bold" href="<c:url value='/product'/>">Tất cả sản phẩm</a></li>
                        <li><hr class="dropdown-divider"></li>
                        
                        <c:forEach items="${categories}" var="cate">
                            <c:if test="${cate.category == null}">
                                <li>
                                    <c:choose>
                                        <c:when test="${not empty cate.subCategories}">
                                            <a class="dropdown-item has-child" href="<c:url value='/product/category?cid=${cate.categoryId}'/>">
                                                ${cate.categoryName}
                                            </a>
                                            <!-- Submenu -->
                                            <ul class="submenu">
                                                <c:forEach items="${cate.subCategories}" var="sub">
                                                    <li><a class="dropdown-item" href="<c:url value='/product/category?cid=${sub.categoryId}'/>">${sub.categoryName}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="dropdown-item" href="<c:url value='/product/category?cid=${cate.categoryId}'/>">
                                                ${cate.categoryName}
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
                
                <li class="nav-item"><a class="nav-link" href="#">Khuyến mãi</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Blog làm đẹp</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Liên hệ</a></li>
            </ul>
        </div>
    </header>

    <!-- MAIN CONTENT -->
    <div style="min-height: 600px;">
        <sitemesh:write property="body"/>
    </div>

    <!-- FOOTER -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-4">
                    <h5 class="footer-heading">Về OriShop</h5>
                    <p class="text-muted small">
                        OriShop là thiên đường mỹ phẩm chính hãng, nơi bạn tìm thấy vẻ đẹp đích thực từ thiên nhiên. 
                        Cam kết 100% sản phẩm chất lượng cao.
                    </p>
                    <div class="mt-3">
                        <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-tiktok"></i></a>
                    </div>
                </div>
                
                <div class="col-md-2 col-6 mb-4">
                    <h5 class="footer-heading">Liên kết</h5>
                    <a href="#" class="footer-link">Về chúng tôi</a>
                    <a href="#" class="footer-link">Tuyển dụng</a>
                    <a href="#" class="footer-link">Tin tức</a>
                    <a href="#" class="footer-link">Hệ thống cửa hàng</a>
                </div>
                
                <div class="col-md-2 col-6 mb-4">
                    <h5 class="footer-heading">Hỗ trợ</h5>
                    <a href="#" class="footer-link">Hướng dẫn mua hàng</a>
                    <a href="#" class="footer-link">Chính sách đổi trả</a>
                    <a href="#" class="footer-link">Bảo mật thông tin</a>
                    <a href="#" class="footer-link">Kiểm tra đơn hàng</a>
                </div>
                
                <div class="col-md-4 mb-4">
                    <h5 class="footer-heading">Liên hệ</h5>
                    <p class="text-muted small mb-2"><i class="fas fa-map-marker-alt text-danger me-2"></i> Tầng 5, Tòa nhà Ori Tower, Quận 1, TP.HCM</p>
                    <p class="text-muted small mb-2"><i class="fas fa-phone-alt text-danger me-2"></i> 1900 1234 (8:00 - 21:00)</p>
                    <p class="text-muted small"><i class="fas fa-envelope text-danger me-2"></i> cskh@orishop.vn</p>
                </div>
            </div>
            <div class="border-top border-secondary pt-4 mt-2 text-center small text-muted">
                &copy; 2025 Công ty Cổ phần OriShop. All rights reserved.
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>