<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <style>
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
  </style>
