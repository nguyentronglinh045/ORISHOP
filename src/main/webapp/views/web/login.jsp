<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - OriShop</title>

    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background: #f5f6fa;
            margin: 0;
        }

        /* Wrapper căn giữa */
        .login-wrapper {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        /* Card chính */
        .login-card {
            width: 100%;
            max-width: 430px;
            background: white;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 20px 45px rgba(0,0,0,0.1);
            animation: fadeIn 0.4s ease;
        }

        /* Header màu đỏ đẹp */
        .login-header {
            background: linear-gradient(135deg, #d6293b, #b1202f);
            color: white;
            text-align: center;
            padding: 35px 20px;
        }

        .login-icon {
            font-size: 3.2rem;
            margin-bottom: 10px;
            opacity: 0.9;
        }

        /* Body form */
        .login-body {
            padding: 35px;
        }

        .form-floating label {
            transition: 0.2s;
        }

        .form-control:focus {
            border-color: #d6293b;
            box-shadow: 0 0 0 0.2rem rgba(214, 41, 59, 0.25);
        }

        /* Nút Login */
        .btn-login {
            background-color: #d6293b;
            border: none;
            font-weight: 700;
            letter-spacing: 1px;
            padding: 12px;
            border-radius: 50px;
            transition: 0.25s;
        }
        .btn-login:hover {
            background-color: #b11f2d;
            transform: translateY(-2px);
            box-shadow: 0 8px 18px rgba(214, 41, 59, 0.3);
        }

        /* Divider */
        .divider-text {
            text-align: center;
            margin: 25px 0;
            position: relative;
        }
        .divider-text span {
            background: white;
            padding: 0 10px;
            font-size: 13px;
            color: #777;
            z-index: 2;
            position: relative;
        }
        .divider-text:before {
            content: "";
            width: 100%;
            height: 1px;
            background: #ddd;
            position: absolute;
            top: 50%;
            left: 0;
            z-index: 1;
        }

        /* Social buttons */
        .social-btn {
            width: 42px;
            height: 42px;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            color: white;
            border-radius: 50%;
            margin: 0 7px;
            transition: 0.25s;
            text-decoration: none;
        }

        .social-fb { background: #3b5998; }
        .social-gg { background: #db4437; }

        .social-btn:hover {
            transform: scale(1.12);
            opacity: 0.85;
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>

<div class="login-wrapper">
    <div class="login-card">

        <!-- Header -->
        <div class="login-header">
            <div class="login-icon"><i class="fas fa-user-circle"></i></div>
            <h3 class="m-0 fw-bold">Chào mừng trở lại</h3>
            <p class="m-0 text-white-50">Đăng nhập để tiếp tục mua sắm</p>
        </div>

        <div class="login-body">

            <!-- Thông báo lỗi -->
            <c:if test="${not empty alert}">
                <div class="alert alert-danger d-flex align-items-center">
                    <i class="fas fa-exclamation-circle me-2"></i>
                    <span>${alert}</span>
                </div>
            </c:if>

            <!-- Form -->
            <form action="<c:url value='/login'/>" method="post">

                <div class="form-floating mb-3">
                    <input type="text" id="username" name="username" class="form-control" placeholder="Tên đăng nhập" required>
                    <label for="username"><i class="fas fa-user me-2 text-muted"></i>Tên đăng nhập</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="password" id="password" name="password" class="form-control" placeholder="Mật khẩu" required>
                    <label for="password"><i class="fas fa-lock me-2 text-muted"></i>Mật khẩu</label>
                </div>

                <div class="d-flex justify-content-between mb-4">
                    <div class="form-check">
                        <input type="checkbox" name="remember" id="remember" class="form-check-input">
                        <label for="remember" class="form-check-label small text-secondary">Nhớ mật khẩu</label>
                    </div>
                    <a href="<c:url value='/forgot-password'/>" class="small text-danger fw-bold text-decoration-none">Quên mật khẩu?</a>
                </div>

                <button class="btn btn-login w-100" type="submit">Đăng Nhập</button>
            </form>

            <!-- Divider -->
            <div class="divider-text"><span>Hoặc đăng nhập với</span></div>

            <div class="text-center">
                <a href="#" class="social-btn social-fb"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social-btn social-gg"><i class="fab fa-google"></i></a>
            </div>

            <p class="text-center mt-4 small text-muted">
                Chưa có tài khoản?
                <a href="<c:url value='/register'/>" class="fw-bold text-danger text-decoration-none">Đăng ký ngay</a>
            </p>

        </div>
    </div>
</div>

</body>
</html>
