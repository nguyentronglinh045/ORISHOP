<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

            <style>
                /* ===== ORDER DETAIL PAGE STYLES ===== */

                /* Hero Section */
                .detail-hero {
                    background: var(--gradient-primary);
                    padding: 3rem 0;
                    margin-bottom: 2rem;
                }

                .detail-hero-content {
                    text-align: center;
                    color: white;
                }

                .detail-hero h1 {
                    font-family: 'Quicksand', sans-serif;
                    font-weight: 700;
                    font-size: 2.25rem;
                    margin-bottom: 0.5rem;
                }

                .detail-breadcrumb {
                    display: flex;
                    justify-content: center;
                    gap: 0.5rem;
                    flex-wrap: wrap;
                }

                .detail-breadcrumb a {
                    color: rgba(255, 255, 255, 0.8);
                    text-decoration: none;
                    transition: color 0.3s ease;
                }

                .detail-breadcrumb a:hover {
                    color: white;
                }

                .detail-breadcrumb span {
                    color: rgba(255, 255, 255, 0.6);
                }

                /* Info Card */
                .info-card {
                    background: white;
                    border-radius: 20px;
                    box-shadow: 0 5px 20px rgba(255, 107, 157, 0.1);
                    overflow: hidden;
                    margin-bottom: 1.5rem;
                }

                .info-card-header {
                    background: linear-gradient(135deg, #fff5f8, #ffeef2);
                    padding: 1.25rem 1.5rem;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    flex-wrap: wrap;
                    gap: 1rem;
                }

                .info-card-title {
                    font-family: 'Quicksand', sans-serif;
                    font-weight: 700;
                    color: var(--dark);
                    margin: 0;
                    display: flex;
                    align-items: center;
                    gap: 0.5rem;
                }

                .info-card-title i {
                    color: var(--primary);
                }

                /* Status Badge */
                .status-badge {
                    display: inline-flex;
                    align-items: center;
                    gap: 0.5rem;
                    padding: 0.5rem 1rem;
                    border-radius: 50px;
                    font-weight: 600;
                    font-size: 0.9rem;
                }

                .status-pending {
                    background: linear-gradient(135deg, rgba(255, 193, 7, 0.2), rgba(255, 193, 7, 0.05));
                    color: #f39c12;
                }

                .status-shipping {
                    background: linear-gradient(135deg, rgba(52, 152, 219, 0.2), rgba(52, 152, 219, 0.05));
                    color: #3498db;
                }

                .status-delivered {
                    background: linear-gradient(135deg, rgba(0, 184, 148, 0.2), rgba(0, 184, 148, 0.05));
                    color: #00b894;
                }

                .status-cancelled {
                    background: linear-gradient(135deg, rgba(231, 76, 60, 0.2), rgba(231, 76, 60, 0.05));
                    color: #e74c3c;
                }

                .status-default {
                    background: linear-gradient(135deg, rgba(108, 117, 125, 0.2), rgba(108, 117, 125, 0.05));
                    color: #6c757d;
                }

                .info-card-body {
                    padding: 1.5rem;
                }

                /* Info Grid */
                .info-grid {
                    display: grid;
                    grid-template-columns: repeat(2, 1fr);
                    gap: 1.25rem;
                }

                .info-item {
                    display: flex;
                    align-items: flex-start;
                    gap: 1rem;
                }

                .info-icon {
                    width: 45px;
                    height: 45px;
                    background: linear-gradient(135deg, rgba(255, 107, 157, 0.1), rgba(255, 143, 171, 0.05));
                    border-radius: 12px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    flex-shrink: 0;
                }

                .info-icon i {
                    color: var(--primary);
                    font-size: 1.1rem;
                }

                .info-content {
                    flex: 1;
                }

                .info-label {
                    font-size: 0.85rem;
                    color: var(--dark-light);
                    margin-bottom: 0.25rem;
                }

                .info-value {
                    font-weight: 600;
                    color: var(--dark);
                }

                /* Products Card */
                .products-card {
                    background: white;
                    border-radius: 20px;
                    box-shadow: 0 5px 20px rgba(255, 107, 157, 0.1);
                    overflow: hidden;
                    margin-bottom: 1.5rem;
                }

                .products-header {
                    background: linear-gradient(135deg, #fff5f8, #ffeef2);
                    padding: 1.25rem 1.5rem;
                }

                .products-title {
                    font-family: 'Quicksand', sans-serif;
                    font-weight: 700;
                    color: var(--dark);
                    margin: 0;
                    display: flex;
                    align-items: center;
                    gap: 0.5rem;
                }

                .products-title i {
                    color: var(--primary);
                }

                /* Product List */
                .product-list {
                    padding: 0;
                }

                .product-item {
                    display: flex;
                    align-items: center;
                    padding: 1.25rem 1.5rem;
                    border-bottom: 1px solid #f5f5f5;
                    gap: 1rem;
                }

                .product-item:last-child {
                    border-bottom: none;
                }

                .product-image {
                    width: 80px;
                    height: 80px;
                    border-radius: 12px;
                    overflow: hidden;
                    flex-shrink: 0;
                    border: 2px solid #fff5f8;
                }

                .product-image img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }

                .product-info {
                    flex: 1;
                }

                .product-name {
                    font-weight: 600;
                    color: var(--dark);
                    margin-bottom: 0.25rem;
                }

                .product-price {
                    font-size: 0.95rem;
                    color: var(--dark-light);
                }

                .product-qty {
                    text-align: center;
                    padding: 0.5rem 1rem;
                    background: linear-gradient(135deg, rgba(255, 107, 157, 0.1), rgba(255, 143, 171, 0.05));
                    border-radius: 50px;
                }

                .product-qty-label {
                    font-size: 0.75rem;
                    color: var(--dark-light);
                }

                .product-qty-value {
                    font-weight: 700;
                    color: var(--primary);
                }

                .product-subtotal {
                    text-align: right;
                    min-width: 120px;
                }

                .subtotal-label {
                    font-size: 0.75rem;
                    color: var(--dark-light);
                }

                .subtotal-value {
                    font-weight: 700;
                    color: var(--primary);
                    font-size: 1.1rem;
                }

                /* Total Row */
                .total-row {
                    display: flex;
                    justify-content: flex-end;
                    align-items: center;
                    padding: 1.5rem;
                    background: linear-gradient(135deg, #fff5f8, #ffeef2);
                    gap: 1rem;
                }

                .total-label {
                    font-size: 1rem;
                    color: var(--dark);
                }

                .total-value {
                    font-family: 'Quicksand', sans-serif;
                    font-size: 1.5rem;
                    font-weight: 700;
                    color: var(--primary);
                }

                /* Action Button */
                .btn-back {
                    background: white;
                    border: 2px solid var(--primary);
                    color: var(--primary);
                    padding: 12px 25px;
                    border-radius: 50px;
                    font-weight: 600;
                    text-decoration: none;
                    display: inline-flex;
                    align-items: center;
                    gap: 0.5rem;
                    transition: all 0.3s ease;
                }

                .btn-back:hover {
                    background: var(--gradient-primary);
                    border-color: transparent;
                    color: white;
                    transform: translateY(-2px);
                    box-shadow: 0 5px 20px rgba(255, 107, 157, 0.3);
                }

                /* Responsive */
                @media (max-width: 991px) {
                    .info-grid {
                        grid-template-columns: 1fr;
                    }
                }

                @media (max-width: 767px) {
                    .detail-hero {
                        padding: 2rem 0;
                    }

                    .detail-hero h1 {
                        font-size: 1.75rem;
                    }

                    .product-item {
                        flex-wrap: wrap;
                    }

                    .product-image {
                        width: 70px;
                        height: 70px;
                    }

                    .product-info {
                        flex: 1 1 calc(100% - 90px);
                    }

                    .product-qty {
                        flex: 1;
                    }

                    .product-subtotal {
                        flex: 1;
                        text-align: left;
                    }

                    .total-row {
                        flex-direction: column;
                        text-align: center;
                    }
                }

                @media (max-width: 575px) {
                    .info-card-header {
                        flex-direction: column;
                        align-items: flex-start;
                    }

                    .info-item {
                        flex-direction: column;
                        gap: 0.5rem;
                    }

                    .product-item {
                        padding: 1rem;
                    }

                    .product-image {
                        width: 60px;
                        height: 60px;
                    }
                }
            </style>

            <!-- Hero Section -->
            <section class="detail-hero">
                <div class="container">
                    <div class="detail-hero-content">
                        <h1><i class="fas fa-receipt me-2"></i>Chi tiết đơn hàng</h1>
                        <div class="detail-breadcrumb">
                            <a href="<c:url value='/'/>"><i class="fas fa-home me-1"></i>Trang chủ</a>
                            <span>/</span>
                            <a href="<c:url value='/order/history'/>">Đơn hàng của tôi</a>
                            <span>/</span>
                            <span>Đơn hàng #${order.orderId}</span>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Main Content -->
            <div class="container py-4">
                <div class="row">
                    <!-- Order Info -->
                    <div class="col-lg-12">
                        <div class="info-card">
                            <div class="info-card-header">
                                <h4 class="info-card-title">
                                    <i class="fas fa-info-circle"></i>
                                    Thông tin đơn hàng #${order.orderId}
                                </h4>
                                <c:choose>
                                    <c:when test="${order.status == 'Chờ xử lý'}">
                                        <span class="status-badge status-pending">
                                            <i class="fas fa-clock"></i>Chờ xử lý
                                        </span>
                                    </c:when>
                                    <c:when test="${order.status == 'Đang giao'}">
                                        <span class="status-badge status-shipping">
                                            <i class="fas fa-truck"></i>Đang giao
                                        </span>
                                    </c:when>
                                    <c:when test="${order.status == 'Đã giao'}">
                                        <span class="status-badge status-delivered">
                                            <i class="fas fa-check-circle"></i>Đã giao
                                        </span>
                                    </c:when>
                                    <c:when test="${order.status == 'Đã hủy'}">
                                        <span class="status-badge status-cancelled">
                                            <i class="fas fa-times-circle"></i>Đã hủy
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status-badge status-default">
                                            <i class="fas fa-info-circle"></i>${order.status}
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="info-card-body">
                                <div class="info-grid">
                                    <div class="info-item">
                                        <div class="info-icon">
                                            <i class="fas fa-user"></i>
                                        </div>
                                        <div class="info-content">
                                            <div class="info-label">Người nhận</div>
                                            <div class="info-value">${order.user.fullname}</div>
                                        </div>
                                    </div>
                                    <div class="info-item">
                                        <div class="info-icon">
                                            <i class="fas fa-phone"></i>
                                        </div>
                                        <div class="info-content">
                                            <div class="info-label">Số điện thoại</div>
                                            <div class="info-value">${order.phone}</div>
                                        </div>
                                    </div>
                                    <div class="info-item">
                                        <div class="info-icon">
                                            <i class="fas fa-map-marker-alt"></i>
                                        </div>
                                        <div class="info-content">
                                            <div class="info-label">Địa chỉ giao hàng</div>
                                            <div class="info-value">${order.address}</div>
                                        </div>
                                    </div>
                                    <div class="info-item">
                                        <div class="info-icon">
                                            <i class="fas fa-calendar-alt"></i>
                                        </div>
                                        <div class="info-content">
                                            <div class="info-label">Ngày đặt hàng</div>
                                            <div class="info-value">
                                                <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Products -->
                    <div class="col-lg-12">
                        <div class="products-card">
                            <div class="products-header">
                                <h4 class="products-title">
                                    <i class="fas fa-shopping-bag"></i>
                                    Sản phẩm đã mua
                                </h4>
                            </div>
                            <div class="product-list">
                                <c:forEach items="${details}" var="d">
                                    <div class="product-item">
                                        <div class="product-image">
                                            <c:choose>
                                                <c:when test="${not empty d.product.image}">
                                                    <img src="<c:url value='/assets/uploads/product/${d.product.image}'/>"
                                                        alt="${d.product.productName}">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="https://placehold.co/80x80/fff5f8/ff6b9d?text=Ảnh"
                                                        alt="No image">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="product-info">
                                            <div class="product-name">${d.product.productName}</div>
                                            <div class="product-price">
                                                <fmt:formatNumber value="${d.unitPrice}" type="currency"
                                                    currencySymbol="₫" maxFractionDigits="0" />
                                            </div>
                                        </div>
                                        <div class="product-qty">
                                            <div class="product-qty-label">Số lượng</div>
                                            <div class="product-qty-value">x${d.quantity}</div>
                                        </div>
                                        <div class="product-subtotal">
                                            <div class="subtotal-label">Thành tiền</div>
                                            <div class="subtotal-value">
                                                <fmt:formatNumber value="${d.unitPrice * d.quantity}" type="currency"
                                                    currencySymbol="₫" maxFractionDigits="0" />
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="total-row">
                                <span class="total-label">Tổng cộng:</span>
                                <span class="total-value">
                                    <fmt:formatNumber value="${order.amount}" type="currency" currencySymbol="₫"
                                        maxFractionDigits="0" />
                                </span>
                            </div>
                        </div>

                        <!-- Back Button -->
                        <a href="<c:url value='/order/history'/>" class="btn-back">
                            <i class="fas fa-arrow-left"></i>Quay lại danh sách
                        </a>
                    </div>
                </div>
            </div>