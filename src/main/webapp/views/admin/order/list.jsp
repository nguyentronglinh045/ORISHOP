<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

                <!-- Order List Styles -->
                <jsp:include page="sections/styles/list-styles.jsp" />

                <div class="container-fluid px-4 py-4">
                    <!-- Hero Section -->
                    <div class="order-hero mb-4">
                        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                            <div>
                                <h1 class="page-title mb-2">
                                    <i class="fas fa-shopping-bag me-2"></i>Quản lý Đơn hàng
                                </h1>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb mb-0">
                                        <li class="breadcrumb-item">
                                            <a href="<c:url value='/admin/home'/>">
                                                <i class="fas fa-home me-1"></i>Dashboard
                                            </a>
                                        </li>
                                        <li class="breadcrumb-item active">Đơn hàng</li>
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

                    <!-- Main Card -->
                    <div class="card order-card">
                        <div class="card-header">
                            <div class="d-flex justify-content-between align-items-center">
                                <h5 class="mb-0 fw-bold">
                                    <i class="fas fa-list me-2"></i>Danh sách Đơn hàng
                                </h5>
                                <span class="badge bg-light text-dark">
                                    <i class="fas fa-receipt me-1"></i>
                                    ${fn:length(orders)} đơn hàng
                                </span>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <c:choose>
                                <c:when test="${empty orders}">
                                    <!-- Empty State -->
                                    <div class="empty-state text-center py-5">
                                        <i class="fas fa-shopping-bag empty-icon mb-3"></i>
                                        <h4 class="text-muted mb-2">Chưa có đơn hàng nào</h4>
                                        <p class="text-muted mb-4">Các đơn hàng mới sẽ hiển thị ở đây</p>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <!-- Orders Table -->
                                    <div class="table-responsive">
                                        <table class="table order-table mb-0">
                                            <thead>
                                                <tr>
                                                    <th class="text-center" style="width: 100px;">Mã đơn</th>
                                                    <th>Khách hàng</th>
                                                    <th class="text-center">Ngày đặt</th>
                                                    <th class="text-center">Tổng tiền</th>
                                                    <th class="text-center">Trạng thái</th>
                                                    <th class="text-center" style="width: 120px;">Thao tác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${orders}" var="o" varStatus="status">
                                                    <tr class="order-row">
                                                        <td class="text-center">
                                                            <span class="order-id">#${o.orderId}</span>
                                                        </td>
                                                        <td>
                                                            <div class="customer-info">
                                                                <div class="customer-avatar">
                                                                    ${fn:substring(o.user.fullname, 0, 1)}
                                                                </div>
                                                                <div class="customer-details">
                                                                    <span
                                                                        class="customer-name">${o.user.fullname}</span>
                                                                    <span class="customer-phone">
                                                                        <i class="fas fa-phone-alt me-1"></i>${o.phone}
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="text-center">
                                                            <div class="order-date">
                                                                <span class="order-date-day">
                                                                    <fmt:formatDate value="${o.orderDate}"
                                                                        pattern="dd/MM/yyyy" />
                                                                </span>
                                                                <span class="order-date-time">
                                                                    <fmt:formatDate value="${o.orderDate}"
                                                                        pattern="HH:mm" />
                                                                </span>
                                                            </div>
                                                        </td>
                                                        <td class="text-center">
                                                            <span class="amount-display">
                                                                <fmt:formatNumber value="${o.amount}" type="number"
                                                                    groupingUsed="true" />₫
                                                            </span>
                                                        </td>
                                                        <td class="text-center">
                                                            <c:choose>
                                                                <c:when test="${o.status == 'Chờ xử lý'}">
                                                                    <span class="status-badge pending">
                                                                        <i class="fas fa-clock"></i>Chờ xử lý
                                                                    </span>
                                                                </c:when>
                                                                <c:when test="${o.status == 'Đang giao'}">
                                                                    <span class="status-badge shipping">
                                                                        <i class="fas fa-truck"></i>Đang giao
                                                                    </span>
                                                                </c:when>
                                                                <c:when test="${o.status == 'Đã giao'}">
                                                                    <span class="status-badge delivered">
                                                                        <i class="fas fa-check-circle"></i>Đã giao
                                                                    </span>
                                                                </c:when>
                                                                <c:when test="${o.status == 'Đã hủy'}">
                                                                    <span class="status-badge cancelled">
                                                                        <i class="fas fa-times-circle"></i>Đã hủy
                                                                    </span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span
                                                                        class="status-badge pending">${o.status}</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td class="text-center">
                                                            <div class="action-buttons">
                                                                <a href="<c:url value='/admin/order/edit?id=${o.orderId}'/>"
                                                                    class="btn btn-edit" title="Cập nhật">
                                                                    <i class="fas fa-edit"></i>
                                                                </a>
                                                                <a href="<c:url value='/admin/order/delete?id=${o.orderId}'/>"
                                                                    class="btn btn-delete"
                                                                    onclick="return confirm('Bạn có chắc chắn muốn xóa đơn hàng này?');"
                                                                    title="Xóa">
                                                                    <i class="fas fa-trash-alt"></i>
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>