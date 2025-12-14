<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%@ include file="sections/styles/product-detail-styles.jsp" %>

<div class="detail-breadcrumb">
    <div class="container">
        <div class="breadcrumb-custom">
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item">
                    <a href="<c:url value='/home'/>"><i class="fas fa-home me-1"></i>Trang chủ</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="<c:url value='/product'/>">Sản phẩm</a>
                </li>
                <li class="breadcrumb-item active">${product.productName}</li>
            </ol>
        </div>
    </div>
</div>

<div class="container pb-5">
    <div class="row">
        <div class="col-lg-5 mb-4">
            <div class="product-image-card">
                <c:choose>
                    <c:when test="${not empty product.image}">
                        <img src="<c:url value='/assets/uploads/product/${product.image}'/>"
                             class="product-main-image" alt="${product.productName}">
                    </c:when>
                    <c:otherwise>
                        <img src="https://placehold.co/600x600/fff5f8/ff6b9d?text=Product+Image"
                             class="product-main-image" alt="No Image">
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="col-lg-7">
            <div class="product-info">
                <c:if test="${not empty product.category}">
                    <div class="product-category-badge">
                        <i class="fas fa-tag"></i>
                        ${product.category.categoryName}
                    </div>
                </c:if>

                <h1 class="product-title">${product.productName}</h1>

                <div class="product-meta">
                    <div class="meta-item rating-stars">
                        <i class="fas fa-star"></i> 4.5
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-barcode"></i>
                        Mã SP: #${product.productId}
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-box"></i>
                        Kho: ${product.quantity} sản phẩm
                    </div>
                </div>

                <div class="product-price-section">
                    <div class="price-label">Giá bán</div>
                    <div class="product-price">
                        <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" />
                    </div>
                </div>

                <c:if test="${not empty product.description}">
                    <div class="product-description">
                        ${product.description}
                    </div>
                </c:if>

                <div class="stock-status">
                    <c:choose>
                        <c:when test="${product.quantity > 0}">
                            <span class="stock-badge in-stock">
                                <i class="fas fa-check-circle me-1"></i>Còn hàng
                            </span>
                            <span class="text-muted">Còn ${product.quantity} sản phẩm</span>
                        </c:when>
                        <c:otherwise>
                            <span class="stock-badge out-of-stock">
                                <i class="fas fa-times-circle me-1"></i>Hết hàng
                            </span>
                        </c:otherwise>
                    </c:choose>
                </div>

                <c:if test="${product.quantity > 0}">
                    <div class="quantity-section">
                        <label class="quantity-label">Số lượng:</label>
                        <div class="quantity-selector">
                            <button type="button" class="qty-btn" onclick="decreaseQty()">
                                <i class="fas fa-minus"></i>
                            </button>
                            <input type="number" class="qty-input" id="quantity" value="1" min="1"
                                   max="${product.quantity}">
                            <button type="button" class="qty-btn"
                                    onclick="increaseQty(${product.quantity})">
                                <i class="fas fa-plus"></i>
                            </button>
                        </div>
                    </div>
                </c:if>

                <div class="action-buttons">
                    <c:choose>
                        <c:when test="${product.quantity > 0}">
                            <a href="<c:url value='/cart/add?pid=${product.productId}'/>"
                               class="btn-add-to-cart">
                                <i class="fas fa-cart-plus me-2"></i>Thêm vào giỏ hàng
                            </a>
                        </c:when>
                        <c:otherwise>
                            <button class="btn-add-to-cart" disabled
                                    style="opacity: 0.6; cursor: not-allowed;">
                                <i class="fas fa-times me-2"></i>Sản phẩm tạm hết hàng
                            </button>
                        </c:otherwise>
                    </c:choose>
                    <button class="btn-wishlist">
                        <i class="far fa-heart"></i>
                    </button>
                </div>

                <div class="info-cards">
                    <div class="info-card">
                        <div class="info-card-icon">
                            <i class="fas fa-truck"></i>
                        </div>
                        <div class="info-card-text">
                            <div class="info-card-title">Miễn phí vận chuyển</div>
                            <p class="info-card-desc">Cho đơn hàng trên 500.000₫</p>
                        </div>
                    </div>
                    <div class="info-card">
                        <div class="info-card-icon">
                            <i class="fas fa-shield-alt"></i>
                        </div>
                        <div class="info-card-text">
                            <div class="info-card-title">Bảo hành chính hãng</div>
                            <p class="info-card-desc">Đổi trả trong vòng 7 ngày</p>
                        </div>
                    </div>
                    <div class="info-card">
                        <div class="info-card-icon">
                            <i class="fas fa-headset"></i>
                        </div>
                        <div class="info-card-text">
                            <div class="info-card-title">Hỗ trợ 24/7</div>
                            <p class="info-card-desc">Liên hệ ngay khi cần</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <c:if test="${not empty relatedProducts}">
        <div class="related-section">
            <h2 class="section-title">
                <i class="fas fa-heart"></i>Sản phẩm cùng loại
            </h2>
            <div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-4">
                <c:forEach items="${relatedProducts}" var="rp" varStatus="status">
                    <c:if test="${rp.productId != product.productId && status.index < 4}">
                        <div class="col">
                            <div class="related-card">
                                <div class="related-image-wrapper">
                                    <a href="<c:url value='/product/detail?id=${rp.productId}'/>">
                                        <c:choose>
                                            <c:when test="${not empty rp.image}">
                                                <img src="<c:url value='/assets/uploads/product/${rp.image}'/>"
                                                     class="related-image" alt="${rp.productName}">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="https://placehold.co/150x150/fff5f8/ff6b9d?text=Product"
                                                     class="related-image" alt="No Image">
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
                                </div>
                                <div class="related-body">
                                    <h6 class="related-name">
                                        <a href="<c:url value='/product/detail?id=${rp.productId}'/>">${rp.productName}</a>
                                    </h6>
                                    <div class="related-price">
                                        <fmt:formatNumber value="${rp.price}" type="currency" currencySymbol="₫" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </c:if>

    <c:if test="${not empty recentProducts}">
        <div class="related-section mt-5">
            <h2 class="section-title">
                <i class="fas fa-history"></i> Sản phẩm bạn vừa xem
            </h2>
            <div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-4">
                <c:forEach items="${recentProducts}" var="rp" varStatus="status">
                    <c:if test="${rp.productId != product.productId && status.index < 4}">
                        <div class="col">
                            <div class="related-card">
                                <div class="related-image-wrapper">
                                    <a href="<c:url value='/product/detail?id=${rp.productId}'/>">
                                        <c:choose>
                                            <c:when test="${not empty rp.image}">
                                                <img src="<c:url value='/assets/uploads/product/${rp.image}'/>"
                                                     class="related-image" alt="${rp.productName}">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="https://placehold.co/150x150/fff5f8/ff6b9d?text=Product"
                                                     class="related-image" alt="No Image">
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
                                </div>
                                <div class="related-body">
                                    <h6 class="related-name">
                                        <a href="<c:url value='/product/detail?id=${rp.productId}'/>">${rp.productName}</a>
                                    </h6>
                                    <div class="related-price">
                                        <fmt:formatNumber value="${rp.price}" type="currency" currencySymbol="₫" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </c:if>
    </div>

<script>
    function decreaseQty() {
        const input = document.getElementById('quantity');
        const currentValue = parseInt(input.value);
        if (currentValue > 1) {
            input.value = currentValue - 1;
        }
    }

    function increaseQty(max) {
        const input = document.getElementById('quantity');
        const currentValue = parseInt(input.value);
        if (currentValue < max) {
            input.value = currentValue + 1;
        }
    }
</script>