<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-lg border-0 rounded-lg">
                <div class="card-header bg-danger text-white text-center">
                    <h3 class="font-weight-light my-2">Đăng Nhập</h3>
                </div>
                <div class="card-body p-4">
                    <!-- Hiển thị thông báo lỗi/thành công -->
                    <c:if test="${not empty alert}">
                        <div class="alert alert-warning text-center" role="alert">
                            ${alert}
                        </div>
                    </c:if>

                    <form action="<c:url value='/login'/>" method="post">
                        <div class="form-floating mb-3">
                            <input class="form-control" id="username" name="username" type="text" placeholder="Tên đăng nhập" required />
                            <label for="username">Tên đăng nhập</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input class="form-control" id="password" name="password" type="password" placeholder="Mật khẩu" required />
                            <label for="password">Mật khẩu</label>
                        </div>
                        <div class="form-check mb-3">
                            <input class="form-check-input" id="remember" name="remember" type="checkbox" value="on" />
                            <label class="form-check-label" for="remember">Nhớ mật khẩu</label>
                        </div>
                        <div class="d-grid gap-2 mt-4 mb-0">
                            <button class="btn btn-danger btn-block" type="submit">Đăng nhập</button>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center py-3">
                    <div class="small"><a href="<c:url value='/register'/>" class="text-decoration-none">Chưa có tài khoản? Đăng ký ngay!</a></div>
                    <div class="small mt-2"><a href="<c:url value='/forgot-password'/>" class="text-decoration-none text-muted">Quên mật khẩu?</a></div>
                </div>
            </div>
        </div>
    </div>
</div>