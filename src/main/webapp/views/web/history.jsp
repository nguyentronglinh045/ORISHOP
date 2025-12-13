<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

            <%@ include file="sections/styles/history-styles.jsp" %>

                <!-- Hero Section -->
                <section class="history-hero">
                    <div class="container">
                        <div class="history-hero-content">
                            <h1><i class="fas fa-history me-2"></i>Lịch sử đơn hàng</h1>
                            <div class="history-breadcrumb">
                                <a href="<c:url value='/'/>"><i class="fas fa-home me-1"></i>Trang chủ</a>
                                <span>/</span>
                                <span>Đơn hàng của tôi</span>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Main Content -->
                <div class="container py-4">
                    <div class="row">
                        <!-- Sidebar -->
                        <div class="col-lg-3 mb-4">
                            <div class="user-sidebar">
                                <div class="user-header">
                                    <div class="user-avatar">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <h5 class="user-name">${sessionScope.user.fullname}</h5>
                                </div>
                                <ul class="user-menu">
                                    <li>
                                        <a href="<c:url value='/order/history'/>" class="active">
                                            <i class="fas fa-shopping-bag"></i>
                                            <span>Đơn hàng của tôi</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="<c:url value='/logout'/>" class="logout-link">
                                            <i class="fas fa-sign-out-alt"></i>
                                            <span>Đăng xuất</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Content -->
                        <div class="col-lg-9">
                            <div class="history-content">
                                <div class="content-header">
                                    <h3 class="content-title">
                                        <i class="fas fa-box-open me-2 text-primary"></i>Danh sách đơn hàng
                                    </h3>
                                    <c:if test="${not empty orders}">
                                        <span class="order-count">${orders.size()} đơn hàng</span>
                                    </c:if>
                                </div>

                                <!-- Empty State -->
                                <c:if test="${empty orders}">
                                    <div class="empty-state">
                                        <div class="empty-icon">
                                            <i class="fas fa-shopping-bag"></i>
                                        </div>
                                        <h4 class="empty-title">Chưa có đơn hàng</h4>
                                        <p class="empty-text">Bạn chưa có đơn hàng nào. Hãy khám phá các sản phẩm của
                                            chúng tôi!</p>
                                        <a href="<c:url value='/product'/>" class="btn-shop">
                                            <i class="fas fa-shopping-cart me-2"></i>Mua sắm ngay
                                        </a>
                                    </div>
                                </c:if>

                                <!-- Order List -->
                                <c:if test="${not empty orders}">
                                    <div class="order-list">
                                        <c:forEach items="${orders}" var="o">
                                            <div class="order-card">
                                                <div class="order-card-header">
                                                    <span class="order-id">
                                                        <i class="fas fa-receipt me-1"></i>Đơn hàng #${o.orderId}
                                                    </span>
                                                    <span class="order-date">
                                                        <i class="far fa-calendar-alt"></i>
                                                        <fmt:formatDate value="${o.orderDate}"
                                                            pattern="dd/MM/yyyy HH:mm" />
                                                    </span>
                                                </div>
                                                <div class="order-card-body">
                                                    <div class="order-info">
                                                        <div class="info-item">
                                                            <span class="info-label">Tổng tiền</span>
                                                            <span class="info-value price">
                                                                <fmt:formatNumber value="${o.amount}" type="currency"
                                                                    currencySymbol="₫" maxFractionDigits="0" />
                                                            </span>
                                                        </div>
                                                        <div class="info-item">
                                                            <span class="info-label">Trạng thái</span>
                                                            <c:choose>
                                                                <c:when test="${o.status == 'Chờ xử lý'}">
                                                                    <span class="status-badge status-pending">
                                                                        <i class="fas fa-clock"></i>Chờ xử lý
                                                                    </span>
                                                                </c:when>
                                                                <c:when test="${o.status == 'Đang giao'}">
                                                                    <span class="status-badge status-shipping">
                                                                        <i class="fas fa-truck"></i>Đang giao
                                                                    </span>
                                                                </c:when>
                                                                <c:when test="${o.status == 'Đã giao'}">
                                                                    <span class="status-badge status-delivered">
                                                                        <i class="fas fa-check-circle"></i>Đã giao
                                                                    </span>
                                                                </c:when>
                                                                <c:when test="${o.status == 'Đã hủy'}">
                                                                    <span class="status-badge status-cancelled">
                                                                        <i class="fas fa-times-circle"></i>Đã hủy
                                                                    </span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="status-badge status-default">
                                                                        <i class="fas fa-info-circle"></i>${o.status}
                                                                    </span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                    <a href="<c:url value='/order/detail?id=${o.orderId}'/>"
                                                        class="btn-view">
                                                        <i class="fas fa-eye"></i>Xem chi tiết
                                                    </a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>