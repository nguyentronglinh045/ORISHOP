<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container-fluid px-4">
    <h1 class="mt-4">Thêm Người dùng mới</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="<c:url value='/admin/users'/>">Người dùng</a></li>
        <li class="breadcrumb-item active">Thêm mới</li>
    </ol>

    <div class="card mb-4">
        <div class="card-header">Thông tin tài khoản</div>
        <div class="card-body">
            <form action="<c:url value='/admin/user/create'/>" method="post">
                
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Tên đăng nhập:</label>
                        <input type="text" class="form-control" name="username" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Mật khẩu:</label>
                        <input type="password" class="form-control" name="password" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Họ và tên:</label>
                    <input type="text" class="form-control" name="fullname" required>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Email:</label>
                        <input type="email" class="form-control" name="email" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Số điện thoại:</label>
                        <input type="tel" class="form-control" name="phone">
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Vai trò:</label>
                    <select class="form-select" name="role">
                        <option value="0">Người dùng (User)</option>
                        <option value="1">Quản trị viên (Admin)</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Lưu lại</button>
                <a href="<c:url value='/admin/users'/>" class="btn btn-secondary">Quay lại</a>
                <a href="<c:url value='/admin/user/reset'/>" class="btn btn-info">Reset Form</a>
            </form>
        </div>
    </div>
</div>