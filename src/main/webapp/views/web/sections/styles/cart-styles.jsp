<style>
  /* ===== CART PAGE STYLES ===== */

  /* Hero Section */
  .cart-hero {
    background: linear-gradient(135deg, #fff5f8 0%, #ffd1dc 50%, #ffb6c1 100%);
    padding: 2.5rem 0;
    margin-bottom: 2rem;
    position: relative;
    overflow: hidden;
  }

  .cart-hero::before {
    content: '';
    position: absolute;
    top: -50%;
    right: -10%;
    width: 300px;
    height: 300px;
    background: radial-gradient(circle, rgba(255, 107, 157, 0.2) 0%, transparent 70%);
    border-radius: 50%;
  }

  .hero-content {
    position: relative;
    z-index: 1;
  }

  .hero-title {
    font-family: 'Quicksand', sans-serif;
    font-size: 2.25rem;
    font-weight: 700;
    color: var(--dark);
    margin-bottom: 0.5rem;
  }

  .hero-title i {
    color: var(--primary);
  }

  .hero-subtitle {
    color: var(--dark-light);
  }

  /* Empty Cart */
  .empty-cart {
    text-align: center;
    padding: 4rem 2rem;
    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
    border-radius: 25px;
    box-shadow: var(--shadow-md);
  }

  .empty-cart-icon {
    font-size: 6rem;
    color: var(--primary);
    margin-bottom: 1.5rem;
    opacity: 0.7;
  }

  .empty-cart h3 {
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    color: var(--dark);
    margin-bottom: 0.75rem;
  }

  .empty-cart p {
    color: var(--dark-light);
    margin-bottom: 1.5rem;
  }

  /* Cart Table */
  .cart-card {
    border: none;
    border-radius: 20px;
    box-shadow: var(--shadow-md);
    overflow: hidden;
    background: white;
  }

  .cart-card .card-header {
    background: var(--gradient-primary);
    color: white;
    font-weight: 700;
    font-family: 'Quicksand', sans-serif;
    padding: 1.25rem 1.5rem;
    border: none;
  }

  .cart-table {
    margin: 0;
  }

  .cart-table thead {
    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
  }

  .cart-table thead th {
    font-weight: 700;
    color: var(--dark);
    padding: 1rem;
    border: none;
    text-transform: uppercase;
    font-size: 0.85rem;
    letter-spacing: 0.5px;
  }

  .cart-table tbody td {
    padding: 1.25rem 1rem;
    vertical-align: middle;
    border-bottom: 1px solid #f8f9fa;
  }

  .cart-table tbody tr:hover {
    background: #fff5f8;
  }

  /* Product in Cart */
  .cart-product {
    display: flex;
    align-items: center;
    gap: 1rem;
  }

  .cart-product-image {
    width: 80px;
    height: 80px;
    border-radius: 12px;
    object-fit: cover;
    background: linear-gradient(135deg, #fff5f8, #ffeef3);
    padding: 0.25rem;
  }

  .cart-product-info h6 {
    font-weight: 600;
    color: var(--dark);
    margin-bottom: 0.25rem;
  }

  .cart-product-info h6 a {
    color: inherit;
    text-decoration: none;
    transition: color 0.3s ease;
  }

  .cart-product-info h6 a:hover {
    color: var(--primary);
  }

  .cart-product-info small {
    color: var(--dark-light);
  }

  /* Price */
  .cart-price {
    font-weight: 600;
    color: var(--dark);
  }

  .cart-total-price {
    font-weight: 700;
    color: var(--primary);
    font-size: 1.1rem;
  }

  /* Quantity Form */
  .qty-form {
    display: flex;
    align-items: center;
    gap: 0.5rem;
  }

  .qty-input {
    width: 65px;
    text-align: center;
    border: 2px solid #ffd1dc;
    border-radius: 10px;
    padding: 0.5rem;
    font-weight: 600;
  }

  .qty-input:focus {
    border-color: var(--primary);
    outline: none;
    box-shadow: 0 0 0 3px rgba(255, 107, 157, 0.15);
  }

  .btn-update-qty {
    width: 38px;
    height: 38px;
    border-radius: 10px;
    border: 2px solid #ffd1dc;
    background: white;
    color: var(--primary);
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
  }

  .btn-update-qty:hover {
    background: var(--gradient-primary);
    border-color: var(--primary);
    color: white;
  }

  /* Remove Button */
  .btn-remove {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    border: none;
    background: linear-gradient(135deg, #ff7675, #fd79a8);
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
    text-decoration: none;
  }

  .btn-remove:hover {
    transform: scale(1.1);
    box-shadow: 0 4px 15px rgba(255, 118, 117, 0.4);
    color: white;
  }

  /* Cart Summary */
  .summary-card {
    border: none;
    border-radius: 20px;
    box-shadow: var(--shadow-md);
    overflow: hidden;
    background: white;
    position: sticky;
    top: 100px;
  }

  .summary-card .card-header {
    background: var(--gradient-primary);
    color: white;
    font-weight: 700;
    font-family: 'Quicksand', sans-serif;
    padding: 1.25rem 1.5rem;
    border: none;
  }

  .summary-card .card-body {
    padding: 1.5rem;
  }

  .summary-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0.75rem 0;
  }

  .summary-row.border-top {
    border-top: 2px dashed #ffd1dc !important;
    margin-top: 0.5rem;
    padding-top: 1rem;
  }

  .summary-label {
    color: var(--dark-light);
  }

  .summary-value {
    font-weight: 600;
    color: var(--dark);
  }

  .summary-total-label {
    font-family: 'Quicksand', sans-serif;
    font-size: 1.1rem;
    font-weight: 700;
    color: var(--dark);
  }

  .summary-total-value {
    font-family: 'Quicksand', sans-serif;
    font-size: 1.5rem;
    font-weight: 700;
    color: var(--primary);
  }

  .free-shipping {
    color: #00b894;
    font-weight: 600;
  }

  .free-shipping i {
    margin-right: 0.25rem;
  }

  /* Action Buttons */
  .btn-checkout {
    width: 100%;
    background: var(--gradient-primary);
    border: none;
    color: white;
    font-weight: 600;
    padding: 1rem;
    border-radius: 50px;
    font-size: 1.1rem;
    transition: all 0.3s ease;
    text-decoration: none;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 0.75rem;
  }

  .btn-checkout:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(255, 107, 157, 0.4);
    color: white;
  }

  .btn-continue {
    width: 100%;
    border: 2px solid var(--primary);
    background: transparent;
    color: var(--primary);
    font-weight: 600;
    padding: 0.875rem;
    border-radius: 50px;
    transition: all 0.3s ease;
    text-decoration: none;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .btn-continue:hover {
    background: var(--gradient-primary);
    border-color: var(--primary);
    color: white;
  }

  /* Mobile Cart Item */
  .mobile-cart-item {
    display: none;
    background: white;
    border-radius: 15px;
    padding: 1rem;
    margin-bottom: 1rem;
    box-shadow: var(--shadow-sm);
  }

  .mobile-cart-header {
    display: flex;
    gap: 1rem;
    margin-bottom: 1rem;
  }

  .mobile-cart-image {
    width: 80px;
    height: 80px;
    border-radius: 12px;
    object-fit: cover;
  }

  .mobile-cart-info {
    flex: 1;
  }

  .mobile-cart-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-top: 1rem;
    border-top: 1px dashed #ffd1dc;
  }

  /* Responsive */
  @media (max-width: 991px) {
    .summary-card {
      position: relative;
      top: 0;
      margin-top: 2rem;
    }
  }

  @media (max-width: 767px) {
    .cart-hero {
      padding: 1.5rem 0;
    }

    .hero-title {
      font-size: 1.75rem;
    }

    .desktop-cart {
      display: none;
    }

    .mobile-cart-item {
      display: block;
    }

    .summary-total-value {
      font-size: 1.25rem;
    }
  }
</style>
