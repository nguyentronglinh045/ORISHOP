<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
