<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <!-- Category Add Styles -->
        <jsp:include page="sections/styles/add-styles.jsp" />

        <div class="container-fluid px-4 py-4">
            <!-- Hero Section -->
            <div class="category-hero mb-4">
                <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                    <div>
                        <h1 class="page-title mb-2">
                            <i class="fas fa-folder-plus me-2"></i>Thêm Danh mục mới
                        </h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="<c:url value='/admin/home'/>">
                                        <i class="fas fa-home me-1"></i>Dashboard
                                    </a>
                                </li>
                                <li class="breadcrumb-item">
                                    <a href="<c:url value='/admin/categories'/>">Danh mục</a>
                                </li>
                                <li class="breadcrumb-item active">Thêm mới</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <!-- Form Card -->
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="card form-card">
                        <div class="card-header">
                            <h5 class="mb-0 fw-bold">
                                <i class="fas fa-info-circle me-2"></i>Thông tin danh mục
                            </h5>
                        </div>
                        <div class="card-body p-4">
                            <form action="<c:url value='/admin/category/create'/>" method="post"
                                enctype="multipart/form-data">

                                <!-- Category Name -->
                                <div class="form-group mb-4">
                                    <label for="categoryName" class="form-label">
                                        Tên danh mục <span class="text-danger">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-tag"></i></span>
                                        <input type="text" class="form-control" id="categoryName" name="categoryName"
                                            placeholder="Nhập tên danh mục..." required>
                                    </div>
                                </div>

                                <!-- Parent Category -->
                                <div class="form-group mb-4">
                                    <label for="parentId" class="form-label">
                                        Danh mục cha
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-code-branch"></i></span>
                                        <select class="form-select" id="parentId" name="parentId">
                                            <option value="">-- Là danh mục gốc --</option>
                                            <c:forEach items="${categories}" var="c">
                                                <option value="${c.categoryId}">${c.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <small class="form-text">Để trống nếu đây là danh mục gốc</small>
                                </div>

                                <!-- Icon/Image Upload -->
                                <div class="form-group mb-4">
                                    <label for="icon" class="form-label">
                                        Hình ảnh (Icon)
                                    </label>
                                    <div class="file-upload-wrapper">
                                        <input type="file" class="form-control file-input" id="icon" name="icon"
                                            accept="image/*">
                                        <div class="file-upload-label">
                                            <i class="fas fa-cloud-upload-alt me-2"></i>
                                            <span class="file-label-text">Chọn hình ảnh</span>
                                        </div>
                                    </div>
                                    <small class="form-text">Định dạng: JPG, PNG, JPEG (Tối đa 2MB)</small>

                                    <!-- Image Preview -->
                                    <div class="image-preview mt-3" id="imagePreview" style="display: none;">
                                        <img id="previewImg" src="" alt="Preview">
                                        <button type="button" class="btn-remove-image" onclick="removeImage()">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>

                                <!-- Divider -->
                                <hr class="form-divider my-4">

                                <!-- Action Buttons -->
                                <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                                    <a href="<c:url value='/admin/categories'/>" class="btn btn-back">
                                        <i class="fas fa-arrow-left me-2"></i>Quay lại
                                    </a>

                                    <div class="d-flex gap-2">
                                        <button type="reset" class="btn btn-reset" onclick="resetForm()">
                                            <i class="fas fa-redo me-2"></i>Làm mới
                                        </button>
                                        <button type="submit" class="btn btn-submit">
                                            <i class="fas fa-save me-2"></i>Lưu danh mục
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- JavaScript for Image Preview -->
        <script>
            document.getElementById('icon').addEventListener('change', function (e) {
                const file = e.target.files[0];
                if (file) {
                    // Update label
                    document.querySelector('.file-label-text').textContent = file.name;

                    // Show preview
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        document.getElementById('previewImg').src = e.target.result;
                        document.getElementById('imagePreview').style.display = 'block';
                    }
                    reader.readAsDataURL(file);
                }
            });

            function removeImage() {
                document.getElementById('icon').value = '';
                document.querySelector('.file-label-text').textContent = 'Chọn hình ảnh';
                document.getElementById('imagePreview').style.display = 'none';
            }

            function resetForm() {
                removeImage();
            }
        </script>