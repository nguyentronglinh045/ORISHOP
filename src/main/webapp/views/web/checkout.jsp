<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%@ include file="sections/styles/checkout-styles.jsp" %>

<div class="checkout-hero">
    <div class="container">
        <div class="hero-content text-center">
            <h1 class="hero-title">
                <i class="fas fa-credit-card me-2"></i>Thanh toán
            </h1>
            <p class="hero-subtitle">Hoàn tất thông tin để đặt hàng</p>

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

    <c:if test="${not empty sessionScope.cart}">
        <form action="<c:url value='/order/checkout'/>" method="post">
            <div class="row">
                <div class="col-lg-7 mb-4">
                    <div class="checkout-card">
                        <div class="card-header">
                            <i class="fas fa-truck me-2"></i>Thông tin giao hàng
                        </div>
                        <div class="card-body">
                            <c:if test="${sessionScope.account == null}">
                                <div class="login-prompt">
                                    <i class="fas fa-user-circle"></i>
                                    <div>
                                        Bạn đã có tài khoản?
                                        <a href="<c:url value='/login'/>">Đăng nhập</a> để thanh toán
                                        nhanh hơn.
                                    </div>
                                </div>
                            </c:if>

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

                            <div class="form-group">
                                <label class="form-label">
                                    <i class="fas fa-map-marker-alt me-1 text-primary"></i>
                                    Địa chỉ nhận hàng <span class="text-danger">*</span>
                                </label>
                                <textarea class="form-control" name="address" rows="3"
                                    placeholder="Số nhà, tên đường, phường/xã, quận/huyện, tỉnh/thành phố..."
                                    required></textarea>
                                <div class="form-text">Vui lòng nhập địa chỉ chi tiết để shipper giao
                                    hàng nhanh chóng</div>
                            </div>

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

                <div class="col-lg-5">
                    <div class="summary-card">
                        <div class="card-header">
                            <i class="fas fa-shopping-bag me-2"></i>Đơn hàng của bạn
                        </div>

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

                        <div class="order-total">
                            <span class="order-total-label">Tổng tiền</span>
                            <span class="order-total-value">
                                <fmt:formatNumber value="${total}" type="currency" currencySymbol="₫" />
                            </span>
                        </div>

                        <div class="p-3">
                            <button type="submit" class="btn-place-order mb-3">
                                <i class="fas fa-money-bill-wave me-2"></i>Thanh toán khi nhận hàng (COD)
                            </button>
                            
                            <div class="text-center position-relative mb-3">
                                <hr class="m-0">
                                <span class="position-absolute top-50 start-50 translate-middle bg-white px-2 text-muted small">HOẶC</span>
                            </div>

                            <a href="<c:url value='/payment/create'/>" 
                               class="btn btn-outline-primary w-100 py-3 mb-3 fw-bold rounded-pill d-flex align-items-center justify-content-center" 
                               style="border: 2px solid #005baa; color: #005baa; background: transparent; transition: all 0.3s;">
                                <i class="fas fa-university me-2" style="font-size: 1.2rem;"></i>
                                Thanh toán Online (Ngân hàng NCB)
                            </a>

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