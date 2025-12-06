<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="container mt-5 mb-5">
    <h2 class="mb-4 text-center fw-bold">
        <i class="fas fa-credit-card me-2 text-primary"></i>Thanh toán đơn hàng
    </h2>

    <c:if test="${empty sessionScope.cart or sessionScope.cart.size() == 0}">
        <div class="alert alert-info text-center rounded-custom">
            Giỏ hàng trống. 
            <a href="<c:url value='/product'/>" class="fw-bold text-primary">Mua sắm ngay</a>
        </div>
    </c:if>

    <c:if test="${not empty sessionScope.cart}">
        <form action="<c:url value='/order/checkout'/>" method="post">
            <div class="row">
                <!-- Thông tin giao hàng -->
                <div class="col-md-7">
                    <div class="card mb-4 shadow-custom">
                        <div class="card-header fw-bold">
                            <i class="fas fa-truck me-2"></i>Thông tin giao hàng
                        </div>
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
                    <div class="card shadow-custom sticky-top" style="top: 100px;">
                        <div class="card-header fw-bold">
                            <i class="fas fa-shopping-bag me-2"></i>Đơn hàng của bạn
                        </div>
                        <ul class="list-group list-group-flush">
                            <c:set var="total" value="0"/>
                            <c:forEach items="${sessionScope.cart}" var="entry">
                                <c:set var="item" value="${entry.value}"/>
                                <c:set var="total" value="${total + item.totalPrice}"/>
                                <li class="list-group-item d-flex justify-content-between lh-sm">
                                    <div>
                                        <h6 class="my-0">${item.productName}</h6>
                                        <small class="text-muted">SL: ${item.quantity} x <fmt:formatNumber value="${item.unitPrice}" type="currency" currencySymbol="₫"/></small>
                                    </div>
                                    <span class="text-muted"><fmt:formatNumber value="${item.totalPrice}" type="currency" currencySymbol="₫"/></span>
                                </li>
                            </c:forEach>
                            <li class="list-group-item d-flex justify-content-between bg-light-custom">
                                <span class="fw-bold fs-5">Tổng tiền</span>
                                <strong class="text-primary fs-5"><fmt:formatNumber value="${total}" type="currency" currencySymbol="₫"/></strong>
                            </li>
                        </ul>
                        <div class="card-body">
                            <button type="submit" class="btn btn-primary w-100 py-3 btn-lg">
                                <i class="fas fa-check-circle me-2"></i>XÁC NHẬN ĐẶT HÀNG
                            </button>
                            <a href="<c:url value='/cart'/>" class="btn btn-outline-primary w-100 mt-2">
                                <i class="fas fa-arrow-left me-2"></i>Quay lại giỏ hàng
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </c:if>
</div>