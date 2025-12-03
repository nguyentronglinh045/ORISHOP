<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container-fluid px-4">
    <h1 class="mt-4">Cập nhật Người dùng</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="<c:url value='/admin/users'/>">Người dùng</a></li>
        <li class="breadcrumb-item active">Cập nhật</li>
    </ol>

    <div class="card mb-4">
        <div class="card-header">Thông tin chi tiết</div>
        <div class="card-body">
            <form action="<c:url value='/admin/user/update'/>" method="post">
                <!-- ID ẩn để update -->
                <input type="hidden" name="userId" value="${user.userId}">

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Tên đăng nhập:</label>
                        <input type="text" class="form-control" name="username" value="${user.username}" readonly class="bg-light">
                        <div class="form-text">Không thể thay đổi tên đăng nhập.</div>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Mật khẩu mới:</label>
                        <input type="password" class="form-control" name="password" placeholder="Để trống nếu không đổi mật khẩu">
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Họ và tên:</label>
                    <input type="text" class="form-control" name="fullname" value="${user.fullname}" required>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Email:</label>
                        <input type="email" class="form-control" name="email" value="${user.email}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Số điện thoại:</label>
                        <input type="tel" class="form-control" name="phone" value="${user.phone}">
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Vai trò:</label>
                    <select class="form-select" name="role">
                        <option value="0" ${user.role == 0 ? 'selected' : ''}>Người dùng (User)</option>
                        <option value="1" ${user.role == 1 ? 'selected' : ''}>Quản trị viên (Admin)</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Cập nhật</button>
                <a href="<c:url value='/admin/users'/>" class="btn btn-secondary">Quay lại</a>
            </form>
        </div>
    </div>
</div>