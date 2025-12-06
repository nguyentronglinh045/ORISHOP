<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

            <div class="card mb-4 shadow-custom">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <div>
                        <i class="fas fa-table me-2"></i>Danh sách Sản phẩm
                    </div>
                    <a href="<c:url value='/admin/product/create'/>" class="btn btn-primary btn-sm">
                        <i class="fas fa-plus me-1"></i>Thêm mới
                    </a>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped table-hover rounded-custom overflow-hidden">
                        <thead>
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
                                            <c:choose>
                                                <c:when test="${p.image != null}">
                                                    <img src="<c:url value='/assets/uploads/product/${p.image}'/>"
                                                        width="70" height="70" class="img-thumbnail rounded-custom" style="object-fit: cover;" />
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="https://placehold.co/70x70/fff5f8/ff6b9d?text=Thumb"
                                                        width="70" height="70" class="img-thumbnail rounded-custom" style="object-fit: cover;" />
                                                </c:otherwise>
                                            </c:choose>
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
                                            <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="₫" />
                                        </td>
                                        <td>${p.quantity}</td>
                                        <td>
                                            <c:if test="${p.active}"><span class="badge bg-success">Đang bán</span>
                                            </c:if>
                                            <c:if test="${!p.active}"><span class="badge bg-secondary">Ngừng bán</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <!-- Nút Sửa -->
                                            <a href="<c:url value='/admin/product/edit?id=${p.productId}'/>"
                                                class="btn btn-warning btn-sm rounded-custom">
                                                <i class="fas fa-edit me-1"></i>Sửa
                                            </a>

                                            <!-- Nút Xóa -->
                                            <a href="<c:url value='/admin/product/delete?id=${p.productId}'/>"
                                                class="btn btn-danger btn-sm rounded-custom"
                                                onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');">
                                                <i class="fas fa-trash-alt me-1"></i>Xóa
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>