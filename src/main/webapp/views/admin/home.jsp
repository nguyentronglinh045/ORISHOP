<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>
    /* Tone màu đỏ giống trang Login */
    .ori-card {
        border: none;
        border-radius: 18px;
        overflow: hidden;
        box-shadow: 0 12px 30px rgba(0,0,0,0.1);
        transition: transform 0.25s ease, box-shadow 0.25s ease;
    }
    .ori-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 18px 40px rgba(0,0,0,0.15);
    }

    /* Tiêu đề card */
    .ori-card .card-body {
        font-size: 1.2rem;
        font-weight: 600;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .ori-icon {
        font-size: 1.8rem;
        opacity: 0.9;
    }

    /* Footer */
    .ori-footer {
        background: rgba(255,255,255,0.25);
        padding: 12px 16px;
        border-top: 1px solid rgba(255,255,255,0.3);
    }
    .ori-footer a {
        font-weight: 500;
    }

    /* Breadcrumb + Title */
    h1 {
        font-weight: 700;
        color: #b02a37;
    }
    .breadcrumb-item.active {
        font-weight: 600;
        color: #dc3545;
    }

    /* Ưu tiên tone màu OriShop */
    .ori-bg-red { background: linear-gradient(135deg, #dc3545, #b02a37); }
    .ori-bg-blue { background: linear-gradient(135deg, #0d6efd, #0a58ca); }
    .ori-bg-green { background: linear-gradient(135deg, #198754, #146c43); }
    .ori-bg-yellow { background: linear-gradient(135deg, #ffc107, #e0a800); }
    .ori-bg-info { background: linear-gradient(135deg, #0dcaf0, #0aa8c2); }
    .ori-bg-danger { background: linear-gradient(135deg, #dc3545, #a82834); }
</style>

<div class="container-fluid px-4">
    <h1 class="mt-4">Dashboard</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">Tổng quan hệ thống</li>
    </ol>

    <div class="row g-4">

        <!-- Danh mục -->
        <div class="col-xl-3 col-md-6">
            <div class="card text-white ori-card ori-bg-info mb-4">
                <div class="card-body">
                    Danh mục
                    <i class="fas fa-list ori-icon"></i>
                </div>
                <div class="card-footer ori-footer d-flex align-items-center justify-content-between">
                    <a class="small text-white stretched-link" href="<c:url value='/admin/categories'/>">Xem chi tiết</a>
                    <i class="fas fa-angle-right"></i>
                </div>
            </div>
        </div>

        <!-- Sản phẩm -->
        <div class="col-xl-3 col-md-6">
            <div class="card text-white ori-card ori-bg-blue mb-4">
                <div class="card-body">
                    Sản phẩm
                    <i class="fas fa-box-open ori-icon"></i>
                </div>
                <div class="card-footer ori-footer d-flex align-items-center justify-content-between">
                    <a class="small text-white stretched-link" href="<c:url value='/admin/products'/>">Xem chi tiết</a>
                    <i class="fas fa-angle-right"></i>
                </div>
            </div>
        </div>

        <!-- Đơn hàng -->
        <div class="col-xl-3 col-md-6">
            <div class="card text-white ori-card ori-bg-yellow mb-4">
                <div class="card-body">
                    Đơn hàng
                    <i class="fas fa-shopping-cart ori-icon"></i>
                </div>
                <div class="card-footer ori-footer d-flex align-items-center justify-content-between">
                    <a class="small text-white stretched-link" href="<c:url value='/admin/orders'/>">Xem chi tiết</a>
                    <i class="fas fa-angle-right"></i>
                </div>
            </div>
        </div>

        <!-- Doanh thu -->
        <div class="col-xl-3 col-md-6">
            <div class="card text-white ori-card ori-bg-green mb-4">
                <div class="card-body">
                    Doanh thu
                    <i class="fas fa-dollar-sign ori-icon"></i>
                </div>
                <div class="card-footer ori-footer d-flex align-items-center justify-content-between">
                    <a class="small text-white stretched-link" href="#">Xem chi tiết</a>
                    <i class="fas fa-angle-right"></i>
                </div>
            </div>
        </div>

        <!-- Người dùng -->
        <div class="col-xl-3 col-md-6">
            <div class="card text-white ori-card ori-bg-danger mb-4">
                <div class="card-body">
                    Người dùng
                    <i class="fas fa-users ori-icon"></i>
                </div>
                <div class="card-footer ori-footer d-flex align-items-center justify-content-between">
                    <a class="small text-white stretched-link" href="<c:url value='/admin/users'/>">Xem chi tiết</a>
                    <i class="fas fa-angle-right"></i>
                </div>
            </div>
        </div>
    </div>
</div>
