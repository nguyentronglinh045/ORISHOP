<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

            <div class="container mt-5">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<c:url value='/home'/>">Trang chủ</a></li>
                        <li class="breadcrumb-item"><a href="<c:url value='/product'/>">Sản phẩm</a></li>
                        <li class="breadcrumb-item active">${product.productName}</li>
                    </ol>
                </nav>

                <div class="row">
                    <!-- Ảnh sản phẩm -->
                    <div class="col-md-5 mb-4">
                        <div class="card border-0 shadow-custom rounded-custom overflow-hidden">
                            <c:choose>
                                <c:when test="${not empty product.image}">
                                    <img src="<c:url value='/assets/uploads/product/${product.image}'/>"
                                        class="img-fluid" alt="${product.productName}">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://placehold.co/600x600/fff5f8/ff6b9d?text=Product+Image"
                                        class="img-fluid" alt="No Image">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <!-- Thông tin chi tiết -->
                    <div class="col-md-7">
                        <h2 class="fw-bold mb-3">${product.productName}</h2>
                        <div class="mb-4">
                            <span class="badge bg-warning text-dark me-2">
                                <i class="fas fa-star"></i> 4.5
                            </span>
                            <span class="text-muted">Mã SP: #${product.productId}</span>
                            <span class="ms-3 text-muted">Danh mục: ${product.category.categoryName}</span>
                        </div>

                        <h3 class="text-primary fw-bold mb-4" style="font-size: 2rem;">
                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" />
                        </h3>

                        <p class="lead mb-4">${product.description}</p>

                        <hr class="my-4">

                        <div class="d-flex align-items-center mb-4">
                            <div class="me-4">
                                <label class="form-label fw-bold mb-2">Số lượng:</label>
                                <input type="number" class="form-control" value="1" min="1" max="${product.quantity}"
                                    style="width: 100px;">
                            </div>
                            <div class="mt-4">
                                <a href="<c:url value='/cart/add?pid=${product.productId}'/>"
                                    class="btn btn-primary btn-lg px-5">
                                    <i class="fas fa-cart-plus me-2"></i>Thêm vào giỏ
                                </a>
                            </div>
                        </div>

                        <div class="alert alert-info rounded-custom">
                            <i class="fas fa-truck me-2"></i>Miễn phí vận chuyển cho đơn hàng trên 500k.
                        </div>
                    </div>
                </div>

                <!-- Sản phẩm liên quan -->
                <c:if test="${not empty relatedProducts}">
                    <div class="mt-5">
                        <h4 class="border-bottom border-primary pb-3 mb-4 fw-bold">
                            <i class="fas fa-heart me-2 text-primary"></i>Sản phẩm cùng loại
                        </h4>
                        <div class="row row-cols-1 row-cols-md-4 g-4">
                            <c:forEach items="${relatedProducts}" var="rp">
                                <c:if test="${rp.productId != product.productId}">
                                    <div class="col">
                                        <div class="card h-100">
                                            <div class="text-center p-2">
                                                <c:choose>
                                                    <c:when test="${not empty rp.image}">
                                                        <img src="<c:url value='/assets/uploads/product/${rp.image}'/>"
                                                            class="card-img-top rounded-custom"
                                                            style="height: 150px; object-fit: contain;">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="https://placehold.co/150x150/fff5f8/ff6b9d?text=Product"
                                                            class="card-img-top rounded-custom"
                                                            style="height: 150px; object-fit: contain;">
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="card-body">
                                                <h6 class="card-title text-truncate"><a
                                                        href="<c:url value='/product/detail?id=${rp.productId}'/>"
                                                        class="text-dark text-decoration-none">${rp.productName}</a>
                                                </h6>
                                                <p class="text-primary fw-bold">
                                                    <fmt:formatNumber value="${rp.price}" type="currency"
                                                        currencySymbol="₫" />
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </div>