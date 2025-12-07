<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

            <style>
                /* ===== PRODUCT DETAIL PAGE STYLES ===== */

                /* Breadcrumb */
                .detail-breadcrumb {
                    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                    padding: 1rem 0;
                    margin-bottom: 2rem;
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

                .breadcrumb-custom .breadcrumb-item.active {
                    color: var(--dark-light);
                    max-width: 200px;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: nowrap;
                }

                /* Product Image Section */
                .product-image-card {
                    border: none;
                    border-radius: 25px;
                    box-shadow: var(--shadow-md);
                    overflow: hidden;
                    background: linear-gradient(135deg, #fff5f8, #ffeef3);
                    padding: 2rem;
                    text-align: center;
                }

                .product-main-image {
                    max-width: 100%;
                    max-height: 450px;
                    object-fit: contain;
                    border-radius: 15px;
                    transition: transform 0.3s ease;
                }

                .product-main-image:hover {
                    transform: scale(1.02);
                }

                /* Product Info Section */
                .product-info {
                    padding-left: 1rem;
                }

                .product-category-badge {
                    display: inline-flex;
                    align-items: center;
                    gap: 0.5rem;
                    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                    color: var(--primary);
                    padding: 0.5rem 1rem;
                    border-radius: 50px;
                    font-weight: 600;
                    font-size: 0.85rem;
                    margin-bottom: 1rem;
                }

                .product-title {
                    font-family: 'Quicksand', sans-serif;
                    font-size: 2rem;
                    font-weight: 700;
                    color: var(--dark);
                    margin-bottom: 1rem;
                    line-height: 1.3;
                }

                .product-meta {
                    display: flex;
                    flex-wrap: wrap;
                    gap: 1rem;
                    margin-bottom: 1.5rem;
                    padding-bottom: 1.5rem;
                    border-bottom: 2px dashed #ffd1dc;
                }

                .meta-item {
                    display: flex;
                    align-items: center;
                    gap: 0.5rem;
                    color: var(--dark-light);
                    font-size: 0.95rem;
                }

                .meta-item i {
                    color: var(--primary);
                }

                .rating-stars {
                    background: linear-gradient(135deg, #fdcb6e, #f39c12);
                    color: white;
                    padding: 0.35rem 0.75rem;
                    border-radius: 50px;
                    font-size: 0.85rem;
                    font-weight: 600;
                }

                .product-price-section {
                    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                    padding: 1.5rem;
                    border-radius: 20px;
                    margin-bottom: 1.5rem;
                }

                .product-price {
                    font-family: 'Quicksand', sans-serif;
                    font-size: 2.5rem;
                    font-weight: 700;
                    color: var(--primary);
                    margin: 0;
                }

                .price-label {
                    color: var(--dark-light);
                    font-size: 0.9rem;
                    margin-bottom: 0.25rem;
                }

                .product-description {
                    color: var(--dark);
                    line-height: 1.8;
                    margin-bottom: 1.5rem;
                    padding-bottom: 1.5rem;
                    border-bottom: 2px dashed #ffd1dc;
                }

                /* Stock Status */
                .stock-status {
                    display: flex;
                    align-items: center;
                    gap: 0.75rem;
                    margin-bottom: 1.5rem;
                }

                .stock-badge {
                    padding: 0.5rem 1rem;
                    border-radius: 50px;
                    font-weight: 600;
                    font-size: 0.9rem;
                }

                .stock-badge.in-stock {
                    background: rgba(0, 184, 148, 0.15);
                    color: #00b894;
                }

                .stock-badge.out-of-stock {
                    background: rgba(231, 76, 60, 0.15);
                    color: #e74c3c;
                }

                /* Quantity Selector */
                .quantity-section {
                    margin-bottom: 1.5rem;
                }

                .quantity-label {
                    font-weight: 600;
                    color: var(--dark);
                    margin-bottom: 0.75rem;
                    display: block;
                }

                .quantity-selector {
                    display: inline-flex;
                    align-items: center;
                    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                    border-radius: 50px;
                    padding: 0.25rem;
                }

                .qty-btn {
                    width: 45px;
                    height: 45px;
                    border: none;
                    background: white;
                    border-radius: 50%;
                    font-size: 1.25rem;
                    color: var(--primary);
                    cursor: pointer;
                    transition: all 0.3s ease;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }

                .qty-btn:hover {
                    background: var(--gradient-primary);
                    color: white;
                }

                .qty-input {
                    width: 70px;
                    text-align: center;
                    border: none;
                    background: transparent;
                    font-size: 1.25rem;
                    font-weight: 700;
                    color: var(--dark);
                }

                .qty-input:focus {
                    outline: none;
                }

                /* Action Buttons */
                .action-buttons {
                    display: flex;
                    gap: 1rem;
                    margin-bottom: 2rem;
                }

                .btn-add-to-cart {
                    flex: 2;
                    background: var(--gradient-primary);
                    border: none;
                    color: white;
                    font-weight: 600;
                    padding: 1rem 2rem;
                    border-radius: 50px;
                    font-size: 1.1rem;
                    transition: all 0.3s ease;
                    text-decoration: none;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }

                .btn-add-to-cart:hover {
                    transform: translateY(-3px);
                    box-shadow: 0 8px 25px rgba(255, 107, 157, 0.4);
                    color: white;
                }

                .btn-wishlist {
                    width: 55px;
                    height: 55px;
                    border: 2px solid #ffd1dc;
                    background: white;
                    border-radius: 50%;
                    color: var(--primary);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 1.25rem;
                    transition: all 0.3s ease;
                }

                .btn-wishlist:hover {
                    background: var(--gradient-primary);
                    border-color: var(--primary);
                    color: white;
                }

                /* Info Cards */
                .info-card {
                    background: white;
                    border-radius: 15px;
                    padding: 1rem 1.25rem;
                    display: flex;
                    align-items: center;
                    gap: 1rem;
                    box-shadow: var(--shadow-sm);
                    margin-bottom: 0.75rem;
                }

                .info-card-icon {
                    width: 45px;
                    height: 45px;
                    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: var(--primary);
                    font-size: 1.1rem;
                }

                .info-card-text {
                    flex: 1;
                }

                .info-card-title {
                    font-weight: 600;
                    color: var(--dark);
                    font-size: 0.95rem;
                    margin-bottom: 0.15rem;
                }

                .info-card-desc {
                    color: var(--dark-light);
                    font-size: 0.85rem;
                    margin: 0;
                }

                /* Related Products */
                .related-section {
                    margin-top: 4rem;
                    padding-top: 3rem;
                    border-top: 2px dashed #ffd1dc;
                }

                .section-title {
                    font-family: 'Quicksand', sans-serif;
                    font-size: 1.75rem;
                    font-weight: 700;
                    color: var(--dark);
                    margin-bottom: 2rem;
                    display: flex;
                    align-items: center;
                    gap: 0.75rem;
                }

                .section-title i {
                    color: var(--primary);
                }

                .related-card {
                    border: none;
                    border-radius: 20px;
                    box-shadow: var(--shadow-sm);
                    overflow: hidden;
                    transition: all 0.3s ease;
                    background: white;
                    height: 100%;
                }

                .related-card:hover {
                    transform: translateY(-5px);
                    box-shadow: var(--shadow-hover);
                }

                .related-image-wrapper {
                    padding: 1rem;
                    background: linear-gradient(135deg, #fff5f8, #ffeef3);
                    text-align: center;
                }

                .related-image {
                    height: 150px;
                    width: 100%;
                    object-fit: contain;
                }

                .related-body {
                    padding: 1rem;
                }

                .related-name {
                    font-weight: 600;
                    color: var(--dark);
                    margin-bottom: 0.5rem;
                    font-size: 0.95rem;
                    display: -webkit-box;
                    -webkit-line-clamp: 2;
                    -webkit-box-orient: vertical;
                    overflow: hidden;
                }

                .related-name a {
                    color: inherit;
                    text-decoration: none;
                }

                .related-name a:hover {
                    color: var(--primary);
                }

                .related-price {
                    font-weight: 700;
                    color: var(--primary);
                    font-size: 1.1rem;
                }

                /* Responsive */
                @media (max-width: 991px) {
                    .product-info {
                        padding-left: 0;
                        margin-top: 2rem;
                    }

                    .product-title {
                        font-size: 1.75rem;
                    }

                    .product-price {
                        font-size: 2rem;
                    }
                }

                @media (max-width: 767px) {
                    .product-image-card {
                        padding: 1.5rem;
                    }

                    .product-main-image {
                        max-height: 300px;
                    }

                    .product-title {
                        font-size: 1.5rem;
                    }

                    .product-price {
                        font-size: 1.75rem;
                    }

                    .product-meta {
                        flex-direction: column;
                        gap: 0.5rem;
                    }

                    .action-buttons {
                        flex-direction: column;
                    }

                    .btn-add-to-cart {
                        width: 100%;
                    }

                    .btn-wishlist {
                        width: 100%;
                        border-radius: 50px;
                        height: auto;
                        padding: 0.75rem;
                    }

                    .quantity-selector {
                        width: 100%;
                        justify-content: center;
                    }
                }
            </style>

            <!-- Breadcrumb -->
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
                    <!-- Product Image -->
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

                    <!-- Product Info -->
                    <div class="col-lg-7">
                        <div class="product-info">
                            <!-- Category Badge -->
                            <c:if test="${not empty product.category}">
                                <div class="product-category-badge">
                                    <i class="fas fa-tag"></i>
                                    ${product.category.categoryName}
                                </div>
                            </c:if>

                            <!-- Product Title -->
                            <h1 class="product-title">${product.productName}</h1>

                            <!-- Meta Info -->
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

                            <!-- Price -->
                            <div class="product-price-section">
                                <div class="price-label">Giá bán</div>
                                <div class="product-price">
                                    <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" />
                                </div>
                            </div>

                            <!-- Description -->
                            <c:if test="${not empty product.description}">
                                <div class="product-description">
                                    ${product.description}
                                </div>
                            </c:if>

                            <!-- Stock Status -->
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

                            <!-- Quantity Selector -->
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

                            <!-- Action Buttons -->
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

                            <!-- Info Cards -->
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

                <!-- Related Products -->
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
                                                    <a
                                                        href="<c:url value='/product/detail?id=${rp.productId}'/>">${rp.productName}</a>
                                                </h6>
                                                <div class="related-price">
                                                    <fmt:formatNumber value="${rp.price}" type="currency"
                                                        currencySymbol="₫" />
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