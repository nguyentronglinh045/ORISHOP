<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <head>
            <title>Đăng ký - OriShop</title>
            <%@ include file="sections/styles/auth-styles.jsp" %>
        </head>

        <!-- Home Button -->
        <a href="<c:url value='/home'/>" class="btn-home">
            <i class="fas fa-home me-2"></i>Trang chủ
        </a>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="card mt-5 shadow">
                        <div class="card-header text-center text-white"
                            style="background: linear-gradient(135deg, #ff6b9d, #c44569);">
                            <h3 class="mb-0">
                                <i class="fas fa-user-plus me-2"></i>Đăng ký tài khoản
                            </h3>
                        </div>
                        <div class="card-body p-4">
                            <!-- Alert -->
                            <c:if test="${not empty alert}">
                                <div class="alert alert-danger d-flex align-items-center" role="alert">
                                    <i class="fas fa-exclamation-circle me-2"></i>
                                    <span>${alert}</span>
                                </div>
                            </c:if>

                            <!-- Register Form -->
                            <form action="<c:url value='/register'/>" method="post">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="fullname" class="form-label">Họ và tên</label>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                                            <input type="text" id="fullname" name="fullname" class="form-control"
                                                placeholder="Nhập họ tên" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="username" class="form-label">Tên đăng nhập</label>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-at"></i></span>
                                            <input type="text" id="username" name="username" class="form-control"
                                                placeholder="Nhập tên đăng nhập" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                            <input type="email" id="email" name="email" class="form-control"
                                                placeholder="Nhập email" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="phone" class="form-label">Số điện thoại</label>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                            <input type="tel" id="phone" name="phone" class="form-control"
                                                placeholder="Nhập số điện thoại" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="password" class="form-label">Mật khẩu</label>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                            <input type="password" id="password" name="password" class="form-control"
                                                placeholder="Nhập mật khẩu" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="confirmPassword" class="form-label">Xác nhận mật khẩu</label>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-check"></i></span>
                                            <input type="password" id="confirmPassword" name="confirmPassword"
                                                class="form-control" placeholder="Nhập lại mật khẩu" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <div class="form-check">
                                        <input type="checkbox" id="terms" name="terms" class="form-check-input"
                                            required>
                                        <label for="terms" class="form-check-label">
                                            Tôi đồng ý với <a href="#" class="text-primary">Điều khoản dịch vụ</a>
                                            và <a href="#" class="text-primary">Chính sách bảo mật</a>
                                        </label>
                                    </div>
                                </div>

                                <button type="submit" class="btn w-100 mb-3 text-white"
                                    style="background: linear-gradient(135deg, #ff6b9d, #c44569); font-weight: 600;">
                                    <i class="fas fa-user-plus me-2"></i>Đăng Ký
                                </button>
                            </form>

                            <!-- Social Register -->
                            <div class="text-center">
                                <p class="text-muted mb-3">Hoặc đăng ký với</p>
                                <div class="d-flex justify-content-center gap-2">
                                    <a href="#" class="btn btn-outline-primary btn-sm">
                                        <i class="fab fa-facebook-f"></i> Facebook
                                    </a>
                                    <a href="#" class="btn btn-outline-danger btn-sm">
                                        <i class="fab fa-google"></i> Google
                                    </a>
                                </div>
                            </div>

                            <!-- Footer -->
                            <div class="text-center mt-4">
                                <p class="mb-0 text-muted">
                                    Đã có tài khoản?
                                    <a href="<c:url value='/login'/>" class="text-primary text-decoration-none">
                                        Đăng nhập ngay
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>