<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="dashboard-card">
<div class="card-header-custom">
<div class="header-left">
<h5 class="card-title-custom">
<i class="fas fa-shopping-bag me-2"></i>Đơn hàng gần đây
</h5>
<p class="card-subtitle-custom">5 đơn hàng mới nhất cần xử lý</p>
</div>
<a href="<c:url value='/admin/orders'/>" class="btn btn-outline-primary btn-sm rounded-pill">
<i class="fas fa-list me-2"></i>Quản lý đơn hàng
</a>
</div>
<div class="table-responsive">
<table class="table table-hover align-middle">
<thead class="table-header-custom">
<tr>
<th>Mã đơn</th>
<th>Khách hàng</th>
<th>Thời gian</th>
<th class="text-end">Tổng tiền</th>
<th class="text-center">Trạng thái</th>
<th class="text-center">Hành động</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<strong class="order-id">#10234</strong>
</td>
<td>
<div class="customer-info">
<div class="customer-avatar">NL</div>
<span>Nguyễn Lan</span>
</div>
</td>
<td>
<small class="text-muted">
<i class="far fa-calendar me-1"></i>06/12/2025
<br>
<i class="far fa-clock me-1"></i>10:15 AM
</small>
</td>
<td class="text-end">
<strong class="price-text">₫2,450,000</strong>
</td>
<td class="text-center">
<span class="status-badge status-pending">
<i class="fas fa-clock me-1"></i>Chờ xử lý
</span>
</td>
<td class="text-center">
<button class="btn btn-sm btn-action-view" title="Xem chi tiết">
<i class="fas fa-eye"></i>
</button>
</td>
</tr>
<tr>
<td>
<strong class="order-id">#10233</strong>
</td>
<td>
<div class="customer-info">
<div class="customer-avatar">TM</div>
<span>Trần Minh</span>
</div>
</td>
<td>
<small class="text-muted">
<i class="far fa-calendar me-1"></i>06/12/2025
<br>
<i class="far fa-clock me-1"></i>09:40 AM
</small>
</td>
<td class="text-end">
<strong class="price-text">₫1,280,000</strong>
</td>
<td class="text-center">
<span class="status-badge status-shipping">
<i class="fas fa-truck me-1"></i>Đang giao
</span>
</td>
<td class="text-center">
<button class="btn btn-sm btn-action-view" title="Xem chi tiết">
<i class="fas fa-eye"></i>
</button>
</td>
</tr>
<tr>
<td>
<strong class="order-id">#10232</strong>
</td>
<td>
<div class="customer-info">
<div class="customer-avatar">LH</div>
<span>Lê Huyền</span>
</div>
</td>
<td>
<small class="text-muted">
<i class="far fa-calendar me-1"></i>06/12/2025
<br>
<i class="far fa-clock me-1"></i>08:55 AM
</small>
</td>
<td class="text-end">
<strong class="price-text">₫560,000</strong>
</td>
<td class="text-center">
<span class="status-badge status-completed">
<i class="fas fa-check-circle me-1"></i>Đã giao
</span>
</td>
<td class="text-center">
<button class="btn btn-sm btn-action-view" title="Xem chi tiết">
<i class="fas fa-eye"></i>
</button>
</td>
</tr>
<tr>
<td>
<strong class="order-id">#10231</strong>
</td>
<td>
<div class="customer-info">
<div class="customer-avatar">PQ</div>
<span>Phạm Quốc</span>
</div>
</td>
<td>
<small class="text-muted">
<i class="far fa-calendar me-1"></i>05/12/2025
<br>
<i class="far fa-clock me-1"></i>05:20 PM
</small>
</td>
<td class="text-end">
<strong class="price-text">₫3,050,000</strong>
</td>
<td class="text-center">
<span class="status-badge status-returned">
<i class="fas fa-undo me-1"></i>Hoàn hàng
</span>
</td>
<td class="text-center">
<button class="btn btn-sm btn-action-view" title="Xem chi tiết">
<i class="fas fa-eye"></i>
</button>
</td>
</tr>
<tr>
<td>
<strong class="order-id">#10230</strong>
</td>
<td>
<div class="customer-info">
<div class="customer-avatar">VM</div>
<span>Võ Mai</span>
</div>
</td>
<td>
<small class="text-muted">
<i class="far fa-calendar me-1"></i>05/12/2025
<br>
<i class="far fa-clock me-1"></i>03:05 PM
</small>
</td>
<td class="text-end">
<strong class="price-text">₫890,000</strong>
</td>
<td class="text-center">
<span class="status-badge status-pending">
<i class="fas fa-clock me-1"></i>Chờ xử lý
</span>
</td>
<td class="text-center">
<button class="btn btn-sm btn-action-view" title="Xem chi tiết">
<i class="fas fa-eye"></i>
</button>
</td>
</tr>
</tbody>
</table>
</div>
</div>