<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="container-fluid px-4">
    <h1 class="mt-4">Quản lý Sản phẩm</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="<c:url value='/admin/home'/>">Dashboard</a></li>
        <li class="breadcrumb-item active">Sản phẩm</li>
    </ol>

    <!-- Thông báo -->
    <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <div class="card mb-4">
        <div class="card-header d-flex justify-content-between align-items-center">
            <div>
                <i class="fas fa-table me-1"></i> Danh sách Sản phẩm
            </div>
            <a href="<c:url value='/admin/product/create'/>" class="btn btn-primary btn-sm">
                <i class="fas fa-plus"></i> Thêm mới
            </a>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Hình ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Danh mục</th>
                        <th>Giá</th>
                        <th>Kho</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${products}" var="p">
                        <tr>
                            <td>${p.productId}</td>
                            <td>
                                <c:if test="${p.image != null}">
                                    <img src="<c:url value='/assets/uploads/product/${p.image}'/>" width="60" height="60" class="img-thumbnail" />
                                </c:if>
                                <c:if test="${p.image == null}">
                                    No Image
                                </c:if>
                            </td>
                            <td>${p.productName}</td>
                            <td>
                                <c:if test="${p.category != null}">
                                    ${p.category.categoryName}
                                </c:if>
                                <c:if test="${p.category == null}">
                                    <span class="text-muted">Chưa phân loại</span>
                                </c:if>
                            </td>
                            <td>
                                <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="đ"/>
                            </td>
                            <td>${p.quantity}</td>
                            <td>
                                <c:if test="${p.active}"><span class="badge bg-success">Đang bán</span></c:if>
                                <c:if test="${!p.active}"><span class="badge bg-secondary">Ngừng bán</span></c:if>
                            </td>
                            <td>
                                <!-- Nút Sửa -->
                                <a href="<c:url value='/admin/product/edit?id=${p.productId}'/>" class="btn btn-warning btn-sm">
                                    <i class="fas fa-edit"></i> Sửa
                                </a>
                                
                                <!-- Nút Xóa -->
                                <a href="<c:url value='/admin/product/delete?id=${p.productId}'/>" class="btn btn-danger btn-sm"
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');">
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