<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

            <head>
                <title>Chi tiết đơn hàng #${order.orderId} - OriShop</title>
            </head>

            <%@ include file="sections/styles/history-detail-styles.jsp" %>

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
                                                    <fmt:formatDate value="${order.orderDate}"
                                                        pattern="dd/MM/yyyy HH:mm" />
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
                                                    <fmt:formatNumber value="${d.unitPrice * d.quantity}"
                                                        type="currency" currencySymbol="₫" maxFractionDigits="0" />
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
