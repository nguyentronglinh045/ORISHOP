<style>
  /* ===== ORDER DETAIL PAGE STYLES ===== */

  /* Hero Section */
  .detail-hero {
    background: var(--gradient-primary);
    padding: 3rem 0;
    margin-bottom: 2rem;
  }

  .detail-hero-content {
    text-align: center;
    color: white;
  }

  .detail-hero h1 {
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    font-size: 2.25rem;
    margin-bottom: 0.5rem;
  }

  .detail-breadcrumb {
    display: flex;
    justify-content: center;
    gap: 0.5rem;
    flex-wrap: wrap;
  }

  .detail-breadcrumb a {
    color: rgba(255, 255, 255, 0.8);
    text-decoration: none;
    transition: color 0.3s ease;
  }

  .detail-breadcrumb a:hover {
    color: white;
  }

  .detail-breadcrumb span {
    color: rgba(255, 255, 255, 0.6);
  }

  /* Info Card */
  .info-card {
    background: white;
    border-radius: 20px;
    box-shadow: 0 5px 20px rgba(255, 107, 157, 0.1);
    overflow: hidden;
    margin-bottom: 1.5rem;
  }

  .info-card-header {
    background: linear-gradient(135deg, #fff5f8, #ffeef2);
    padding: 1.25rem 1.5rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 1rem;
  }

  .info-card-title {
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    color: var(--dark);
    margin: 0;
    display: flex;
    align-items: center;
    gap: 0.5rem;
  }

  .info-card-title i {
    color: var(--primary);
  }

  /* Status Badge */
  .status-badge {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.5rem 1rem;
    border-radius: 50px;
    font-weight: 600;
    font-size: 0.9rem;
  }

  .status-pending {
    background: linear-gradient(135deg, rgba(255, 193, 7, 0.2), rgba(255, 193, 7, 0.05));
    color: #f39c12;
  }

  .status-shipping {
    background: linear-gradient(135deg, rgba(52, 152, 219, 0.2), rgba(52, 152, 219, 0.05));
    color: #3498db;
  }

  .status-delivered {
    background: linear-gradient(135deg, rgba(0, 184, 148, 0.2), rgba(0, 184, 148, 0.05));
    color: #00b894;
  }

  .status-cancelled {
    background: linear-gradient(135deg, rgba(231, 76, 60, 0.2), rgba(231, 76, 60, 0.05));
    color: #e74c3c;
  }

  .status-default {
    background: linear-gradient(135deg, rgba(108, 117, 125, 0.2), rgba(108, 117, 125, 0.05));
    color: #6c757d;
  }

  .info-card-body {
    padding: 1.5rem;
  }

  /* Info Grid */
  .info-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1.25rem;
  }

  .info-item {
    display: flex;
    align-items: flex-start;
    gap: 1rem;
  }

  .info-icon {
    width: 45px;
    height: 45px;
    background: linear-gradient(135deg, rgba(255, 107, 157, 0.1), rgba(255, 143, 171, 0.05));
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
  }

  .info-icon i {
    color: var(--primary);
    font-size: 1.1rem;
  }

  .info-content {
    flex: 1;
  }

  .info-label {
    font-size: 0.85rem;
    color: var(--dark-light);
    margin-bottom: 0.25rem;
  }

  .info-value {
    font-weight: 600;
    color: var(--dark);
  }

  /* Products Card */
  .products-card {
    background: white;
    border-radius: 20px;
    box-shadow: 0 5px 20px rgba(255, 107, 157, 0.1);
    overflow: hidden;
    margin-bottom: 1.5rem;
  }

  .products-header {
    background: linear-gradient(135deg, #fff5f8, #ffeef2);
    padding: 1.25rem 1.5rem;
  }

  .products-title {
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    color: var(--dark);
    margin: 0;
    display: flex;
    align-items: center;
    gap: 0.5rem;
  }

  .products-title i {
    color: var(--primary);
  }

  /* Product List */
  .product-list {
    padding: 0;
  }

  .product-item {
    display: flex;
    align-items: center;
    padding: 1.25rem 1.5rem;
    border-bottom: 1px solid #f5f5f5;
    gap: 1rem;
  }

  .product-item:last-child {
    border-bottom: none;
  }

  .product-image {
    width: 80px;
    height: 80px;
    border-radius: 12px;
    overflow: hidden;
    flex-shrink: 0;
    border: 2px solid #fff5f8;
  }

  .product-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  .product-info {
    flex: 1;
  }

  .product-name {
    font-weight: 600;
    color: var(--dark);
    margin-bottom: 0.25rem;
  }

  .product-price {
    font-size: 0.95rem;
    color: var(--dark-light);
  }

  .product-qty {
    text-align: center;
    padding: 0.5rem 1rem;
    background: linear-gradient(135deg, rgba(255, 107, 157, 0.1), rgba(255, 143, 171, 0.05));
    border-radius: 50px;
  }

  .product-qty-label {
    font-size: 0.75rem;
    color: var(--dark-light);
  }

  .product-qty-value {
    font-weight: 700;
    color: var(--primary);
  }

  .product-subtotal {
    text-align: right;
    min-width: 120px;
  }

  .subtotal-label {
    font-size: 0.75rem;
    color: var(--dark-light);
  }

  .subtotal-value {
    font-weight: 700;
    color: var(--primary);
    font-size: 1.1rem;
  }

  /* Total Row */
  .total-row {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    padding: 1.5rem;
    background: linear-gradient(135deg, #fff5f8, #ffeef2);
    gap: 1rem;
  }

  .total-label {
    font-size: 1rem;
    color: var(--dark);
  }

  .total-value {
    font-family: 'Quicksand', sans-serif;
    font-size: 1.5rem;
    font-weight: 700;
    color: var(--primary);
  }

  /* Action Button */
  .btn-back {
    background: white;
    border: 2px solid var(--primary);
    color: var(--primary);
    padding: 12px 25px;
    border-radius: 50px;
    font-weight: 600;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    transition: all 0.3s ease;
  }

  .btn-back:hover {
    background: var(--gradient-primary);
    border-color: transparent;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 5px 20px rgba(255, 107, 157, 0.3);
  }

  /* Responsive */
  @media (max-width: 991px) {
    .info-grid {
      grid-template-columns: 1fr;
    }
  }

  @media (max-width: 767px) {
    .detail-hero {
      padding: 2rem 0;
    }

    .detail-hero h1 {
      font-size: 1.75rem;
    }

    .product-item {
      flex-wrap: wrap;
    }

    .product-image {
      width: 70px;
      height: 70px;
    }

    .product-info {
      flex: 1 1 calc(100% - 90px);
    }

    .product-qty {
      flex: 1;
    }

    .product-subtotal {
      flex: 1;
      text-align: left;
    }

    .total-row {
      flex-direction: column;
      text-align: center;
    }
  }

  @media (max-width: 575px) {
    .info-card-header {
      flex-direction: column;
      align-items: flex-start;
    }

    .info-item {
      flex-direction: column;
      gap: 0.5rem;
    }

    .product-item {
      padding: 1rem;
    }

    .product-image {
      width: 60px;
      height: 60px;
    }
  }
</style>