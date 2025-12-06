<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <style>
    /* Home page specific styles - using theme variables */

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

    /* === FEATURES SECTION === */
    .features-section {
      padding: 70px 0;
      background: var(--light-gray);
    }

    .feature-box {
      background: var(--white);
      padding: 40px 30px;
      border-radius: var(--radius-md);
      text-align: center;
      transition: all var(--transition-base);
      height: 100%;
      border: 2px solid var(--border);
    }

    .feature-box:hover {
      transform: translateY(-10px);
      box-shadow: var(--shadow-lg);
      border-color: var(--primary);
    }

    .feature-icon {
      width: 80px;
      height: 80px;
      background: var(--gradient-primary);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 25px;
      color: var(--white);
      font-size: 2rem;
      box-shadow: var(--shadow-md);
    }

    .feature-title {
      font-family: 'Quicksand', sans-serif;
      font-size: 1.2rem;
      font-weight: 700;
      margin-bottom: 12px;
      color: var(--dark);
    }

    .feature-desc {
      font-size: 0.95rem;
      color: var(--dark-light);
      margin: 0;
    }

    /* === SECTION TITLE === */
    .section-header {
      text-align: center;
      margin: 70px 0 50px;
    }

    .section-header h2 {
      font-size: 2.8rem;
      font-weight: 800;
      color: var(--dark);
      margin-bottom: 15px;
      position: relative;
      display: inline-block;
    }

    .section-header h2::after {
      content: '';
      position: absolute;
      bottom: -12px;
      left: 50%;
      transform: translateX(-50%);
      width: 100px;
      height: 4px;
      background: var(--gradient-primary);
      border-radius: var(--radius-full);
    }

    .section-subtitle {
      font-size: 1.1rem;
      color: #6c757d;
      margin-top: 20px;
    }

    /* === PRODUCT CARD === */
    .product-card {
      background: var(--white);
      border-radius: var(--radius-md);
      overflow: hidden;
      transition: all var(--transition-base);
      border: 2px solid var(--border);
      height: 100%;
      display: flex;
      flex-direction: column;
      position: relative;
    }

    .product-card:hover {
      transform: translateY(-12px);
      box-shadow: var(--shadow-hover);
      border-color: var(--primary);
    }

    .product-image-wrapper {
      position: relative;
      overflow: hidden;
      padding-top: 100%;
      background: #f8f9fa;
    }

    .product-image {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.5s;
    }

    .product-card:hover .product-image {
      transform: scale(1.08);
    }

    .product-badge {
      position: absolute;
      top: 15px;
      left: 15px;
      z-index: 2;
    }

    .badge-new {
      background: var(--gradient-primary);
      color: var(--white);
      padding: 8px 18px;
      border-radius: var(--radius-full);
      font-size: 0.85rem;
      font-weight: 700;
      box-shadow: var(--shadow-sm);
    }

    .badge-sale {
      background: var(--danger);
      color: var(--white);
      padding: 8px 18px;
      border-radius: var(--radius-full);
      font-size: 0.85rem;
      font-weight: 700;
      box-shadow: var(--shadow-sm);
    }

    .badge-hot {
      background: var(--warning);
      color: var(--dark);
      padding: 8px 18px;
      border-radius: var(--radius-full);
      font-size: 0.85rem;
      font-weight: 700;
      box-shadow: var(--shadow-sm);
    }

    .product-actions {
      position: absolute;
      top: 15px;
      right: 15px;
      display: flex;
      flex-direction: column;
      gap: 8px;
      opacity: 0;
      transition: opacity 0.3s;
    }

    .product-card:hover .product-actions {
      opacity: 1;
    }

    .action-btn {
      width: 40px;
      height: 40px;
      background: white;
      border: none;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      color: var(--primary);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      transition: all 0.3s;
      cursor: pointer;
    }

    .action-btn:hover {
      background: var(--primary);
      color: white;
      transform: scale(1.1);
    }

    .product-body {
      padding: 20px;
      flex-grow: 1;
      display: flex;
      flex-direction: column;
    }

    .product-category {
      font-size: 0.85rem;
      color: #6c757d;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      margin-bottom: 8px;
    }

    .product-name {
      font-size: 1rem;
      font-weight: 600;
      color: var(--dark);
      margin-bottom: 12px;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
      min-height: 48px;
    }

    .product-rating {
      display: flex;
      align-items: center;
      gap: 5px;
      margin-bottom: 12px;
      font-size: 0.9rem;
    }

    .stars {
      color: #ffc107;
    }

    .rating-count {
      color: #6c757d;
      font-size: 0.85rem;
    }

    .product-price-wrapper {
      margin-top: auto;
      margin-bottom: 15px;
    }

    .product-price {
      font-size: 1.5rem;
      font-weight: 800;
      color: var(--primary);
    }

    .product-price-old {
      font-size: 1rem;
      color: #999;
      text-decoration: line-through;
      margin-left: 10px;
    }

    .btn-add-cart {
      background: var(--gradient-primary);
      color: var(--white);
      border: none;
      padding: 14px;
      border-radius: var(--radius-md);
      font-weight: 600;
      transition: all var(--transition-base);
      width: 100%;
    }

    .btn-add-cart:hover {
      transform: translateY(-3px);
      box-shadow: var(--shadow-md);
      color: var(--white);
    }

    /* === CATEGORY CARD === */
    .category-card {
      position: relative;
      height: 280px;
      border-radius: 15px;
      overflow: hidden;
      cursor: pointer;
      transition: all 0.3s;
    }

    .category-card::before {
      content: '';
      position: absolute;
      inset: 0;
      background: linear-gradient(to bottom, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.7) 100%);
      z-index: 1;
      transition: all 0.3s;
    }

    .category-card:hover::before {
      background: linear-gradient(to bottom, rgba(255, 107, 157, 0.3) 0%, rgba(196, 69, 105, 0.8) 100%);
    }

    .category-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
    }

    .category-image {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.5s;
    }

    .category-card:hover .category-image {
      transform: scale(1.1);
    }

    .category-content {
      position: absolute;
      bottom: 25px;
      left: 25px;
      z-index: 2;
      color: white;
    }

    .category-name {
      font-size: 1.8rem;
      font-weight: 800;
      margin-bottom: 5px;
    }

    .category-count {
      font-size: 0.95rem;
      opacity: 0.9;
    }

    /* === PROMO BANNER === */
    .promo-banner {
      background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
      padding: 80px 0;
      margin: 80px 0;
      border-radius: 20px;
      color: white;
      text-align: center;
      position: relative;
      overflow: hidden;
    }

    .promo-banner::before {
      content: '🎉';
      position: absolute;
      font-size: 15rem;
      opacity: 0.1;
      top: -50px;
      right: -50px;
    }

    .promo-title {
      font-size: 3.5rem;
      font-weight: 800;
      margin-bottom: 20px;
    }

    .promo-subtitle {
      font-size: 1.4rem;
      margin-bottom: 30px;
      opacity: 0.95;
    }

    /* === NEWSLETTER === */
    .newsletter-section {
      background: #f8f9fa;
      padding: 80px 0;
    }

    .newsletter-content {
      max-width: 600px;
      margin: 0 auto;
      text-align: center;
    }

    .newsletter-title {
      font-size: 2.5rem;
      font-weight: 800;
      color: var(--dark);
      margin-bottom: 15px;
    }

    .newsletter-desc {
      color: #6c757d;
      font-size: 1.1rem;
      margin-bottom: 30px;
    }

    .newsletter-form {
      display: flex;
      gap: 10px;
      max-width: 500px;
      margin: 0 auto;
    }

    .newsletter-input {
      flex: 1;
      padding: 15px 25px;
      border: 2px solid #e9ecef;
      border-radius: 50px;
      font-size: 1rem;
    }

    .newsletter-input:focus {
      outline: none;
      border-color: var(--primary);
    }

    .btn-subscribe {
      background: linear-gradient(135deg, var(--primary), var(--secondary));
      color: white;
      border: none;
      padding: 15px 40px;
      border-radius: 50px;
      font-weight: 700;
      white-space: nowrap;
      transition: all 0.3s;
    }

    .btn-subscribe:hover {
      transform: translateY(-3px);
      box-shadow: 0 10px 25px rgba(255, 107, 157, 0.4);
    }

    /* === RESPONSIVE === */
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

      .section-header h2 {
        font-size: 2rem;
      }

      .promo-title {
        font-size: 2rem;
      }

      .newsletter-form {
        flex-direction: column;
      }
    }
  </style>