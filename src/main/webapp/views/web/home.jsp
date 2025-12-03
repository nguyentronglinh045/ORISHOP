<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ OriShop - Mỹ phẩm chính hãng</title>
    <style>
        /* Đồng bộ biến màu với Layout */
        :root {
            --primary-color: #dc3545;
            --text-main: #333333;
            --text-light: #6c757d;
        }

        /* 1. HERO SLIDER */
        .hero-slider { margin-top: -1px; }
        .hero-slider .carousel-item { height: 500px; background-color: #f2f2f2; }
        .hero-slider img { object-fit: cover; height: 100%; width: 100%; }
        
        .hero-caption {
            position: absolute; top: 50%; left: 10%; transform: translateY(-50%);
            background: rgba(255, 255, 255, 0.95);
            padding: 40px; max-width: 500px;
            border-left: 5px solid var(--primary-color);
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            text-align: left; color: var(--text-main);
            opacity: 0; animation: slideUp 0.8s forwards 0.3s;
        }
        @keyframes slideUp { from { opacity: 0; transform: translateY(-40%); } to { opacity: 1; transform: translateY(-50%); } }

        /* 2. FEATURES BOX */
        .features-section { padding: 50px 0; background: #fff; border-bottom: 1px solid #eee; }
        .feature-box {
            text-align: center; padding: 30px 20px;
            border: 1px solid #eee; border-radius: 8px;
            transition: all 0.3s ease; height: 100%;
        }
        .feature-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.05);
            border-color: var(--primary-color);
        }
        .feature-icon { font-size: 2.5rem; color: var(--primary-color); margin-bottom: 20px; }
        .feature-title { font-weight: 700; text-transform: uppercase; font-size: 1rem; margin-bottom: 10px; }
        .feature-desc { font-size: 0.9rem; color: var(--text-light); }

        /* SECTION HEADER */
        .section-header { text-align: center; margin: 70px 0 40px; position: relative; }
        .section-title {
            font-size: 2rem; font-weight: 800; color: var(--text-main);
            text-transform: uppercase; letter-spacing: 1px;
            display: inline-block; background: #fff; padding: 0 30px;
            position: relative; z-index: 1;
        }
        .section-header::after {
            content: ""; position: absolute; top: 50%; left: 0; right: 0;
            height: 1px; background: #e0e0e0; z-index: 0;
        }

        /* 3. CATEGORY CARD */
        .cat-card {
            display: block; position: relative; overflow: hidden;
            border-radius: 8px; margin-bottom: 20px; height: 200px;
        }
        .cat-card img {
            width: 100%; height: 100%; object-fit: cover;
            transition: transform 0.5s ease;
        }
        .cat-card:hover img { transform: scale(1.1); }
        .cat-overlay {
            position: absolute; inset: 0;
            background: linear-gradient(to top, rgba(0,0,0,0.7), transparent);
            display: flex; align-items: flex-end; padding: 20px;
        }
        .cat-name { color: #fff; font-weight: 700; text-transform: uppercase; letter-spacing: 1px; }

        /* 4. PRODUCT CARD */
        .product-card {
            background: #fff; border: 1px solid #f0f0f0; border-radius: 8px;
            overflow: hidden; transition: all 0.3s; height: 100%;
            position: relative;
        }
        .product-card:hover {
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            border-color: transparent; transform: translateY(-5px);
        }
        
        .badge-tag {
            position: absolute; top: 15px; left: 15px; z-index: 2;
            padding: 4px 10px; font-size: 11px; font-weight: 700;
            text-transform: uppercase; border-radius: 4px; color: #fff;
        }
        .badge-new { background: var(--primary-color); }
        .badge-hot { background: #ffc107; color: #333; }

        .product-img-wrap {
            position: relative; overflow: hidden; height: 260px;
            display: flex; align-items: center; justify-content: center;
            background: #fff; padding: 15px;
        }
        .product-img-wrap img {
            max-width: 100%; max-height: 100%;
            transition: transform 0.5s ease;
        }
        .product-card:hover .product-img-wrap img { transform: scale(1.08); }

        .product-info { padding: 15px; text-align: center; }
        .product-cat { font-size: 12px; text-transform: uppercase; color: #999; margin-bottom: 5px; }
        .product-name {
            font-size: 15px; font-weight: 600; color: var(--text-main);
            text-decoration: none; display: -webkit-box; -webkit-line-clamp: 2;
            -webkit-box-orient: vertical; overflow: hidden; height: 44px;
            margin-bottom: 10px; transition: 0.2s;
        }
        .product-name:hover { color: var(--primary-color); }
        
        .product-price {
            color: var(--primary-color); font-weight: 700; font-size: 18px;
        }

        /* Nút Mua Hàng */
        .btn-add-cart {
            display: block; width: 100%; margin-top: 15px;
            border: 1px solid var(--primary-color); color: var(--primary-color);
            background: transparent; padding: 8px; font-weight: 600;
            text-transform: uppercase; text-decoration: none; font-size: 13px;
            border-radius: 4px; transition: 0.3s;
        }
        .btn-add-cart:hover {
            background: var(--primary-color); color: #fff;
        }

        /* 5. PROMO BANNER */
        .promo-banner {
            margin: 80px 0; position: relative; height: 400px;
            background: url('https://thefaceshop.com.vn/cdn/shop/files/slider_1_1920x680_7f53f9e9-8646-4456-9959-566063600962.jpg?v=1683606774') center/cover fixed;
            display: flex; align-items: center; justify-content: center; text-align: center;
        }
        .promo-overlay { position: absolute; inset: 0; background: rgba(0,0,0,0.4); }
        .promo-content { position: relative; z-index: 1; color: #fff; }
        .promo-title { font-size: 3rem; font-weight: 800; margin-bottom: 15px; }
        .btn-promo {
            background: #fff; color: var(--primary-color);
            padding: 12px 35px; border-radius: 30px; font-weight: 700;
            text-transform: uppercase; text-decoration: none; display: inline-block;
            transition: 0.3s; margin-top: 20px;
        }
        .btn-promo:hover { background: var(--primary-color); color: #fff; }

        /* 6. BLOG SECTION */
        .blog-card { border: none; transition: 0.3s; }
        .blog-card:hover { transform: translateY(-5px); }
        .blog-img { height: 200px; object-fit: cover; border-radius: 8px; width: 100%; }
        .blog-date { font-size: 0.8rem; color: #999; margin: 10px 0 5px; }
        .blog-title { font-size: 1.1rem; font-weight: 700; color: var(--text-main); text-decoration: none; display: block; margin-bottom: 10px; }
        .blog-title:hover { color: var(--primary-color); }
        .blog-desc { font-size: 0.9rem; color: var(--text-light); display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }

        /* 7. NEWSLETTER */
        .newsletter-area { background: #333; color: #fff; padding: 60px 0; text-align: center; }
        .newsletter-form { max-width: 500px; margin: 20px auto 0; position: relative; }
        .newsletter-input { width: 100%; padding: 15px 120px 15px 20px; border-radius: 30px; border: none; outline: none; }
        .newsletter-btn { position: absolute; right: 5px; top: 5px; bottom: 5px; background: var(--primary-color); color: #fff; border: none; border-radius: 30px; padding: 0 25px; font-weight: 700; }
        
        @media (max-width: 768px) {
            .hero-slider .carousel-item { height: 300px; }
            .hero-caption { display: none; }
            .promo-title { font-size: 2rem; }
        }
    </style>
</head>
<body>

    <!-- 1. HERO SLIDER -->
    <div id="homeCarousel" class="carousel slide hero-slider" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#homeCarousel" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#homeCarousel" data-bs-slide-to="1"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://images.unsplash.com/photo-1596462502278-27bfdd403cc2?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80" alt="Banner 1">
                <div class="hero-caption d-none d-md-block">
                    <h5 class="text-danger fw-bold text-uppercase mb-2">OriShop Cosmetics</h5>
                    <h1 class="display-4 fw-bold mb-3">VẺ ĐẸP THUẦN KHIẾT</h1>
                    <p class="mb-4">Khám phá bộ sưu tập chăm sóc da từ thiên nhiên, an toàn và hiệu quả.</p>
                    <a href="<c:url value='/product'/>" class="btn btn-danger rounded-pill px-4 py-2">MUA NGAY</a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://thefaceshop.com.vn/cdn/shop/files/Artboard_1_252ed707-8e47-4933-9034-7db3df7834bc.jpg?v=1704253303" alt="Banner 2">
                <div class="hero-caption d-none d-md-block">
                    <h5 class="text-danger fw-bold text-uppercase mb-2">Khuyến mãi hè</h5>
                    <h1 class="display-4 fw-bold mb-3">RẠNG NGỜI ĐÓN NẮNG</h1>
                    <p class="mb-4">Giảm giá lên đến 50% cho các dòng sản phẩm dưỡng trắng.</p>
                    <a href="<c:url value='/product'/>" class="btn btn-danger rounded-pill px-4 py-2">KHÁM PHÁ</a>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#homeCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#homeCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>

    <!-- 2. FEATURES -->
    <div class="features-section">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-3 col-6">
                    <div class="feature-box">
                        <i class="fas fa-truck feature-icon"></i>
                        <h6 class="feature-title">Miễn phí vận chuyển</h6>
                        <p class="feature-desc">Đơn hàng từ 500k</p>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="feature-box">
                        <i class="fas fa-sync-alt feature-icon"></i>
                        <h6 class="feature-title">Đổi trả dễ dàng</h6>
                        <p class="feature-desc">Trong vòng 7 ngày</p>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="feature-box">
                        <i class="fas fa-check-circle feature-icon"></i>
                        <h6 class="feature-title">Cam kết chính hãng</h6>
                        <p class="feature-desc">Hoàn tiền 200% nếu giả</p>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="feature-box">
                        <i class="fas fa-headset feature-icon"></i>
                        <h6 class="feature-title">Hỗ trợ 24/7</h6>
                        <p class="feature-desc">Hotline: 1900 1000</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <!-- 3. DANH MỤC NỔI BẬT -->
        <div class="section-header">
            <h2 class="section-title">Danh mục nổi bật</h2>
        </div>
        
        <div class="row g-4">
            <c:forEach items="${categories}" var="c" begin="0" end="3">
                <c:if test="${c.category == null}">
                    <div class="col-md-3 col-6">
                        <a href="<c:url value='/product/category?cid=${c.categoryId}'/>" class="cat-card">
                            <c:if test="${c.icon != null}">
                                <img src="<c:url value='/assets/uploads/category/${c.icon}'/>" alt="${c.categoryName}">
                            </c:if>
                            <c:if test="${c.icon == null}">
                                <img src="https://via.placeholder.com/400x300?text=${fn:substring(c.categoryName,0,1)}" alt="${c.categoryName}">
                            </c:if>
                            <div class="cat-overlay">
                                <span class="cat-name">${c.categoryName}</span>
                            </div>
                        </a>
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <!-- 4. SẢN PHẨM MỚI -->
        <div class="section-header">
            <h2 class="section-title">Sản phẩm mới</h2>
        </div>

        <c:if test="${empty products}">
            <div class="alert alert-light text-center py-5 border">
                <i class="fas fa-box-open fa-3x text-muted mb-3"></i>
                <h5>Chưa có sản phẩm nào được cập nhật.</h5>
            </div>
        </c:if>

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4">
            <c:forEach items="${products}" var="p">
                <div class="col">
                    <div class="product-card">
                        <span class="badge-tag badge-new">New</span>
                        
                        <div class="product-img-wrap">
                            <a href="<c:url value='/product/detail?id=${p.productId}'/>">
                                <c:if test="${p.image != null}">
                                    <img src="<c:url value='/assets/uploads/product/${p.image}'/>" alt="${p.productName}">
                                </c:if>
                                <c:if test="${p.image == null}">
                                    <img src="https://via.placeholder.com/300x300?text=OriShop" alt="No Image">
                                </c:if>
                            </a>
                        </div>
                        
                        <div class="product-info">
                            <div class="product-cat">
                                <c:if test="${p.category != null}">${p.category.categoryName}</c:if>
                            </div>
                            <a href="<c:url value='/product/detail?id=${p.productId}'/>" class="product-name" title="${p.productName}">
                                ${p.productName}
                            </a>
                            <div class="product-price">
                                <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="đ"/>
                            </div>
                            
                            <a href="<c:url value='/cart/add?pid=${p.productId}'/>" class="btn-add-cart">
                                <i class="fas fa-shopping-cart me-1"></i> Thêm vào giỏ
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <!-- 5. PROMO BANNER -->
        <div class="promo-banner">
            <div class="promo-overlay"></div>
            <div class="promo-content">
                <h5 class="text-uppercase ls-2 mb-2">Khuyến mãi đặc biệt</h5>
                <h2 class="promo-title">GIẢM GIÁ ĐẾN 50%</h2>
                <p class="mb-4">Dành cho các sản phẩm chăm sóc da mùa hè này</p>
                <a href="<c:url value='/product'/>" class="btn-promo">MUA NGAY</a>
            </div>
        </div>

        <!-- 6. SẢN PHẨM BÁN CHẠY (Demo lại List) -->
        <div class="section-header">
            <h2 class="section-title">Sản phẩm bán chạy</h2>
        </div>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4">
            <c:forEach items="${products}" var="p" begin="0" end="3">
                <div class="col">
                    <div class="product-card">
                        <span class="badge-tag badge-hot">Hot</span>
                        <div class="product-img-wrap">
                            <a href="<c:url value='/product/detail?id=${p.productId}'/>">
                                <c:if test="${p.image != null}">
                                    <img src="<c:url value='/assets/uploads/product/${p.image}'/>" alt="${p.productName}">
                                </c:if>
                                <c:if test="${p.image == null}">
                                    <img src="https://via.placeholder.com/300x300?text=OriShop" alt="No Image">
                                </c:if>
                            </a>
                        </div>
                        <div class="product-info">
                            <a href="<c:url value='/product/detail?id=${p.productId}'/>" class="product-name" title="${p.productName}">${p.productName}</a>
                            <div class="product-price"><fmt:formatNumber value="${p.price}" type="currency" currencySymbol="đ"/></div>
                            <a href="<c:url value='/cart/add?pid=${p.productId}'/>" class="btn-add-cart"><i class="fas fa-shopping-cart me-1"></i> Thêm vào giỏ</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- 7. TIN TỨC / BLOG -->
        <div class="section-header">
            <h2 class="section-title">Tin tức làm đẹp</h2>
        </div>
        <div class="row g-4 mb-5">
            <div class="col-md-4">
                <div class="blog-card">
                    <img src="https://images.unsplash.com/photo-1556228552-523cd13b86e0" class="blog-img" alt="Blog 1">
                    <div class="p-2">
                        <div class="blog-date"><i class="far fa-calendar-alt me-1"></i> 12/05/2025</div>
                        <a href="#" class="blog-title">5 Bước chăm sóc da cơ bản cho người mới</a>
                        <p class="blog-desc">Làm thế nào để có làn da khỏe mạnh? Cùng OriShop tìm hiểu quy trình skincare chuẩn nhé.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="blog-card">
                    <img src="https://images.unsplash.com/photo-1596755094514-f87e34085b2c" class="blog-img" alt="Blog 2">
                    <div class="p-2">
                        <div class="blog-date"><i class="far fa-calendar-alt me-1"></i> 10/05/2025</div>
                        <a href="#" class="blog-title">Review bộ sản phẩm trị mụn từ trà xanh</a>
                        <p class="blog-desc">Đánh giá chi tiết hiệu quả của dòng sản phẩm best-seller tháng này.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="blog-card">
                    <img src="https://images.unsplash.com/photo-1516975080664-ed2fc6a32937" class="blog-img" alt="Blog 3">
                    <div class="p-2">
                        <div class="blog-date"><i class="far fa-calendar-alt me-1"></i> 08/05/2025</div>
                        <a href="#" class="blog-title">Xu hướng trang điểm tự nhiên năm 2025</a>
                        <p class="blog-desc">Phong cách make-up "no makeup" đang lên ngôi như thế nào?</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 8. NEWSLETTER -->
    <div class="newsletter-area">
        <div class="container">
            <h3>ĐĂNG KÝ NHẬN TIN</h3>
            <p>Nhận ngay mã giảm giá 10% cho đơn hàng đầu tiên</p>
            <div class="newsletter-form">
                <input type="email" class="newsletter-input" placeholder="Nhập email của bạn...">
                <button class="newsletter-btn">GỬI</button>
            </div>
        </div>
    </div>

</body>
</html>