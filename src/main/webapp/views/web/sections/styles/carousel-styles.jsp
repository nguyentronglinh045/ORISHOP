<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <style>
    /* === CAROUSEL STYLES === */
    .hero-carousel {
      margin-top: 0;
      position: relative;
    }

    .hero-carousel .carousel-item {
      height: 500px;
      position: relative;
    }

    .hero-carousel .carousel-item::before {
      content: '';
      position: absolute;
      inset: 0;
      background: linear-gradient(90deg, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.1) 100%);
      z-index: 1;
    }

    .hero-carousel img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .carousel-caption {
      z-index: 2;
      left: 10%;
      right: auto;
      text-align: left;
      bottom: 50%;
      transform: translateY(50%);
    }

    .carousel-caption h2 {
      font-size: 3.5rem;
      font-weight: 800;
      text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.3);
      margin-bottom: 20px;
    }

    .carousel-caption p {
      font-size: 1.3rem;
      margin-bottom: 30px;
      max-width: 500px;
    }

    .btn-carousel {
      background: var(--gradient-primary);
      color: var(--white);
      padding: 15px 50px;
      border-radius: var(--radius-full);
      font-weight: 700;
      border: none;
      transition: all var(--transition-base);
      box-shadow: var(--shadow-lg);
    }

    .btn-carousel:hover {
      transform: translateY(-3px);
      box-shadow: var(--shadow-hover);
      color: var(--white);
    }

    .carousel-indicators button {
      width: 12px;
      height: 12px;
      border-radius: 50%;
      margin: 0 5px;
    }

    .carousel-control-prev-icon,
    .carousel-control-next-icon {
      width: 50px;
      height: 50px;
      background-color: rgba(255, 255, 255, 0.3);
      border-radius: 50%;
    }

    @media (max-width: 768px) {
      .hero-carousel .carousel-item {
        height: 400px;
      }

      .carousel-caption h2 {
        font-size: 2rem;
      }

      .carousel-caption p {
        font-size: 1rem;
      }
    }
  </style>