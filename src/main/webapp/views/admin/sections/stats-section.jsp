<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
      <div class="row g-3 g-xl-4">
        <!-- Revenue Card -->
        <div class="col-xl-3 col-lg-6 col-md-6">
          <div class="stat-card">
            <div class="stat-card-body">
              <div class="stat-info">
                <div class="stat-label">Doanh thu tháng</div>
                <h3 class="stat-value">${not empty monthlyRevenue ? monthlyRevenue : '₫0'}</h3>
                <div class="stat-trend trend-up">
                  <i class="fas fa-check-circle"></i>
                  <span>Đơn "Đã giao"</span>
                </div>
              </div>
              <div class="stat-icon icon-revenue">
                <i class="fas fa-dollar-sign"></i>
              </div>
            </div>
            <div class="stat-footer">
              <i class="fas fa-chart-line me-2"></i>Doanh thu tháng hiện tại
            </div>
          </div>
        </div>
        <!-- Orders Card -->
        <div class="col-xl-3 col-lg-6 col-md-6">
          <div class="stat-card">
            <div class="stat-card-body">
              <div class="stat-info">
                <div class="stat-label">Tổng đơn hàng</div>
                <h3 class="stat-value">
                  <fmt:formatNumber value="${not empty totalOrders ? totalOrders : 0}" type="number" />
                </h3>
                <div class="stat-trend trend-pending">
                  <i class="fas fa-clock"></i>
                  <span>${not empty pendingOrders ? pendingOrders : 0} chờ xử lý</span>
                </div>
              </div>
              <div class="stat-icon icon-orders">
                <i class="fas fa-shopping-cart"></i>
              </div>
            </div>
            <div class="stat-footer">
              <i class="fas fa-box me-2"></i>
              <c:choose>
                <c:when test="${pendingOrders > 0}">Cần xử lý nhanh</c:when>
                <c:otherwise>Không có đơn chờ</c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
        <!-- Customers Card -->
        <div class="col-xl-3 col-lg-6 col-md-6">
          <div class="stat-card">
            <div class="stat-card-body">
              <div class="stat-info">
                <div class="stat-label">Tổng khách hàng</div>
                <h3 class="stat-value">
                  <fmt:formatNumber value="${not empty totalCustomers ? totalCustomers : 0}" type="number" />
                </h3>
                <div class="stat-trend trend-new">
                  <i class="fas fa-user-check"></i>
                  <span>Đã đăng ký</span>
                </div>
              </div>
              <div class="stat-icon icon-customers">
                <i class="fas fa-users"></i>
              </div>
            </div>
            <div class="stat-footer">
              <i class="fas fa-heart me-2"></i>Tổng tài khoản hệ thống
            </div>
          </div>
        </div>
        <!-- Products Card -->
        <div class="col-xl-3 col-lg-6 col-md-6">
          <div class="stat-card">
            <div class="stat-card-body">
              <div class="stat-info">
                <div class="stat-label">Tổng sản phẩm</div>
                <h3 class="stat-value">
                  <fmt:formatNumber value="${not empty totalProducts ? totalProducts : 0}" type="number" />
                </h3>
                <div class="stat-trend trend-info">
                  <i class="fas fa-box-open"></i>
                  <span>Đang kinh doanh</span>
                </div>
              </div>
              <div class="stat-icon icon-products">
                <i class="fas fa-box-open"></i>
              </div>
            </div>
            <div class="stat-footer">
              <i class="fas fa-warehouse me-2"></i>Tổng sản phẩm trong kho
            </div>
          </div>
        </div>
      </div>