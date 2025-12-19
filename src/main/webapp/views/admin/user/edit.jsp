<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

            <head>
                <title>Sửa Người dùng - ORISHOP Admin</title>
            </head>

            <!-- User Form Styles -->
            <jsp:include page="sections/styles/form-styles.jsp" />

            <div class="container-fluid px-4 py-4">
                <!-- Hero Section -->
                <div class="user-hero mb-4">
                    <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                        <div>
                            <h1 class="page-title mb-2">
                                <i class="fas fa-user-edit me-2"></i>Cập nhật Người dùng
                            </h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item">
                                        <a href="<c:url value='/admin/home'/>">
                                            <i class="fas fa-home me-1"></i>Dashboard
                                        </a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="<c:url value='/admin/users'/>">Người dùng</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Cập nhật</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>

                <!-- Alert Messages -->
                <c:if test="${not empty message}">
                    <div class="alert custom-alert alert-success alert-dismissible fade show mb-4" role="alert">
                        <i class="fas fa-check-circle me-2"></i>${message}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="alert custom-alert alert-danger alert-dismissible fade show mb-4" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i>${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <form action="<c:url value='/admin/user/update'/>" method="post">
                    <!-- Hidden ID -->
                    <input type="hidden" name="userId" value="${user.userId}">

                    <div class="row">
                        <!-- Left Column - User Info -->
                        <div class="col-lg-8">
                            <!-- Account Information -->
                            <div class="section-card">
                                <div class="card-header">
                                    <i class="fas fa-key me-2"></i>Thông tin Tài khoản
                                </div>
                                <div class="card-body p-4">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">
                                                    Tên đăng nhập <span class="text-danger">*</span>
                                                </label>
                                                <div class="input-group">
                                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                                    <input type="text" class="form-control readonly-field"
                                                        name="username" value="${user.username}" readonly>
                                                </div>
                                                <small class="form-text">
                                                    <i class="fas fa-lock me-1"></i>Không thể thay đổi tên đăng nhập
                                                </small>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">Mật khẩu mới</label>
                                                <div class="input-group">
                                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                                    <input type="password" class="form-control" name="password"
                                                        placeholder="Để trống nếu không đổi">
                                                </div>
                                                <small class="form-text">
                                                    <i class="fas fa-info-circle me-1"></i>Chỉ nhập nếu muốn đổi mật
                                                    khẩu
                                                </small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Personal Information -->
                            <div class="section-card">
                                <div class="card-header">
                                    <i class="fas fa-id-card me-2"></i>Thông tin Cá nhân
                                </div>
                                <div class="card-body p-4">
                                    <div class="form-group">
                                        <label class="form-label">
                                            Họ và tên <span class="text-danger">*</span>
                                        </label>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-user-circle"></i></span>
                                            <input type="text" class="form-control" name="fullname"
                                                value="${user.fullname}" placeholder="Nhập họ và tên đầy đủ" required>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">
                                                    Email <span class="text-danger">*</span>
                                                </label>
                                                <div class="input-group">
                                                    <span class="input-group-text"><i
                                                            class="fas fa-envelope"></i></span>
                                                    <input type="email" class="form-control" name="email"
                                                        value="${user.email}" placeholder="example@email.com" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">Số điện thoại</label>
                                                <div class="input-group">
                                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                                    <input type="tel" class="form-control" name="phone"
                                                        value="${user.phone}" placeholder="0123 456 789">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Right Column - Avatar, Role & Actions -->
                        <div class="col-lg-4">
                            <!-- User Avatar Preview -->
                            <div class="section-card">
                                <div class="card-header">
                                    <i class="fas fa-user-circle me-2"></i>Avatar
                                </div>
                                <div class="card-body p-4 text-center">
                                    <div class="user-avatar-preview">
                                        ${fn:toUpperCase(fn:substring(user.fullname, 0, 1))}
                                    </div>
                                    <h5 class="mb-1" style="font-family: 'Quicksand', sans-serif; font-weight: 700;">
                                        ${user.fullname}</h5>
                                    <p class="text-muted mb-0">@${user.username}</p>
                                </div>
                            </div>

                            <!-- Role Selection -->
                            <div class="section-card">
                                <div class="card-header">
                                    <i class="fas fa-shield-alt me-2"></i>Vai trò
                                </div>
                                <div class="card-body p-4">
                                    <div class="role-options">
                                        <div class="role-option">
                                            <input type="radio" id="role-user" name="role" value="0" ${user.role==0
                                                ? 'checked' : '' }>
                                            <label for="role-user" class="role-user">
                                                <i class="fas fa-user"></i>User
                                            </label>
                                        </div>
                                        <div class="role-option">
                                            <input type="radio" id="role-admin" name="role" value="1" ${user.role==1
                                                ? 'checked' : '' }>
                                            <label for="role-admin" class="role-admin">
                                                <i class="fas fa-crown"></i>Admin
                                            </label>
                                        </div>
                                    </div>
                                    <small class="form-text mt-3">
                                        <i class="fas fa-info-circle me-1"></i>
                                        Admin có toàn quyền quản lý hệ thống
                                    </small>
                                </div>
                            </div>

                            <!-- Actions -->
                            <div class="section-card">
                                <div class="card-header">
                                    <i class="fas fa-cog me-2"></i>Thao tác
                                </div>
                                <div class="card-body p-4">
                                    <div class="d-grid gap-2">
                                        <button type="submit" class="btn btn-submit">
                                            <i class="fas fa-save me-2"></i>Cập nhật
                                        </button>
                                        <a href="<c:url value='/admin/users'/>" class="btn btn-back">
                                            <i class="fas fa-arrow-left me-2"></i>Quay lại
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>