<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <div class="dashboard-card daily-stats-card">
      <div class="card-header-custom">
        <div class="header-left">
          <h5 class="card-title-custom">
            <i class="fas fa-calendar-day me-2"></i>Hoạt động hôm nay
          </h5>
          <p class="card-subtitle-custom">Cập nhật lúc <span id="updateTime">14:30</span></p>
        </div>
        <button class="btn btn-sm btn-refresh" id="refreshBtn">
          <i class="fas fa-sync-alt me-1"></i>Làm mới
        </button>
      </div>
      <div class="card-body-custom">
        <!-- Today's Revenue -->
        <div class="daily-stat-item">
          <div class="daily-stat-header">
            <div class="daily-stat-icon icon-revenue">
              <i class="fas fa-money-bill-wave"></i>
            </div>
            <div class="daily-stat-content">
              <div class="daily-stat-label">Doanh thu hôm nay</div>
              <div class="daily-stat-value">₫21.5M</div>
              <div class="daily-stat-compare">
                <i class="fas fa-arrow-up"></i>
                <span>+15.3% so với hôm qua</span>
              </div>
            </div>
          </div>
          <div class="daily-stat-progress">
            <div class="progress-info">
              <span>Mục tiêu: ₫25M</span>
              <span class="text-primary fw-bold">86%</span>
            </div>
            <div class="progress">
              <div class="progress-bar bg-gradient-primary" role="progressbar" style="width: 86%" aria-valuenow="86"
                aria-valuemin="0" aria-valuemax="100"></div>
            </div>
          </div>
        </div>

        <div class="daily-stats-divider"></div>

        <!-- Today's Orders -->
        <div class="daily-stat-item">
          <div class="daily-stat-header">
            <div class="daily-stat-icon icon-orders">
              <i class="fas fa-shopping-bag"></i>
            </div>
            <div class="daily-stat-content">
              <div class="daily-stat-label">Đơn hàng mới</div>
              <div class="daily-stat-value">186 đơn</div>
              <div class="daily-stat-compare compare-neutral">
                <i class="fas fa-minus"></i>
                <span>Bằng với hôm qua</span>
              </div>
            </div>
          </div>
          <div class="order-status-mini">
            <div class="status-mini-item">
              <span class="status-mini-badge badge-pending">
                <i class="fas fa-clock"></i>
              </span>
              <span class="status-mini-count">24</span>
              <span class="status-mini-label">Chờ xử lý</span>
            </div>
            <div class="status-mini-item">
              <span class="status-mini-badge badge-shipping">
                <i class="fas fa-truck"></i>
              </span>
              <span class="status-mini-count">108</span>
              <span class="status-mini-label">Đang giao</span>
            </div>
            <div class="status-mini-item">
              <span class="status-mini-badge badge-completed">
                <i class="fas fa-check-circle"></i>
              </span>
              <span class="status-mini-count">54</span>
              <span class="status-mini-label">Hoàn tất</span>
            </div>
          </div>
        </div>

        <div class="daily-stats-divider"></div>

        <!-- Today's Visitors -->
        <div class="daily-stat-item">
          <div class="daily-stat-header">
            <div class="daily-stat-icon icon-visitors">
              <i class="fas fa-eye"></i>
            </div>
            <div class="daily-stat-content">
              <div class="daily-stat-label">Lượt truy cập</div>
              <div class="daily-stat-value">3,842</div>
              <div class="daily-stat-compare">
                <i class="fas fa-arrow-up"></i>
                <span>+8.7% so với hôm qua</span>
              </div>
            </div>
          </div>
        </div>

        <div class="daily-stats-divider"></div>

        <!-- Today's New Customers -->
        <div class="daily-stat-item">
          <div class="daily-stat-header">
            <div class="daily-stat-icon icon-customers">
              <i class="fas fa-user-plus"></i>
            </div>
            <div class="daily-stat-content">
              <div class="daily-stat-label">Khách hàng mới</div>
              <div class="daily-stat-value">38 người</div>
              <div class="daily-stat-compare compare-down">
                <i class="fas fa-arrow-down"></i>
                <span>-5.2% so với hôm qua</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script>
      // Auto refresh update time
      function updateTime() {
        const now = new Date();
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        document.getElementById('updateTime').textContent = hours + ':' + minutes;
      }

      // Refresh button animation
      document.getElementById('refreshBtn')?.addEventListener('click', function () {
        const icon = this.querySelector('i');
        icon.classList.add('fa-spin');

        setTimeout(() => {
          icon.classList.remove('fa-spin');
          updateTime();
        }, 1000);
      });

      // Update time on load
      updateTime();
    </script>