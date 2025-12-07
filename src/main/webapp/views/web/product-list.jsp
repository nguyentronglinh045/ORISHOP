<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

                <head>
                    <title>Sản phẩm - OriShop</title>
                </head>

                <%@ include file="sections/styles/product-list-styles.jsp" %>

                    <!-- Hero Section -->
                    <div class="product-hero">
                        <div class="container">
                            <div class="hero-content">
                                <div class="row align-items-center">
                                    <div class="col-lg-8">
                                        <h1 class="hero-title">
                                            <i class="fas fa-shopping-bag me-2"></i>Cửa hàng
                                        </h1>
                                        <p class="hero-subtitle">Khám phá bộ sưu tập sản phẩm chất lượng với giá tốt
                                            nhất
                                        </p>
                                    </div>
                                    <div class="col-lg-4 mt-3 mt-lg-0">
                                        <div class="breadcrumb-custom">
                                            <ol class="breadcrumb mb-0">
                                                <li class="breadcrumb-item">
                                                    <a href="<c:url value='/home'/>"><i
                                                            class="fas fa-home me-1"></i>Trang
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
                                        <a href="<c:url value='/product'/>"
                                            class="btn btn-primary px-4 py-2 rounded-pill">
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
                                                                <i
                                                                    class="fas fa-tag me-1"></i>${p.category.categoryName}
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
                                                                        <i class="fas fa-cart-plus me-2"></i>Thêm vào
                                                                        giỏ
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