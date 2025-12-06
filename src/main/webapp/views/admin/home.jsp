<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>
    /* Admin cards with new theme */
    .ori-card {
        border: none;
        border-radius: var(--radius-md);
        overflow: hidden;
        box-shadow: var(--shadow-md);
        transition: all var(--transition-base);
    }
    .ori-card:hover {
        transform: translateY(-6px);
        box-shadow: var(--shadow-hover);
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
        font-family: 'Quicksand', sans-serif;
        font-weight: 700;
        color: var(--primary);
    }
    .breadcrumb-item.active {
        font-weight: 600;
        color: var(--primary);
    }

    /* Gradient backgrounds with pink theme */
    .ori-bg-red { background: var(--gradient-primary); }
    .ori-bg-blue { background: linear-gradient(135deg, #74b9ff, #0984e3); }
    .ori-bg-green { background: linear-gradient(135deg, #00b894, #00a085); }
    .ori-bg-yellow { background: linear-gradient(135deg, #fdcb6e, #e17055); }
    .ori-bg-info { background: linear-gradient(135deg, #ffb6c1, #ff6b9d); }
    .ori-bg-danger { background: var(--gradient-primary); }
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
