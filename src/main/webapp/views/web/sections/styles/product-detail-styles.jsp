<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <style>
    /* ===== PRODUCT DETAIL PAGE STYLES ===== */

    /* Breadcrumb */
    .detail-breadcrumb {
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
      padding: 1rem 0;
      margin-bottom: 2rem;
    }

    .breadcrumb-custom {
      background: rgba(255, 255, 255, 0.8);
      padding: 0.75rem 1.5rem;
      border-radius: 50px;
      display: inline-flex;
      box-shadow: 0 2px 8px rgba(255, 107, 157, 0.1);
    }

    .breadcrumb-custom .breadcrumb {
      margin: 0;
      background: transparent;
    }

    .breadcrumb-custom .breadcrumb-item a {
      color: var(--primary);
      text-decoration: none;
      font-weight: 600;
    }

    .breadcrumb-custom .breadcrumb-item.active {
      color: var(--dark-light);
      max-width: 200px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }

    /* Product Image Section */
    .product-image-card {
      border: none;
      border-radius: 25px;
      box-shadow: var(--shadow-md);
      overflow: hidden;
      background: linear-gradient(135deg, #fff5f8, #ffeef3);
      padding: 2rem;
      text-align: center;
    }

    .product-main-image {
      max-width: 100%;
      max-height: 450px;
      object-fit: contain;
      border-radius: 15px;
      transition: transform 0.3s ease;
    }

    .product-main-image:hover {
      transform: scale(1.02);
    }

    /* Product Info Section */
    .product-info {
      padding-left: 1rem;
    }

    .product-category-badge {
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
      color: var(--primary);
      padding: 0.5rem 1rem;
      border-radius: 50px;
      font-weight: 600;
      font-size: 0.85rem;
      margin-bottom: 1rem;
    }

    .product-title {
      font-family: 'Quicksand', sans-serif;
      font-size: 2rem;
      font-weight: 700;
      color: var(--dark);
      margin-bottom: 1rem;
      line-height: 1.3;
    }

    .product-meta {
      display: flex;
      flex-wrap: wrap;
      gap: 1rem;
      margin-bottom: 1.5rem;
      padding-bottom: 1.5rem;
      border-bottom: 2px dashed #ffd1dc;
    }

    .meta-item {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      color: var(--dark-light);
      font-size: 0.95rem;
    }

    .meta-item i {
      color: var(--primary);
    }

    .rating-stars {
      background: linear-gradient(135deg, #fdcb6e, #f39c12);
      color: white;
      padding: 0.35rem 0.75rem;
      border-radius: 50px;
      font-size: 0.85rem;
      font-weight: 600;
    }

    .product-price-section {
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
      padding: 1.5rem;
      border-radius: 20px;
      margin-bottom: 1.5rem;
    }

    .product-price {
      font-family: 'Quicksand', sans-serif;
      font-size: 2.5rem;
      font-weight: 700;
      color: var(--primary);
      margin: 0;
    }

    .price-label {
      color: var(--dark-light);
      font-size: 0.9rem;
      margin-bottom: 0.25rem;
    }

    .product-description {
      color: var(--dark);
      line-height: 1.8;
      margin-bottom: 1.5rem;
      padding-bottom: 1.5rem;
      border-bottom: 2px dashed #ffd1dc;
    }

    /* Stock Status */
    .stock-status {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      margin-bottom: 1.5rem;
    }

    .stock-badge {
      padding: 0.5rem 1rem;
      border-radius: 50px;
      font-weight: 600;
      font-size: 0.9rem;
    }

    .stock-badge.in-stock {
      background: rgba(0, 184, 148, 0.15);
      color: #00b894;
    }

    .stock-badge.out-of-stock {
      background: rgba(231, 76, 60, 0.15);
      color: #e74c3c;
    }

    /* Quantity Selector */
    .quantity-section {
      margin-bottom: 1.5rem;
    }

    .quantity-label {
      font-weight: 600;
      color: var(--dark);
      margin-bottom: 0.75rem;
      display: block;
    }

    .quantity-selector {
      display: inline-flex;
      align-items: center;
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
      border-radius: 50px;
      padding: 0.25rem;
    }

    .qty-btn {
      width: 45px;
      height: 45px;
      border: none;
      background: white;
      border-radius: 50%;
      font-size: 1.25rem;
      color: var(--primary);
      cursor: pointer;
      transition: all 0.3s ease;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .qty-btn:hover {
      background: var(--gradient-primary);
      color: white;
    }

    .qty-input {
      width: 70px;
      text-align: center;
      border: none;
      background: transparent;
      font-size: 1.25rem;
      font-weight: 700;
      color: var(--dark);
    }

    .qty-input:focus {
      outline: none;
    }

    /* Action Buttons */
    .action-buttons {
      display: flex;
      gap: 1rem;
      margin-bottom: 2rem;
    }

    .btn-add-to-cart {
      flex: 2;
      background: var(--gradient-primary);
      border: none;
      color: white;
      font-weight: 600;
      padding: 1rem 2rem;
      border-radius: 50px;
      font-size: 1.1rem;
      transition: all 0.3s ease;
      text-decoration: none;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .btn-add-to-cart:hover {
      transform: translateY(-3px);
      box-shadow: 0 8px 25px rgba(255, 107, 157, 0.4);
      color: white;
    }

    .btn-wishlist {
      width: 55px;
      height: 55px;
      border: 2px solid #ffd1dc;
      background: white;
      border-radius: 50%;
      color: var(--primary);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.25rem;
      transition: all 0.3s ease;
    }

    .btn-wishlist:hover {
      background: var(--gradient-primary);
      border-color: var(--primary);
      color: white;
    }

    /* Info Cards */
    .info-card {
      background: white;
      border-radius: 15px;
      padding: 1rem 1.25rem;
      display: flex;
      align-items: center;
      gap: 1rem;
      box-shadow: var(--shadow-sm);
      margin-bottom: 0.75rem;
    }

    .info-card-icon {
      width: 45px;
      height: 45px;
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      color: var(--primary);
      font-size: 1.1rem;
    }

    .info-card-text {
      flex: 1;
    }

    .info-card-title {
      font-weight: 600;
      color: var(--dark);
      font-size: 0.95rem;
      margin-bottom: 0.15rem;
    }

    .info-card-desc {
      color: var(--dark-light);
      font-size: 0.85rem;
      margin: 0;
    }

    /* Related Products */
    .related-section {
      margin-top: 4rem;
      padding-top: 3rem;
      border-top: 2px dashed #ffd1dc;
    }

    .section-title {
      font-family: 'Quicksand', sans-serif;
      font-size: 1.75rem;
      font-weight: 700;
      color: var(--dark);
      margin-bottom: 2rem;
      display: flex;
      align-items: center;
      gap: 0.75rem;
    }

    .section-title i {
      color: var(--primary);
    }

    .related-card {
      border: none;
      border-radius: 20px;
      box-shadow: var(--shadow-sm);
      overflow: hidden;
      transition: all 0.3s ease;
      background: white;
      height: 100%;
    }

    .related-card:hover {
      transform: translateY(-5px);
      box-shadow: var(--shadow-hover);
    }

    .related-image-wrapper {
      padding: 1rem;
      background: linear-gradient(135deg, #fff5f8, #ffeef3);
      text-align: center;
    }

    .related-image {
      height: 150px;
      width: 100%;
      object-fit: contain;
    }

    .related-body {
      padding: 1rem;
    }

    .related-name {
      font-weight: 600;
      color: var(--dark);
      margin-bottom: 0.5rem;
      font-size: 0.95rem;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
    }

    .related-name a {
      color: inherit;
      text-decoration: none;
    }

    .related-name a:hover {
      color: var(--primary);
    }

    .related-price {
      font-weight: 700;
      color: var(--primary);
      font-size: 1.1rem;
    }

    /* Responsive */
    @media (max-width: 991px) {
      .product-info {
        padding-left: 0;
        margin-top: 2rem;
      }

      .product-title {
        font-size: 1.75rem;
      }

      .product-price {
        font-size: 2rem;
      }
    }

    @media (max-width: 767px) {
      .product-image-card {
        padding: 1.5rem;
      }

      .product-main-image {
        max-height: 300px;
      }

      .product-title {
        font-size: 1.5rem;
      }

      .product-price {
        font-size: 1.75rem;
      }

      .product-meta {
        flex-direction: column;
        gap: 0.5rem;
      }

      .action-buttons {
        flex-direction: column;
      }

      .btn-add-to-cart {
        width: 100%;
      }

      .btn-wishlist {
        width: 100%;
        border-radius: 50px;
        height: auto;
        padding: 0.75rem;
      }

      .quantity-selector {
        width: 100%;
        justify-content: center;
      }
    }
  </style>
