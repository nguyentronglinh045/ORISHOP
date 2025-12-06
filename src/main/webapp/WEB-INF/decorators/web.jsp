<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="sitemesh" uri="http://www.sitemesh.org/sitemesh-decorator" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>
                    <sitemesh:write property="title" />
                </title>

                <!-- Bootstrap 5 Local -->
                <link href="<c:url value='/assets/lib/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
                <!-- Font Awesome Local -->
                <link href="<c:url value='/assets/lib/fontawesome/css/all.min.css'/>" rel="stylesheet">
                <!-- Google Fonts: Quicksand + Inter -->
                <link
                    href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&family=Inter:wght@300;400;500;600;700&display=swap"
                    rel="stylesheet">
                <!-- ORISHOP Theme CSS - Embedded inline to avoid Sitemesh static resource issues -->
                <style>
                    /* ============================================
                       ORISHOP THEME - Rose Gold / Pink Playful
                       ============================================ */

                    /* === CSS VARIABLES === */
                    :root {
                        --primary: #ff6b9d;
                        --primary-dark: #e84a7f;
                        --primary-light: #ffb6c1;
                        --secondary: #ffd1dc;
                        --accent: #ffb6c1;
                        --gold: #d4a574;
                        --dark: #2d3436;
                        --dark-light: #636e72;
                        --light: #fff5f8;
                        --light-gray: #f8f9fa;
                        --white: #ffffff;
                        --border: #e9ecef;
                        --success: #00b894;
                        --warning: #fdcb6e;
                        --danger: #e74c3c;
                        --info: #74b9ff;
                        --gradient-primary: linear-gradient(135deg, #ff6b9d, #ffb6c1);
                        --gradient-gold: linear-gradient(135deg, #d4a574, #ffb6c1);
                        --gradient-light: linear-gradient(135deg, #fff5f8, #ffd1dc);
                        --shadow-sm: 0 2px 8px rgba(255, 107, 157, 0.1);
                        --shadow-md: 0 4px 16px rgba(255, 107, 157, 0.15);
                        --shadow-lg: 0 8px 32px rgba(255, 107, 157, 0.2);
                        --shadow-hover: 0 12px 40px rgba(255, 107, 157, 0.25);
                        --radius-sm: 8px;
                        --radius-md: 15px;
                        --radius-lg: 25px;
                        --radius-full: 50px;
                        --transition-fast: 0.2s ease;
                        --transition-base: 0.3s ease;
                        --transition-slow: 0.5s ease;
                    }

                    body {
                        font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
                        color: var(--dark);
                        line-height: 1.6;
                        font-size: 15px;
                        background-color: var(--white);
                    }

                    h1,
                    h2,
                    h3,
                    h4,
                    h5,
                    h6 {
                        font-family: 'Quicksand', sans-serif;
                        font-weight: 700;
                        color: var(--dark);
                        line-height: 1.2;
                    }

                    .btn-primary,
                    .btn-danger {
                        background: var(--gradient-primary);
                        border: none;
                        color: var(--white);
                        font-weight: 600;
                        padding: 12px 30px;
                        border-radius: var(--radius-full);
                        transition: all var(--transition-base);
                        box-shadow: var(--shadow-sm);
                    }

                    .btn-primary:hover,
                    .btn-danger:hover {
                        transform: translateY(-2px);
                        box-shadow: var(--shadow-hover);
                        color: var(--white);
                    }

                    .text-primary {
                        color: var(--primary) !important;
                    }

                    .bg-primary {
                        background: var(--gradient-primary) !important;
                    }

                    .bg-light-custom {
                        background: var(--light) !important;
                    }

                    .rounded-custom {
                        border-radius: var(--radius-md) !important;
                    }

                    .shadow-custom {
                        box-shadow: var(--shadow-md) !important;
                    }
                </style>

                <style>
                    /* Web-specific overrides */

                    a {
                        text-decoration: none;
                        transition: all var(--transition-base);
                    }

                    /* --- 1. TOP BAR (Thông báo) --- */
                    .top-bar {
                        background: var(--gradient-primary);
                        color: var(--white);
                        padding: 10px 0;
                        font-size: 13px;
                        font-weight: 500;
                    }

                    .top-bar a {
                        color: var(--white);
                        margin-left: 15px;
                        opacity: 0.9;
                        transition: all var(--transition-fast);
                    }

                    .top-bar a:hover {
                        opacity: 1;
                        transform: translateY(-1px);
                    }

                    /* --- 2. MAIN HEADER (Sticky) --- */
                    .main-header {
                        background: var(--white);
                        box-shadow: var(--shadow-md);
                        position: sticky;
                        top: 0;
                        z-index: 1020;
                        padding: 18px 0;
                    }

                    /* Logo */
                    .brand-logo {
                        font-family: 'Quicksand', sans-serif;
                        font-size: 26px;
                        font-weight: 700;
                        background: var(--gradient-primary);
                        -webkit-background-clip: text;
                        -webkit-text-fill-color: transparent;
                        background-clip: text;
                        text-transform: uppercase;
                        letter-spacing: 1.5px;
                        display: flex;
                        align-items: center;
                        gap: 10px;
                        transition: all var(--transition-base);
                    }

                    .brand-logo:hover {
                        transform: scale(1.05);
                    }

                    .brand-logo i {
                        background: var(--gradient-primary);
                        -webkit-background-clip: text;
                        -webkit-text-fill-color: transparent;
                        background-clip: text;
                    }

                    /* Search Bar */
                    .search-container {
                        position: relative;
                        max-width: 500px;
                        width: 100%;
                    }

                    .search-input {
                        width: 100%;
                        padding: 12px 50px 12px 22px;
                        border: 2px solid var(--border);
                        border-radius: var(--radius-full);
                        background-color: var(--light);
                        transition: all var(--transition-base);
                        font-size: 14px;
                    }

                    .search-input:focus {
                        outline: none;
                        border-color: var(--primary);
                        background-color: var(--white);
                        box-shadow: 0 0 0 4px rgba(255, 107, 157, 0.15);
                    }

                    .search-btn {
                        position: absolute;
                        right: 5px;
                        top: 50%;
                        transform: translateY(-50%);
                        border: none;
                        background: var(--gradient-primary);
                        color: var(--white);
                        width: 38px;
                        height: 38px;
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        cursor: pointer;
                        transition: all var(--transition-base);
                    }

                    .search-btn:hover {
                        transform: translateY(-50%) scale(1.1);
                        box-shadow: var(--shadow-md);
                    }

                    /* Header Icons (User, Cart) */
                    .header-actions {
                        display: flex;
                        align-items: center;
                        gap: 20px;
                    }

                    .action-btn {
                        position: relative;
                        color: var(--dark);
                        font-size: 22px;
                        padding: 8px;
                        transition: all var(--transition-base);
                    }

                    .action-btn:hover {
                        color: var(--primary);
                        transform: scale(1.1);
                    }

                    .cart-badge {
                        position: absolute;
                        top: -2px;
                        right: -6px;
                        background: var(--gradient-primary);
                        color: var(--white);
                        font-size: 10px;
                        font-weight: 700;
                        min-width: 20px;
                        height: 20px;
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        border: 2px solid var(--white);
                        box-shadow: var(--shadow-sm);
                    }

                    /* --- 3. NAVIGATION MENU --- */
                    .navbar-custom {
                        padding: 0;
                        margin-top: 18px;
                        border-top: 2px solid var(--light);
                    }

                    .nav-link {
                        font-family: 'Quicksand', sans-serif;
                        font-weight: 600;
                        text-transform: uppercase;
                        color: var(--dark) !important;
                        padding: 18px 24px !important;
                        font-size: 14px;
                        position: relative;
                        letter-spacing: 0.5px;
                        transition: all var(--transition-base);
                    }

                    .nav-link:hover,
                    .nav-link.active {
                        color: var(--primary) !important;
                        background: var(--light);
                        border-radius: var(--radius-md);
                    }

                    /* Hiệu ứng gạch chân khi hover menu */
                    .nav-link::after {
                        content: '';
                        position: absolute;
                        bottom: 8px;
                        left: 50%;
                        transform: translateX(-50%);
                        width: 0;
                        height: 3px;
                        background: var(--gradient-primary);
                        border-radius: var(--radius-full);
                        transition: width var(--transition-base);
                    }

                    .nav-link:hover::after,
                    .nav-link.active::after {
                        width: 60%;
                    }

                    /* Dropdown Menu Đa cấp */
                    .dropdown-menu {
                        border: none;
                        border-top: 3px solid var(--primary);
                        border-radius: 0 0 var(--radius-md) var(--radius-md);
                        box-shadow: var(--shadow-lg);
                        padding: 12px 0;
                        margin-top: 8px;
                    }

                    .dropdown-item {
                        font-size: 14px;
                        padding: 10px 28px;
                        color: var(--dark);
                        font-weight: 500;
                        transition: all var(--transition-fast);
                    }

                    .dropdown-item:hover {
                        background: var(--light);
                        color: var(--primary);
                        padding-left: 35px;
                        transform: translateX(5px);
                    }

                    /* Logic CSS cho Menu con (Submenu) */
                    .dropdown-menu li {
                        position: relative;
                    }

                    .dropdown-menu .submenu {
                        display: none;
                        position: absolute;
                        left: 100%;
                        top: -10px;
                        background: #fff;
                        min-width: 220px;
                        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                        border-radius: 4px;
                        padding: 10px 0;
                        list-style: none;
                    }

                    .dropdown-menu>li:hover>.submenu {
                        display: block;
                    }

                    /* Mũi tên chỉ sang phải */
                    .has-child::after {
                        content: "\f0da";
                        /* FontAwesome arrow */
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
                        background: linear-gradient(135deg, #2d3436, #1a1e21);
                        color: #adb5bd;
                        padding: 80px 0 30px;
                        margin-top: auto;
                    }

                    .footer-heading {
                        font-family: 'Quicksand', sans-serif;
                        color: var(--white);
                        font-size: 18px;
                        font-weight: 700;
                        text-transform: uppercase;
                        margin-bottom: 28px;
                        position: relative;
                        padding-bottom: 12px;
                        letter-spacing: 1px;
                    }

                    .footer-heading::after {
                        content: '';
                        position: absolute;
                        left: 0;
                        bottom: 0;
                        width: 50px;
                        height: 3px;
                        background: var(--gradient-primary);
                        border-radius: var(--radius-full);
                    }

                    .footer-link {
                        display: block;
                        color: #adb5bd;
                        margin-bottom: 14px;
                        font-size: 14px;
                        transition: all var(--transition-fast);
                    }

                    .footer-link:hover {
                        color: var(--primary);
                        transform: translateX(5px);
                        text-decoration: none;
                    }

                    .social-icon {
                        display: inline-flex;
                        width: 42px;
                        height: 42px;
                        background: rgba(255, 255, 255, 0.1);
                        color: var(--white);
                        border-radius: 50%;
                        align-items: center;
                        justify-content: center;
                        margin-right: 12px;
                        transition: all var(--transition-base);
                        font-size: 18px;
                    }

                    .social-icon:hover {
                        background: var(--gradient-primary);
                        transform: translateY(-5px) scale(1.1);
                        box-shadow: var(--shadow-md);
                    }

                    /* Responsive Mobile */
                    @media (max-width: 991px) {
                        .navbar-custom {
                            display: none;
                        }

                        /* Ẩn menu ngang trên mobile */
                        .header-actions span {
                            display: none;
                        }

                        /* Ẩn chữ Login/Cart */
                        .logo-text {
                            font-size: 20px;
                        }
                    }
                </style>

                <sitemesh:write property="head" />
            </head>

            <body>

                <!-- 1. TOP BAR -->
                <div class="top-bar">
                    <div class="container d-flex justify-content-between align-items-center">
                        <span><i class="fas fa-truck me-2"></i>Miễn phí vận chuyển đơn từ 500K</span>
                        <div class="d-none d-md-block">
                            <a href="#"><i class="fab fa-facebook"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="mailto:support@orishop.vn"><i class="fas fa-envelope me-1"></i>
                                support@orishop.vn</a>
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
                                    <input type="text" class="search-input" name="keyword"
                                        placeholder="Bạn đang tìm sản phẩm gì..." value="${param.keyword}">
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
                                                <li><span class="dropdown-item-text fw-bold text-muted">Xin chào,
                                                        ${sessionScope.account.fullname}</span></li>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <c:if test="${sessionScope.account.role == 1}">
                                                    <li><a class="dropdown-item" href="<c:url value='/admin/home'/>"><i
                                                                class="fas fa-cogs me-2"></i>Quản trị</a></li>
                                                </c:if>
                                                <li><a class="dropdown-item" href="<c:url value='/order/history'/>"><i
                                                            class="fas fa-box-open me-2"></i>Đơn hàng</a></li>
                                                <li><a class="dropdown-item" href="<c:url value='/logout'/>"><i
                                                            class="fas fa-sign-out-alt me-2"></i>Đăng xuất</a></li>
                                            </ul>
                                        </div>
                                    </c:if>

                                    <!-- Cart -->
                                    <a href="<c:url value='/cart'/>" class="action-btn" title="Giỏ hàng">
                                        <i class="fas fa-shopping-cart"></i>
                                        <span class="cart-badge">${sessionScope.cart != null ? sessionScope.cart.size()
                                            : 0}</span>
                                    </a>

                                    <!-- Mobile Menu Button -->
                                    <button class="btn d-md-none border-0 p-0 ms-2" type="button"
                                        data-bs-toggle="offcanvas" data-bs-target="#mobileMenu">
                                        <i class="fas fa-bars fa-lg"></i>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- 3. NAVIGATION MENU -->
                        <ul class="nav justify-content-center navbar-custom">
                            <li class="nav-item">
                                <a class="nav-link active" href="<c:url value='/home'/>">Trang chủ</a>
                            </li>

                            <!-- Menu Đa cấp -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Sản phẩm</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item fw-bold" href="<c:url value='/product'/>">Tất cả sản
                                            phẩm</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>

                                    <c:forEach items="${categories}" var="cate">
                                        <c:if test="${cate.category == null}">
                                            <li>
                                                <c:choose>
                                                    <c:when test="${not empty cate.subCategories}">
                                                        <a class="dropdown-item has-child"
                                                            href="<c:url value='/product/category?cid=${cate.categoryId}'/>">
                                                            ${cate.categoryName}
                                                        </a>
                                                        <!-- Submenu -->
                                                        <ul class="submenu">
                                                            <c:forEach items="${cate.subCategories}" var="sub">
                                                                <li><a class="dropdown-item"
                                                                        href="<c:url value='/product/category?cid=${sub.categoryId}'/>">${sub.categoryName}</a>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a class="dropdown-item"
                                                            href="<c:url value='/product/category?cid=${cate.categoryId}'/>">
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

                <!-- Mobile Menu Offcanvas -->
                <div class="offcanvas offcanvas-end" tabindex="-1" id="mobileMenu">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title">Menu</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
                    </div>
                    <div class="offcanvas-body">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value='/home'/>">Trang chủ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value='/product'/>">Sản phẩm</a>
                            </li>
                            <c:forEach items="${categories}" var="cate">
                                <c:if test="${cate.category == null}">
                                    <li class="nav-item">
                                        <a class="nav-link"
                                            href="<c:url value='/product/category?cid=${cate.categoryId}'/>">
                                            ${cate.categoryName}
                                        </a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <li class="nav-item"><a class="nav-link" href="#">Khuyến mãi</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">Blog làm đẹp</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">Liên hệ</a></li>
                        </ul>
                    </div>
                </div>

                <!-- MAIN CONTENT -->
                <div style="min-height: 600px;">
                    <sitemesh:write property="body" />
                </div>

                <!-- FOOTER -->
                <footer>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4 mb-4">
                                <h5 class="footer-heading">Về OriShop</h5>
                                <p class="text-muted small">
                                    OriShop là thiên đường mỹ phẩm chính hãng, nơi bạn tìm thấy vẻ đẹp đích thực từ
                                    thiên nhiên.
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
                                <p class="text-muted small mb-2"><i class="fas fa-map-marker-alt"
                                        style="color: var(--primary);"></i>
                                    <span class="ms-2">Tầng 5, Tòa nhà Ori Tower, Quận 1, TP.HCM</span>
                                </p>
                                <p class="text-muted small mb-2"><i class="fas fa-phone-alt"
                                        style="color: var(--primary);"></i>
                                    <span class="ms-2">1900 1234 (8:00 - 21:00)</span>
                                </p>
                                <p class="text-muted small"><i class="fas fa-envelope"
                                        style="color: var(--primary);"></i>
                                    <span class="ms-2">cskh@orishop.vn</span>
                                </p>
                            </div>
                        </div>
                        <div class="border-top border-secondary pt-4 mt-2 text-center small text-muted">
                            &copy; 2025 Công ty Cổ phần OriShop. All rights reserved.
                        </div>
                    </div>
                </footer>

                <!-- Bootstrap JS Local -->
                <script src="<c:url value='/assets/lib/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

                <!-- Initialize Bootstrap components -->
                <script>
                    // Ensure carousel is initialized
                    document.addEventListener('DOMContentLoaded', function () {
                        var carouselElement = document.querySelector('#heroCarousel');
                        if (carouselElement) {
                            var carousel = new bootstrap.Carousel(carouselElement, {
                                interval: 5000,
                                wrap: true
                            });
                        }
                    });
                </script>
            </body>

            </html>