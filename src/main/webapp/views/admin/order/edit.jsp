<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="container-fluid px-4">
    <h1 class="mt-4">Cập nhật Đơn hàng #${order.orderId}</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="<c:url value='/admin/orders'/>">Đơn hàng</a></li>
        <li class="breadcrumb-item active">Cập nhật</li>
    </ol>

    <div class="row">
        <!-- Cột thông tin đơn hàng -->
        <div class="col-md-8">
            <div class="card mb-4">
                <div class="card-header">Thông tin chi tiết</div>
                <div class="card-body">
                    <form action="<c:url value='/admin/order/update'/>" method="post">
                        <input type="hidden" name="orderId" value="${order.orderId}">
                        <!-- Giữ nguyên các thông tin quan trọng không cho sửa, gửi lại server qua hidden -->
                        <input type="hidden" name="userId" value="${order.user.userId}">
                        <input type="hidden" name="amount" value="${order.amount}">
                        <!-- Ngày tháng cần xử lý cẩn thận nếu gửi lại, ở đây ta chỉ update trạng thái -->

                        <div class="mb-3 row">
                            <label class="col-sm-3 col-form-label">Khách hàng:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control-plaintext" readonly value="${order.user.fullname} (${order.user.username})">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label class="col-sm-3 col-form-label">Ngày đặt:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control-plaintext" readonly value="<fmt:formatDate value='${order.orderDate}' pattern='dd/MM/yyyy HH:mm'/>">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label class="col-sm-3 col-form-label">Tổng tiền:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control-plaintext fw-bold text-danger" readonly value="<fmt:formatNumber value='${order.amount}' type='currency' currencySymbol='đ'/>">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Địa chỉ giao hàng:</label>
                            <input type="text" class="form-control" name="address" value="${order.address}" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Số điện thoại:</label>
                            <input type="text" class="form-control" name="phone" value="${order.phone}" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Trạng thái đơn hàng:</label>
                            <select class="form-select" name="status">
                                <option value="Chờ xử lý" ${order.status == 'Chờ xử lý' ? 'selected' : ''}>Chờ xử lý</option>
                                <option value="Đang giao" ${order.status == 'Đang giao' ? 'selected' : ''}>Đang giao</option>
                                <option value="Đã giao" ${order.status == 'Đã giao' ? 'selected' : ''}>Đã giao</option>
                                <option value="Đã hủy" ${order.status == 'Đã hủy' ? 'selected' : ''}>Đã hủy</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Cập nhật trạng thái</button>
                        <a href="<c:url value='/admin/orders'/>" class="btn btn-secondary">Quay lại</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>