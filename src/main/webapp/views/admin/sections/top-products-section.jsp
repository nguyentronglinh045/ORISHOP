<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="dashboard-card">
<div class="card-header-custom">
<div class="header-left">
<h5 class="card-title-custom">
<i class="fas fa-trophy me-2"></i>Top sản phẩm
</h5>
<p class="card-subtitle-custom">Dựa trên doanh thu tuần này</p>
</div>
<a href="<c:url value='/admin/products'/>" class="btn btn-outline-primary btn-sm rounded-pill">
<i class="fas fa-box me-2"></i>Xem sản phẩm
</a>
</div>
<div class="card-body-custom">
<!-- Product 1 -->
<div class="product-item">
<div class="product-rank rank-1">
<i class="fas fa-crown"></i>
<span>1</span>
</div>
<div class="product-icon icon-serum">
<i class="fas fa-gem"></i>
</div>
<div class="product-details">
<div class="product-name">Serum Vitamin C</div>
<div class="product-category">Serum & Essence</div>
</div>
<div class="product-revenue">
<div class="revenue-amount">₫18.4M</div>
<div class="progress product-progress">
<div class="progress-bar" role="progressbar" style="width: 85%" aria-valuenow="85" aria-valuemin="0"
aria-valuemax="100"></div>
</div>
<div class="revenue-percent">85% mục tiêu</div>
</div>
</div>
<!-- Product 2 -->
<div class="product-item">
<div class="product-rank rank-2">
<i class="fas fa-medal"></i>
<span>2</span>
</div>
<div class="product-icon icon-moisturizer">
<i class="fas fa-leaf"></i>
</div>
<div class="product-details">
<div class="product-name">Kem dưỡng ẩm 24h</div>
<div class="product-category">Moisturizer</div>
</div>
<div class="product-revenue">
<div class="revenue-amount">₫15.2M</div>
<div class="progress product-progress">
<div class="progress-bar" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0"
aria-valuemax="100"></div>
</div>
<div class="revenue-percent">70% mục tiêu</div>
</div>
</div>
<!-- Product 3 -->
<div class="product-item">
<div class="product-rank rank-3">
<i class="fas fa-award"></i>
<span>3</span>
</div>
<div class="product-icon icon-sunscreen">
<i class="fas fa-sun"></i>
</div>
<div class="product-details">
<div class="product-name">Kem chống nắng SPF50</div>
<div class="product-category">Sun Protection</div>
</div>
<div class="product-revenue">
<div class="revenue-amount">₫12.7M</div>
<div class="progress product-progress">
<div class="progress-bar" role="progressbar" style="width: 58%" aria-valuenow="58" aria-valuemin="0"
aria-valuemax="100"></div>
</div>
<div class="revenue-percent">58% mục tiêu</div>
</div>
</div>
<!-- Product 4 -->
<div class="product-item">
<div class="product-rank rank-other">
<span>4</span>
</div>
<div class="product-icon icon-toner">
<i class="fas fa-tint"></i>
</div>
<div class="product-details">
<div class="product-name">Toner hoa hồng</div>
<div class="product-category">Toner & Mist</div>
</div>
<div class="product-revenue">
<div class="revenue-amount">₫9.8M</div>
<div class="progress product-progress">
<div class="progress-bar" role="progressbar" style="width: 45%" aria-valuenow="45" aria-valuemin="0"
aria-valuemax="100"></div>
</div>
<div class="revenue-percent">45% mục tiêu</div>
</div>
</div>
<!-- Product 5 -->
<div class="product-item">
<div class="product-rank rank-other">
<span>5</span>
</div>
<div class="product-icon icon-cleanser">
<i class="fas fa-pump-soap"></i>
</div>
<div class="product-details">
<div class="product-name">Sữa rửa mặt dịu nhẹ</div>
<div class="product-category">Cleanser</div>
</div>
<div class="product-revenue">
<div class="revenue-amount">₫8.5M</div>
<div class="progress product-progress">
<div class="progress-bar" role="progressbar" style="width: 38%" aria-valuenow="38" aria-valuemin="0"
aria-valuemax="100"></div>
</div>
<div class="revenue-percent">38% mục tiêu</div>
</div>
</div>
</div>
</div>