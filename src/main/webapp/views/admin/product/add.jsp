<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <head>
            <title>Thêm Sản phẩm - ORISHOP Admin</title>
        </head>

        <style>
            /* ===== PRODUCT ADD FORM STYLES ===== */
            /* Hero Section */
            .product-hero {
                background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                padding: 2rem;
                border-radius: 15px;
                box-shadow: 0 2px 8px rgba(255, 107, 157, 0.1);
            }

            .page-title {
                color: var(--dark);
                font-size: 2rem;
                font-weight: 700;
                font-family: 'Quicksand', sans-serif;
            }

            .page-title i {
                color: var(--primary);
            }

            .breadcrumb {
                background: transparent;
                padding: 0;
                margin: 0;
            }

            .breadcrumb-item a {
                color: var(--primary);
                text-decoration: none;
                font-weight: 600;
                transition: var(--transition-base);
            }

            .breadcrumb-item a:hover {
                color: var(--primary-dark);
            }

            .breadcrumb-item.active {
                color: var(--dark-light);
            }

            /* Form Card */
            .form-card {
                border: none;
                border-radius: 20px;
                box-shadow: var(--shadow-md);
                overflow: hidden;
                background: white;
            }

            .form-card .card-header {
                background: var(--gradient-primary);
                color: white;
                padding: 1.5rem 2rem;
                border: none;
            }

            .form-card .card-header h5 {
                font-family: 'Quicksand', sans-serif;
                font-weight: 700;
                font-size: 1.25rem;
            }

            .form-card .card-body {
                padding: 2rem;
            }

            /* Form Labels */
            .form-label {
                font-weight: 600;
                color: var(--dark);
                margin-bottom: 0.5rem;
                font-family: 'Quicksand', sans-serif;
            }

            .form-label .text-danger {
                color: #e74c3c !important;
            }

            /* Input Group */
            .input-group-text {
                background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                border: 2px solid #ffd1dc;
                border-right: none;
                color: var(--primary);
                font-size: 1rem;
                padding: 12px 15px;
                border-radius: 12px 0 0 12px;
            }

            .form-control,
            .form-select {
                border: 2px solid #ffd1dc;
                padding: 12px 15px;
                font-size: 0.95rem;
                border-radius: 12px;
                transition: all 0.3s ease;
            }

            .input-group .form-control,
            .input-group .form-select {
                border-left: none;
                border-radius: 0 12px 12px 0;
            }

            .form-control:focus,
            .form-select:focus {
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(255, 107, 157, 0.15);
            }

            .input-group:focus-within .input-group-text {
                border-color: var(--primary);
                background: linear-gradient(135deg, #ffd1dc, #ffb6c1);
            }

            .form-control::placeholder {
                color: #adb5bd;
            }

            textarea.form-control {
                border-radius: 12px;
                border: 2px solid #ffd1dc;
            }

            /* Form Text Helper */
            .form-text {
                color: var(--dark-light);
                font-size: 0.8rem;
                margin-top: 0.5rem;
            }

            /* Select Dropdown */
            .form-select {
                background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23ff6b9d' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
                background-size: 16px 12px;
            }

            /* File Upload */
            .file-upload-area {
                border: 2px dashed #ffd1dc;
                border-radius: 15px;
                padding: 2rem;
                text-align: center;
                cursor: pointer;
                transition: all 0.3s ease;
                background: #fff5f8;
            }

            .file-upload-area:hover {
                border-color: var(--primary);
                background: linear-gradient(135deg, #fff5f8, #ffd1dc);
            }

            .file-upload-area i {
                font-size: 2.5rem;
                color: var(--primary);
                margin-bottom: 1rem;
            }

            .file-upload-area p {
                margin: 0;
                color: var(--dark);
                font-weight: 600;
            }

            .file-upload-area small {
                color: var(--dark-light);
            }

            .file-input {
                display: none;
            }

            /* Image Preview */
            .image-preview-container {
                position: relative;
                display: inline-block;
                margin-top: 1rem;
            }

            .image-preview-container img {
                max-width: 200px;
                max-height: 200px;
                border-radius: 12px;
                box-shadow: var(--shadow-sm);
                object-fit: cover;
            }

            .btn-remove-preview {
                position: absolute;
                top: -10px;
                right: -10px;
                width: 30px;
                height: 30px;
                border-radius: 50%;
                background: linear-gradient(135deg, #ff7675, #fd79a8);
                color: white;
                border: none;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 0.85rem;
                box-shadow: 0 2px 8px rgba(255, 118, 117, 0.3);
                transition: all 0.3s ease;
            }

            .btn-remove-preview:hover {
                transform: scale(1.1);
            }

            /* Action Buttons */
            .btn-actions {
                display: flex;
                gap: 1rem;
                margin-top: 2rem;
                padding-top: 2rem;
                border-top: 2px dashed #ffd1dc;
            }

            .btn-submit {
                flex: 2;
                background: var(--gradient-primary);
                border: none;
                color: white;
                font-weight: 600;
                padding: 14px 30px;
                border-radius: 50px;
                font-size: 1rem;
                box-shadow: var(--shadow-sm);
                transition: all 0.3s ease;
            }

            .btn-submit:hover {
                transform: translateY(-2px);
                box-shadow: var(--shadow-hover);
                color: white;
            }

            .btn-reset {
                flex: 1;
                background: transparent;
                border: 2px solid #fdcb6e;
                color: #fdcb6e;
                font-weight: 600;
                padding: 14px 20px;
                border-radius: 50px;
                transition: all 0.3s ease;
            }

            .btn-reset:hover {
                background: #fdcb6e;
                color: white;
            }

            .btn-back {
                flex: 1;
                background: transparent;
                border: 2px solid var(--dark-light);
                color: var(--dark-light);
                font-weight: 600;
                padding: 14px 20px;
                border-radius: 50px;
                text-decoration: none;
                text-align: center;
                transition: all 0.3s ease;
            }

            .btn-back:hover {
                background: var(--dark-light);
                color: white;
            }

            /* Row Spacing */
            .form-row {
                margin-bottom: 1.5rem;
            }

            .form-row:last-child {
                margin-bottom: 0;
            }

            /* Responsive */
            @media (max-width: 768px) {
                .product-hero {
                    padding: 1.5rem;
                }

                .page-title {
                    font-size: 1.5rem;
                }

                .form-card .card-body {
                    padding: 1.5rem;
                }

                .btn-actions {
                    flex-direction: column;
                }

                .btn-submit,
                .btn-reset,
                .btn-back {
                    flex: none;
                    width: 100%;
                }
            }
        </style>

        <div class="container-fluid px-4 py-4">
            <div class="product-hero mb-4">
                <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                    <div>
                        <h1 class="page-title mb-2">
                            <i class="fas fa-plus-circle me-2"></i>Thêm Sản phẩm mới
                        </h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="<c:url value='/admin/home'/>">
                                        <i class="fas fa-home me-1"></i>Dashboard
                                    </a>
                                </li>
                                <li class="breadcrumb-item">
                                    <a href="<c:url value='/admin/products'/>">Sản phẩm</a>
                                </li>
                                <li class="breadcrumb-item active">Thêm mới</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="card form-card">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fas fa-edit me-2"></i>Thông tin sản phẩm
                    </h5>
                </div>
                <div class="card-body">
                    <form action="<c:url value='/admin/product/create'/>" method="post" enctype="multipart/form-data">

                        <div class="form-row">
                            <label for="productName" class="form-label">
                                <i class="fas fa-box me-1 text-primary"></i>
                                Tên sản phẩm <span class="text-danger">*</span>
                            </label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-cube"></i></span>
                                <input type="text" class="form-control" id="productName" name="productName"
                                    placeholder="Nhập tên sản phẩm..." required>
                            </div>
                        </div>

                        <div class="row form-row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <label for="categoryId" class="form-label">
                                    <i class="fas fa-tags me-1 text-primary"></i>
                                    Danh mục <span class="text-danger">*</span>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-folder"></i></span>
                                    <select class="form-select" id="categoryId" name="categoryId" required>
                                        <option value="">-- Chọn danh mục --</option>
                                        <c:forEach items="${listCate}" var="c">
                                            <option value="${c.categoryId}">${c.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="active" class="form-label">
                                    <i class="fas fa-toggle-on me-1 text-primary"></i>
                                    Trạng thái <span class="text-danger">*</span>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-check-circle"></i></span>
                                    <select class="form-select" id="active" name="active" required>
                                        <option value="true" selected>✅ Đang bán</option>
                                        <option value="false">⏸️ Ngừng bán</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row form-row">
                            <div class="col-md-4 mb-3 mb-md-0">
                                <label for="price" class="form-label">
                                    <i class="fas fa-dollar-sign me-1 text-primary"></i>
                                    Giá bán <span class="text-danger">*</span>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text">₫</span>
                                    <input type="number" class="form-control" id="price" name="price" min="0"
                                        placeholder="0" required>
                                </div>
                                <div class="form-text">Nhập giá bán (VNĐ)</div>
                            </div>

                            <div class="col-md-4 mb-3 mb-md-0">
                                <label for="discount" class="form-label">
                                    <i class="fas fa-percent me-1 text-primary"></i>
                                    Giảm giá
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-tag"></i></span>
                                    <input type="number" class="form-control" id="discount" name="discount" min="0"
                                        max="100" placeholder="0">
                                </div>
                                <div class="form-text">% giảm (0-100)</div>
                            </div>

                            <div class="col-md-4">
                                <label for="quantity" class="form-label">
                                    <i class="fas fa-warehouse me-1 text-primary"></i>
                                    Số lượng kho <span class="text-danger">*</span>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-boxes"></i></span>
                                    <input type="number" class="form-control" id="quantity" name="quantity" min="0"
                                        placeholder="0" required>
                                </div>
                                <div class="form-text">Số lượng sản phẩm trong kho</div>
                            </div>
                        </div>

                        <div class="form-row">
                            <label for="description" class="form-label">
                                <i class="fas fa-align-left me-1 text-primary"></i>
                                Mô tả sản phẩm
                            </label>
                            <textarea class="form-control" id="description" name="description" rows="4"
                                placeholder="Nhập mô tả chi tiết về sản phẩm..."></textarea>
                            <div class="form-text">Mô tả ngắn gọn, hấp dẫn về sản phẩm</div>
                        </div>

                        <div class="form-row">
                            <label class="form-label">
                                <i class="fas fa-image me-1 text-primary"></i>
                                Hình ảnh sản phẩm
                            </label>
                            <div class="file-upload-area" onclick="document.getElementById('image').click()">
                                <i class="fas fa-cloud-upload-alt"></i>
                                <p>Nhấn để chọn hình ảnh</p>
                                <small>JPG, PNG, JPEG (Tối đa 2MB)</small>
                            </div>
                            <input type="file" class="file-input" id="image" name="image" accept="image/*"
                                onchange="previewImage(this)">

                            <div class="image-preview-container" id="imagePreview" style="display: none;">
                                <img id="previewImg" src="" alt="Preview">
                                <button type="button" class="btn-remove-preview" onclick="removeImage()">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>

                        <div class="btn-actions">
                            <button type="submit" class="btn btn-submit">
                                <i class="fas fa-save me-2"></i>Lưu sản phẩm
                            </button>
                            <button type="reset" class="btn btn-reset" onclick="removeImage()">
                                <i class="fas fa-redo me-2"></i>Nhập lại
                            </button>
                            <a href="<c:url value='/admin/products'/>" class="btn btn-back">
                                <i class="fas fa-arrow-left me-2"></i>Quay lại
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function previewImage(input) {
                if (input.files && input.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        document.getElementById('previewImg').src = e.target.result;
                        document.getElementById('imagePreview').style.display = 'inline-block';
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

            function removeImage() {
                document.getElementById('image').value = '';
                document.getElementById('imagePreview').style.display = 'none';
                document.getElementById('previewImg').src = '';
            }
        </script>
