<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container-fluid px-4">
    <h1 class="mt-4">Thêm Sản phẩm mới</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="<c:url value='/admin/products'/>">Sản phẩm</a></li>
        <li class="breadcrumb-item active">Thêm mới</li>
    </ol>

    <div class="card mb-4">
        <div class="card-header">Thông tin sản phẩm</div>
        <div class="card-body">
            <form action="<c:url value='/admin/product/create'/>" method="post" enctype="multipart/form-data">
                
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Tên sản phẩm:</label>
                        <input type="text" class="form-control" name="productName" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Danh mục:</label>
                        <select class="form-select" name="categoryId" required>
                            <option value="">-- Chọn danh mục --</option>
                            <c:forEach items="${listCate}" var="c">
                                <option value="${c.categoryId}">${c.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4">
                        <label class="form-label">Giá (VNĐ):</label>
                        <input type="number" class="form-control" name="price" min="0" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Số lượng kho:</label>
                        <input type="number" class="form-control" name="quantity" min="0" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Trạng thái:</label>
                        <select class="form-select" name="active">
                            <option value="true">Đang bán</option>
                            <option value="false">Ngừng bán</option>
                        </select>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Hình ảnh:</label>
                    <input type="file" class="form-control" name="image" accept="image/*">
                </div>

                <div class="mb-3">
                    <label class="form-label">Mô tả:</label>
                    <textarea class="form-control" name="description" rows="3"></textarea>
                </div>

                <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Lưu lại</button>
                <a href="<c:url value='/admin/products'/>" class="btn btn-secondary">Quay lại</a>
            </form>
        </div>
    </div>
</div>