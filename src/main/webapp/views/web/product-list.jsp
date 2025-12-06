<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

            <head>
                <title>Sản phẩm - OriShop</title>
            </head>

            <div class="container mt-4">
                <div class="row">
                    <!-- Sidebar Danh mục -->
                    <div class="col-md-3 mb-4">
                        <div class="card shadow-custom">
                            <div class="card-header">
                                <i class="fas fa-list me-2"></i> Danh mục sản phẩm
                            </div>
                            <div class="list-group list-group-flush">
                                <a href="<c:url value='/product'/>"
                                    class="list-group-item list-group-item-action ${empty activeCate ? 'active bg-light-custom text-primary border-primary' : ''}">
                                    <i class="fas fa-th me-2"></i>Tất cả sản phẩm
                                </a>
                                <c:forEach items="${categories}" var="c">
                                    <a href="<c:url value='/product/category?cid=${c.categoryId}'/>"
                                        class="list-group-item list-group-item-action ${activeCate == c.categoryId ? 'active bg-light-custom text-primary border-primary' : ''}">
                                        <c:if test="${not empty c.icon}">
                                            <img src="<c:url value='/assets/uploads/category/${c.icon}'/>" width="20"
                                                height="20" class="me-2">
                                        </c:if>
                                        ${c.categoryName}
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <!-- Danh sách sản phẩm chính -->
                    <div class="col-md-9">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<c:url value='/home'/>">Trang chủ</a></li>
                                <li class="breadcrumb-item active">Sản phẩm</li>
                                <c:if test="${not empty keyword}">
                                    <li class="breadcrumb-item active">Tìm kiếm: "${keyword}"</li>
                                </c:if>
                            </ol>
                        </nav>

                        <!-- Thông báo nếu không có sản phẩm -->
                        <c:if test="${empty products}">
                            <div class="alert alert-info text-center rounded-custom">
                                <i class="fas fa-search fa-3x mb-3 text-primary"></i>
                                <h5 class="fw-bold">Không tìm thấy sản phẩm nào.</h5>
                                <p class="mb-3">Hiện tại hệ thống chưa có dữ liệu hoặc không tìm thấy sản phẩm phù hợp.</p>
                                <c:if test="${sessionScope.account != null && sessionScope.account.role == 1}">
                                    <a href="<c:url value='/admin/product/create'/>" class="btn btn-primary mt-2">
                                        <i class="fas fa-plus me-2"></i>Thêm sản phẩm ngay (Admin)
                                    </a>
                                </c:if>
                            </div>
                        </c:if>

                        <div class="row row-cols-1 row-cols-md-3 g-4">
                            <c:forEach items="${products}" var="p">
                                <div class="col">
                                    <div class="card h-100 shadow-custom card-product">
                                        <div class="position-relative text-center p-3">
                                            <a href="<c:url value='/product/detail?id=${p.productId}'/>">
                                                <c:choose>
                                                    <c:when test="${p.image != null}">
                                                        <img src="<c:url value='/assets/uploads/product/${p.image}'/>"
                                                            class="card-img-top rounded-custom"
                                                            style="height: 220px; object-fit: contain;">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="https://placehold.co/300x300/fff5f8/ff6b9d?text=Product"
                                                            class="card-img-top rounded-custom"
                                                            style="height: 220px; object-fit: contain;">
                                                    </c:otherwise>
                                                </c:choose>
                                            </a>
                                        </div>
                                        <div class="card-body d-flex flex-column">
                                            <h5 class="card-title text-truncate">
                                                <a href="<c:url value='/product/detail?id=${p.productId}'/>"
                                                    class="text-decoration-none text-dark fw-bold">${p.productName}</a>
                                            </h5>
                                            <div class="mt-auto">
                                                <p class="card-text fw-bold text-primary fs-5 mb-3">
                                                    <fmt:formatNumber value="${p.price}" type="currency"
                                                        currencySymbol="₫" />
                                                </p>
                                                <div class="d-grid">
                                                    <a href="<c:url value='/cart/add?pid=${p.productId}'/>"
                                                        class="btn btn-primary">
                                                        <i class="fas fa-cart-plus me-2"></i>Thêm vào giỏ
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>