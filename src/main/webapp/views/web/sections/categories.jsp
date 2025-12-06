<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>

    <!-- === CATEGORIES === -->
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
                  <img src="https://placehold.co/400x300/ffd1dc/e84a7f?text=${cat.categoryName}" class="category-image"
                    alt="${cat.categoryName}">
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