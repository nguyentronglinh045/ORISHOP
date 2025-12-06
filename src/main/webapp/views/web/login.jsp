<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <head>
            <title>Đăng nhập - OriShop</title>
            <style>
                /* Hide navbar and footer for login page */
                .top-bar,
                .main-header,
                .navbar-custom,
                footer {
                    display: none !important;
                }

                /* Full height centered layout */
                body {
                    min-height: 100vh;
                    background: linear-gradient(135deg, #ffeef4 0%, #fff5f8 100%);
                    padding: 50px 0;
                }

                .container {
                    width: 100%;
                    max-width: 100%;
                }

                /* Custom input styling with pink theme */
                .input-group-text {
                    background-color: #fff;
                    border: 2px solid #ff6b9d;
                    border-right: none;
                    color: #ff6b9d;
                }

                .input-group .form-control {
                    border: 2px solid #ff6b9d;
                    border-left: none;
                    padding: 0.75rem 1rem;
                }

                .input-group .form-control:focus {
                    border-color: #ff6b9d;
                    box-shadow: none;
                    outline: none;
                }

                .input-group .form-control::placeholder {
                    color: #999;
                    opacity: 0.7;
                }

                /* Ensure icon stays pink on focus */
                .input-group:focus-within .input-group-text {
                    border-color: #ff6b9d;
                    color: #c44569;
                }

                /* Home button styling */
                .btn-home {
                    position: absolute;
                    top: 20px;
                    left: 20px;
                    background: white;
                    border: 2px solid #ff6b9d;
                    color: #ff6b9d;
                    padding: 10px 20px;
                    border-radius: 50px;
                    text-decoration: none;
                    font-weight: 600;
                    transition: all 0.3s;
                    box-shadow: 0 2px 8px rgba(255, 107, 157, 0.2);
                }

                .btn-home:hover {
                    background: linear-gradient(135deg, #ff6b9d, #c44569);
                    color: white;
                    transform: translateY(-2px);
                    box-shadow: 0 4px 12px rgba(255, 107, 157, 0.3);
                }
            </style>
        </head>

        <!-- Home Button -->
        <a href="<c:url value='/home'/>" class="btn-home">
            <i class="fas fa-home me-2"></i>Trang chủ
        </a>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <div class="card mt-5 shadow">
                        <div class="card-header text-center text-white"
                            style="background: linear-gradient(135deg, #ff6b9d, #c44569);">
                            <h3 class="mb-0">
                                <i class="fas fa-sign-in-alt me-2"></i>Đăng nhập
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

                            <!-- Login Form -->
                            <form action="<c:url value='/login'/>" method="post">
                                <div class="mb-3">
                                    <label for="username" class="form-label">Tên đăng nhập</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                                        <input type="text" id="username" name="username" class="form-control"
                                            placeholder="Nhập tên đăng nhập" required>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="password" class="form-label">Mật khẩu</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                        <input type="password" id="password" name="password" class="form-control"
                                            placeholder="Nhập mật khẩu" required>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <div class="form-check">
                                        <input type="checkbox" name="remember" id="remember" class="form-check-input">
                                        <label for="remember" class="form-check-label">Nhớ mật khẩu</label>
                                    </div>
                                    <a href="<c:url value='/forgot-password'/>"
                                        class="text-primary text-decoration-none">
                                        Quên mật khẩu?
                                    </a>
                                </div>

                                <button type="submit" class="btn w-100 mb-3 text-white"
                                    style="background: linear-gradient(135deg, #ff6b9d, #c44569); font-weight: 600;">
                                    <i class="fas fa-sign-in-alt me-2"></i>Đăng Nhập
                                </button>
                            </form>

                            <!-- Social Login -->
                            <div class="text-center">
                                <p class="text-muted mb-3">Hoặc đăng nhập với</p>
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
                                    Chưa có tài khoản?
                                    <a href="<c:url value='/register'/>" class="text-primary text-decoration-none">
                                        Đăng ký ngay
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>