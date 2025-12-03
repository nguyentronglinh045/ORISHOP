<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container-fluid px-4">
    <h1 class="mt-4">Cập nhật Danh mục</h1>
    <ol class="breadcrumb mb-4">
        <!-- Sử dụng c:url -->
        <li class="breadcrumb-item"><a href="<c:url value='/admin/categories'/>">Danh mục</a></li>
        <li class="breadcrumb-item active">Cập nhật</li>
    </ol>

    <!-- Hiển thị thông báo -->
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
        <div class="card-header">
            <i class="fas fa-edit me-1"></i>
            Thông tin danh mục
        </div>
        <div class="card-body">
            <form action="<c:url value='/admin/category/update'/>" method="post" enctype="multipart/form-data">
                
                <!-- Input Hidden chứa ID -->
                <input type="hidden" name="categoryId" value="${cate.categoryId}">

                <div class="mb-3">
                    <label for="categoryName" class="form-label">Tên danh mục:</label>
                    <input type="text" class="form-control" id="categoryName" name="categoryName" 
                           value="${cate.categoryName}" required>
                </div>

                <!-- PHẦN CẬP NHẬT: Chọn danh mục cha -->
                <div class="mb-3">
                    <label for="parentId" class="form-label">Danh mục cha:</label>
                    <select class="form-select" id="parentId" name="parentId">
                        <option value="">-- Không (Đây là danh mục gốc) --</option>
                        
                        <c:forEach items="${categories}" var="c">
                            <!-- Logic 1: Không hiển thị chính nó trong danh sách cha (tránh chọn chính mình) -->
                            <c:if test="${c.categoryId != cate.categoryId}">
                                
                                <!-- Logic 2: Kiểm tra nếu 'c' đang là cha của 'cate' thì selected -->
                                <c:set var="isSelected" value="" />
                                <!-- cate.category có thể null nếu là gốc, cần check null trước -->
                                <c:if test="${cate.category != null && cate.category.categoryId == c.categoryId}">
                                    <c:set var="isSelected" value="selected" />
                                </c:if>
                                
                                <option value="${c.categoryId}" ${isSelected}>${c.categoryName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                    <div class="form-text">Thay đổi danh mục cấp trên nếu cần.</div>
                </div>

                <div class="mb-3">
                    <label for="icon" class="form-label">Hình ảnh (Icon):</label>
                    <!-- Hiển thị ảnh cũ nếu có -->
                    <c:if test="${not empty cate.icon}">
                        <div class="mb-2">
                            <!-- Sử dụng c:url cho đường dẫn ảnh -->
                            <img src="<c:url value='/assets/uploads/category/${cate.icon}'/>" 
                                 width="100" class="img-thumbnail" alt="Ảnh hiện tại">
                            <br>
                            <small class="text-muted">Ảnh hiện tại</small>
                        </div>
                    </c:if>
                    <input type="file" class="form-control" id="icon" name="icon" accept="image/*">
                    <div class="form-text">Chọn ảnh mới nếu muốn thay đổi ảnh hiện tại.</div>
                </div>

                <div class="mt-4">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Cập nhật
                    </button>
                    <a href="<c:url value='/admin/categories'/>" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Quay lại
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>