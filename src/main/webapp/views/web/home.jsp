<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>OriShop - Mỹ phẩm chính hãng cao cấp</title>
                <!-- Bootstrap 5 Local -->
                <link href="/ORISHOP/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <!-- Font Awesome Local -->
                <link href="/ORISHOP/assets/lib/fontawesome/css/all.min.css" rel="stylesheet">
                <!-- Google Fonts: Quicksand + Inter -->
                <link
                    href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&family=Inter:wght@300;400;500;600;700&display=swap"
                    rel="stylesheet">
                <!-- ORISHOP Theme CSS -->
                <link href="/ORISHOP/assets/css/orishop-theme.css" rel="stylesheet">

                <!-- Navbar Styles -->
                <jsp:include page="sections/navbar-styles.jsp" />

                <!-- Home Page Styles -->
                <jsp:include page="sections/home-styles.jsp" />
            </head>

            <body>
                <!-- Navbar -->
                <jsp:include page="sections/navbar.jsp" />

                <!-- Hero Carousel Section -->
                <jsp:include page="sections/hero-carousel.jsp" />

                <!-- Features Section -->
                <jsp:include page="sections/features.jsp" />

                <!-- Categories Section -->
                <jsp:include page="sections/categories.jsp" />

                <!-- New Products Section -->
                <jsp:include page="sections/new-products.jsp" />

                <!-- Promo Banner Section -->
                <jsp:include page="sections/promo-banner.jsp" />

                <!-- Best Sellers Section -->
                <jsp:include page="sections/best-sellers.jsp" />

                <!-- Newsletter Section -->
                <jsp:include page="sections/newsletter.jsp" />

                <!-- Home Page Scripts -->
                <jsp:include page="sections/home-scripts.jsp" />
            </body>

            </html>