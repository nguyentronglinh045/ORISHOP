<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

            <div class="container mt-5 mb-5">
                <h2 class="mb-4 fw-bold">
                    <i class="fas fa-shopping-cart me-2 text-primary"></i>Giỏ hàng của bạn
                </h2>

                <c:if test="${empty sessionScope.cart or sessionScope.cart.size() == 0}">
                    <div class="alert alert-info text-center rounded-custom py-5">
                        <i class="fas fa-shopping-cart fa-4x mb-3 text-primary"></i>
                        <h4 class="fw-bold">Giỏ hàng đang trống!</h4>
                        <p class="mb-4">Hãy quay lại trang chủ để chọn mua sản phẩm yêu thích nhé.</p>
                        <a href="<c:url value='/product'/>" class="btn btn-primary btn-lg">
                            <i class="fas fa-arrow-left me-2"></i>Tiếp tục mua sắm
                        </a>
                    </div>
                </c:if>

                <c:if test="${not empty sessionScope.cart and sessionScope.cart.size() > 0}">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover align-middle rounded-custom overflow-hidden">
                                    <thead>
                                        <tr>
                                            <th>Sản phẩm</th>
                                            <th style="width: 15%">Đơn giá</th>
                                            <th style="width: 15%">Số lượng</th>
                                            <th style="width: 15%">Thành tiền</th>
                                            <th style="width: 10%">Xóa</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Tính tổng tiền -->
                                        <c:set var="totalAmount" value="0" />

                                        <c:forEach items="${sessionScope.cart}" var="entry">
                                            <c:set var="item" value="${entry.value}" />
                                            <c:set var="totalAmount" value="${totalAmount + item.totalPrice}" />

                                            <tr>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <c:choose>
                                                            <c:when test="${not empty item.image}">
                                                                <img src="<c:url value='/assets/uploads/product/${item.image}'/>"
                                                                    width="70" height="70" class="img-thumbnail rounded-custom me-3" style="object-fit: cover;">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="https://placehold.co/70x70/fff5f8/ff6b9d?text=Thumb"
                                                                    width="70" height="70" class="img-thumbnail rounded-custom me-3" style="object-fit: cover;">
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <div>
                                                            <h6 class="mb-0"><a
                                                                    href="<c:url value='/product/detail?id=${item.productId}'/>"
                                                                    class="text-decoration-none text-dark">${item.productName}</a>
                                                            </h6>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <fmt:formatNumber value="${item.unitPrice}" type="currency"
                                                        currencySymbol="₫" />
                                                </td>
                                                <td>
                                                    <!-- Form cập nhật số lượng -->
                                                    <form action="<c:url value='/cart/update'/>" method="post"
                                                        class="d-flex">
                                                        <input type="hidden" name="pid" value="${item.productId}">
                                                        <input type="number" name="quantity" value="${item.quantity}"
                                                            min="1" class="form-control form-control-sm me-1"
                                                            style="width: 60px;">
                                                        <button type="submit"
                                                            class="btn btn-sm btn-outline-secondary"><i
                                                                class="fas fa-sync-alt"></i></button>
                                                    </form>
                                                </td>
                                                <td class="text-primary fw-bold fs-6">
                                                    <fmt:formatNumber value="${item.totalPrice}" type="currency"
                                                        currencySymbol="₫" />
                                                </td>
                                                <td class="text-center">
                                                    <a href="<c:url value='/cart/remove?pid=${item.productId}'/>"
                                                        class="btn btn-sm btn-danger rounded-custom"
                                                        onclick="return confirm('Xóa sản phẩm này khỏi giỏ?');">
                                                        <i class="fas fa-trash"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Tổng kết đơn hàng -->
                        <div class="col-md-4">
                            <div class="card shadow-custom border-0 sticky-top" style="top: 100px;">
                                <div class="card-header">
                                    <h5 class="mb-0 fw-bold">
                                        <i class="fas fa-calculator me-2"></i>Tổng cộng
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex justify-content-between mb-3">
                                        <span>Tạm tính:</span>
                                        <strong>
                                            <fmt:formatNumber value="${totalAmount}" type="currency"
                                                currencySymbol="₫" />
                                        </strong>
                                    </div>
                                    <div class="d-flex justify-content-between mb-3">
                                        <span>Phí vận chuyển:</span>
                                        <span class="text-success fw-bold">
                                            <i class="fas fa-check-circle me-1"></i>Miễn phí
                                        </span>
                                    </div>
                                    <hr>
                                    <div class="d-flex justify-content-between mb-4">
                                        <span class="fs-5 fw-bold">Thành tiền:</span>
                                        <span class="fs-4 text-primary fw-bold">
                                            <fmt:formatNumber value="${totalAmount}" type="currency"
                                                currencySymbol="₫" />
                                        </span>
                                    </div>
                                    <div class="d-grid gap-2">
                                        <a href="<c:url value='/cart/checkout'/>" class="btn btn-primary btn-lg">
                                            <i class="fas fa-credit-card me-2"></i>Tiến hành thanh toán
                                        </a>
                                        <a href="<c:url value='/product'/>" class="btn btn-outline-primary">
                                            <i class="fas fa-arrow-left me-2"></i>Tiếp tục mua hàng
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>