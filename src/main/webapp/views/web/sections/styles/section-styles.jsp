<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <style>
    /* === COMMON SECTION STYLES === */
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

    /* Section Header */
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

    /* Category Card */
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

    /* Promo Banner */
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

    /* Newsletter */
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

    /* Responsive */
    @media (max-width: 768px) {
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