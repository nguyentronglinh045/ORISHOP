<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="container mt-5 mb-5">
    <h2 class="mb-4 text-center text-uppercase">Thanh toán đơn hàng</h2>

    <c:if test="${empty sessionScope.cart or sessionScope.cart.size() == 0}">
        <div class="alert alert-warning text-center">Giỏ hàng trống. <a href="<c:url value='/product'/>">Mua sắm ngay</a></div>
    </c:if>

    <c:if test="${not empty sessionScope.cart}">
        <form action="<c:url value='/order/checkout'/>" method="post">
            <div class="row">
                <!-- Thông tin giao hàng -->
                <div class="col-md-7">
                    <div class="card mb-4">
                        <div class="card-header bg-light fw-bold">Thông tin giao hàng</div>
                        <div class="card-body">
                            <!-- Nếu chưa đăng nhập thì yêu cầu đăng nhập -->
                            <c:if test="${sessionScope.account == null}">
                                <div class="alert alert-info">
                                    Bạn đã có tài khoản? <a href="<c:url value='/login'/>">Đăng nhập</a> để thanh toán nhanh hơn.
                                </div>
                            </c:if>

                            <div class="mb-3">
                                <label class="form-label">Họ và tên người nhận:</label>
                                <input type="text" class="form-control" name="fullname" value="${sessionScope.account.fullname}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Số điện thoại:</label>
                                <input type="text" class="form-control" name="phone" value="${sessionScope.account.phone}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Địa chỉ nhận hàng:</label>
                                <textarea class="form-control" name="address" rows="3" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Ghi chú (Tùy chọn):</label>
                                <textarea class="form-control" name="note" rows="2"></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Tóm tắt đơn hàng -->
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-header bg-light fw-bold">Đơn hàng của bạn</div>
                        <ul class="list-group list-group-flush">
                            <c:set var="total" value="0"/>
                            <c:forEach items="${sessionScope.cart}" var="entry">
                                <c:set var="item" value="${entry.value}"/>
                                <c:set var="total" value="${total + item.totalPrice}"/>
                                <li class="list-group-item d-flex justify-content-between lh-sm">
                                    <div>
                                        <h6 class="my-0">${item.productName}</h6>
                                        <small class="text-muted">SL: ${item.quantity} x <fmt:formatNumber value="${item.unitPrice}" type="currency" currencySymbol="đ"/></small>
                                    </div>
                                    <span class="text-muted"><fmt:formatNumber value="${item.totalPrice}" type="currency" currencySymbol="đ"/></span>
                                </li>
                            </c:forEach>
                            <li class="list-group-item d-flex justify-content-between bg-light">
                                <span class="fw-bold">Tổng tiền (VNĐ)</span>
                                <strong class="text-danger"><fmt:formatNumber value="${total}" type="currency" currencySymbol="đ"/></strong>
                            </li>
                        </ul>
                        <div class="card-body">
                            <button type="submit" class="btn btn-success w-100 py-2">XÁC NHẬN ĐẶT HÀNG</button>
                            <a href="<c:url value='/cart'/>" class="btn btn-link w-100 mt-2">Quay lại giỏ hàng</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </c:if>
</div>