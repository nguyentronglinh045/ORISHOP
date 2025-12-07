<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <style>
    /* ===== PRODUCT LIST STYLES - CARD LAYOUT ===== */

    /* Hero Section */
    .product-hero {
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
      padding: 2rem;
      border-radius: 15px;
      box-shadow: 0 2px 8px rgba(255, 107, 157, 0.1);
    }

    .page-title {
      color: var(--dark);
      font-size: 2rem;
      font-weight: 700;
      font-family: 'Quicksand', sans-serif;
    }

    .page-title i {
      color: var(--primary);
    }

    /* Breadcrumb */
    .breadcrumb {
      background: transparent;
      padding: 0;
      margin: 0;
    }

    .breadcrumb-item a {
      color: var(--primary);
      text-decoration: none;
      font-weight: 600;
      transition: var(--transition-base);
    }

    .breadcrumb-item a:hover {
      color: var(--primary-dark);
    }

    .breadcrumb-item.active {
      color: var(--dark-light);
    }

    /* Add Button */
    .btn-add {
      background: var(--gradient-primary);
      border: none;
      color: white;
      font-weight: 600;
      padding: 12px 30px;
      border-radius: 50px;
      box-shadow: var(--shadow-sm);
      transition: var(--transition-base);
    }

    .btn-add:hover {
      transform: translateY(-2px);
      box-shadow: var(--shadow-hover);
      color: white;
    }

    /* Custom Alerts */
    .custom-alert {
      border: none;
      border-radius: 15px;
      padding: 15px 20px;
      font-weight: 500;
      box-shadow: var(--shadow-sm);
    }

    .alert-success {
      background-color: rgba(0, 184, 148, 0.1);
      color: #00b894;
      border-left: 4px solid #00b894;
    }

    .alert-danger {
      background-color: rgba(231, 76, 60, 0.1);
      color: #e74c3c;
      border-left: 4px solid #e74c3c;
    }

    /* Main Container Card */
    .products-container {
      border: none;
      border-radius: 15px;
      box-shadow: var(--shadow-md);
      overflow: hidden;
    }

    .products-container .card-header {
      background: var(--gradient-primary);
      color: white;
      padding: 1.25rem 1.5rem;
      border: none;
    }

    .products-container .card-header h5 {
      font-family: 'Quicksand', sans-serif;
    }

    .products-container .card-header .badge {
      background-color: rgba(255, 255, 255, 0.2) !important;
      color: white !important;
      padding: 8px 16px;
      border-radius: 50px;
      font-weight: 600;
    }

    /* Empty State */
    .empty-state {
      padding: 4rem 2rem;
    }

    .empty-icon {
      font-size: 5rem;
      color: #ffd1dc;
    }

    .empty-state h4 {
      font-family: 'Quicksand', sans-serif;
      font-weight: 600;
    }

    /* Products Grid */
    .products-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
      gap: 1.5rem;
      padding: 1.5rem;
    }

    /* Product Item Card */
    .product-item {
      background: white;
      border-radius: 15px;
      box-shadow: var(--shadow-sm);
      overflow: hidden;
      transition: var(--transition-base);
      display: flex;
      flex-direction: column;
      border: 1px solid #f0f0f0;
    }

    .product-item:hover {
      transform: translateY(-5px);
      box-shadow: var(--shadow-md);
      border-color: var(--primary-light);
    }

    /* Product Image */
    .product-image-container {
      position: relative;
      width: 100%;
      height: 200px;
      overflow: hidden;
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
    }

    .product-image {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: var(--transition-base);
    }

    .product-item:hover .product-image {
      transform: scale(1.05);
    }

    .product-image-placeholder {
      width: 100%;
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 3rem;
      color: var(--primary);
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
    }

    /* Product ID Badge */
    .product-id-badge {
      position: absolute;
      top: 12px;
      left: 12px;
      background: rgba(255, 255, 255, 0.95);
      color: var(--dark);
      padding: 6px 12px;
      border-radius: 50px;
      font-size: 0.8rem;
      font-weight: 700;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    /* Status Badge on Image */
    .product-status-overlay {
      position: absolute;
      top: 12px;
      right: 12px;
    }

    .status-badge {
      padding: 6px 14px;
      border-radius: 50px;
      font-size: 0.75rem;
      font-weight: 600;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    .status-badge.active {
      background: linear-gradient(135deg, #00b894, #55efc4);
      color: white;
    }

    .status-badge.inactive {
      background: linear-gradient(135deg, #636e72, #b2bec3);
      color: white;
    }

    /* Product Info */
    .product-info {
      padding: 1.25rem;
      flex: 1;
      display: flex;
      flex-direction: column;
    }

    .product-category {
      margin-bottom: 0.5rem;
    }

    .category-badge {
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
      color: var(--primary-dark);
      padding: 5px 12px;
      border-radius: 50px;
      font-size: 0.75rem;
      font-weight: 600;
      display: inline-block;
    }

    .product-name {
      font-weight: 700;
      color: var(--dark);
      font-size: 1.1rem;
      font-family: 'Quicksand', sans-serif;
      margin-bottom: 0.5rem;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
      line-height: 1.4;
    }

    .product-description {
      font-size: 0.85rem;
      color: var(--dark-light);
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
      margin-bottom: 1rem;
      flex: 1;
    }

    /* Price & Stock Row */
    .product-meta {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 1rem;
      padding-top: 0.75rem;
      border-top: 1px dashed #f0f0f0;
    }

    .price-display {
      font-weight: 700;
      color: var(--primary);
      font-size: 1.2rem;
      font-family: 'Quicksand', sans-serif;
    }

    /* Stock Badge */
    .stock-badge {
      padding: 5px 12px;
      border-radius: 50px;
      font-size: 0.8rem;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      gap: 4px;
    }

    .stock-badge.in-stock {
      background: rgba(0, 184, 148, 0.1);
      color: #00b894;
    }

    .stock-badge.low-stock {
      background: rgba(253, 203, 110, 0.15);
      color: #d63031;
    }

    .stock-badge.out-of-stock {
      background: rgba(231, 76, 60, 0.1);
      color: #e74c3c;
    }

    /* Action Buttons */
    .product-actions {
      display: flex;
      gap: 0.75rem;
      padding-top: 0.75rem;
      border-top: 1px solid #f0f0f0;
    }

    .btn-edit,
    .btn-delete {
      flex: 1;
      padding: 10px 16px;
      border-radius: 10px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
      border: none;
      transition: var(--transition-base);
      font-size: 0.85rem;
      font-weight: 600;
      cursor: pointer;
      text-decoration: none;
    }

    .btn-edit {
      background: linear-gradient(135deg, #74b9ff, #a29bfe);
      color: white;
      box-shadow: 0 2px 8px rgba(116, 185, 255, 0.2);
    }

    .btn-edit:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 16px rgba(116, 185, 255, 0.3);
      color: white;
    }

    .btn-delete {
      background: linear-gradient(135deg, #ff7675, #fd79a8);
      color: white;
      box-shadow: 0 2px 8px rgba(255, 118, 117, 0.2);
    }

    .btn-delete:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 16px rgba(255, 118, 117, 0.3);
      color: white;
    }

    /* Pagination Styles */
    .pagination-wrapper {
      padding: 1.5rem;
      border-top: 1px solid #f0f0f0;
      background: #fff;
      border-radius: 0 0 15px 15px;
    }

    .pagination-info {
      color: var(--dark-light);
      font-size: 0.9rem;
    }

    .pagination {
      margin: 0;
    }

    .page-link {
      border: none;
      color: var(--dark);
      padding: 10px 16px;
      margin: 0 3px;
      border-radius: 10px;
      font-weight: 600;
      transition: var(--transition-base);
      background: #f8f9fa;
    }

    .page-link:hover {
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
      color: var(--primary);
      transform: translateY(-2px);
    }

    .page-item.active .page-link {
      background: var(--gradient-primary);
      color: white;
      box-shadow: 0 4px 12px rgba(255, 107, 157, 0.3);
    }

    .page-item.disabled .page-link {
      background: #f0f0f0;
      color: #ccc;
    }

    .page-link i {
      font-size: 0.85rem;
    }

    /* Animation */
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(20px);
      }

      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .product-item {
      animation: fadeInUp 0.4s ease-out;
      animation-fill-mode: both;
    }

    .product-item:nth-child(1) {
      animation-delay: 0.05s;
    }

    .product-item:nth-child(2) {
      animation-delay: 0.1s;
    }

    .product-item:nth-child(3) {
      animation-delay: 0.15s;
    }

    .product-item:nth-child(4) {
      animation-delay: 0.2s;
    }

    .product-item:nth-child(5) {
      animation-delay: 0.25s;
    }

    .product-item:nth-child(6) {
      animation-delay: 0.3s;
    }

    .product-item:nth-child(7) {
      animation-delay: 0.35s;
    }

    .product-item:nth-child(8) {
      animation-delay: 0.4s;
    }

    .product-item:nth-child(9) {
      animation-delay: 0.45s;
    }

    .product-item:nth-child(10) {
      animation-delay: 0.5s;
    }

    .product-item:nth-child(11) {
      animation-delay: 0.55s;
    }

    .product-item:nth-child(12) {
      animation-delay: 0.6s;
    }

    /* Responsive Design */
    @media (max-width: 992px) {
      .products-grid {
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 1.25rem;
        padding: 1.25rem;
      }
    }

    @media (max-width: 768px) {
      .product-hero {
        padding: 1.5rem;
      }

      .page-title {
        font-size: 1.5rem;
      }

      .btn-add {
        padding: 10px 20px;
        font-size: 0.9rem;
      }

      .products-grid {
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 1rem;
        padding: 1rem;
      }

      .product-image-container {
        height: 180px;
      }

      .product-name {
        font-size: 1rem;
      }

      .price-display {
        font-size: 1.1rem;
      }
    }

    @media (max-width: 576px) {
      .product-hero .d-flex {
        flex-direction: column;
        align-items: flex-start !important;
      }

      .product-hero .d-flex>div:last-child {
        width: 100%;
      }

      .btn-add {
        width: 100%;
        justify-content: center;
      }

      .products-grid {
        grid-template-columns: 1fr;
        padding: 1rem;
      }

      .product-image-container {
        height: 200px;
      }

      .pagination-wrapper {
        flex-direction: column;
        gap: 1rem;
        text-align: center;
      }

      .pagination-wrapper .d-flex {
        flex-direction: column;
        gap: 1rem;
      }

      .page-link {
        padding: 8px 12px;
        font-size: 0.85rem;
      }
    }
  </style>