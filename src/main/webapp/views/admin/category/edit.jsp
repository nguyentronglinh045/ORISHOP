<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>

		<head>
			<title>Sửa Danh mục - ORISHOP Admin</title>
		</head>

		<jsp:include page="sections/styles/add-styles.jsp" />

		<div class="container-fluid px-4 py-4">
			<div class="category-hero mb-4">
				<div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
					<div>
						<h1 class="page-title mb-2">
							<i class="fas fa-edit me-2"></i>Cập nhật Danh mục
						</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="<c:url value='/admin/home'/>"> <i
											class="fas fa-home me-1"></i>Dashboard
									</a></li>
								<li class="breadcrumb-item"><a href="<c:url value='/admin/categories'/>">Danh mục</a></li>
								<li class="breadcrumb-item active">Cập nhật
									#${cate.categoryId}</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>

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

			<div class="row justify-content-center">
				<div class="col-12">
					<div class="card form-card">
						<div class="card-header">
							<h5 class="mb-0 fw-bold">
								<i class="fas fa-info-circle me-2"></i>Thông tin danh mục
							</h5>
						</div>
						<div class="card-body p-4">
							<form action="<c:url value='/admin/category/update'/>" method="post" enctype="multipart/form-data">

								<input type="hidden" name="categoryId" value="${cate.categoryId}">

								<div class="form-group mb-4">
									<label for="categoryName" class="form-label"> Tên danh
										mục <span class="text-danger">*</span>
									</label>
									<div class="input-group">
										<span class="input-group-text"><i class="fas fa-tag"></i></span>
										<input type="text" class="form-control" id="categoryName" name="categoryName"
											value="${cate.categoryName}" placeholder="Nhập tên danh mục..." required>
									</div>
								</div>

								<div class="form-group mb-4">
									<label for="parentId" class="form-label"> Danh mục cha </label>
									<div class="input-group">
										<span class="input-group-text"><i class="fas fa-code-branch"></i></span> <select class="form-select"
											id="parentId" name="parentId">
											<option value="">-- Là danh mục gốc --</option>
											<c:forEach items="${categories}" var="c">
												<c:if test="${c.categoryId != cate.categoryId}">
													<c:set var="isSelected" value="" />
													<c:if test="${cate.category != null && cate.category.categoryId == c.categoryId}">
														<c:set var="isSelected" value="selected" />
													</c:if>
													<option value="${c.categoryId}" ${isSelected}>${c.categoryName}</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<small class="form-text">Để trống nếu đây là danh mục gốc</small>
								</div>

								<c:if test="${not empty cate.icon}">
									<div class="mb-4">
										<label class="form-label">Hình ảnh hiện tại</label>
										<div class="current-image-wrapper">
											<img src="<c:url value='/assets/uploads/category/${cate.icon}'/>" alt="${cate.categoryName}"
												class="current-image"> <span class="badge-current"> <i class="fas fa-image me-1"></i>Ảnh
												hiện tại
											</span>
										</div>
									</div>
								</c:if>

								<div class="form-group mb-4">
									<label class="form-label"> Thay đổi hình ảnh </label>
									<div class="file-upload-wrapper">
										<input type="file" class="form-control" id="icon" name="icon" accept="image/*"
											style="display: none;"> <label for="icon" class="file-upload-label"> <i
												class="fas fa-cloud-upload-alt me-2"></i> <span class="file-label-text">Chọn hình ảnh mới</span>
										</label>
									</div>
									<small class="form-text">Để trống nếu không muốn thay đổi
										ảnh</small>

									<div class="image-preview mt-3" id="imagePreview" style="display: none;">
										<img id="previewImg" src="" alt="Preview">
										<button type="button" class="btn-remove-image" onclick="removeImage()">
											<i class="fas fa-times"></i>
										</button>
									</div>
								</div>

								<hr class="form-divider my-4">

								<div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
									<a href="<c:url value='/admin/categories'/>" class="btn btn-back">
										<i class="fas fa-arrow-left me-2"></i>Quay lại
									</a>

									<div class="d-flex gap-2">
										<button type="reset" class="btn btn-reset" onclick="resetForm()">
											<i class="fas fa-redo me-2"></i>Hoàn tác
										</button>
										<button type="submit" class="btn btn-submit">
											<i class="fas fa-save me-2"></i>Cập nhật
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script>
			document.getElementById('icon').addEventListener('change', function (e) {
				const file = e.target.files[0];
				if (file) {
					// Update label text
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
				document.querySelector('.file-label-text').textContent = 'Chọn hình ảnh mới';
				document.getElementById('imagePreview').style.display = 'none';
			}

			function resetForm() {
				removeImage();
			}
		</script>

		<style>
			/* Fixed styles for File Upload Label */
			.file-upload-label {
				display: block;
				width: 100%;
				padding: 30px;
				border: 2px dashed #cbd5e0;
				border-radius: 10px;
				text-align: center;
				background: #f8f9fa;
				cursor: pointer;
				/* Quan trọng: Hình bàn tay */
				transition: all 0.3s ease;
				color: #4a5568;
			}

			.file-upload-label:hover {
				background: #e2e8f0;
				border-color: #a0aec0;
				color: #2d3748;
			}

			/* Additional styles for edit page */
			.current-image-wrapper {
				position: relative;
				display: inline-block;
				border-radius: 15px;
				overflow: hidden;
				box-shadow: var(--shadow-md);
			}

			.current-image {
				max-width: 200px;
				max-height: 200px;
				border-radius: 15px;
				display: block;
			}

			.badge-current {
				position: absolute;
				bottom: 10px;
				left: 10px;
				background: rgba(255, 107, 157, 0.9);
				color: white;
				padding: 6px 12px;
				border-radius: 20px;
				font-size: 0.85rem;
				font-weight: 600;
			}

			.custom-alert {
				border: none;
				border-radius: 15px;
				padding: 15px 20px;
				font-weight: 500;
				box-shadow: var(--shadow-sm);
			}

			.alert-success {
				background-color: rgba(0, 184, 148, 0.1);
				color: #00b894;
				border-left: 4px solid #00b894;
			}

			.alert-danger {
				background-color: rgba(231, 76, 60, 0.1);
				color: #e74c3c;
				border-left: 4px solid #e74c3c;
			}

			/* Styles for image preview wrapper (copy from add styles if missing) */
			.image-preview {
				position: relative;
				display: inline-block;
				border-radius: 10px;
				overflow: hidden;
				box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
			}

			.image-preview img {
				max-width: 200px;
				display: block;
			}

			.btn-remove-image {
				position: absolute;
				top: 5px;
				right: 5px;
				background: rgba(255, 255, 255, 0.9);
				border: none;
				border-radius: 50%;
				width: 25px;
				height: 25px;
				display: flex;
				align-items: center;
				justify-content: center;
				cursor: pointer;
				color: #e74c3c;
			}
		</style>
