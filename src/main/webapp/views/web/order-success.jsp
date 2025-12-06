<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container mt-5 mb-5 text-center">
    <div class="card border-0 shadow-custom rounded-custom p-5">
        <div class="mb-4">
            <i class="fas fa-check-circle text-success" style="font-size: 6rem;"></i>
        </div>
        <h2 class="text-success mb-3 fw-bold">Đặt hàng thành công!</h2>
        <p class="lead mb-3">Cảm ơn bạn đã mua sắm tại OriShop.</p>
        <p class="text-muted mb-4">Đơn hàng của bạn đang được xử lý và sẽ sớm được giao đến bạn.</p>
        
        <div class="mt-4 d-flex justify-content-center gap-3">
            <a href="<c:url value='/home'/>" class="btn btn-primary btn-lg">
                <i class="fas fa-home me-2"></i>Về trang chủ
            </a>
            <a href="<c:url value='/product'/>" class="btn btn-outline-primary btn-lg">
                <i class="fas fa-shopping-bag me-2"></i>Tiếp tục mua sắm
            </a>
        </div>
    </div>
</div>