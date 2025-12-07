<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

                <head>
                    <title>Sản phẩm - OriShop</title>
                </head>

                <style>
                    /* ===== PRODUCT LIST PAGE STYLES ===== */

                    /* Hero Section */
                    .product-hero {
                        background: linear-gradient(135deg, #fff5f8 0%, #ffd1dc 50%, #ffb6c1 100%);
                        padding: 3rem 0;
                        margin-bottom: 2rem;
                        position: relative;
                        overflow: hidden;
                    }

                    .product-hero::before {
                        content: '';
                        position: absolute;
                        top: -50%;
                        right: -20%;
                        width: 400px;
                        height: 400px;
                        background: radial-gradient(circle, rgba(255, 107, 157, 0.2) 0%, transparent 70%);
                        border-radius: 50%;
                    }

                    .product-hero::after {
                        content: '';
                        position: absolute;
                        bottom: -30%;
                        left: -10%;
                        width: 300px;
                        height: 300px;
                        background: radial-gradient(circle, rgba(212, 165, 116, 0.15) 0%, transparent 70%);
                        border-radius: 50%;
                    }

                    .hero-content {
                        position: relative;
                        z-index: 1;
                    }

                    .hero-title {
                        font-family: 'Quicksand', sans-serif;
                        font-size: 2.5rem;
                        font-weight: 700;
                        color: var(--dark);
                        margin-bottom: 0.5rem;
                    }

                    .hero-title i {
                        color: var(--primary);
                    }

                    .hero-subtitle {
                        color: var(--dark-light);
                        font-size: 1.1rem;
                    }

                    .breadcrumb-custom {
                        background: rgba(255, 255, 255, 0.8);
                        padding: 0.75rem 1.5rem;
                        border-radius: 50px;
                        display: inline-flex;
                        box-shadow: 0 2px 8px rgba(255, 107, 157, 0.1);
                    }

                    .breadcrumb-custom .breadcrumb {
                        margin: 0;
                        background: transparent;
                    }

                    .breadcrumb-custom .breadcrumb-item a {
                        color: var(--primary);
                        text-decoration: none;
                        font-weight: 600;
                    }

                    .breadcrumb-custom .breadcrumb-item a:hover {
                        color: var(--primary-dark);
                    }

                    .breadcrumb-custom .breadcrumb-item.active {
                        color: var(--dark-light);
                    }

                    /* Sidebar Category */
                    .category-sidebar {
                        position: sticky;
                        top: 100px;
                    }

                    .category-card {
                        border: none;
                        border-radius: 20px;
                        box-shadow: var(--shadow-md);
                        overflow: hidden;
                        background: white;
                    }

                    .category-card .card-header {
                        background: var(--gradient-primary);
                        color: white;
                        font-weight: 700;
                        font-family: 'Quicksand', sans-serif;
                        padding: 1.25rem 1.5rem;
                        border: none;
                    }

                    .category-list {
                        padding: 0.5rem 0;
                    }

                    .category-item {
                        display: flex;
                        align-items: center;
                        padding: 0.875rem 1.5rem;
                        color: var(--dark);
                        text-decoration: none;
                        font-weight: 500;
                        transition: all 0.3s ease;
                        border-left: 3px solid transparent;
                    }

                    .category-item:hover {
                        background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                        color: var(--primary);
                        border-left-color: var(--primary);
                    }

                    .category-item.active {
                        background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                        color: var(--primary);
                        border-left-color: var(--primary);
                        font-weight: 600;
                    }

                    .category-item img {
                        width: 24px;
                        height: 24px;
                        object-fit: cover;
                        border-radius: 6px;
                        margin-right: 0.75rem;
                    }

                    .category-item i {
                        margin-right: 0.75rem;
                        width: 24px;
                        text-align: center;
                        color: var(--primary);
                    }

                    .category-count {
                        margin-left: auto;
                        background: rgba(255, 107, 157, 0.1);
                        color: var(--primary);
                        padding: 0.25rem 0.75rem;
                        border-radius: 50px;
                        font-size: 0.8rem;
                        font-weight: 600;
                    }

                    /* Product Grid */
                    .products-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 1.5rem;
                        padding-bottom: 1rem;
                        border-bottom: 2px dashed #ffd1dc;
                    }

                    .products-title {
                        font-family: 'Quicksand', sans-serif;
                        font-weight: 700;
                        color: var(--dark);
                        font-size: 1.5rem;
                    }

                    .products-count {
                        background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                        padding: 0.5rem 1rem;
                        border-radius: 50px;
                        font-weight: 600;
                        color: var(--dark);
                    }

                    /* Product Card */
                    .product-card {
                        border: none;
                        border-radius: 20px;
                        box-shadow: var(--shadow-sm);
                        overflow: hidden;
                        transition: all 0.3s ease;
                        background: white;
                        height: 100%;
                    }

                    .product-card:hover {
                        transform: translateY(-8px);
                        box-shadow: var(--shadow-hover);
                    }

                    .product-image-wrapper {
                        position: relative;
                        padding: 1.5rem;
                        background: linear-gradient(135deg, #fff5f8, #ffeef3);
                        text-align: center;
                        overflow: hidden;
                    }

                    .product-image-wrapper::before {
                        content: '';
                        position: absolute;
                        top: 0;
                        left: 0;
                        right: 0;
                        bottom: 0;
                        background: linear-gradient(135deg, transparent 0%, rgba(255, 107, 157, 0.05) 100%);
                    }

                    .product-image {
                        max-height: 200px;
                        width: 100%;
                        object-fit: contain;
                        transition: transform 0.3s ease;
                        position: relative;
                        z-index: 1;
                    }

                    .product-card:hover .product-image {
                        transform: scale(1.05);
                    }

                    .product-badge {
                        position: absolute;
                        top: 1rem;
                        left: 1rem;
                        background: linear-gradient(135deg, #ff6b9d, #ff8fab);
                        color: white;
                        padding: 0.35rem 0.85rem;
                        border-radius: 50px;
                        font-size: 0.75rem;
                        font-weight: 600;
                        z-index: 2;
                    }

                    .product-badge.out-of-stock {
                        background: linear-gradient(135deg, #636e72, #95a5a6);
                    }

                    .product-body {
                        padding: 1.5rem;
                    }

                    .product-category {
                        color: var(--primary);
                        font-size: 0.8rem;
                        font-weight: 600;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                        margin-bottom: 0.5rem;
                    }

                    .product-name {
                        font-family: 'Quicksand', sans-serif;
                        font-weight: 700;
                        font-size: 1.1rem;
                        color: var(--dark);
                        margin-bottom: 0.75rem;
                        display: -webkit-box;
                        -webkit-line-clamp: 2;
                        -webkit-box-orient: vertical;
                        overflow: hidden;
                        line-height: 1.4;
                        min-height: 2.8rem;
                    }

                    .product-name a {
                        color: inherit;
                        text-decoration: none;
                        transition: color 0.3s ease;
                    }

                    .product-name a:hover {
                        color: var(--primary);
                    }

                    .product-price {
                        font-family: 'Quicksand', sans-serif;
                        font-size: 1.35rem;
                        font-weight: 700;
                        color: var(--primary);
                        margin-bottom: 1rem;
                    }

                    .product-footer {
                        display: flex;
                        gap: 0.5rem;
                    }

                    .btn-add-cart {
                        flex: 1;
                        background: var(--gradient-primary);
                        border: none;
                        color: white;
                        font-weight: 600;
                        padding: 0.75rem 1rem;
                        border-radius: 50px;
                        transition: all 0.3s ease;
                        text-decoration: none;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                    }

                    .btn-add-cart:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 4px 15px rgba(255, 107, 157, 0.4);
                        color: white;
                    }

                    .btn-quick-view {
                        width: 45px;
                        height: 45px;
                        border-radius: 50%;
                        border: 2px solid #ffd1dc;
                        background: white;
                        color: var(--primary);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        transition: all 0.3s ease;
                        text-decoration: none;
                    }

                    .btn-quick-view:hover {
                        background: var(--gradient-primary);
                        border-color: var(--primary);
                        color: white;
                    }

                    /* Empty State */
                    .empty-state {
                        text-align: center;
                        padding: 4rem 2rem;
                        background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                        border-radius: 20px;
                    }

                    .empty-state-icon {
                        font-size: 5rem;
                        color: var(--primary);
                        margin-bottom: 1.5rem;
                        opacity: 0.7;
                    }

                    .empty-state h4 {
                        font-family: 'Quicksand', sans-serif;
                        font-weight: 700;
                        color: var(--dark);
                        margin-bottom: 0.75rem;
                    }

                    .empty-state p {
                        color: var(--dark-light);
                        margin-bottom: 1.5rem;
                    }

                    /* Search Result Info */
                    .search-info {
                        background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                        padding: 1rem 1.5rem;
                        border-radius: 15px;
                        margin-bottom: 1.5rem;
                        display: flex;
                        align-items: center;
                        gap: 1rem;
                    }

                    .search-info i {
                        color: var(--primary);
                        font-size: 1.25rem;
                    }

                    .search-info strong {
                        color: var(--primary);
                    }

                    /* Mobile Category Toggle */
                    .category-toggle {
                        display: none;
                        width: 100%;
                        background: var(--gradient-primary);
                        color: white;
                        border: none;
                        padding: 1rem;
                        border-radius: 15px;
                        font-weight: 600;
                        margin-bottom: 1rem;
                        cursor: pointer;
                    }

                    /* Responsive */
                    @media (max-width: 991px) {
                        .product-hero {
                            padding: 2rem 0;
                        }

                        .hero-title {
                            font-size: 2rem;
                        }

                        .category-sidebar {
                            position: relative;
                            top: 0;
                        }

                        .category-toggle {
                            display: flex;
                            align-items: center;
                            justify-content: space-between;
                        }

                        .category-card {
                            display: none;
                        }

                        .category-card.show {
                            display: block;
                        }
                    }

                    @media (max-width: 767px) {
                        .product-hero {
                            padding: 1.5rem 0;
                        }

                        .hero-title {
                            font-size: 1.5rem;
                        }

                        .hero-subtitle {
                            font-size: 0.95rem;
                        }

                        .breadcrumb-custom {
                            padding: 0.5rem 1rem;
                            font-size: 0.85rem;
                        }

                        .products-header {
                            flex-direction: column;
                            gap: 1rem;
                            align-items: flex-start;
                        }

                        .product-image {
                            max-height: 160px;
                        }

                        .product-body {
                            padding: 1rem;
                        }

                        .product-name {
                            font-size: 1rem;
                        }

                        .product-price {
                            font-size: 1.15rem;
                        }

                        .btn-add-cart {
                            padding: 0.65rem 0.75rem;
                            font-size: 0.9rem;
                        }

                        .btn-quick-view {
                            width: 40px;
                            height: 40px;
                        }
                    }
                </style>

                <!-- Hero Section -->
                <div class="product-hero">
                    <div class="container">
                        <div class="hero-content">
                            <div class="row align-items-center">
                                <div class="col-lg-8">
                                    <h1 class="hero-title">
                                        <i class="fas fa-shopping-bag me-2"></i>Cửa hàng
                                    </h1>
                                    <p class="hero-subtitle">Khám phá bộ sưu tập sản phẩm chất lượng với giá tốt nhất
                                    </p>
                                </div>
                                <div class="col-lg-4 mt-3 mt-lg-0">
                                    <div class="breadcrumb-custom">
                                        <ol class="breadcrumb mb-0">
                                            <li class="breadcrumb-item">
                                                <a href="<c:url value='/home'/>"><i class="fas fa-home me-1"></i>Trang
                                                    chủ</a>
                                            </li>
                                            <li class="breadcrumb-item active">Sản phẩm</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container pb-5">
                    <div class="row">
                        <!-- Sidebar Category -->
                        <div class="col-lg-3 mb-4">
                            <div class="category-sidebar">
                                <!-- Mobile Toggle -->
                                <button class="category-toggle" onclick="toggleCategory()">
                                    <span><i class="fas fa-filter me-2"></i>Lọc theo danh mục</span>
                                    <i class="fas fa-chevron-down"></i>
                                </button>

                                <div class="card category-card" id="categoryCard">
                                    <div class="card-header">
                                        <i class="fas fa-list me-2"></i>Danh mục sản phẩm
                                    </div>
                                    <div class="category-list">
                                        <a href="<c:url value='/product'/>"
                                            class="category-item ${empty activeCate ? 'active' : ''}">
                                            <i class="fas fa-th-large"></i>
                                            <span>Tất cả sản phẩm</span>
                                            <span class="category-count">${fn:length(products)}</span>
                                        </a>
                                        <c:forEach items="${categories}" var="c">
                                            <a href="<c:url value='/product/category?cid=${c.categoryId}'/>"
                                                class="category-item ${activeCate == c.categoryId ? 'active' : ''}">
                                                <c:choose>
                                                    <c:when test="${not empty c.icon}">
                                                        <img src="<c:url value='/assets/uploads/category/${c.icon}'/>"
                                                            alt="${c.categoryName}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="fas fa-folder"></i>
                                                    </c:otherwise>
                                                </c:choose>
                                                <span>${c.categoryName}</span>
                                            </a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Product Grid -->
                        <div class="col-lg-9">
                            <!-- Search Info -->
                            <c:if test="${not empty keyword}">
                                <div class="search-info">
                                    <i class="fas fa-search"></i>
                                    <span>Kết quả tìm kiếm cho: <strong>"${keyword}"</strong></span>
                                </div>
                            </c:if>

                            <!-- Products Header -->
                            <div class="products-header">
                                <h2 class="products-title">
                                    <c:choose>
                                        <c:when test="${not empty activeCateName}">${activeCateName}</c:when>
                                        <c:otherwise>Tất cả sản phẩm</c:otherwise>
                                    </c:choose>
                                </h2>
                                <span class="products-count">
                                    <i class="fas fa-box me-1"></i>${fn:length(products)} sản phẩm
                                </span>
                            </div>

                            <!-- Empty State -->
                            <c:if test="${empty products}">
                                <div class="empty-state">
                                    <i class="fas fa-search empty-state-icon"></i>
                                    <h4>Không tìm thấy sản phẩm nào</h4>
                                    <p>Hiện tại chưa có sản phẩm phù hợp với tiêu chí của bạn.</p>
                                    <a href="<c:url value='/product'/>" class="btn btn-primary px-4 py-2 rounded-pill">
                                        <i class="fas fa-arrow-left me-2"></i>Xem tất cả sản phẩm
                                    </a>
                                </div>
                            </c:if>

                            <!-- Product Grid -->
                            <c:if test="${not empty products}">
                                <div class="row row-cols-1 row-cols-sm-2 row-cols-xl-3 g-4">
                                    <c:forEach items="${products}" var="p">
                                        <div class="col">
                                            <div class="product-card">
                                                <div class="product-image-wrapper">
                                                    <c:if test="${p.quantity <= 0}">
                                                        <span class="product-badge out-of-stock">Hết hàng</span>
                                                    </c:if>
                                                    <a href="<c:url value='/product/detail?id=${p.productId}'/>">
                                                        <c:choose>
                                                            <c:when test="${not empty p.image}">
                                                                <img src="<c:url value='/assets/uploads/product/${p.image}'/>"
                                                                    class="product-image" alt="${p.productName}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="https://placehold.co/300x300/fff5f8/ff6b9d?text=Product"
                                                                    class="product-image" alt="No Image">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </a>
                                                </div>
                                                <div class="product-body">
                                                    <c:if test="${not empty p.category}">
                                                        <div class="product-category">
                                                            <i class="fas fa-tag me-1"></i>${p.category.categoryName}
                                                        </div>
                                                    </c:if>
                                                    <h3 class="product-name">
                                                        <a
                                                            href="<c:url value='/product/detail?id=${p.productId}'/>">${p.productName}</a>
                                                    </h3>
                                                    <div class="product-price">
                                                        <fmt:formatNumber value="${p.price}" type="currency"
                                                            currencySymbol="₫" />
                                                    </div>
                                                    <div class="product-footer">
                                                        <c:choose>
                                                            <c:when test="${p.quantity > 0}">
                                                                <a href="<c:url value='/cart/add?pid=${p.productId}'/>"
                                                                    class="btn-add-cart">
                                                                    <i class="fas fa-cart-plus me-2"></i>Thêm vào giỏ
                                                                </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <button class="btn-add-cart" disabled
                                                                    style="opacity: 0.6; cursor: not-allowed;">
                                                                    <i class="fas fa-times me-2"></i>Hết hàng
                                                                </button>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <a href="<c:url value='/product/detail?id=${p.productId}'/>"
                                                            class="btn-quick-view">
                                                            <i class="fas fa-eye"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>

                <script>
                    function toggleCategory() {
                        const categoryCard = document.getElementById('categoryCard');
                        categoryCard.classList.toggle('show');
                    }
                </script>