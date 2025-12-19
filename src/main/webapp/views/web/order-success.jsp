<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <head>
            <title>Đặt hàng thành công - OriShop</title>
        </head>

        <%@ include file="sections/styles/order-success-styles.jsp" %>

            <div class="success-page">
                <div class="success-card">
                    <!-- Confetti -->
                    <div class="confetti"></div>
                    <div class="confetti"></div>
                    <div class="confetti"></div>

                    <!-- Success Icon -->
                    <div class="success-icon-wrapper">
                        <div class="success-icon">
                            <i class="fas fa-check"></i>
                        </div>
                    </div>

                    <!-- Content -->
                    <h1 class="success-title">Đặt hàng thành công!</h1>
                    <p class="success-subtitle">Cảm ơn bạn đã mua sắm tại OriShop</p>
                    <p class="success-message">
                        Đơn hàng của bạn đã được tiếp nhận và đang được xử lý.<br>
                        Chúng tôi sẽ liên hệ với bạn sớm nhất để xác nhận đơn hàng.
                    </p>

                    <!-- Order Info -->
                    <div class="order-info">
                        <div class="order-info-item">
                            <i class="fas fa-envelope"></i>
                            <span>Thông tin đơn hàng đã được gửi qua email</span>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="success-actions">
                        <a href="<c:url value='/home'/>" class="btn-home">
                            <i class="fas fa-home me-2"></i>Về trang chủ
                        </a>
                        <a href="<c:url value='/product'/>" class="btn-continue">
                            <i class="fas fa-shopping-bag me-2"></i>Tiếp tục mua sắm
                        </a>
                        <a href="<c:url value='/order/history'/>" class="btn-history">
                            <i class="fas fa-history"></i>
                            Xem lịch sử đơn hàng
                        </a>
                    </div>
                </div>
            </div>