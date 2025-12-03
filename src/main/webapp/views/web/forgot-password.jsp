<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-lg border-0 rounded-lg">
                <div class="card-header bg-danger text-white text-center">
                    <h3 class="font-weight-light my-2">Khôi Phục Mật Khẩu</h3>
                </div>
                <div class="card-body p-4">
                    <div class="small mb-3 text-muted text-center">
                        Nhập địa chỉ email của bạn và chúng tôi sẽ gửi hướng dẫn đặt lại mật khẩu.
                    </div>

                    <!-- Hiển thị thông báo -->
                    <c:if test="${not empty alert}">
                        <div class="alert alert-info text-center" role="alert">
                            ${alert}
                        </div>
                    </c:if>

                    <form action="<c:url value='/forgot-password'/>" method="post">
                        <div class="form-floating mb-3">
                            <input class="form-control" id="email" name="email" type="email" placeholder="name@example.com" required />
                            <label for="email">Địa chỉ Email</label>
                        </div>
                        
                        <div class="d-grid gap-2 mt-4 mb-0">
                            <button class="btn btn-primary btn-block" type="submit">Gửi yêu cầu</button>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center py-3">
                    <div class="small"><a href="<c:url value='/login'/>" class="text-decoration-none">Quay lại Đăng nhập</a></div>
                    <div class="small mt-2"><a href="<c:url value='/register'/>" class="text-decoration-none">Chưa có tài khoản? Đăng ký!</a></div>
                </div>
            </div>
        </div>
    </div>
</div>