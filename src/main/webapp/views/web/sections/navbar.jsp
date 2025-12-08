<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="top-bar">
    <div class="container d-flex justify-content-between align-items-center">
        <span><i class="fas fa-truck me-2"></i>Miễn phí vận chuyển đơn từ 500K</span>
        <div class="d-none d-md-block">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="mailto:support@orishop.vn"><i class="fas fa-envelope me-1"></i>support@orishop.vn</a>
        </div>
    </div>
</div>

<header class="main-header">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-3 col-6">
                <a href="<c:url value='/home'/>" class="brand-logo">
                    <i class="fas fa-shopping-bag"></i> ORISHOP
                </a>
            </div>

            <div class="col-md-5 d-none d-md-block">
                <form action="<c:url value='/product/search'/>" class="search-container">
                    <input type="text" class="search-input" name="keyword" placeholder="Bạn đang tìm sản phẩm gì..." value="${param.keyword}">
                    <button type="submit" class="search-btn">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
            </div>

            <div class="col-md-4 col-6">
                <div class="header-actions justify-content-end">
                    <c:if test="${sessionScope.account == null}">
                        <a href="<c:url value='/login'/>" class="action-btn" title="Đăng nhập">
                            <i class="far fa-user"></i>
                        </a>
                    </c:if>

                    <c:if test="${sessionScope.account != null}">
                        <div class="dropdown">
                            <a href="#" class="action-btn" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" title="Tài khoản">
                                <i class="fas fa-user-circle text-danger"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                                <li><span class="dropdown-item-text fw-bold text-muted">Xin chào, ${sessionScope.account.fullname}</span></li>
                                <li><hr class="dropdown-divider"></li>
                                <c:if test="${sessionScope.account.role == 1}">
                                    <li><a class="dropdown-item" href="<c:url value='/admin/home'/>"><i class="fas fa-cogs me-2"></i>Quản trị</a></li>
                                </c:if>
                                <li><a class="dropdown-item" href="<c:url value='/order/history'/>"><i class="fas fa-box-open me-2"></i>Đơn hàng</a></li>
                                <li><a class="dropdown-item" href="<c:url value='/logout'/>"><i class="fas fa-sign-out-alt me-2"></i>Đăng xuất</a></li>
                            </ul>
                        </div>
                    </c:if>

                    <a href="<c:url value='/cart'/>" class="action-btn" title="Giỏ hàng">
                        <i class="fas fa-shopping-cart"></i>
                        <span class="cart-badge">${sessionScope.cart != null ? sessionScope.cart.size() : 0}</span>
                    </a>

                    <button class="btn d-md-none border-0 p-0 ms-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#mobileMenu">
                        <i class="fas fa-bars fa-lg"></i>
                    </button>
                </div>
            </div>
        </div>

        <ul class="nav justify-content-center navbar-custom">
            <li class="nav-item">
                <a class="nav-link active" href="<c:url value='/home'/>">Trang chủ</a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="productDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Sản phẩm
                </a>
                <ul class="dropdown-menu" aria-labelledby="productDropdown">
                    <li><a class="dropdown-item fw-bold" href="<c:url value='/product'/>">Tất cả sản phẩm</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <c:forEach items="${categories}" var="cate">
                        <c:if test="${cate.category == null}">
                            <li>
                                <c:choose>
                                    <c:when test="${not empty cate.subCategories}">
                                        <a class="dropdown-item has-child" href="<c:url value='/product/category?cid=${cate.categoryId}'/>">
                                            ${cate.categoryName}
                                        </a>
                                        <ul class="submenu">
                                            <c:forEach items="${cate.subCategories}" var="sub">
                                                <li><a class="dropdown-item" href="<c:url value='/product/category?cid=${sub.categoryId}'/>">${sub.categoryName}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="dropdown-item" href="<c:url value='/product/category?cid=${cate.categoryId}'/>">
                                            ${cate.categoryName}
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </li>

            <li class="nav-item"><a class="nav-link" href="#">Khuyến mãi</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Blog làm đẹp</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Liên hệ</a></li>
        </ul>
    </div>
</header>

<div class="offcanvas offcanvas-end" tabindex="-1" id="mobileMenu">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title">Menu</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
    </div>
    <div class="offcanvas-body">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/home'/>">Trang chủ</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/product'/>">Sản phẩm</a>
            </li>
            <c:forEach items="${categories}" var="cate">
                <c:if test="${cate.category == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/product/category?cid=${cate.categoryId}'/>">
                            ${cate.categoryName}
                        </a>
                    </li>
                </c:if>
            </c:forEach>
            <li class="nav-item"><a class="nav-link" href="#">Khuyến mãi</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Blog làm đẹp</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Liên hệ</a></li>
        </ul>
    </div>
</div>