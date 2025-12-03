<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container-fluid px-4">
    <!-- Breadcrumb đẹp hơn -->
    <h2 class="mt-4 text-primary fw-bold"><i class="fas fa-folder-plus me-2"></i>Thêm Danh mục mới</h2>
    <ol class="breadcrumb mb-4 bg-light p-2 rounded shadow-sm">
        <li class="breadcrumb-item"><a href="<c:url value='/admin/home'/>" class="text-decoration-none">Dashboard</a></li>
        <li class="breadcrumb-item"><a href="<c:url value='/admin/categories'/>" class="text-decoration-none">Danh mục</a></li>
        <li class="breadcrumb-item active">Thêm mới</li>
    </ol>

    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-lg border-0 rounded-3">
                <div class="card-header bg-primary text-white py-3">
                    <h5 class="mb-0 fw-bold"><i class="fas fa-info-circle me-2"></i>Thông tin danh mục</h5>
                </div>
                <div class="card-body p-4">
                    <!-- Form -->
                    <form action="<c:url value='/admin/category/create'/>" method="post" enctype="multipart/form-data">
                        
                        <!-- Dòng 1: Tên danh mục & Danh mục cha -->
                        <div class="row mb-4">
                            <div class="col-md-6">
                                <label for="categoryName" class="form-label fw-bold">Tên danh mục <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="fas fa-tag"></i></span>
                                    <input type="text" class="form-control" id="categoryName" name="categoryName" required placeholder="Ví dụ: Chăm sóc da...">
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="parentId" class="form-label fw-bold">Danh mục cha</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="fas fa-code-branch"></i></span>
                                    <select class="form-select" id="parentId" name="parentId">
                                        <option value="">-- Là danh mục gốc (Không có cha) --</option>
                                        <c:forEach items="${categories}" var="c">
                                            <option value="${c.categoryId}">${c.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-text fst-italic ms-1">Chọn cấp cha nếu đây là danh mục con.</div>
                            </div>
                        </div>

                        <!-- Dòng 2: Hình ảnh -->
                        <div class="mb-4">
                            <label for="icon" class="form-label fw-bold">Hình ảnh (Icon)</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="fas fa-image"></i></span>
                                <input type="file" class="form-control" id="icon" name="icon" accept="image/*">
                            </div>
                            <div class="form-text ms-1">Hỗ trợ định dạng: .jpg, .png, .jpeg</div>
                        </div>

                        <hr class="my-4">

                        <!-- Nút bấm hành động -->
                        <div class="d-flex justify-content-between">
                            <a href="<c:url value='/admin/categories'/>" class="btn btn-secondary px-4 rounded-pill">
                                <i class="fas fa-arrow-left me-2"></i>Quay lại
                            </a>
                            
                            <div>
                                <a href="<c:url value='/admin/category/reset'/>" class="btn btn-outline-warning me-2 rounded-pill">
                                    <i class="fas fa-sync-alt me-2"></i>Làm mới
                                </a>
                                <button type="submit" class="btn btn-success px-4 rounded-pill fw-bold shadow-sm">
                                    <i class="fas fa-save me-2"></i>Lưu dữ liệu
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>