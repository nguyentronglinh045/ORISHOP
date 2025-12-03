<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="container-fluid px-4">
    <h1 class="mt-4">Quản lý Người dùng</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="<c:url value='/admin/home'/>">Dashboard</a></li>
        <li class="breadcrumb-item active">Người dùng</li>
    </ol>

    <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible fade show">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show">
            ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <div class="card mb-4">
        <div class="card-header d-flex justify-content-between align-items-center">
            <div><i class="fas fa-users me-1"></i> Danh sách Tài khoản</div>
            <a href="<c:url value='/admin/user/create'/>" class="btn btn-primary btn-sm">
                <i class="fas fa-user-plus"></i> Thêm mới
            </a>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Tên đăng nhập</th>
                        <th>Họ và tên</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Vai trò</th>
                        <th>Ngày tạo</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${users}" var="u">
                        <tr>
                            <td>${u.userId}</td>
                            <td>${u.username}</td>
                            <td>${u.fullname}</td>
                            <td>${u.email}</td>
                            <td>${u.phone}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${u.role == 1}">
                                        <span class="badge bg-danger">Admin</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-primary">User</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <fmt:formatDate value="${u.createDate}" pattern="dd/MM/yyyy"/>
                            </td>
                            <td>
                                <a href="<c:url value='/admin/user/edit?id=${u.userId}'/>" class="btn btn-warning btn-sm">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="<c:url value='/admin/user/delete?id=${u.userId}'/>" class="btn btn-danger btn-sm"
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa user này không?');">
                                    <i class="fas fa-trash-alt"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>