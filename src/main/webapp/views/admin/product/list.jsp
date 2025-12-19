<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

                <head>
                    <title>Quản lý Sản phẩm - ORISHOP Admin</title>
                </head>

                <jsp:include page="sections/styles/list-styles.jsp" />

                <div class="container-fluid px-4 py-4">
                    <div class="product-hero mb-4">
                        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                            <div>
                                <h1 class="page-title mb-2">
                                    <i class="fas fa-box-open me-2"></i>Quản lý Sản phẩm
                                </h1>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb mb-0">
                                        <li class="breadcrumb-item">
                                            <a href="<c:url value='/admin/home'/>">
                                                <i class="fas fa-home me-1"></i>Dashboard
                                            </a>
                                        </li>
                                        <li class="breadcrumb-item active">Sản phẩm</li>
                                    </ol>
                                </nav>
                            </div>
                            <div>
                                <a href="<c:url value='/admin/product/create'/>" class="btn btn-primary btn-add">
                                    <i class="fas fa-plus me-2"></i>Thêm sản phẩm mới
                                </a>
                            </div>
                        </div>
                    </div>

                    <c:if test="${not empty message}">
                        <div class="alert alert-success alert-dismissible fade show custom-alert mb-4" role="alert">
                            <i class="fas fa-check-circle me-2"></i>${message}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show custom-alert mb-4" role="alert">
                            <i class="fas fa-exclamation-circle me-2"></i>${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <div class="card products-container">
                        <div class="card-header">
                            <div class="d-flex justify-content-between align-items-center">
                                <h5 class="mb-0 fw-bold">
                                    <i class="fas fa-th-large me-2"></i>Danh sách Sản phẩm
                                </h5>
                                <span class="badge">
                                    <i class="fas fa-cubes me-1"></i>
                                    ${fn:length(products)} sản phẩm
                                </span>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <c:choose>
                                <c:when test="${empty products}">
                                    <div class="empty-state text-center">
                                        <i class="fas fa-box-open empty-icon mb-3"></i>
                                        <h4 class="text-muted mb-2">Chưa có sản phẩm nào</h4>
                                        <p class="text-muted mb-4">Bắt đầu bằng cách thêm sản phẩm đầu tiên của bạn</p>
                                        <a href="<c:url value='/admin/product/create'/>" class="btn btn-add">
                                            <i class="fas fa-plus me-2"></i>Thêm sản phẩm đầu tiên
                                        </a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="products-grid">
                                        <c:forEach items="${products}" var="p" varStatus="status">
                                            <div class="product-item">
                                                <div class="product-image-container">
                                                    <c:choose>
                                                        <c:when test="${not empty p.image}">
                                                            <img src="<c:url value='/assets/uploads/product/${p.image}'/>"
                                                                class="product-image" alt="${p.productName}" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="product-image-placeholder">
                                                                <i class="fas fa-image"></i>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <span class="product-id-badge">#${p.productId}</span>

                                                    <div class="product-status-overlay">
                                                        <c:choose>
                                                            <c:when test="${p.active}">
                                                                <span class="status-badge active">
                                                                    <i class="fas fa-check-circle me-1"></i>Đang bán
                                                                </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="status-badge inactive">
                                                                    <i class="fas fa-pause-circle me-1"></i>Ngừng bán
                                                                </span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>

                                                <div class="product-info">
                                                    <div class="product-category">
                                                        <c:choose>
                                                            <c:when test="${p.category != null}">
                                                                <span class="category-badge">
                                                                    <i
                                                                        class="fas fa-tag me-1"></i>${p.category.categoryName}
                                                                </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="category-badge">
                                                                    <i class="fas fa-tag me-1"></i>Chưa phân loại
                                                                </span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>

                                                    <h6 class="product-name">${p.productName}</h6>

                                                    <c:if test="${not empty p.description}">
                                                        <p class="product-description">${p.description}</p>
                                                    </c:if>
                                                    <c:if test="${empty p.description}">
                                                        <p class="product-description text-muted fst-italic">Chưa có mô
                                                            tả</p>
                                                    </c:if>

                                                    <div
                                                        class="product-meta d-flex justify-content-between align-items-center mt-3">
                                                        <div class="d-flex flex-column">
                                                            <c:choose>
                                                                <c:when test="${p.discount > 0}">
                                                                    <div>
                                                                        <span
                                                                            class="text-decoration-line-through text-muted small me-2">
                                                                            <fmt:formatNumber value="${p.price}"
                                                                                type="number" groupingUsed="true" />₫
                                                                        </span>
                                                                        <span
                                                                            class="badge bg-danger">-${p.discount}%</span>
                                                                    </div>
                                                                    <span class="price-display text-danger fw-bold">
                                                                        <fmt:formatNumber value="${p.discountPrice}"
                                                                            type="number" groupingUsed="true" />₫
                                                                    </span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="price-display fw-bold text-primary">
                                                                        <fmt:formatNumber value="${p.price}"
                                                                            type="number" groupingUsed="true" />₫
                                                                    </span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>

                                                        <c:choose>
                                                            <c:when test="${p.quantity > 10}">
                                                                <span class="stock-badge in-stock">
                                                                    <i class="fas fa-check"></i>${p.quantity}
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${p.quantity > 0}">
                                                                <span class="stock-badge low-stock">
                                                                    <i class="fas fa-exclamation"></i>${p.quantity}
                                                                </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="stock-badge out-of-stock">
                                                                    <i class="fas fa-times"></i>Hết
                                                                </span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>

                                                    <div class="product-actions">
                                                        <a href="<c:url value='/admin/product/edit?id=${p.productId}'/>"
                                                            class="btn-edit">
                                                            <i class="fas fa-edit"></i>Sửa
                                                        </a>
                                                        <a href="<c:url value='/admin/product/delete?id=${p.productId}'/>"
                                                            class="btn-delete"
                                                            onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');">
                                                            <i class="fas fa-trash-alt"></i>Xóa
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>

                                    <c:if test="${totalPages > 1}">
                                        <div class="pagination-wrapper">
                                            <div
                                                class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                                                <div class="pagination-info">
                                                    Hiển thị <strong>${(currentPage - 1) * pageSize + 1}</strong> -
                                                    <strong>${currentPage * pageSize > totalProducts ? totalProducts :
                                                        currentPage * pageSize}</strong>
                                                    trong tổng số <strong>${totalProducts}</strong> sản phẩm
                                                </div>
                                                <nav aria-label="Product pagination">
                                                    <ul class="pagination">
                                                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                                            <a class="page-link"
                                                                href="<c:url value='/admin/products?page=${currentPage - 1}'/>"
                                                                aria-label="Previous">
                                                                <i class="fas fa-chevron-left"></i>
                                                            </a>
                                                        </li>

                                                        <c:choose>
                                                            <c:when test="${totalPages <= 5}">
                                                                <c:forEach begin="1" end="${totalPages}" var="i">
                                                                    <li
                                                                        class="page-item ${currentPage == i ? 'active' : ''}">
                                                                        <a class="page-link"
                                                                            href="<c:url value='/admin/products?page=${i}'/>">${i}</a>
                                                                    </li>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li
                                                                    class="page-item ${currentPage == 1 ? 'active' : ''}">
                                                                    <a class="page-link"
                                                                        href="<c:url value='/admin/products?page=1'/>">1</a>
                                                                </li>

                                                                <c:if test="${currentPage > 3}">
                                                                    <li class="page-item disabled">
                                                                        <span class="page-link">...</span>
                                                                    </li>
                                                                </c:if>

                                                                <c:forEach
                                                                    begin="${currentPage - 1 > 1 ? currentPage - 1 : 2}"
                                                                    end="${currentPage + 1 < totalPages ? currentPage + 1 : totalPages - 1}"
                                                                    var="i">
                                                                    <c:if test="${i > 1 && i < totalPages}">
                                                                        <li
                                                                            class="page-item ${currentPage == i ? 'active' : ''}">
                                                                            <a class="page-link"
                                                                                href="<c:url value='/admin/products?page=${i}'/>">${i}</a>
                                                                        </li>
                                                                    </c:if>
                                                                </c:forEach>

                                                                <c:if test="${currentPage < totalPages - 2}">
                                                                    <li class="page-item disabled">
                                                                        <span class="page-link">...</span>
                                                                    </li>
                                                                </c:if>

                                                                <li
                                                                    class="page-item ${currentPage == totalPages ? 'active' : ''}">
                                                                    <a class="page-link"
                                                                        href="<c:url value='/admin/products?page=${totalPages}'/>">${totalPages}</a>
                                                                </li>
                                                            </c:otherwise>
                                                        </c:choose>

                                                        <li
                                                            class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                                            <a class="page-link"
                                                                href="<c:url value='/admin/products?page=${currentPage + 1}'/>"
                                                                aria-label="Next">
                                                                <i class="fas fa-chevron-right"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>