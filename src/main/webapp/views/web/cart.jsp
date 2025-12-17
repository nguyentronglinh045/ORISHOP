<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%@ include file="sections/styles/cart-styles.jsp" %>

<div class="cart-hero">
    <div class="container">
        <div class="hero-content">
            <h1 class="hero-title">
                <i class="fas fa-shopping-cart me-2"></i>Giỏ hàng của bạn
            </h1>
            <p class="hero-subtitle">Kiểm tra sản phẩm trước khi thanh toán</p>
        </div>
    </div>
</div>

<div class="container pb-5">
    <c:if test="${empty sessionScope.cart or sessionScope.cart.size() == 0}">
        <div class="empty-cart">
            <i class="fas fa-shopping-cart empty-cart-icon"></i>
            <h3>Giỏ hàng đang trống!</h3>
            <p>Hãy quay lại cửa hàng và chọn sản phẩm yêu thích nhé.</p>
            <a href="<c:url value='/product'/>" class="btn btn-primary px-5 py-3 rounded-pill fw-bold">
                <i class="fas fa-shopping-bag me-2"></i>Tiếp tục mua sắm
            </a>
        </div>
    </c:if>

    <c:if test="${not empty sessionScope.cart and sessionScope.cart.size() > 0}">
        <c:set var="totalAmount" value="0" />
        <c:forEach items="${sessionScope.cart}" var="entry">
            <c:set var="totalAmount" value="${totalAmount + entry.value.totalPrice}" />
        </c:forEach>

        <div class="row">
            <div class="col-lg-8 mb-4">
                <div class="cart-card desktop-cart">
                    <div class="card-header">
                        <i class="fas fa-box me-2"></i>Sản phẩm trong giỏ (${sessionScope.cart.size()})
                    </div>
                    <div class="table-responsive">
                        <table class="table cart-table">
                            <thead>
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th>Đơn giá</th>
                                    <th>Số lượng</th>
                                    <th>Thành tiền</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${sessionScope.cart}" var="entry">
                                    <c:set var="item" value="${entry.value}" />
                                    <tr>
                                        <td>
                                            <div class="cart-product">
                                                <c:choose>
                                                    <c:when test="${not empty item.image}">
                                                        <img src="<c:url value='/assets/uploads/product/${item.image}'/>"
                                                            class="cart-product-image" alt="${item.productName}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="https://placehold.co/80x80/fff5f8/ff6b9d?text=P"
                                                            class="cart-product-image" alt="No Image">
                                                    </c:otherwise>
                                                </c:choose>
                                                <div class="cart-product-info">
                                                    <h6>
                                                        <a href="<c:url value='/product/detail?id=${item.productId}'/>">${item.productName}</a>
                                                    </h6>
                                                    <small>Mã SP: #${item.productId}</small>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex flex-column">
                                                <c:choose>
                                                    <c:when test="${item.product.discount > 0}">
                                                        <span class="text-decoration-line-through text-muted small">
                                                            <fmt:formatNumber value="${item.product.price}" type="number" groupingUsed="true" />₫
                                                        </span>
                                                        <span class="cart-price text-danger">
                                                            <fmt:formatNumber value="${item.unitPrice}" type="currency" currencySymbol="₫" />
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="cart-price">
                                                            <fmt:formatNumber value="${item.unitPrice}" type="currency" currencySymbol="₫" />
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </td>
                                        <td>
                                            <form action="<c:url value='/cart/update'/>" method="post" class="qty-form">
                                                <input type="hidden" name="pid" value="${item.productId}">
                                                <input type="number" name="quantity" value="${item.quantity}" min="1"
                                                    class="qty-input">
                                                <button type="submit" class="btn-update-qty">
                                                    <i class="fas fa-sync-alt"></i>
                                                </button>
                                            </form>
                                        </td>
                                        <td>
                                            <span class="cart-total-price">
                                                <fmt:formatNumber value="${item.totalPrice}" type="currency"
                                                    currencySymbol="₫" />
                                            </span>
                                        </td>
                                        <td>
                                            <button type="button" class="btn-remove" data-bs-toggle="modal"
                                                data-bs-target="#deleteModal" data-product-id="${item.productId}"
                                                data-product-name="${item.productName}">
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <c:forEach items="${sessionScope.cart}" var="entry">
                    <c:set var="item" value="${entry.value}" />
                    <div class="mobile-cart-item">
                        <div class="mobile-cart-header">
                            <c:choose>
                                <c:when test="${not empty item.image}">
                                    <img src="<c:url value='/assets/uploads/product/${item.image}'/>"
                                        class="mobile-cart-image" alt="${item.productName}">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://placehold.co/80x80/fff5f8/ff6b9d?text=P"
                                        class="mobile-cart-image" alt="No Image">
                                </c:otherwise>
                            </c:choose>
                            <div class="mobile-cart-info">
                                <h6 class="fw-bold mb-1">${item.productName}</h6>
                                
                                <c:choose>
                                    <c:when test="${item.product.discount > 0}">
                                        <div class="text-muted small text-decoration-line-through">
                                            <fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="₫" />
                                        </div>
                                        <div class="text-danger fw-bold">
                                            <fmt:formatNumber value="${item.unitPrice}" type="currency" currencySymbol="₫" />
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="text-primary fw-bold">
                                            <fmt:formatNumber value="${item.unitPrice}" type="currency" currencySymbol="₫" />
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="mobile-cart-footer">
                            <form action="<c:url value='/cart/update'/>" method="post" class="qty-form">
                                <input type="hidden" name="pid" value="${item.productId}">
                                <input type="number" name="quantity" value="${item.quantity}" min="1" class="qty-input">
                                <button type="submit" class="btn-update-qty">
                                    <i class="fas fa-sync-alt"></i>
                                </button>
                            </form>
                            <div class="d-flex align-items-center gap-2">
                                <span class="fw-bold text-primary">
                                    <fmt:formatNumber value="${item.totalPrice}" type="currency" currencySymbol="₫" />
                                </span>
                                <button type="button" class="btn-remove" data-bs-toggle="modal"
                                    data-bs-target="#deleteModal" data-product-id="${item.productId}"
                                    data-product-name="${item.productName}">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="col-lg-4">
                <div class="summary-card">
                    <div class="card-header">
                        <i class="fas fa-receipt me-2"></i>Tổng đơn hàng
                    </div>
                    <div class="card-body">
                        <div class="summary-row">
                            <span class="summary-label">Tạm tính:</span>
                            <span class="summary-value">
                                <fmt:formatNumber value="${totalAmount}" type="currency" currencySymbol="₫" />
                            </span>
                        </div>
                        <div class="summary-row">
                            <span class="summary-label">Phí vận chuyển:</span>
                            <span class="free-shipping">
                                <i class="fas fa-check-circle"></i>Miễn phí
                            </span>
                        </div>
                        <div class="summary-row border-top">
                            <span class="summary-total-label">Thành tiền:</span>
                            <span class="summary-total-value">
                                <fmt:formatNumber value="${totalAmount}" type="currency" currencySymbol="₫" />
                            </span>
                        </div>

                        <div class="mt-4">
                            <a href="<c:url value='/cart/checkout'/>" class="btn-checkout">
                                <i class="fas fa-credit-card me-2"></i>Tiến hành thanh toán
                            </a>
                            <a href="<c:url value='/product'/>" class="btn-continue">
                                <i class="fas fa-arrow-left me-2"></i>Tiếp tục mua hàng
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</div>

