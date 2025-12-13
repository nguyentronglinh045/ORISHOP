<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <%@ include file="sections/styles/forgot-password-styles.jsp" %>

            <div class="forgot-page">
                <div class="forgot-card">
                    <!-- Header -->
                    <div class="forgot-header">
                        <div class="forgot-icon">
                            <i class="fas fa-key"></i>
                        </div>
                        <h1 class="forgot-title">Khôi phục mật khẩu</h1>
                    </div>

                    <!-- Body -->
                    <div class="forgot-body">
                        <p class="forgot-description">
                            Nhập địa chỉ email đã đăng ký và chúng tôi sẽ gửi hướng dẫn đặt lại mật khẩu cho bạn.
                        </p>

                        <!-- Alert -->
                        <c:if test="${not empty alert}">
                            <div class="forgot-alert alert-info">
                                <i class="fas fa-info-circle"></i>
                                <span>${alert}</span>
                            </div>
                        </c:if>

                        <c:if test="${not empty success}">
                            <div class="forgot-alert alert-success">
                                <i class="fas fa-check-circle"></i>
                                <span>${success}</span>
                            </div>
                        </c:if>

                        <c:if test="${not empty error}">
                            <div class="forgot-alert alert-danger">
                                <i class="fas fa-exclamation-circle"></i>
                                <span>${error}</span>
                            </div>
                        </c:if>

                        <!-- Form -->
                        <form action="<c:url value='/forgot-password'/>" method="post">
                            <div class="form-group">
                                <label class="form-label">
                                    <i class="fas fa-envelope me-1 text-primary"></i>
                                    Địa chỉ Email
                                </label>
                                <div class="input-wrapper">
                                    <i class="fas fa-envelope input-icon"></i>
                                    <input type="email" class="form-control" name="email"
                                        placeholder="Nhập email của bạn..." required>
                                </div>
                            </div>

                            <button type="submit" class="btn-submit">
                                <i class="fas fa-paper-plane me-2"></i>Gửi yêu cầu
                            </button>
                        </form>
                    </div>

                    <!-- Footer -->
                    <div class="forgot-footer">
                        <div class="footer-link">
                            <a href="<c:url value='/login'/>">
                                <i class="fas fa-arrow-left me-1"></i>Quay lại Đăng nhập
                            </a>
                        </div>
                        <div class="footer-link">
                            <span>Chưa có tài khoản?</span>
                            <a href="<c:url value='/register'/>">Đăng ký ngay!</a>
                        </div>
                    </div>
                </div>
            </div>