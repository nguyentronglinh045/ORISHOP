<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
                integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link
                href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&family=Inter:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">

            <title>
                <sitemesh:write property="title" default="OriShop - Mỹ phẩm chính hãng" />
            </title>
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
                    color: var(--white);
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
                    color: var(--white);
                    line-height: 1.2;
                }

                /* --- [FIX QUAN TRỌNG] TĂNG Z-INDEX --- */
                .main-header {
                    background: var(--white);
                    box-shadow: var(--shadow-md);
                    position: sticky;
                    top: 0;
                    z-index: 1050 !important;
                    /* Cao hơn Slider */
                    padding: 18px 0;
                }

                .dropdown-menu {
                    z-index: 1060 !important;
                    /* Nổi lên trên cùng */
                    border: none;
                    border-top: 3px solid var(--primary);
                    border-radius: 0 0 var(--radius-md) var(--radius-md);
                    box-shadow: var(--shadow-lg);
                    padding: 12px 0;
                    margin-top: 8px;
                }

                /* --- Các style khác (giữ nguyên) --- */
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

                a {
                    text-decoration: none;
                    transition: all var(--transition-base);
                }

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

                .brand-logo i {
                    background: var(--gradient-primary);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    background-clip: text;
                }

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

                .has-child::after {
                    content: "\f0da";
                    font-family: "Font Awesome 6 Free";
                    font-weight: 900;
                    position: absolute;
                    right: 15px;
                    color: #ccc;
                    font-size: 12px;
                    top: 50%;
                    transform: translateY(-50%);
                }

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

                footer .text-muted {
                    color: #adb5bd !important;
                }

                footer p {
                    color: #adb5bd;
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

                @media (max-width: 991px) {
                    .navbar-custom {
                        display: none;
                    }

                    .header-actions span {
                        display: none;
                    }

                    .logo-text {
                        font-size: 20px;
                    }
                }
            </style>

            <sitemesh:write property="head" />
        </head>

        <body>

            <jsp:include page="../../views/web/sections/navbar.jsp" />

            <div style="min-height: 600px;">
                <sitemesh:write property="body" />
            </div>

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
                            <p class="text-muted small"><i class="fas fa-envelope" style="color: var(--primary);"></i>
                                <span class="ms-2">cskh@orishop.vn</span>
                            </p>
                        </div>
                    </div>
                    <div class="border-top border-secondary pt-4 mt-2 text-center small text-muted">
                        &copy; 2025 Công ty Cổ phần OriShop. All rights reserved.
                    </div>
                </div>
            </footer>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
                crossorigin="anonymous"></script>

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
