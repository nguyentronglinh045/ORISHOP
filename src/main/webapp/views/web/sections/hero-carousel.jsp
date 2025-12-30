<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!-- === HERO CAROUSEL === -->
  <section class="hero-carousel">
    <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2"></button>
      </div>

      <div class="carousel-inner">
        <!-- Slide 1 -->
        <div class="carousel-item active">
          <img src="https://images.summitmedia-digital.com/cosmo/images/2023/04/13/cosmo-hot-list-2023-main-image-1681358510.jpg" alt="Summer Collection">
          <div class="carousel-caption">
            <h2>Bộ Sưu Tập Mùa Hè</h2>
            <p>Làn da rạng rỡ, tự tin tỏa sáng cả mùa hè với các sản phẩm chăm sóc da cao cấp</p>
            <a href="${pageContext.request.contextPath}/product" class="btn btn-carousel">
              <i class="fas fa-shopping-bag me-2"></i>Khám Phá Ngay
            </a>
          </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item">
          <img src="https://theme.hstatic.net/200000687421/1001045754/14/slide_4_img.jpg?v=318" alt="Sale 50%">
          <div class="carousel-caption">
            <h2>Giảm Giá Lên Đến 50%</h2>
            <p>Cơ hội vàng sở hữu mỹ phẩm chính hãng với giá ưu đãi nhất trong năm</p>
            <a href="${pageContext.request.contextPath}/product" class="btn btn-carousel">
              Mua Sắm Ngay
            </a>
          </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item">
          <img src="https://image.hsv-tech.io/1920x0/tfs/common/7050176d-9c9e-434b-aadd-ecf3ba6da404.webp" alt="New Arrivals">
          <div class="carousel-caption">
            <h2>Hàng Mới Về</h2>
            <p>Cập nhật ngay xu hướng làm đẹp mới nhất từ các thương hiệu hàng đầu thế giới</p>
            <a href="${pageContext.request.contextPath}/product" class="btn btn-carousel">
              Xem Ngay
            </a>
          </div>
        </div>
      </div>

      <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
      </button>
    </div>
  </section>
