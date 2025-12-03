<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container-fluid px-4">
    <h1 class="mt-4">Cập nhật Sản phẩm</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="<c:url value='/admin/products'/>">Sản phẩm</a></li>
        <li class="breadcrumb-item active">Cập nhật</li>
    </ol>

    <div class="card mb-4">
        <div class="card-header">Thông tin chi tiết</div>
        <div class="card-body">
            <form action="<c:url value='/admin/product/update'/>" method="post" enctype="multipart/form-data">
                <!-- ID ẩn -->
                <input type="hidden" name="productId" value="${product.productId}">

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Tên sản phẩm:</label>
                        <input type="text" class="form-control" name="productName" value="${product.productName}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Danh mục:</label>
                        <select class="form-select" name="categoryId" required>
                            <c:forEach items="${listCate}" var="c">
                                <option value="${c.categoryId}" ${c.categoryId == product.category.categoryId ? 'selected' : ''}>
                                    ${c.categoryName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4">
                        <label class="form-label">Giá (VNĐ):</label>
                        <input type="number" class="form-control" name="price" value="${product.price}" min="0" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Số lượng:</label>
                        <input type="number" class="form-control" name="quantity" value="${product.quantity}" min="0" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Trạng thái:</label>
                        <select class="form-select" name="active">
                            <option value="true" ${product.active ? 'selected' : ''}>Đang bán</option>
                            <option value="false" ${!product.active ? 'selected' : ''}>Ngừng bán</option>
                        </select>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Hình ảnh:</label>
                    <c:if test="${not empty product.image}">
                        <div class="mb-2">
                            <img src="<c:url value='/assets/uploads/product/${product.image}'/>" width="100" class="img-thumbnail">
                        </div>
                    </c:if>
                    <input type="file" class="form-control" name="image" accept="image/*">
                </div>

                <div class="mb-3">
                    <label class="form-label">Mô tả:</label>
                    <textarea class="form-control" name="description" rows="3">${product.description}</textarea>
                </div>

                <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Cập nhật</button>
                <a href="<c:url value='/admin/products'/>" class="btn btn-secondary">Quay lại</a>
            </form>
        </div>
    </div>
</div>