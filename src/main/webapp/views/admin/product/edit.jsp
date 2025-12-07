<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

            <style>
                /* ===== PRODUCT EDIT FORM STYLES ===== */

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

                /* Alert Styles */
                .custom-alert {
                    border: none;
                    border-radius: 12px;
                    padding: 1rem 1.5rem;
                    font-weight: 500;
                }

                .alert-success {
                    background: linear-gradient(135deg, #d4edda, #c3e6cb);
                    color: #155724;
                }

                .alert-danger {
                    background: linear-gradient(135deg, #f8d7da, #f5c6cb);
                    color: #721c24;
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

                /* Current Image */
                .current-image-container {
                    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
                    border-radius: 15px;
                    padding: 1.5rem;
                    text-align: center;
                    margin-bottom: 1rem;
                }

                .current-image-container img {
                    max-width: 200px;
                    max-height: 200px;
                    border-radius: 12px;
                    box-shadow: var(--shadow-sm);
                    object-fit: cover;
                }

                .current-image-label {
                    font-size: 0.85rem;
                    color: var(--dark-light);
                    margin-top: 0.75rem;
                    margin-bottom: 0;
                }

                /* File Upload */
                .file-upload-area {
                    border: 2px dashed #ffd1dc;
                    border-radius: 15px;
                    padding: 1.5rem;
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
                    font-size: 2rem;
                    color: var(--primary);
                    margin-bottom: 0.75rem;
                }

                .file-upload-area p {
                    margin: 0;
                    color: var(--dark);
                    font-weight: 600;
                    font-size: 0.95rem;
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

                /* Product ID Badge */
                .product-id-badge {
                    display: inline-flex;
                    align-items: center;
                    gap: 0.5rem;
                    background: rgba(255, 107, 157, 0.15);
                    color: var(--primary);
                    padding: 0.5rem 1rem;
                    border-radius: 20px;
                    font-weight: 600;
                    font-size: 0.9rem;
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
                    .btn-back {
                        flex: none;
                        width: 100%;
                    }
                }
            </style>

            <div class="container-fluid px-4 py-4">
                <!-- Hero Section -->
                <div class="product-hero mb-4">
                    <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                        <div>
                            <h1 class="page-title mb-2">
                                <i class="fas fa-edit me-2"></i>Cập nhật Sản phẩm
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
                                    <li class="breadcrumb-item active">Cập nhật</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="product-id-badge">
                            <i class="fas fa-hashtag"></i>
                            ID: ${product.productId}
                        </div>
                    </div>
                </div>

                <!-- Alerts -->
                <c:if test="${not empty message}">
                    <div class="alert alert-success alert-dismissible fade show custom-alert mb-4" role="alert">
                        <i class="fas fa-check-circle me-2"></i>${message}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show custom-alert mb-4" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i>${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <!-- Form Card -->
                <div class="card form-card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <i class="fas fa-box-open me-2"></i>Thông tin sản phẩm
                        </h5>
                    </div>
                    <div class="card-body">
                        <form action="<c:url value='/admin/product/update'/>" method="post"
                            enctype="multipart/form-data">
                            <!-- Hidden ID -->
                            <input type="hidden" name="productId" value="${product.productId}">

                            <!-- Row 1: Product Name -->
                            <div class="form-row">
                                <label for="productName" class="form-label">
                                    <i class="fas fa-box me-1 text-primary"></i>
                                    Tên sản phẩm <span class="text-danger">*</span>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-cube"></i></span>
                                    <input type="text" class="form-control" id="productName" name="productName"
                                        value="${product.productName}" placeholder="Nhập tên sản phẩm..." required>
                                </div>
                            </div>

                            <!-- Row 2: Category & Status -->
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
                                                <option value="${c.categoryId}" ${product.category !=null &&
                                                    c.categoryId==product.category.categoryId ? 'selected' : '' }>
                                                    ${c.categoryName}
                                                </option>
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
                                            <option value="true" ${product.active ? 'selected' : '' }>✅ Đang bán
                                            </option>
                                            <option value="false" ${!product.active ? 'selected' : '' }>⏸️ Ngừng bán
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <!-- Row 3: Price & Quantity -->
                            <div class="row form-row">
                                <div class="col-md-6 mb-3 mb-md-0">
                                    <label for="price" class="form-label">
                                        <i class="fas fa-dollar-sign me-1 text-primary"></i>
                                        Giá bán <span class="text-danger">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text">₫</span>
                                        <input type="number" class="form-control" id="price" name="price"
                                            value="${product.price}" min="0" placeholder="0" required>
                                    </div>
                                    <div class="form-text">Nhập giá bán (VNĐ)</div>
                                </div>
                                <div class="col-md-6">
                                    <label for="quantity" class="form-label">
                                        <i class="fas fa-warehouse me-1 text-primary"></i>
                                        Số lượng kho <span class="text-danger">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-boxes"></i></span>
                                        <input type="number" class="form-control" id="quantity" name="quantity"
                                            value="${product.quantity}" min="0" placeholder="0" required>
                                    </div>
                                    <div class="form-text">Số lượng sản phẩm trong kho</div>
                                </div>
                            </div>

                            <!-- Row 4: Description -->
                            <div class="form-row">
                                <label for="description" class="form-label">
                                    <i class="fas fa-align-left me-1 text-primary"></i>
                                    Mô tả sản phẩm
                                </label>
                                <textarea class="form-control" id="description" name="description" rows="4"
                                    placeholder="Nhập mô tả chi tiết về sản phẩm...">${product.description}</textarea>
                                <div class="form-text">Mô tả ngắn gọn, hấp dẫn về sản phẩm</div>
                            </div>

                            <!-- Row 5: Image -->
                            <div class="form-row">
                                <label class="form-label">
                                    <i class="fas fa-image me-1 text-primary"></i>
                                    Hình ảnh sản phẩm
                                </label>

                                <div class="row">
                                    <!-- Current Image -->
                                    <c:if test="${not empty product.image}">
                                        <div class="col-md-4 mb-3 mb-md-0">
                                            <div class="current-image-container">
                                                <img src="<c:url value='/assets/uploads/product/${product.image}'/>"
                                                    alt="${product.productName}">
                                                <p class="current-image-label">
                                                    <i class="fas fa-image me-1"></i>Hình ảnh hiện tại
                                                </p>
                                            </div>
                                        </div>
                                    </c:if>

                                    <!-- Upload New Image -->
                                    <div class="${not empty product.image ? 'col-md-8' : 'col-12'}">
                                        <div class="file-upload-area"
                                            onclick="document.getElementById('image').click()">
                                            <i class="fas fa-cloud-upload-alt"></i>
                                            <p>Nhấn để chọn hình ảnh mới</p>
                                            <small>JPG, PNG, JPEG (Tối đa 2MB)</small>
                                        </div>
                                        <input type="file" class="file-input" id="image" name="image" accept="image/*"
                                            onchange="previewImage(this)">

                                        <!-- Image Preview -->
                                        <div class="image-preview-container" id="imagePreview" style="display: none;">
                                            <img id="previewImg" src="" alt="Preview">
                                            <button type="button" class="btn-remove-preview" onclick="removeImage()">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>

                                        <div class="form-text">Để trống nếu không muốn thay đổi hình ảnh</div>
                                    </div>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <div class="btn-actions">
                                <button type="submit" class="btn btn-submit">
                                    <i class="fas fa-save me-2"></i>Cập nhật sản phẩm
                                </button>
                                <a href="<c:url value='/admin/products'/>" class="btn btn-back">
                                    <i class="fas fa-arrow-left me-2"></i>Quay lại
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- JavaScript for Image Preview -->
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