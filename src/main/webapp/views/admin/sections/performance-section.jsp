<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="dashboard-card">
<div class="card-header-custom">
<div class="header-left">
<h5 class="card-title-custom">
<i class="fas fa-chart-pie me-2"></i>Hiệu suất giao hàng
</h5>
<p class="card-subtitle-custom">Tỷ lệ đơn hàng theo trạng thái</p>
</div>
<div class="time-range-selector">
<button class="btn btn-sm btn-time active">Tuần này</button>
<button class="btn btn-sm btn-time">Tháng này</button>
</div>
</div>
<div class="card-body-custom">
<div class="performance-stats">
<div class="performance-item">
<div class="performance-header">
<div class="performance-icon icon-success">
<i class="fas fa-check-circle"></i>
</div>
<div class="performance-info">
<div class="performance-label">Đã giao thành công</div>
<div class="performance-count">902 đơn</div>
</div>
<div class="performance-percent">72%</div>
</div>
<div class="progress performance-progress">
<div class="progress-bar bg-success" role="progressbar" style="width: 72%" aria-valuenow="72"
aria-valuemin="0" aria-valuemax="100"></div>
</div>
</div>
<div class="performance-item">
<div class="performance-header">
<div class="performance-icon icon-shipping">
<i class="fas fa-shipping-fast"></i>
</div>
<div class="performance-info">
<div class="performance-label">Đang vận chuyển</div>
<div class="performance-count">226 đơn</div>
</div>
<div class="performance-percent">18%</div>
</div>
<div class="progress performance-progress">
<div class="progress-bar bg-info" role="progressbar" style="width: 18%" aria-valuenow="18"
aria-valuemin="0" aria-valuemax="100"></div>
</div>
</div>
<div class="performance-item">
<div class="performance-header">
<div class="performance-icon icon-warning">
<i class="fas fa-exclamation-circle"></i>
</div>
<div class="performance-info">
<div class="performance-label">Hủy / Hoàn hàng</div>
<div class="performance-count">126 đơn</div>
</div>
<div class="performance-percent">10%</div>
</div>
<div class="progress performance-progress">
<div class="progress-bar bg-warning" role="progressbar" style="width: 10%" aria-valuenow="10"
aria-valuemin="0" aria-valuemax="100"></div>
</div>
</div>
</div>
<div class="performance-summary">
<div class="summary-item">
<i class="fas fa-box text-primary"></i>
<div>
<div class="summary-value">1,254</div>
<div class="summary-label">Tổng đơn hàng</div>
</div>
</div>
<div class="summary-divider"></div>
<div class="summary-item">
<i class="fas fa-clock text-warning"></i>
<div>
<div class="summary-value">2.5h</div>
<div class="summary-label">Thời gian xử lý TB</div>
</div>
</div>
<div class="summary-divider"></div>
<div class="summary-item">
<i class="fas fa-star text-success"></i>
<div>
<div class="summary-value">4.8/5</div>
<div class="summary-label">Đánh giá dịch vụ</div>
</div>
</div>
</div>
</div>
</div>