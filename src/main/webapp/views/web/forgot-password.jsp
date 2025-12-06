<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-custom border-0 rounded-custom">
                <div class="card-header text-center">
                    <h3 class="fw-bold my-2">
                        <i class="fas fa-key me-2"></i>Khôi Phục Mật Khẩu
                    </h3>
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
                            <button class="btn btn-primary btn-lg" type="submit">
                                <i class="fas fa-paper-plane me-2"></i>Gửi yêu cầu
                            </button>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center py-3 bg-light-custom">
                    <div class="small mb-2">
                        <a href="<c:url value='/login'/>" class="text-primary fw-bold text-decoration-none">Quay lại Đăng nhập</a>
                    </div>
                    <div class="small">
                        Chưa có tài khoản? 
                        <a href="<c:url value='/register'/>" class="text-primary fw-bold text-decoration-none">Đăng ký!</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>