<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title text-dark w-100" id="deleteModalLabel">
                    <i class="fas fa-exclamation-triangle text-warning me-2"></i>Xác nhận xóa sản phẩm
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center py-3">
                <p class="mb-0 text-dark">Bạn có muốn xóa sản phẩm</p>
                <p class="fw-bold text-primary mb-0 mt-1" id="productNameToDelete"></p>
                <p class="mb-0 text-dark mt-1">khỏi giỏ hàng không?</p>
            </div>
            <div class="modal-footer border-0 d-flex justify-content-center gap-3 pt-0">
                <button type="button" class="btn btn-secondary d-flex align-items-center justify-content-center"
                    data-bs-dismiss="modal" style="min-width: 120px; height: 42px;">
                    <i class="fas fa-times me-2"></i>Hủy
                </button>
                <a href="#" id="confirmDeleteBtn"
                    class="btn btn-danger d-flex align-items-center justify-content-center"
                    style="min-width: 120px; height: 42px;">
                    <i class="fas fa-trash-alt me-2"></i>Xóa
                </a>
            </div>
        </div>
    </div>
</div>

<script>
    // Handle delete modal
    const deleteModal = document.getElementById('deleteModal');
    if (deleteModal) {
        deleteModal.addEventListener('show.bs.modal', function (event) {
            const button = event.relatedTarget;
            const productId = button.getAttribute('data-product-id');
            const productName = button.getAttribute('data-product-name');

            const productNameElement = document.getElementById('productNameToDelete');
            const confirmBtn = document.getElementById('confirmDeleteBtn');

            productNameElement.textContent = productName;
            confirmBtn.href = '${pageContext.request.contextPath}/cart/remove?pid=' + productId;
        });
    }
</script>