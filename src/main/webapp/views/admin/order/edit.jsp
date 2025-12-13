<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

                <!-- Order Edit Styles -->
                <jsp:include page="sections/styles/edit-styles.jsp" />

                <div class="container-fluid px-4 py-4">
                    <!-- Hero Section -->
                    <div class="order-hero mb-4">
                        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                            <div>
                                <h1 class="page-title mb-2">
                                    <i class="fas fa-edit me-2"></i>Cập nhật Đơn hàng #${order.orderId}
                                </h1>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb mb-0">
                                        <li class="breadcrumb-item">
                                            <a href="<c:url value='/admin/home'/>">
                                                <i class="fas fa-home me-1"></i>Dashboard
                                            </a>
                                        </li>
                                        <li class="breadcrumb-item">
                                            <a href="<c:url value='/admin/orders'/>">Đơn hàng</a>
                                        </li>
                                        <li class="breadcrumb-item active">Cập nhật #${order.orderId}</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>

                    <!-- Alerts -->
                    <c:if test="${not empty message}">
                        <div class="alert alert-success alert-dismissible fade show custom-alert" role="alert">
                            <i class="fas fa-check-circle me-2"></i>${message}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show custom-alert" role="alert">
                            <i class="fas fa-exclamation-circle me-2"></i>${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="<c:url value='/admin/order/update'/>" method="post">
                        <input type="hidden" name="orderId" value="${order.orderId}">
                        <input type="hidden" name="userId" value="${order.user.userId}">
                        <input type="hidden" name="amount" value="${order.amount}">

                        <div class="row">
                            <!-- Main Content -->
                            <div class="col-lg-8">
                                <!-- Customer Info Card -->
                                <div class="card section-card info-card">
                                    <div class="card-header">
                                        <i class="fas fa-user me-2"></i>Thông tin khách hàng
                                    </div>
                                    <div class="card-body p-4">
                                        <div class="customer-card">
                                            <div class="customer-avatar-lg">
                                                ${fn:substring(order.user.fullname, 0, 1)}
                                            </div>
                                            <div class="customer-details-lg">
                                                <div class="customer-name-lg">${order.user.fullname}</div>
                                                <div class="customer-username">@${order.user.username}</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Order Info Card -->
                                <div class="card section-card info-card">
                                    <div class="card-header">
                                        <i class="fas fa-info-circle me-2"></i>Thông tin đơn hàng
                                    </div>
                                    <div class="card-body p-4">
                                        <div class="info-row">
                                            <div class="info-label">
                                                <i class="fas fa-hashtag me-2"></i>Mã đơn hàng
                                            </div>
                                            <div class="info-value highlight">#${order.orderId}</div>
                                        </div>
                                        <div class="info-row">
                                            <div class="info-label">
                                                <i class="fas fa-calendar me-2"></i>Ngày đặt
                                            </div>
                                            <div class="info-value">
                                                <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm" />
                                            </div>
                                        </div>
                                        <div class="info-row">
                                            <div class="info-label">
                                                <i class="fas fa-money-bill me-2"></i>Tổng tiền
                                            </div>
                                            <div class="info-value highlight">
                                                <fmt:formatNumber value="${order.amount}" type="number"
                                                    groupingUsed="true" />₫
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Shipping Info Card -->
                                <div class="card section-card">
                                    <div class="card-header">
                                        <i class="fas fa-truck me-2"></i>Thông tin giao hàng
                                    </div>
                                    <div class="card-body p-4">
                                        <!-- Address -->
                                        <div class="form-group">
                                            <label for="address" class="form-label">
                                                <i class="fas fa-map-marker-alt me-2"></i>Địa chỉ giao hàng <span
                                                    class="text-danger">*</span>
                                            </label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i
                                                        class="fas fa-map-marker-alt"></i></span>
                                                <input type="text" class="form-control" id="address" name="address"
                                                    value="${order.address}" placeholder="Nhập địa chỉ giao hàng..."
                                                    required>
                                            </div>
                                        </div>

                                        <!-- Phone -->
                                        <div class="form-group mb-0">
                                            <label for="phone" class="form-label">
                                                <i class="fas fa-phone me-2"></i>Số điện thoại <span
                                                    class="text-danger">*</span>
                                            </label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                                <input type="tel" class="form-control" id="phone" name="phone"
                                                    value="${order.phone}" placeholder="Nhập số điện thoại..." required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Sidebar -->
                            <div class="col-lg-4">
                                <!-- Status Card -->
                                <div class="card section-card">
                                    <div class="card-header">
                                        <i class="fas fa-flag me-2"></i>Trạng thái đơn hàng
                                    </div>
                                    <div class="card-body p-4">
                                        <div class="status-options">
                                            <div class="status-option">
                                                <input type="radio" id="statusPending" name="status" value="Chờ xử lý"
                                                    ${order.status=='Chờ xử lý' ? 'checked' : '' }>
                                                <label for="statusPending" class="status-pending">
                                                    <i class="fas fa-clock"></i>Chờ xử lý
                                                </label>
                                            </div>
                                            <div class="status-option">
                                                <input type="radio" id="statusShipping" name="status" value="Đang giao"
                                                    ${order.status=='Đang giao' ? 'checked' : '' }>
                                                <label for="statusShipping" class="status-shipping">
                                                    <i class="fas fa-truck"></i>Đang giao
                                                </label>
                                            </div>
                                            <div class="status-option">
                                                <input type="radio" id="statusDelivered" name="status" value="Đã giao"
                                                    ${order.status=='Đã giao' ? 'checked' : '' }>
                                                <label for="statusDelivered" class="status-delivered">
                                                    <i class="fas fa-check-circle"></i>Đã giao
                                                </label>
                                            </div>
                                            <div class="status-option">
                                                <input type="radio" id="statusCancelled" name="status" value="Đã hủy"
                                                    ${order.status=='Đã hủy' ? 'checked' : '' }>
                                                <label for="statusCancelled" class="status-cancelled">
                                                    <i class="fas fa-times-circle"></i>Đã hủy
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Order Summary Card -->
                                <div class="card section-card info-card">
                                    <div class="card-header">
                                        <i class="fas fa-receipt me-2"></i>Tóm tắt đơn hàng
                                    </div>
                                    <div class="card-body p-4">
                                        <div class="order-summary">
                                            <div class="summary-row">
                                                <span class="summary-label">Tạm tính</span>
                                                <span class="summary-value">
                                                    <fmt:formatNumber value="${order.amount}" type="number"
                                                        groupingUsed="true" />₫
                                                </span>
                                            </div>
                                            <div class="summary-row">
                                                <span class="summary-label">Phí vận chuyển</span>
                                                <span class="summary-value">Miễn phí</span>
                                            </div>
                                            <div class="summary-row total">
                                                <span class="summary-label">Tổng cộng</span>
                                                <span class="summary-value total">
                                                    <fmt:formatNumber value="${order.amount}" type="number"
                                                        groupingUsed="true" />₫
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Action Buttons Card -->
                                <div class="card section-card">
                                    <div class="card-body p-4">
                                        <div class="d-grid gap-2">
                                            <button type="submit" class="btn btn-submit">
                                                <i class="fas fa-save me-2"></i>Cập nhật đơn hàng
                                            </button>
                                            <a href="<c:url value='/admin/orders'/>" class="btn btn-back">
                                                <i class="fas fa-arrow-left me-2"></i>Quay lại
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>