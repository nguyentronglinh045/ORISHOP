<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <div class="dashboard-card">
      <div class="card-header-custom">
        <div class="header-left">
          <h5 class="card-title-custom">
            <i class="fas fa-bolt me-2"></i>Thao tác nhanh
          </h5>
          <p class="card-subtitle-custom">Truy cập nhanh các tác vụ thường dùng</p>
        </div>
      </div>
      <div class="card-body-custom">
        <div class="row g-3">
          <div class="col-md-6">
            <a href="<c:url value='/admin/products'/>" class="quick-action-btn">
              <div class="action-icon icon-add-product">
                <i class="fas fa-plus-circle"></i>
              </div>
              <div class="action-content">
                <div class="action-title">Thêm sản phẩm</div>
                <div class="action-desc">Tạo sản phẩm mới</div>
              </div>
              <div class="action-arrow">
                <i class="fas fa-arrow-right"></i>
              </div>
            </a>
          </div>
          <div class="col-md-6">
            <a href="<c:url value='/admin/orders'/>" class="quick-action-btn">
              <div class="action-icon icon-track-order">
                <i class="fas fa-truck"></i>
              </div>
              <div class="action-content">
                <div class="action-title">Theo dõi đơn hàng</div>
                <div class="action-desc">Quản lý vận chuyển</div>
              </div>
              <div class="action-arrow">
                <i class="fas fa-arrow-right"></i>
              </div>
            </a>
          </div>
          <div class="col-md-6">
            <a href="<c:url value='/admin/categories'/>" class="quick-action-btn">
              <div class="action-icon icon-manage-category">
                <i class="fas fa-list"></i>
              </div>
              <div class="action-content">
                <div class="action-title">Quản lý danh mục</div>
                <div class="action-desc">Phân loại sản phẩm</div>
              </div>
              <div class="action-arrow">
                <i class="fas fa-arrow-right"></i>
              </div>
            </a>
          </div>
          <div class="col-md-6">
            <a href="<c:url value='/admin/users'/>" class="quick-action-btn">
              <div class="action-icon icon-manage-users">
                <i class="fas fa-users"></i>
              </div>
              <div class="action-content">
                <div class="action-title">Quản lý người dùng</div>
                <div class="action-desc">Phân quyền & vai trò</div>
              </div>
              <div class="action-arrow">
                <i class="fas fa-arrow-right"></i>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>