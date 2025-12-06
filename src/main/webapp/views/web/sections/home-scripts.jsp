<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Bootstrap JS Local -->
<script src="/ORISHOP/assets/lib/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Initialize Bootstrap components -->
<script>
    // Initialize carousel if exists
    document.addEventListener('DOMContentLoaded', function () {
        var carouselElement = document.querySelector('.carousel');
        if (carouselElement && typeof bootstrap !== 'undefined') {
            var carousel = new bootstrap.Carousel(carouselElement, {
                interval: 5000,
                wrap: true
            });
        }
    });
</script>

