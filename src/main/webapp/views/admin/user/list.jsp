<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

                <!-- User List Styles -->
                <jsp:include page="sections/styles/list-styles.jsp" />

                <div class="container-fluid px-4 py-4">
                    <!-- Hero Section -->
                    <div class="user-hero mb-4">
                        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                            <div>
                                <h1 class="page-title mb-2">
                                    <i class="fas fa-users me-2"></i>Quản lý Người dùng
                                </h1>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb mb-0">
                                        <li class="breadcrumb-item">
                                            <a href="<c:url value='/admin/home'/>">
                                                <i class="fas fa-home me-1"></i>Dashboard
                                            </a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page">Người dùng</li>
                                    </ol>
                                </nav>
                            </div>
                            <a href="<c:url value='/admin/user/create'/>" class="btn btn-add">
                                <i class="fas fa-user-plus me-2"></i>Thêm người dùng
                            </a>
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

                    <!-- User List Card -->
                    <div class="card user-card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="mb-0">
                                <i class="fas fa-list me-2"></i>Danh sách Tài khoản
                            </h5>
                            <span class="badge">
                                <i class="fas fa-users me-1"></i>${fn:length(users)} người dùng
                            </span>
                        </div>
                        <div class="card-body p-0">
                            <c:choose>
                                <c:when test="${empty users}">
                                    <!-- Empty State -->
                                    <div class="empty-state text-center">
                                        <i class="fas fa-user-slash empty-icon mb-3"></i>
                                        <h4 class="text-muted">Chưa có người dùng nào</h4>
                                        <p class="text-muted mb-4">Hãy thêm người dùng đầu tiên cho hệ thống!</p>
                                        <a href="<c:url value='/admin/user/create'/>" class="btn btn-add">
                                            <i class="fas fa-user-plus me-2"></i>Thêm người dùng ngay
                                        </a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="table-responsive">
                                        <table class="user-table">
                                            <thead>
                                                <tr>
                                                    <th class="text-center" style="width: 60px;">ID</th>
                                                    <th style="min-width: 200px;">Thông tin</th>
                                                    <th style="min-width: 180px;">Liên hệ</th>
                                                    <th class="text-center" style="width: 120px;">Vai trò</th>
                                                    <th class="text-center" style="width: 120px;">Ngày tạo</th>
                                                    <th class="text-center" style="width: 120px;">Thao tác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${users}" var="u" varStatus="loop">
                                                    <tr class="user-row">
                                                        <td class="text-center fw-bold">#${u.userId}</td>
                                                        <td>
                                                            <div class="user-info">
                                                                <div class="user-avatar">
                                                                    ${fn:toUpperCase(fn:substring(u.fullname, 0, 1))}
                                                                </div>
                                                                <div class="user-details">
                                                                    <span class="user-fullname">${u.fullname}</span>
                                                                    <span class="user-username">@${u.username}</span>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="contact-info">
                                                                <span class="contact-item">
                                                                    <i class="fas fa-envelope"></i>${u.email}
                                                                </span>
                                                                <c:if test="${not empty u.phone}">
                                                                    <span class="contact-item">
                                                                        <i class="fas fa-phone"></i>${u.phone}
                                                                    </span>
                                                                </c:if>
                                                            </div>
                                                        </td>
                                                        <td class="text-center">
                                                            <c:choose>
                                                                <c:when test="${u.role == 1}">
                                                                    <span class="role-badge admin">
                                                                        <i class="fas fa-crown"></i>Admin
                                                                    </span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="role-badge user">
                                                                        <i class="fas fa-user"></i>User
                                                                    </span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td class="text-center">
                                                            <span class="date-display">
                                                                <fmt:formatDate value="${u.createDate}"
                                                                    pattern="dd/MM/yyyy" />
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <div class="action-buttons">
                                                                <a href="<c:url value='/admin/user/edit?id=${u.userId}'/>"
                                                                    class="btn-edit" title="Chỉnh sửa">
                                                                    <i class="fas fa-edit"></i>
                                                                </a>
                                                                <a href="<c:url value='/admin/user/delete?id=${u.userId}'/>"
                                                                    class="btn-delete" title="Xóa"
                                                                    onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này không?');">
                                                                    <i class="fas fa-trash-alt"></i>
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>