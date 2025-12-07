<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

            <style>
                /* ===== ORDER HISTORY PAGE STYLES ===== */

                /* Hero Section */
                .history-hero {
                    background: var(--gradient-primary);
                    padding: 3rem 0;
                    margin-bottom: 2rem;
                }

                .history-hero-content {
                    text-align: center;
                    color: white;
                }

                .history-hero h1 {
                    font-family: 'Quicksand', sans-serif;
                    font-weight: 700;
                    font-size: 2.25rem;
                    margin-bottom: 0.5rem;
                }

                .history-breadcrumb {
                    display: flex;
                    justify-content: center;
                    gap: 0.5rem;
                    flex-wrap: wrap;
                }

                .history-breadcrumb a {
                    color: rgba(255, 255, 255, 0.8);
                    text-decoration: none;
                    transition: color 0.3s ease;
                }

                .history-breadcrumb a:hover {
                    color: white;
                }

                .history-breadcrumb span {
                    color: rgba(255, 255, 255, 0.6);
                }

                /* User Sidebar */
                .user-sidebar {
                    background: white;
                    border-radius: 20px;
                    box-shadow: 0 5px 20px rgba(255, 107, 157, 0.1);
                    overflow: hidden;
                    position: sticky;
                    top: 100px;
                }

                .user-header {
                    background: var(--gradient-primary);
                    padding: 1.5rem;
                    text-align: center;
                    color: white;
                }

                .user-avatar {
                    width: 80px;
                    height: 80px;
                    background: rgba(255, 255, 255, 0.2);
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0 auto 1rem;
                    font-size: 2rem;
                }

                .user-name {
                    font-family: 'Quicksand', sans-serif;
                    font-weight: 700;
                    font-size: 1.25rem;
                    margin-bottom: 0;
                }

                .user-menu {
                    padding: 0;
                    list-style: none;
                    margin: 0;
                }

                .user-menu li {
                    border-bottom: 1px solid #f5f5f5;
                }

                .user-menu li:last-child {
                    border-bottom: none;
                }

                .user-menu a {
                    display: flex;
                    align-items: center;
                    padding: 1rem 1.5rem;
                    color: var(--dark);
                    text-decoration: none;
                    transition: all 0.3s ease;
                    gap: 0.75rem;
                }

                .user-menu a:hover {
                    background: #fff5f8;
                    color: var(--primary);
                }

                .user-menu a.active {
                    background: linear-gradient(135deg, rgba(255, 107, 157, 0.1), rgba(255, 143, 171, 0.05));
                    color: var(--primary);
                    border-left: 3px solid var(--primary);
                }

                .user-menu a i {
                    width: 20px;
                    text-align: center;
                }

                .user-menu .logout-link {
                    color: #e74c3c;
                }

                .user-menu .logout-link:hover {
                    background: #fff5f5;
                }

                /* Content Area */
                .history-content {
                    background: white;
                    border-radius: 20px;
                    box-shadow: 0 5px 20px rgba(255, 107, 157, 0.1);
                    padding: 1.5rem;
                }

                .content-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 1.5rem;
                    padding-bottom: 1rem;
                    border-bottom: 2px solid #fff5f8;
                }

                .content-title {
                    font-family: 'Quicksand', sans-serif;
                    font-weight: 700;
                    font-size: 1.25rem;
                    color: var(--dark);
                    margin: 0;
                }

                .order-count {
                    background: var(--gradient-primary);
                    color: white;
                    font-size: 0.85rem;
                    padding: 0.35rem 0.75rem;
                    border-radius: 50px;
                }

                /* Empty State */
                .empty-state {
                    text-align: center;
                    padding: 3rem 1rem;
                }

                .empty-icon {
                    width: 100px;
                    height: 100px;
                    background: linear-gradient(135deg, rgba(255, 107, 157, 0.1), rgba(255, 143, 171, 0.05));
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0 auto 1.5rem;
                }

                .empty-icon i {
                    font-size: 2.5rem;
                    color: var(--primary);
                }

                .empty-title {
                    font-family: 'Quicksand', sans-serif;
                    font-weight: 700;
                    color: var(--dark);
                    margin-bottom: 0.5rem;
                }

                .empty-text {
                    color: var(--dark-light);
                    margin-bottom: 1.5rem;
                }

                .btn-shop {
                    background: var(--gradient-primary);
                    border: none;
                    color: white;
                    padding: 12px 30px;
                    border-radius: 50px;
                    font-weight: 600;
                    text-decoration: none;
                    display: inline-block;
                    transition: all 0.3s ease;
                }

                .btn-shop:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 8px 25px rgba(255, 107, 157, 0.4);
                    color: white;
                }

                /* Order Cards */
                .order-list {
                    display: flex;
                    flex-direction: column;
                    gap: 1rem;
                }

                .order-card {
                    border: 2px solid #f5f5f5;
                    border-radius: 15px;
                    transition: all 0.3s ease;
                }

                .order-card:hover {
                    border-color: var(--primary);
                    box-shadow: 0 5px 20px rgba(255, 107, 157, 0.1);
                }

                .order-card-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    padding: 1rem 1.25rem;
                    background: linear-gradient(135deg, #fff5f8, #ffeef2);
                    border-radius: 13px 13px 0 0;
                    flex-wrap: wrap;
                    gap: 0.5rem;
                }

                .order-id {
                    font-family: 'Quicksand', sans-serif;
                    font-weight: 700;
                    color: var(--primary);
                }

                .order-date {
                    color: var(--dark-light);
                    font-size: 0.9rem;
                }

                .order-date i {
                    margin-right: 5px;
                }

                .order-card-body {
                    padding: 1.25rem;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    flex-wrap: wrap;
                    gap: 1rem;
                }

                .order-info {
                    display: flex;
                    gap: 2rem;
                    flex-wrap: wrap;
                }

                .info-item {
                    display: flex;
                    flex-direction: column;
                }

                .info-label {
                    font-size: 0.85rem;
                    color: var(--dark-light);
                    margin-bottom: 0.25rem;
                }

                .info-value {
                    font-weight: 600;
                    color: var(--dark);
                }

                .info-value.price {
                    color: var(--primary);
                    font-size: 1.1rem;
                }

                /* Status Badge */
                .status-badge {
                    display: inline-flex;
                    align-items: center;
                    gap: 0.5rem;
                    padding: 0.5rem 1rem;
                    border-radius: 50px;
                    font-weight: 600;
                    font-size: 0.85rem;
                }

                .status-pending {
                    background: linear-gradient(135deg, rgba(255, 193, 7, 0.2), rgba(255, 193, 7, 0.05));
                    color: #f39c12;
                }

                .status-shipping {
                    background: linear-gradient(135deg, rgba(52, 152, 219, 0.2), rgba(52, 152, 219, 0.05));
                    color: #3498db;
                }

                .status-delivered {
                    background: linear-gradient(135deg, rgba(0, 184, 148, 0.2), rgba(0, 184, 148, 0.05));
                    color: #00b894;
                }

                .status-cancelled {
                    background: linear-gradient(135deg, rgba(231, 76, 60, 0.2), rgba(231, 76, 60, 0.05));
                    color: #e74c3c;
                }

                .status-default {
                    background: linear-gradient(135deg, rgba(108, 117, 125, 0.2), rgba(108, 117, 125, 0.05));
                    color: #6c757d;
                }

                /* Action Button */
                .btn-view {
                    background: white;
                    border: 2px solid var(--primary);
                    color: var(--primary);
                    padding: 8px 20px;
                    border-radius: 50px;
                    font-weight: 600;
                    text-decoration: none;
                    transition: all 0.3s ease;
                    display: inline-flex;
                    align-items: center;
                    gap: 0.5rem;
                }

                .btn-view:hover {
                    background: var(--gradient-primary);
                    border-color: transparent;
                    color: white;
                }

                /* Responsive */
                @media (max-width: 991px) {
                    .user-sidebar {
                        position: relative;
                        top: 0;
                        margin-bottom: 1.5rem;
                    }

                    .user-header {
                        padding: 1rem;
                    }

                    .user-avatar {
                        width: 60px;
                        height: 60px;
                        font-size: 1.5rem;
                    }

                    .user-menu {
                        display: flex;
                        overflow-x: auto;
                    }

                    .user-menu li {
                        border-bottom: none;
                        border-right: 1px solid #f5f5f5;
                        white-space: nowrap;
                    }

                    .user-menu li:last-child {
                        border-right: none;
                    }

                    .user-menu a.active {
                        border-left: none;
                        border-bottom: 3px solid var(--primary);
                    }
                }

                @media (max-width: 767px) {
                    .history-hero {
                        padding: 2rem 0;
                    }

                    .history-hero h1 {
                        font-size: 1.75rem;
                    }

                    .order-card-header {
                        flex-direction: column;
                        align-items: flex-start;
                    }

                    .order-card-body {
                        flex-direction: column;
                        align-items: flex-start;
                    }

                    .order-info {
                        gap: 1rem;
                    }

                    .btn-view {
                        width: 100%;
                        justify-content: center;
                    }
                }

                @media (max-width: 575px) {
                    .content-header {
                        flex-direction: column;
                        gap: 0.75rem;
                        align-items: flex-start;
                    }

                    .user-menu {
                        flex-wrap: wrap;
                    }
                }
            </style>

            <!-- Hero Section -->
            <section class="history-hero">
                <div class="container">
                    <div class="history-hero-content">
                        <h1><i class="fas fa-history me-2"></i>Lịch sử đơn hàng</h1>
                        <div class="history-breadcrumb">
                            <a href="<c:url value='/'/>"><i class="fas fa-home me-1"></i>Trang chủ</a>
                            <span>/</span>
                            <span>Đơn hàng của tôi</span>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Main Content -->
            <div class="container py-4">
                <div class="row">
                    <!-- Sidebar -->
                    <div class="col-lg-3 mb-4">
                        <div class="user-sidebar">
                            <div class="user-header">
                                <div class="user-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <h5 class="user-name">${sessionScope.user.fullname}</h5>
                            </div>
                            <ul class="user-menu">
                                <li>
                                    <a href="<c:url value='/order/history'/>" class="active">
                                        <i class="fas fa-shopping-bag"></i>
                                        <span>Đơn hàng của tôi</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="<c:url value='/logout'/>" class="logout-link">
                                        <i class="fas fa-sign-out-alt"></i>
                                        <span>Đăng xuất</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- Content -->
                    <div class="col-lg-9">
                        <div class="history-content">
                            <div class="content-header">
                                <h3 class="content-title">
                                    <i class="fas fa-box-open me-2 text-primary"></i>Danh sách đơn hàng
                                </h3>
                                <c:if test="${not empty orders}">
                                    <span class="order-count">${orders.size()} đơn hàng</span>
                                </c:if>
                            </div>

                            <!-- Empty State -->
                            <c:if test="${empty orders}">
                                <div class="empty-state">
                                    <div class="empty-icon">
                                        <i class="fas fa-shopping-bag"></i>
                                    </div>
                                    <h4 class="empty-title">Chưa có đơn hàng</h4>
                                    <p class="empty-text">Bạn chưa có đơn hàng nào. Hãy khám phá các sản phẩm của chúng
                                        tôi!</p>
                                    <a href="<c:url value='/product'/>" class="btn-shop">
                                        <i class="fas fa-shopping-cart me-2"></i>Mua sắm ngay
                                    </a>
                                </div>
                            </c:if>

                            <!-- Order List -->
                            <c:if test="${not empty orders}">
                                <div class="order-list">
                                    <c:forEach items="${orders}" var="o">
                                        <div class="order-card">
                                            <div class="order-card-header">
                                                <span class="order-id">
                                                    <i class="fas fa-receipt me-1"></i>Đơn hàng #${o.orderId}
                                                </span>
                                                <span class="order-date">
                                                    <i class="far fa-calendar-alt"></i>
                                                    <fmt:formatDate value="${o.orderDate}" pattern="dd/MM/yyyy HH:mm" />
                                                </span>
                                            </div>
                                            <div class="order-card-body">
                                                <div class="order-info">
                                                    <div class="info-item">
                                                        <span class="info-label">Tổng tiền</span>
                                                        <span class="info-value price">
                                                            <fmt:formatNumber value="${o.amount}" type="currency"
                                                                currencySymbol="₫" maxFractionDigits="0" />
                                                        </span>
                                                    </div>
                                                    <div class="info-item">
                                                        <span class="info-label">Trạng thái</span>
                                                        <c:choose>
                                                            <c:when test="${o.status == 'Chờ xử lý'}">
                                                                <span class="status-badge status-pending">
                                                                    <i class="fas fa-clock"></i>Chờ xử lý
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${o.status == 'Đang giao'}">
                                                                <span class="status-badge status-shipping">
                                                                    <i class="fas fa-truck"></i>Đang giao
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${o.status == 'Đã giao'}">
                                                                <span class="status-badge status-delivered">
                                                                    <i class="fas fa-check-circle"></i>Đã giao
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${o.status == 'Đã hủy'}">
                                                                <span class="status-badge status-cancelled">
                                                                    <i class="fas fa-times-circle"></i>Đã hủy
                                                                </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="status-badge status-default">
                                                                    <i class="fas fa-info-circle"></i>${o.status}
                                                                </span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                                <a href="<c:url value='/order/detail?id=${o.orderId}'/>"
                                                    class="btn-view">
                                                    <i class="fas fa-eye"></i>Xem chi tiết
                                                </a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>