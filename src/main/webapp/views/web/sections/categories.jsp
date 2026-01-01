<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="section-header">
    <h2>Danh Mục Nổi Bật</h2>
    <p class="section-subtitle">Khám phá các dòng mỹ phẩm cao cấp</p>
</div>

<section class="pb-5">
    <div class="container">
        <div class="row g-4">
            <c:forEach items="${categories}" var="cat" begin="0" end="5">

                <c:if test="${cat.category == null}">
                    <div class="col-lg-4 col-md-6">
                        <a href="${pageContext.request.contextPath}/product/category?cid=${cat.categoryId}"
                           class="category-card d-block">

                            <c:choose>
                                <c:when test="${cat.categoryName == 'Dưỡng Da'}">
                                    <img src="https://images.pexels.com/photos/5938255/pexels-photo-5938255.jpeg"
                                         class="category-image" alt="${cat.categoryName}"
                                         style="width: 100%; height: 300px; object-fit: cover;">
                                </c:when>

                                <c:when test="${cat.categoryName == 'Trang Điểm Mắt Môi'}">
                                    <img src="https://images.pexels.com/photos/1115128/pexels-photo-1115128.jpeg"
                                         class="category-image" alt="${cat.categoryName}"
                                         style="width: 100%; height: 300px; object-fit: cover;">
                                </c:when>

                                <c:when test="${cat.categoryName == 'Trang Điểm Nền'}">
                                    <img src="https://images.pexels.com/photos/1523528/pexels-photo-1523528.jpeg"
                                         class="category-image" alt="${cat.categoryName}"
                                         style="width: 100%; height: 300px; object-fit: cover;">
                                </c:when>

                                <c:when test="${cat.categoryName == 'Làm Sạch'}">
                                    <img src="https://images.pexels.com/photos/6811732/pexels-photo-6811732.jpeg"
                                         class="category-image" alt="${cat.categoryName}"
                                         style="width: 100%; height: 300px; object-fit: cover;">
                                </c:when>

                                <c:when test="${cat.categoryName == 'Chăm Sóc Cơ Thể'}">
                                    <img src="https://images.pexels.com/photos/6707559/pexels-photo-6707559.jpeg"
                                         class="category-image" alt="${cat.categoryName}"
                                         style="width: 100%; height: 300px; object-fit: cover;">
                                </c:when>

                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${not empty cat.icon}">
                                            <img src="${cat.icon}" class="category-image" alt="${cat.categoryName}"
                                                 style="width: 100%; height: 300px; object-fit: cover;">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="https://placehold.co/400x300/ffd1dc/e84a7f?text=${cat.categoryName}"
                                                 class="category-image" alt="${cat.categoryName}">
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
                            <div class="category-content">
                                <h3 class="category-name">${cat.categoryName}</h3>
                                <p class="category-count">Khám phá ngay</p>
                            </div>
                        </a>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</section>
