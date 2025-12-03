<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sản phẩm - OriShop</title>
</head>
<body>
    <div class="container mt-4">
        <div class="row">
            <!-- Sidebar Danh mục -->
            <div class="col-md-3 mb-4">
                <div class="card">
                    <div class="card-header bg-danger text-white">
                        <i class="fas fa-list"></i> Danh mục sản phẩm
                    </div>
                    <div class="list-group list-group-flush">
                        <a href="<c:url value='/product'/>" class="list-group-item list-group-item-action ${empty activeCate ? 'active bg-light text-danger border-danger' : ''}">
                            Tất cả sản phẩm
                        </a>
                        <c:forEach items="${categories}" var="c">
                            <a href="<c:url value='/product/category?cid=${c.categoryId}'/>" 
                               class="list-group-item list-group-item-action ${activeCate == c.categoryId ? 'active bg-light text-danger border-danger' : ''}">
                                <c:if test="${not empty c.icon}">
                                    <img src="<c:url value='/assets/uploads/category/${c.icon}'/>" width="20" height="20" class="me-2">
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
                    <div class="alert alert-warning text-center">
                        <h5>Không tìm thấy sản phẩm nào.</h5>
                        <p>Hiện tại hệ thống chưa có dữ liệu hoặc không tìm thấy sản phẩm phù hợp.</p>
                        <c:if test="${sessionScope.account != null && sessionScope.account.role == 1}">
                            <a href="<c:url value='/admin/product/create'/>" class="btn btn-primary mt-2">Thêm sản phẩm ngay (Admin)</a>
                        </c:if>
                    </div>
                </c:if>
    
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <c:forEach items="${products}" var="p">
                        <div class="col">
                            <div class="card h-100 shadow-sm card-product">
                                <div class="position-relative text-center p-3">
                                    <a href="<c:url value='/product/detail?id=${p.productId}'/>">
                                        <c:if test="${p.image != null}">
                                            <img src="<c:url value='/assets/uploads/product/${p.image}'/>" class="card-img-top" style="height: 200px; object-fit: contain;">
                                        </c:if>
                                        <c:if test="${p.image == null}">
                                            <img src="https://via.placeholder.com/300x300?text=No+Image" class="card-img-top" style="height: 200px; object-fit: contain;">
                                        </c:if>
                                    </a>
                                </div>
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title text-truncate">
                                        <a href="<c:url value='/product/detail?id=${p.productId}'/>" class="text-decoration-none text-dark">${p.productName}</a>
                                    </h5>
                                    <div class="mt-auto">
                                        <p class="card-text fw-bold text-danger fs-5">
                                            <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="đ"/>
                                        </p>
                                        <div class="d-grid">
                                            <a href="<c:url value='/cart/add?pid=${p.productId}'/>" class="btn btn-outline-danger">
                                                <i class="fas fa-cart-plus"></i> Thêm vào giỏ
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
</body>
</html>