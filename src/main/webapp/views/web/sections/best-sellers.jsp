<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

      <!-- === BEST SELLERS === -->
      <div class="section-header">
        <h2>Sản Phẩm Bán Chạy</h2>
        <p class="section-subtitle">Được yêu thích nhất bởi khách hàng</p>
      </div>
      <section class="pb-5">
        <div class="container">
          <div class="row g-4">
            <c:forEach items="${products}" var="p" begin="0" end="7">
              <div class="col-lg-3 col-md-4 col-6">
                <div class="product-card">
                  <div class="product-image-wrapper">
                    <div class="product-badge">
                      <span class="badge-hot">HOT</span>
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
                    <div class="product-category">BEST SELLER</div>
                    <h5 class="product-name">${p.productName}</h5>
                    <div class="product-rating">
                      <span class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                      </span>
                      <span class="rating-count">(5.0)</span>
                    </div>
                    <div class="product-price-wrapper">
                      <span class="product-price">
                        <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="₫" />
                      </span>
                      <span class="product-price-old">
                        <fmt:formatNumber value="${p.price * 1.3}" type="currency" currencySymbol="₫" />
                      </span>
                    </div>
                    <a href="${pageContext.request.contextPath}/product/detail?id=${p.productId}"
                      class="btn btn-add-cart">
                      <i class="fas fa-shopping-cart me-2"></i>Thêm Vào Giỏ
                    </a>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>
      </section>