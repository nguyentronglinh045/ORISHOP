<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

      <!-- === NEW PRODUCTS === -->
      <div class="section-header">
        <h2>Sản Phẩm Mới Nhất</h2>
        <p class="section-subtitle">Cập nhật xu hướng làm đẹp 2025</p>
      </div>
      <section class="pb-5">
        <div class="container">
          <div class="row g-4">
            <c:forEach items="${products}" var="p" begin="0" end="7">
              <div class="col-lg-3 col-md-4 col-6">
                <div class="product-card">
                  <div class="product-image-wrapper">
                    <div class="product-badge">
                      <c:choose>
                        <c:when test="${p.quantity == 0}">
                          <span class="badge-sale">Hết hàng</span>
                        </c:when>
                        <c:otherwise>
                          <span class="badge-new">NEW</span>
                        </c:otherwise>
                      </c:choose>
                    </div>
                    <div class="product-actions">
                      <button class="action-btn" title="Yêu thích">
                        <i class="far fa-heart"></i>
                      </button>
                      <button class="action-btn" title="Xem nhanh">
                        <i class="far fa-eye"></i>
                      </button>
                    </div>
                    <img src="${empty p.image ? 'https://placehold.co/300x300/fff5f8/ff6b9d?text=Product' : p.image}"
                      class="product-image" alt="${p.productName}">
                  </div>
                  <div class="product-body">
                    <div class="product-category">MỸ PHẨM</div>
                    <h5 class="product-name">${p.productName}</h5>
                    <div class="product-rating">
                      <span class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                      </span>
                      <span class="rating-count">(4.5)</span>
                    </div>
                    <div class="product-price-wrapper">
                      <span class="product-price">
                        <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="₫" />
                      </span>
                    </div>
                    <a href="${pageContext.request.contextPath}/product/detail?id=${p.productId}"
                      class="btn btn-add-cart">
                      <i class="fas fa-shopping-cart me-2"></i>Xem Chi Tiết
                    </a>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
          <div class="text-center mt-5">
            <a href="${pageContext.request.contextPath}/product" class="btn btn-carousel">
              Xem Tất Cả Sản Phẩm <i class="fas fa-arrow-right ms-2"></i>
            </a>
          </div>
        </div>
      </section>