<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <div class="container-fluid px-4">
            <h1 class="mt-4">Quản lý Danh mục</h1>
            <ol class="breadcrumb mb-4">
                <!-- Sử dụng c:url thay cho pageContext... -->
                <li class="breadcrumb-item"><a href="<c:url value='/admin/home'/>">Dashboard</a></li>
                <li class="breadcrumb-item active">Danh mục</li>
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
                        <i class="fas fa-table me-2"></i>Danh sách Danh mục
                    </div>
                    <a href="<c:url value='/admin/category/create'/>" class="btn btn-primary btn-sm">
                        <i class="fas fa-plus me-1"></i>Thêm mới
                    </a>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped table-hover rounded-custom overflow-hidden">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên danh mục</th>
                                <th>Icon/Hình ảnh</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${categories}" var="cate">
                                <tr>
                                    <td>${cate.categoryId}</td>
                                    <td>${cate.categoryName}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${cate.icon != null && cate.icon.startsWith('http')}">
                                                <img src="${cate.icon}" width="70" height="70" class="img-thumbnail"
                                                    alt="icon" />
                                            </c:when>
                                            <c:when test="${cate.icon != null && !cate.icon.startsWith('http')}">
                                                <img src="<c:url value='/assets/uploads/category/${cate.icon}'/>"
                                                    width="70" height="70" class="img-thumbnail" alt="icon" />
                                            </c:when>
                                            <c:otherwise>
                                                <img src="https://placehold.co/70x70/ffd1dc/ff6b9d?text=${fn:substring(cate.categoryName,0,1)}"
                                                    width="70" height="70" class="img-thumbnail rounded-custom" alt="No Icon" />
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <!-- Sử dụng c:url cho nút Sửa -->
                                        <a href="<c:url value='/admin/category/edit?id=${cate.categoryId}'/>"
                                            class="btn btn-warning btn-sm rounded-custom">
                                            <i class="fas fa-edit me-1"></i>Sửa
                                        </a>
                                        <a href="<c:url value='/admin/category/delete?categoryId=${cate.categoryId}'/>"
                                            class="btn btn-danger btn-sm rounded-custom"
                                            onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này không?');">
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