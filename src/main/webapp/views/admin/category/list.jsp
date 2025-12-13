<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

            <!-- Category List Styles -->
            <jsp:include page="sections/styles/list-styles.jsp" />

            <div class="container-fluid px-4 py-4">
                <!-- Hero Section -->
                <div class="category-hero mb-4">
                    <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                        <div>
                            <h1 class="page-title mb-2">
                                <i class="fas fa-tags me-2"></i>Quản lý Danh mục
                            </h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item">
                                        <a href="<c:url value='/admin/home'/>">
                                            <i class="fas fa-home me-1"></i>Dashboard
                                        </a>
                                    </li>
                                    <li class="breadcrumb-item active">Danh mục</li>
                                </ol>
                            </nav>
                        </div>
                        <div>
                            <a href="<c:url value='/admin/category/create'/>" class="btn btn-primary btn-add">
                                <i class="fas fa-plus me-2"></i>Thêm danh mục mới
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Alerts -->
                <c:if test="${not empty message}">
                    <div class="alert alert-success alert-dismissible fade show custom-alert" role="alert">
                        <i class="fas fa-check-circle me-2"></i>${message}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show custom-alert" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i>${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <!-- Main Card -->
                <div class="card category-card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5 class="mb-0 fw-bold">
                                <i class="fas fa-list me-2"></i>Danh sách Danh mục
                            </h5>
                            <span class="badge bg-light text-dark">
                                <i class="fas fa-layer-group me-1"></i>
                                ${fn:length(categories)} danh mục
                            </span>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <c:choose>
                            <c:when test="${empty categories}">
                                <!-- Empty State -->
                                <div class="empty-state text-center py-5">
                                    <i class="fas fa-folder-open empty-icon mb-3"></i>
                                    <h4 class="text-muted mb-2">Chưa có danh mục nào</h4>
                                    <p class="text-muted mb-4">Bắt đầu bằng cách thêm danh mục đầu tiên của bạn</p>
                                    <a href="<c:url value='/admin/category/create'/>" class="btn btn-primary">
                                        <i class="fas fa-plus me-2"></i>Thêm danh mục đầu tiên
                                    </a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <!-- Categories Table -->
                                <div class="table-responsive">
                                    <table class="table category-table mb-0">
                                        <thead>
                                            <tr>
                                                <th class="text-center" style="width: 80px;">ID</th>
                                                <th class="text-center" style="width: 100px;">Icon</th>
                                                <th>Tên danh mục</th>
                                                <th class="text-center" style="width: 200px;">Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${categories}" var="cate" varStatus="status">
                                                <tr class="category-row">
                                                    <td class="text-center fw-bold text-muted">#${cate.categoryId}</td>
                                                    <td class="text-center">
                                                        <div class="category-icon-wrapper">
                                                            <c:choose>
                                                                <c:when
                                                                    test="${cate.icon != null && cate.icon.startsWith('http')}">
                                                                    <img src="${cate.icon}" class="category-icon"
                                                                        alt="${cate.categoryName}" />
                                                                </c:when>
                                                                <c:when
                                                                    test="${cate.icon != null && !cate.icon.startsWith('http')}">
                                                                    <img src="<c:url value='/assets/uploads/category/${cate.icon}'/>"
                                                                        class="category-icon"
                                                                        alt="${cate.categoryName}" />
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="category-icon-placeholder">
                                                                        ${fn:substring(cate.categoryName,0,1)}
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="category-name">${cate.categoryName}</div>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="action-buttons">
                                                            <a href="<c:url value='/admin/category/edit?id=${cate.categoryId}'/>"
                                                                class="btn btn-edit" title="Chỉnh sửa">
                                                                <i class="fas fa-edit"></i>
                                                            </a>
                                                            <a href="<c:url value='/admin/category/delete?categoryId=${cate.categoryId}'/>"
                                                                class="btn btn-delete"
                                                                onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này không?');"
                                                                title="Xóa">
                                                                <i class="fas fa-trash-alt"></i>
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>