<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <style>
    /* ========================================
       TOP PRODUCTS SECTION - Design System Compliant
       ======================================== */
    .product-item {
      display: flex;
      align-items: center;
      gap: 1rem;
      padding: 1rem;
      border-radius: 15px;
      transition: all 0.3s ease;
      margin-bottom: 1rem;
      border: 2px solid transparent;
      background: #ffffff;
    }

    .product-item:last-child {
      margin-bottom: 0;
    }

    .product-item:hover {
      background: #fff5f8;
      border-color: rgba(255, 107, 157, 0.2);
      transform: translateY(-2px);
      box-shadow: 0 4px 16px rgba(255, 107, 157, 0.15);
    }

    .product-rank {
      width: 52px;
      height: 52px;
      border-radius: 15px;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      font-weight: 700;
      font-size: 1.25rem;
      flex-shrink: 0;
      position: relative;
      font-family: 'Quicksand', sans-serif;
    }

    .product-rank i {
      font-size: 0.75rem;
      position: absolute;
      top: 6px;
    }

    .product-rank span {
      margin-top: 8px;
    }

    .rank-1 {
      background: linear-gradient(135deg, #ffd700, #ffed4e);
      color: #856404;
      box-shadow: 0 4px 16px rgba(255, 215, 0, 0.3);
    }

    .rank-2 {
      background: linear-gradient(135deg, #c0c0c0, #e8e8e8);
      color: #495057;
      box-shadow: 0 4px 16px rgba(192, 192, 192, 0.3);
    }

    .rank-3 {
      background: linear-gradient(135deg, #cd7f32, #daa06d);
      color: #ffffff;
      box-shadow: 0 4px 16px rgba(205, 127, 50, 0.3);
    }

    .rank-other {
      background: #f8f9fa;
      color: #636e72;
      border: 2px solid #e9ecef;
    }

    .product-icon {
      width: 56px;
      height: 56px;
      border-radius: 15px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.5rem;
      color: #ffffff;
      flex-shrink: 0;
      box-shadow: 0 4px 16px rgba(255, 107, 157, 0.15);
    }

    .icon-serum {
      background: linear-gradient(135deg, #ff6b9d, #ffb6c1);
    }

    .icon-moisturizer {
      background: linear-gradient(135deg, #00b894, #55efc4);
    }

    .icon-sunscreen {
      background: linear-gradient(135deg, #fdcb6e, #ffeaa7);
    }

    .icon-toner {
      background: linear-gradient(135deg, #a29bfe, #dfe6e9);
    }

    .icon-cleanser {
      background: linear-gradient(135deg, #74b9ff, #a29bfe);
    }

    .product-details {
      flex: 1;
      min-width: 0;
    }

    .product-name {
      font-weight: 600;
      font-size: 1rem;
      color: #2d3436;
      margin-bottom: 0.25rem;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      font-family: 'Quicksand', sans-serif;
    }

    .product-category {
      font-size: 0.8rem;
      color: #636e72;
      font-family: 'Inter', sans-serif;
    }

    .product-revenue {
      min-width: 160px;
      text-align: right;
    }

    .revenue-amount {
      font-weight: 700;
      font-size: 1.1rem;
      color: #ff6b9d;
      margin-bottom: 0.5rem;
      font-family: 'Quicksand', sans-serif;
    }

    .product-progress {
      height: 8px;
      border-radius: 10px;
      background: rgba(255, 107, 157, 0.1);
      margin-bottom: 0.4rem;
    }

    .product-progress .progress-bar {
      background: linear-gradient(135deg, #ff6b9d, #ffb6c1);
      border-radius: 10px;
    }

    .revenue-percent {
      font-size: 0.75rem;
      color: #636e72;
      font-family: 'Inter', sans-serif;
    }

    /* ========================================
       RESPONSIVE DESIGN
       ======================================== */
    @media (max-width: 992px) {
      .product-revenue {
        min-width: 140px;
      }

      .revenue-amount {
        font-size: 1rem;
      }
    }

    @media (max-width: 768px) {
      .product-item {
        flex-wrap: wrap;
        gap: 0.75rem;
        padding: 0.85rem;
      }

      .product-revenue {
        width: 100%;
        text-align: left;
        padding-left: 0;
        margin-top: 0.5rem;
      }

      .product-rank {
        width: 44px;
        height: 44px;
        font-size: 1.1rem;
      }

      .product-icon {
        width: 48px;
        height: 48px;
        font-size: 1.3rem;
      }

      .product-name {
        font-size: 0.95rem;
      }

      .revenue-amount {
        font-size: 0.95rem;
      }
    }

    @media (max-width: 576px) {
      .product-item {
        padding: 0.75rem;
      }

      .product-rank {
        width: 40px;
        height: 40px;
        font-size: 1rem;
      }

      .product-icon {
        width: 44px;
        height: 44px;
        font-size: 1.2rem;
      }

      .product-name {
        font-size: 0.9rem;
      }

      .product-category {
        font-size: 0.75rem;
      }
    }
  </style>
