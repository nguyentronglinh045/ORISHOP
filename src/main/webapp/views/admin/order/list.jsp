<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="container-fluid px-4">
    <h1 class="mt-4">Quản lý Đơn hàng</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="<c:url value='/admin/home'/>">Dashboard</a></li>
        <li class="breadcrumb-item active">Đơn hàng</li>
    </ol>

    <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible fade show">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-shopping-cart me-1"></i> Danh sách Đơn hàng
        </div>
        <div class="card-body">
            <table class="table table-bordered table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Khách hàng</th>
                        <th>Ngày đặt</th>
                        <th>Tổng tiền</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${orders}" var="o">
                        <tr>
                            <td>#${o.orderId}</td>
                            <td>
                                <strong>${o.user.fullname}</strong><br>
                                <small>${o.phone}</small>
                            </td>
                            <td>
                                <fmt:formatDate value="${o.orderDate}" pattern="dd/MM/yyyy HH:mm"/>
                            </td>
                            <td class="text-danger fw-bold">
                                <fmt:formatNumber value="${o.amount}" type="currency" currencySymbol="đ"/>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${o.status == 'Chờ xử lý'}"><span class="badge bg-warning text-dark">Chờ xử lý</span></c:when>
                                    <c:when test="${o.status == 'Đang giao'}"><span class="badge bg-info">Đang giao</span></c:when>
                                    <c:when test="${o.status == 'Đã giao'}"><span class="badge bg-success">Đã giao</span></c:when>
                                    <c:when test="${o.status == 'Đã hủy'}"><span class="badge bg-danger">Đã hủy</span></c:when>
                                    <c:otherwise><span class="badge bg-secondary">${o.status}</span></c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="<c:url value='/admin/order/edit?id=${o.orderId}'/>" class="btn btn-primary btn-sm">
                                    <i class="fas fa-edit"></i> Cập nhật
                                </a>
                                <a href="<c:url value='/admin/order/delete?id=${o.orderId}'/>" class="btn btn-danger btn-sm"
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa đơn hàng này?');">
                                    <i class="fas fa-trash-alt"></i> Xóa
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>