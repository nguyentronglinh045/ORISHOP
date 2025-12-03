<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container mt-5 mb-5 text-center">
    <div class="card border-0 shadow-sm p-5">
        <div class="mb-4">
            <i class="fas fa-check-circle text-success" style="font-size: 5rem;"></i>
        </div>
        <h2 class="text-success mb-3">Đặt hàng thành công!</h2>
        <p class="lead">Cảm ơn bạn đã mua sắm tại OriShop.</p>
        <p>Đơn hàng của bạn đang được xử lý và sẽ sớm được giao đến bạn.</p>
        
        <div class="mt-4">
            <a href="<c:url value='/home'/>" class="btn btn-primary me-2">Về trang chủ</a>
            <a href="<c:url value='/product'/>" class="btn btn-outline-secondary">Tiếp tục mua sắm</a>
        </div>
    </div>
</div>