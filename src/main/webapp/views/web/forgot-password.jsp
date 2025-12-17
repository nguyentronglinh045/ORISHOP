<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="sections/styles/forgot-password-styles.jsp" %>

<div class="forgot-page">
    <div class="forgot-card">
        <div class="forgot-header">
            <div class="forgot-icon">
                <i class="fas fa-key"></i>
            </div>
            <h1 class="forgot-title">
                <c:choose>
                    <c:when test="${step == 'verify'}">Xác thực OTP</c:when>
                    <c:when test="${step == 'reset'}">Đặt lại mật khẩu</c:when>
                    <c:otherwise>Khôi phục mật khẩu</c:otherwise>
                </c:choose>
            </h1>
        </div>

        <div class="forgot-body">
            <p class="forgot-description">
                <c:choose>
                    <c:when test="${step == 'verify'}">
                        Mã xác thực 6 số đã được gửi đến email của bạn. Vui lòng kiểm tra hộp thư (kể cả mục Spam).
                    </c:when>
                    <c:when test="${step == 'reset'}">
                        Vui lòng nhập mật khẩu mới để hoàn tất quá trình khôi phục tài khoản.
                    </c:when>
                    <c:otherwise>
                        Nhập địa chỉ email đã đăng ký và chúng tôi sẽ gửi mã xác thực để đặt lại mật khẩu cho bạn.
                    </c:otherwise>
                </c:choose>
            </p>

            <c:if test="${not empty message}">
                <div class="forgot-alert alert-success">
                    <i class="fas fa-check-circle"></i>
                    <span>${message}</span>
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

            <c:choose>
                
                <%-- BƯỚC 2: NHẬP OTP --%>
                <c:when test="${step == 'verify'}">
                    <form action="<c:url value='/verify-otp'/>" method="post">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-shield-alt me-1 text-primary"></i>
                                Mã OTP
                            </label>
                            <div class="input-wrapper">
                                <i class="fas fa-keyboard input-icon"></i>
                                <input type="text" class="form-control" name="otp"
                                    placeholder="Nhập 6 số OTP..." maxlength="6" required>
                            </div>
                        </div>

                        <button type="submit" class="btn-submit">
                            <i class="fas fa-check-circle me-2"></i>Xác thực ngay
                        </button>
                    </form>
                </c:when>

                <%-- BƯỚC 3: ĐẶT MẬT KHẨU MỚI --%>
                <c:when test="${step == 'reset'}">
                    <form action="<c:url value='/reset-password'/>" method="post">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-lock me-1 text-primary"></i>
                                Mật khẩu mới
                            </label>
                            <div class="input-wrapper">
                                <i class="fas fa-lock input-icon"></i>
                                <input type="password" class="form-control" name="password"
                                    placeholder="Nhập mật khẩu mới..." required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-lock me-1 text-primary"></i>
                                Xác nhận mật khẩu
                            </label>
                            <div class="input-wrapper">
                                <i class="fas fa-check-double input-icon"></i>
                                <input type="password" class="form-control" name="confirmPassword"
                                    placeholder="Nhập lại mật khẩu..." required>
                            </div>
                        </div>

                        <button type="submit" class="btn-submit btn-success">
                            <i class="fas fa-save me-2"></i>Đổi mật khẩu
                        </button>
                    </form>
                </c:when>

                <%-- BƯỚC 1: NHẬP EMAIL (MẶC ĐỊNH) --%>
                <c:otherwise>
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
                            <i class="fas fa-paper-plane me-2"></i>Gửi mã OTP
                        </button>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="forgot-footer">
            <div class="footer-link">
                <a href="<c:url value='/login'/>">
                    <i class="fas fa-arrow-left me-1"></i>Quay lại Đăng nhập
                </a>
            </div>
            <c:if test="${empty step}">
                <div class="footer-link">
                    <span>Chưa có tài khoản?</span>
                    <a href="<c:url value='/register'/>">Đăng ký ngay!</a>
                </div>
            </c:if>
        </div>
    </div>
</div>