<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

            <style>
                /* ===== CHECKOUT PAGE STYLES ===== */

                /* Hero Section */
                .checkout-hero {
                    background: linear-gradient(135deg, #fff5f8 0%, #ffd1dc 50%, #ffb6c1 100%);
                    padding: 2.5rem 0;
                    margin-bottom: 2rem;
                    position: relative;
                    overflow: hidden;
                }

                .checkout-hero::before {
                    content: '';
                    position: absolute;
                    top: -50%;
                    right: -10%;
                    width: 300px;
                    height: 300px;
                    background: radial-gradient(circle, rgba(255, 107, 157, 0.2) 0%, transparent 70%);
                    border-radius: 50%;
                }

                .hero-content {
                    position: relative;
                    z-index: 1;
                }

                .hero-title {
                    font-family: 'Quicksand', sans-serif;
                    font-size: 2.25rem;
                    font-weight: 700;
                    color: var(--dark);
                    margin-bottom: 0.5rem;
                }

                .hero-title i {
                    color: var(--primary);
                }

                .hero-subtitle {
                    color: var(--dark-light);
                }

                /* Steps Indicator */
                .checkout-steps {
                    display: flex;
                    justify-content: center;
                    gap: 1rem;
                    margin-top: 1.5rem;
                }

                .step-item {
                    display: flex;
                    align-items: center;
                    gap: 0.5rem;
                    padding: 0.5rem 1rem;
                    background: rgba(255, 255, 255, 0.8);
                    border-radius: 50px;
                    font-weight: 600;
                    color: var(--dark-light);
                }

                .step-item.active {
                    background: white;
                    color: var(--primary);
                    box-shadow: 0 2px 8px rgba(255, 107, 157, 0.2);
                }

                .step-item.completed {
                    background: var(--primary);
                    color: white;
                }

                .step-number {
                    width: 28px;
                    height: 28px;
                    border-radius: 50%;
                    background: currentColor;
                    color: white;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 0.85rem;
                }

                .step-item.active .step-number {
                    background: var(--primary);
                }

                .step-item.completed .step-number {
                    background: white;
                    color: var(--primary);
                }

                /* Empty Cart Alert */
                .empty-alert {
                    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                    border: none;
                    border-radius: 20px;
                    padding: 2rem;
                    text-align: center;
                }

                .empty-alert i {
                    font-size: 3rem;
                    color: var(--primary);
                    margin-bottom: 1rem;
                }

                /* Form Card */
                .checkout-card {
                    border: none;
                    border-radius: 20px;
                    box-shadow: var(--shadow-md);
                    overflow: hidden;
                    background: white;
                }

                .checkout-card .card-header {
                    background: var(--gradient-primary);
                    color: white;
                    font-weight: 700;
                    font-family: 'Quicksand', sans-serif;
                    padding: 1.25rem 1.5rem;
                    border: none;
                }

                .checkout-card .card-body {
                    padding: 2rem;
                }

                /* Login Prompt */
                .login-prompt {
                    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                    border-radius: 15px;
                    padding: 1rem 1.5rem;
                    margin-bottom: 1.5rem;
                    display: flex;
                    align-items: center;
                    gap: 1rem;
                }

                .login-prompt i {
                    font-size: 1.5rem;
                    color: var(--primary);
                }

                .login-prompt a {
                    color: var(--primary);
                    font-weight: 600;
                    text-decoration: none;
                }

                .login-prompt a:hover {
                    text-decoration: underline;
                }

                /* Form Styles */
                .form-group {
                    margin-bottom: 1.5rem;
                }

                .form-label {
                    font-weight: 600;
                    color: var(--dark);
                    margin-bottom: 0.5rem;
                    font-family: 'Quicksand', sans-serif;
                }

                .form-label .text-danger {
                    color: #e74c3c !important;
                }

                .input-group-text {
                    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                    border: 2px solid #ffd1dc;
                    border-right: none;
                    color: var(--primary);
                    padding: 12px 15px;
                    border-radius: 12px 0 0 12px;
                }

                .form-control {
                    border: 2px solid #ffd1dc;
                    padding: 12px 15px;
                    border-radius: 12px;
                    transition: all 0.3s ease;
                }

                .input-group .form-control {
                    border-left: none;
                    border-radius: 0 12px 12px 0;
                }

                .form-control:focus {
                    border-color: var(--primary);
                    box-shadow: 0 0 0 3px rgba(255, 107, 157, 0.15);
                }

                textarea.form-control {
                    border-radius: 12px;
                    border: 2px solid #ffd1dc;
                }

                .form-text {
                    color: var(--dark-light);
                    font-size: 0.85rem;
                    margin-top: 0.5rem;
                }

                /* Order Summary Card */
                .summary-card {
                    border: none;
                    border-radius: 20px;
                    box-shadow: var(--shadow-md);
                    overflow: hidden;
                    background: white;
                    position: sticky;
                    top: 100px;
                }

                .summary-card .card-header {
                    background: var(--gradient-primary);
                    color: white;
                    font-weight: 700;
                    font-family: 'Quicksand', sans-serif;
                    padding: 1.25rem 1.5rem;
                    border: none;
                }

                /* Order Items */
                .order-item {
                    display: flex;
                    gap: 1rem;
                    padding: 1rem;
                    border-bottom: 1px dashed #ffd1dc;
                }

                .order-item:last-child {
                    border-bottom: none;
                }

                .order-item-image {
                    width: 60px;
                    height: 60px;
                    border-radius: 10px;
                    object-fit: cover;
                    background: linear-gradient(135deg, #fff5f8, #ffeef3);
                    padding: 0.25rem;
                }

                .order-item-info {
                    flex: 1;
                }

                .order-item-name {
                    font-weight: 600;
                    color: var(--dark);
                    font-size: 0.95rem;
                    margin-bottom: 0.25rem;
                }

                .order-item-details {
                    font-size: 0.85rem;
                    color: var(--dark-light);
                }

                .order-item-price {
                    font-weight: 600;
                    color: var(--dark);
                    white-space: nowrap;
                }

                /* Total Section */
                .order-total {
                    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                    padding: 1.25rem;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }

                .order-total-label {
                    font-family: 'Quicksand', sans-serif;
                    font-weight: 700;
                    font-size: 1.1rem;
                    color: var(--dark);
                }

                .order-total-value {
                    font-family: 'Quicksand', sans-serif;
                    font-weight: 700;
                    font-size: 1.35rem;
                    color: var(--primary);
                }

                /* Action Buttons */
                .btn-place-order {
                    width: 100%;
                    background: var(--gradient-primary);
                    border: none;
                    color: white;
                    font-weight: 700;
                    padding: 1rem;
                    border-radius: 50px;
                    font-size: 1.1rem;
                    transition: all 0.3s ease;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                .btn-place-order:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 8px 25px rgba(255, 107, 157, 0.4);
                    color: white;
                }

                .btn-back-cart {
                    width: 100%;
                    border: 2px solid var(--primary);
                    background: transparent;
                    color: var(--primary);
                    font-weight: 600;
                    padding: 0.875rem;
                    border-radius: 50px;
                    transition: all 0.3s ease;
                    text-decoration: none;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin-top: 0.75rem;
                }

                .btn-back-cart:hover {
                    background: var(--gradient-primary);
                    border-color: var(--primary);
                    color: white;
                }

                /* Responsive */
                @media (max-width: 991px) {
                    .summary-card {
                        position: relative;
                        top: 0;
                        margin-top: 2rem;
                    }
                }

                @media (max-width: 767px) {
                    .checkout-hero {
                        padding: 1.5rem 0;
                    }

                    .hero-title {
                        font-size: 1.75rem;
                    }

                    .checkout-steps {
                        flex-direction: column;
                        align-items: center;
                    }

                    .checkout-card .card-body {
                        padding: 1.5rem;
                    }

                    .order-total-value {
                        font-size: 1.15rem;
                    }
                }
            </style>

            <!-- Hero Section -->
            <div class="checkout-hero">
                <div class="container">
                    <div class="hero-content text-center">
                        <h1 class="hero-title">
                            <i class="fas fa-credit-card me-2"></i>Thanh toán
                        </h1>
                        <p class="hero-subtitle">Hoàn tất thông tin để đặt hàng</p>

                        <!-- Checkout Steps -->
                        <div class="checkout-steps">
                            <div class="step-item completed">
                                <span class="step-number"><i class="fas fa-check"></i></span>
                                <span>Giỏ hàng</span>
                            </div>
                            <div class="step-item active">
                                <span class="step-number">2</span>
                                <span>Thanh toán</span>
                            </div>
                            <div class="step-item">
                                <span class="step-number">3</span>
                                <span>Hoàn tất</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container pb-5">
                <!-- Empty Cart -->
                <c:if test="${empty sessionScope.cart or sessionScope.cart.size() == 0}">
                    <div class="empty-alert">
                        <i class="fas fa-shopping-cart"></i>
                        <h4 class="fw-bold mb-2">Giỏ hàng trống</h4>
                        <p class="mb-3">Vui lòng thêm sản phẩm vào giỏ hàng trước khi thanh toán.</p>
                        <a href="<c:url value='/product'/>" class="btn btn-primary px-4 py-2 rounded-pill">
                            <i class="fas fa-shopping-bag me-2"></i>Mua sắm ngay
                        </a>
                    </div>
                </c:if>

                <!-- Checkout Form -->
                <c:if test="${not empty sessionScope.cart}">
                    <form action="<c:url value='/order/checkout'/>" method="post">
                        <div class="row">
                            <!-- Shipping Info -->
                            <div class="col-lg-7 mb-4">
                                <div class="checkout-card">
                                    <div class="card-header">
                                        <i class="fas fa-truck me-2"></i>Thông tin giao hàng
                                    </div>
                                    <div class="card-body">
                                        <!-- Login Prompt -->
                                        <c:if test="${sessionScope.account == null}">
                                            <div class="login-prompt">
                                                <i class="fas fa-user-circle"></i>
                                                <div>
                                                    Bạn đã có tài khoản?
                                                    <a href="<c:url value='/login'/>">Đăng nhập</a> để thanh toán nhanh
                                                    hơn.
                                                </div>
                                            </div>
                                        </c:if>

                                        <!-- Full Name -->
                                        <div class="form-group">
                                            <label class="form-label">
                                                <i class="fas fa-user me-1 text-primary"></i>
                                                Họ và tên người nhận <span class="text-danger">*</span>
                                            </label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                                <input type="text" class="form-control" name="fullname"
                                                    value="${sessionScope.account.fullname}"
                                                    placeholder="Nhập họ và tên..." required>
                                            </div>
                                        </div>

                                        <!-- Phone -->
                                        <div class="form-group">
                                            <label class="form-label">
                                                <i class="fas fa-phone me-1 text-primary"></i>
                                                Số điện thoại <span class="text-danger">*</span>
                                            </label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                                <input type="text" class="form-control" name="phone"
                                                    value="${sessionScope.account.phone}"
                                                    placeholder="Nhập số điện thoại..." required>
                                            </div>
                                        </div>

                                        <!-- Address -->
                                        <div class="form-group">
                                            <label class="form-label">
                                                <i class="fas fa-map-marker-alt me-1 text-primary"></i>
                                                Địa chỉ nhận hàng <span class="text-danger">*</span>
                                            </label>
                                            <textarea class="form-control" name="address" rows="3"
                                                placeholder="Số nhà, tên đường, phường/xã, quận/huyện, tỉnh/thành phố..."
                                                required></textarea>
                                            <div class="form-text">Vui lòng nhập địa chỉ chi tiết để shipper giao hàng
                                                nhanh chóng</div>
                                        </div>

                                        <!-- Note -->
                                        <div class="form-group mb-0">
                                            <label class="form-label">
                                                <i class="fas fa-sticky-note me-1 text-primary"></i>
                                                Ghi chú (Tùy chọn)
                                            </label>
                                            <textarea class="form-control" name="note" rows="2"
                                                placeholder="Ghi chú cho đơn hàng: thời gian giao hàng, hướng dẫn..."></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Order Summary -->
                            <div class="col-lg-5">
                                <div class="summary-card">
                                    <div class="card-header">
                                        <i class="fas fa-shopping-bag me-2"></i>Đơn hàng của bạn
                                    </div>

                                    <!-- Order Items -->
                                    <div class="order-items">
                                        <c:set var="total" value="0" />
                                        <c:forEach items="${sessionScope.cart}" var="entry">
                                            <c:set var="item" value="${entry.value}" />
                                            <c:set var="total" value="${total + item.totalPrice}" />
                                            <div class="order-item">
                                                <c:choose>
                                                    <c:when test="${not empty item.image}">
                                                        <img src="<c:url value='/assets/uploads/product/${item.image}'/>"
                                                            class="order-item-image" alt="${item.productName}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="https://placehold.co/60x60/fff5f8/ff6b9d?text=P"
                                                            class="order-item-image" alt="No Image">
                                                    </c:otherwise>
                                                </c:choose>
                                                <div class="order-item-info">
                                                    <div class="order-item-name">${item.productName}</div>
                                                    <div class="order-item-details">
                                                        SL: ${item.quantity} ×
                                                        <fmt:formatNumber value="${item.unitPrice}" type="currency"
                                                            currencySymbol="₫" />
                                                    </div>
                                                </div>
                                                <div class="order-item-price">
                                                    <fmt:formatNumber value="${item.totalPrice}" type="currency"
                                                        currencySymbol="₫" />
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>

                                    <!-- Total -->
                                    <div class="order-total">
                                        <span class="order-total-label">Tổng tiền</span>
                                        <span class="order-total-value">
                                            <fmt:formatNumber value="${total}" type="currency" currencySymbol="₫" />
                                        </span>
                                    </div>

                                    <!-- Actions -->
                                    <div class="p-3">
                                        <button type="submit" class="btn-place-order">
                                            <i class="fas fa-check-circle me-2"></i>Xác nhận đặt hàng
                                        </button>
                                        <a href="<c:url value='/cart'/>" class="btn-back-cart">
                                            <i class="fas fa-arrow-left me-2"></i>Quay lại giỏ hàng
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </c:if>
            </div>