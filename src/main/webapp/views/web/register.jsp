<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Đăng ký - OriShop</title>

            <!-- Bootstrap 5 Local -->
            <link href="/ORISHOP/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <!-- Font Awesome Local -->
            <link href="/ORISHOP/assets/lib/fontawesome/css/all.min.css" rel="stylesheet">
            <!-- Google Fonts -->
            <link
                href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&family=Inter:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">
            <!-- ORISHOP Theme CSS -->
            <link href="/ORISHOP/assets/css/orishop-theme.css" rel="stylesheet">

            <style>
                :root {
                    --primary: #ff6b9d;
                    --primary-dark: #e84a7f;
                    --secondary: #ffd1dc;
                    --white: #ffffff;
                    --dark: #2d3436;
                    --light: #fff5f8;
                    --light-gray: #f8f9fa;
                    --border: #e9ecef;
                    --gradient-primary: linear-gradient(135deg, #ff6b9d, #ffb6c1);
                    --shadow-sm: 0 2px 8px rgba(255, 107, 157, 0.1);
                    --shadow-md: 0 4px 16px rgba(255, 107, 157, 0.15);
                    --shadow-lg: 0 8px 32px rgba(255, 107, 157, 0.2);
                    --shadow-hover: 0 12px 40px rgba(255, 107, 157, 0.25);
                    --radius-md: 15px;
                    --radius-full: 50px;
                    --transition-base: 0.3s ease;
                }

                body {
                    font-family: 'Inter', sans-serif;
                    background: var(--light-gray);
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    padding: 20px;
                }

                .auth-wrapper {
                    width: 100%;
                    max-width: 600px;
                    margin: 0 auto;
                }

                .auth-card {
                    background: var(--white);
                    border-radius: var(--radius-md);
                    overflow: hidden;
                    box-shadow: var(--shadow-lg);
                    animation: fadeInUp 0.5s ease;
                }

                @keyframes fadeInUp {
                    from {
                        opacity: 0;
                        transform: translateY(30px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                .auth-header {
                    background: var(--gradient-primary);
                    color: var(--white);
                    text-align: center;
                    padding: 50px 30px 40px;
                    position: relative;
                    overflow: hidden;
                }

                .auth-header::before {
                    content: '';
                    position: absolute;
                    top: -50%;
                    right: -50%;
                    width: 200%;
                    height: 200%;
                    background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0%, transparent 70%);
                    animation: pulse 3s ease-in-out infinite;
                }

                @keyframes pulse {

                    0%,
                    100% {
                        transform: scale(1);
                        opacity: 0.5;
                    }

                    50% {
                        transform: scale(1.1);
                        opacity: 0.8;
                    }
                }

                .auth-icon {
                    font-size: 4rem;
                    margin-bottom: 15px;
                    position: relative;
                    z-index: 1;
                    display: inline-block;
                    animation: bounce 2s ease-in-out infinite;
                }

                @keyframes bounce {

                    0%,
                    100% {
                        transform: translateY(0);
                    }

                    50% {
                        transform: translateY(-10px);
                    }
                }

                .auth-header h2 {
                    font-family: 'Quicksand', sans-serif;
                    font-size: 2rem;
                    font-weight: 700;
                    margin-bottom: 8px;
                    position: relative;
                    z-index: 1;
                }

                .auth-header p {
                    font-size: 0.95rem;
                    opacity: 0.95;
                    position: relative;
                    z-index: 1;
                    margin: 0;
                }

                .auth-body {
                    padding: 40px 35px;
                }

                .form-group {
                    margin-bottom: 20px;
                    position: relative;
                }

                .form-control {
                    border: 2px solid var(--border);
                    border-radius: var(--radius-md);
                    padding: 14px 20px 14px 45px;
                    font-size: 0.95rem;
                    transition: all var(--transition-base);
                    width: 100%;
                    background-color: var(--white);
                }

                .form-control:focus {
                    border-color: var(--primary);
                    box-shadow: 0 0 0 0.25rem rgba(255, 107, 157, 0.15);
                    outline: none;
                }

                .form-control::placeholder {
                    color: #6c757d;
                    opacity: 0.7;
                }

                .input-icon {
                    position: absolute;
                    left: 15px;
                    top: 50%;
                    transform: translateY(-50%);
                    color: var(--primary);
                    z-index: 3;
                    font-size: 1.1rem;
                    pointer-events: none;
                    transition: color var(--transition-base);
                }

                .form-group .form-control:focus~.input-icon {
                    color: var(--primary-dark);
                }

                .btn-register {
                    background: var(--gradient-primary);
                    border: none;
                    color: var(--white);
                    font-weight: 700;
                    font-size: 1rem;
                    padding: 16px;
                    border-radius: var(--radius-full);
                    width: 100%;
                    transition: all var(--transition-base);
                    box-shadow: var(--shadow-md);
                    letter-spacing: 0.5px;
                    text-transform: uppercase;
                }

                .btn-register:hover {
                    transform: translateY(-3px);
                    box-shadow: var(--shadow-hover);
                    color: var(--white);
                }

                .btn-register:active {
                    transform: translateY(-1px);
                }

                .auth-footer {
                    text-align: center;
                    padding-top: 25px;
                    border-top: 1px solid var(--border);
                    margin-top: 25px;
                }

                .auth-footer a {
                    color: var(--primary);
                    font-weight: 600;
                    text-decoration: none;
                    transition: all var(--transition-base);
                }

                .auth-footer a:hover {
                    color: var(--primary-dark);
                    text-decoration: underline;
                }

                .alert {
                    border-radius: var(--radius-md);
                    border: none;
                    padding: 14px 18px;
                    margin-bottom: 25px;
                }

                .alert-danger {
                    background: #fee;
                    color: #c33;
                    border-left: 4px solid var(--danger);
                }

                .password-strength {
                    font-size: 0.85rem;
                    margin-top: 5px;
                }

                .password-strength.weak {
                    color: #e74c3c;
                }

                .password-strength.medium {
                    color: #f39c12;
                }

                .password-strength.strong {
                    color: #00b894;
                }

                /* Responsive */
                @media (max-width: 768px) {
                    .auth-body {
                        padding: 30px 25px;
                    }

                    .auth-header {
                        padding: 40px 25px 35px;
                    }

                    .auth-icon {
                        font-size: 3rem;
                    }

                    .auth-header h2 {
                        font-size: 1.75rem;
                    }
                }

                @media (max-width: 576px) {
                    .auth-body {
                        padding: 25px 20px;
                    }
                }
            </style>
        </head>

        <body>
            <div class="auth-wrapper">
                <div class="auth-card">
                    <!-- Header -->
                    <div class="auth-header">
                        <div class="auth-icon">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <h2>Tạo Tài Khoản Mới</h2>
                        <p>Tham gia cùng OriShop ngay hôm nay</p>
                    </div>

                    <!-- Body -->
                    <div class="auth-body">
                        <!-- Alert -->
                        <c:if test="${not empty alert}">
                            <div class="alert alert-danger d-flex align-items-center" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i>
                                <span>${alert}</span>
                            </div>
                        </c:if>

                        <!-- Form -->
                        <form action="<c:url value='/register'/>" method="post" id="registerForm">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" id="username" name="username" class="form-control"
                                            placeholder="Tên đăng nhập" required>
                                        <i class="fas fa-user input-icon"></i>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" id="fullname" name="fullname" class="form-control"
                                            placeholder="Họ và tên đầy đủ" required>
                                        <i class="fas fa-id-card input-icon"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <input type="email" id="email" name="email" class="form-control"
                                    placeholder="Địa chỉ Email" required>
                                <i class="fas fa-envelope input-icon"></i>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="password" id="password" name="password" class="form-control"
                                            placeholder="Mật khẩu" required minlength="6">
                                        <i class="fas fa-lock input-icon"></i>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="password" id="confirmPassword" name="confirmPassword"
                                            class="form-control" placeholder="Xác nhận mật khẩu" required>
                                        <i class="fas fa-lock input-icon"></i>
                                    </div>
                                </div>
                            </div>

                            <button class="btn btn-register" type="submit">
                                <i class="fas fa-check me-2"></i>Tạo Tài Khoản
                            </button>
                        </form>

                        <!-- Footer -->
                        <div class="auth-footer">
                            <p class="mb-0 small text-muted">
                                Đã có tài khoản?
                                <a href="<c:url value='/login'/>">Đăng nhập ngay</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bootstrap JS -->
            <script src="/ORISHOP/assets/lib/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Form Validation -->
            <script>
                document.getElementById('registerForm').addEventListener('submit', function (e) {
                    var password = document.getElementById('password').value;
                    var confirmPassword = document.getElementById('confirmPassword').value;

                    if (password !== confirmPassword) {
                        e.preventDefault();
                        alert('Mật khẩu xác nhận không khớp!');
                        return false;
                    }

                    if (password.length < 6) {
                        e.preventDefault();
                        alert('Mật khẩu phải có ít nhất 6 ký tự!');
                        return false;
                    }
                });
            </script>
        </body>

        </html>