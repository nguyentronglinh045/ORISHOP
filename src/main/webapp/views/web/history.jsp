<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="container mt-5 mb-5">
    <h2 class="mb-4 text-uppercase">Lịch sử đơn hàng</h2>
    
    <div class="row">
        <div class="col-md-3 mb-4">
            <!-- Sidebar User Menu -->
            <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action disabled fw-bold">Tài khoản</a>
                <a href="<c:url value='/order/history'/>" class="list-group-item list-group-item-action active">Đơn hàng của tôi</a>
                <a href="<c:url value='/logout'/>" class="list-group-item list-group-item-action text-danger">Đăng xuất</a>
            </div>
        </div>
        
        <div class="col-md-9">
            <c:if test="${empty orders}">
                <div class="alert alert-info">Bạn chưa có đơn hàng nào. <a href="<c:url value='/product'/>">Mua sắm ngay!</a></div>
            </c:if>

            <c:if test="${not empty orders}">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="table-light">
                            <tr>
                                <th>Mã ĐH</th>
                                <th>Ngày đặt</th>
                                <th>Tổng tiền</th>
                                <th>Trạng thái</th>
                                <th>Chi tiết</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${orders}" var="o">
                                <tr>
                                    <td>#${o.orderId}</td>
                                    <td><fmt:formatDate value="${o.orderDate}" pattern="dd/MM/yyyy HH:mm"/></td>
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
                                        <a href="<c:url value='/order/detail?id=${o.orderId}'/>" class="btn btn-sm btn-outline-primary">
                                            <i class="fas fa-eye"></i> Xem
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>
</div>