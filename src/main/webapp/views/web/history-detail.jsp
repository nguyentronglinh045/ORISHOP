<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="container mt-5 mb-5">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<c:url value='/order/history'/>">Lịch sử đơn hàng</a></li>
            <li class="breadcrumb-item active">Chi tiết đơn hàng #${order.orderId}</li>
        </ol>
    </nav>

    <div class="row">
        <!-- Thông tin đơn hàng -->
        <div class="col-md-12 mb-4">
            <div class="card shadow-custom">
                <div class="card-header fw-bold">
                    <i class="fas fa-info-circle me-2"></i>Thông tin nhận hàng
                </div>
                <div class="card-body">
                    <p class="mb-1"><strong>Người nhận:</strong> ${order.user.fullname}</p>
                    <p class="mb-1"><strong>Số điện thoại:</strong> ${order.phone}</p>
                    <p class="mb-1"><strong>Địa chỉ:</strong> ${order.address}</p>
                    <p class="mb-1"><strong>Ngày đặt:</strong> <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm"/></p>
                    <p class="mb-0"><strong>Trạng thái:</strong> 
                        <span class="badge bg-info text-dark">${order.status}</span>
                    </p>
                </div>
            </div>
        </div>

        <!-- Danh sách sản phẩm -->
        <div class="col-md-12">
            <div class="card shadow-custom">
                <div class="card-header fw-bold">
                    <i class="fas fa-shopping-bag me-2"></i>Sản phẩm đã mua
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered mb-0">
                        <thead class="table-light">
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Đơn giá</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${details}" var="d">
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <c:choose>
                                                <c:when test="${not empty d.product.image}">
                                                    <img src="<c:url value='/assets/uploads/product/${d.product.image}'/>" width="60" height="60" class="img-thumbnail rounded-custom me-3" style="object-fit: cover;">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="https://placehold.co/60x60/fff5f8/ff6b9d?text=Thumb" width="60" height="60" class="img-thumbnail rounded-custom me-3" style="object-fit: cover;">
                                                </c:otherwise>
                                            </c:choose>
                                            ${d.product.productName}
                                        </div>
                                    </td>
                                    <td><fmt:formatNumber value="${d.unitPrice}" type="currency" currencySymbol="₫"/></td>
                                    <td>${d.quantity}</td>
                                    <td class="fw-bold"><fmt:formatNumber value="${d.unitPrice * d.quantity}" type="currency" currencySymbol="₫"/></td>
                                </tr>
                            </c:forEach>
                            <tr class="table-light">
                                <td colspan="3" class="text-end fw-bold">Tổng cộng:</td>
                                <td class="text-primary fw-bold fs-5">
                                    <fmt:formatNumber value="${order.amount}" type="currency" currencySymbol="₫"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="mt-3">
                <a href="<c:url value='/order/history'/>" class="btn btn-outline-primary">
                    <i class="fas fa-arrow-left me-2"></i>Quay lại danh sách
                </a>
            </div>
        </div>
    </div>
</div>