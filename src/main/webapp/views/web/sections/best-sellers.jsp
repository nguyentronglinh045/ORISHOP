<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

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
                                <c:choose>
                                    <c:when test="${p.discount > 0}">
                                        <span class="badge-hot">-${p.discount}%</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge-hot">HOT</span>
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

                            <a href="<c:url value='/product/detail?id=${p.productId}'/>">
                                <c:choose>
                                    <c:when test="${not empty p.image}">
                                        <img src="<c:url value='/assets/uploads/product/${p.image}'/>"
                                             class="product-image" alt="${p.productName}">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://placehold.co/300x300/fff5f8/ff6b9d?text=No+Image"
                                             class="product-image" alt="No Image">
                                    </c:otherwise>
                                </c:choose>
                            </a>

                        </div>
                        <div class="product-body">
                            <div class="product-category">BEST SELLER</div>
                            <h5 class="product-name">
                                <a href="<c:url value='/product/detail?id=${p.productId}'/>">${p.productName}</a>
                            </h5>
                            <div class="product-rating">
                                <span class="stars">
                                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                                </span>
                                <span class="rating-count">(5.0)</span>
                            </div>

                            <div class="product-price-wrapper">
                                <c:choose>
                                    <c:when test="${p.discount > 0}">
                                        <span class="product-price text-danger">
                                            <fmt:formatNumber value="${p.discountPrice}" type="currency" currencySymbol="₫" />
                                        </span>
                                        <span class="product-price-old text-muted text-decoration-line-through ms-2 small">
                                            <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="₫" />
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="product-price">
                                            <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="₫" />
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            
                            <c:choose>
                                <c:when test="${p.quantity > 0}">
                                    <a href="<c:url value='/cart/add?pid=${p.productId}'/>" class="btn btn-add-cart">
                                        <i class="fas fa-shopping-cart me-2"></i>Thêm Vào Giỏ
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <button class="btn btn-add-cart" disabled style="opacity: 0.6; cursor: not-allowed;">
                                        <i class="fas fa-times me-2"></i>Hết Hàng
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>