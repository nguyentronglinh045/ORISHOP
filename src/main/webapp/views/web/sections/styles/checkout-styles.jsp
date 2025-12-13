<style>
  /* ===== CHECKOUT PAGE STYLES ===== */

  /* Hero Section */
  .checkout-hero {
    background: linear-gradient(135deg, #fff5f8 0%, #ffd1dc 50%, #ffb6c1 100%);
    padding: 2.5rem 0;
    margin-bottom: 2rem;
    position: relative;
    overflow: hidden;
  }

  .checkout-hero::before {
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

  /* Steps Indicator */
  .checkout-steps {
    display: flex;
    justify-content: center;
    gap: 1rem;
    margin-top: 1.5rem;
  }

  .step-item {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.5rem 1rem;
    background: rgba(255, 255, 255, 0.8);
    border-radius: 50px;
    font-weight: 600;
    color: var(--dark-light);
  }

  .step-item.active {
    background: white;
    color: var(--primary);
    box-shadow: 0 2px 8px rgba(255, 107, 157, 0.2);
  }

  .step-item.completed {
    background: var(--primary);
    color: white;
  }

  .step-number {
    width: 28px;
    height: 28px;
    border-radius: 50%;
    background: currentColor;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.85rem;
  }

  .step-item.active .step-number {
    background: var(--primary);
  }

  .step-item.completed .step-number {
    background: white;
    color: var(--primary);
  }

  /* Empty Cart Alert */
  .empty-alert {
    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
    border: none;
    border-radius: 20px;
    padding: 2rem;
    text-align: center;
  }

  .empty-alert i {
    font-size: 3rem;
    color: var(--primary);
    margin-bottom: 1rem;
  }

  /* Form Card */
  .checkout-card {
    border: none;
    border-radius: 20px;
    box-shadow: var(--shadow-md);
    overflow: hidden;
    background: white;
  }

  .checkout-card .card-header {
    background: var(--gradient-primary);
    color: white;
    font-weight: 700;
    font-family: 'Quicksand', sans-serif;
    padding: 1.25rem 1.5rem;
    border: none;
  }

  .checkout-card .card-body {
    padding: 2rem;
  }

  /* Login Prompt */
  .login-prompt {
    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
    border-radius: 15px;
    padding: 1rem 1.5rem;
    margin-bottom: 1.5rem;
    display: flex;
    align-items: center;
    gap: 1rem;
  }

  .login-prompt i {
    font-size: 1.5rem;
    color: var(--primary);
  }

  .login-prompt a {
    color: var(--primary);
    font-weight: 600;
    text-decoration: none;
  }

  .login-prompt a:hover {
    text-decoration: underline;
  }

  /* Form Styles */
  .form-group {
    margin-bottom: 1.5rem;
  }

  .form-label {
    font-weight: 600;
    color: var(--dark);
    margin-bottom: 0.5rem;
    font-family: 'Quicksand', sans-serif;
  }

  .form-label .text-danger {
    color: #e74c3c !important;
  }

  .input-group-text {
    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
    border: 2px solid #ffd1dc;
    border-right: none;
    color: var(--primary);
    padding: 12px 15px;
    border-radius: 12px 0 0 12px;
  }

  .form-control {
    border: 2px solid #ffd1dc;
    padding: 12px 15px;
    border-radius: 12px;
    transition: all 0.3s ease;
  }

  .input-group .form-control {
    border-left: none;
    border-radius: 0 12px 12px 0;
  }

  .form-control:focus {
    border-color: var(--primary);
    box-shadow: 0 0 0 3px rgba(255, 107, 157, 0.15);
  }

  textarea.form-control {
    border-radius: 12px;
    border: 2px solid #ffd1dc;
  }

  .form-text {
    color: var(--dark-light);
    font-size: 0.85rem;
    margin-top: 0.5rem;
  }

  /* Order Summary Card */
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

  /* Order Items */
  .order-item {
    display: flex;
    gap: 1rem;
    padding: 1rem;
    border-bottom: 1px dashed #ffd1dc;
  }

  .order-item:last-child {
    border-bottom: none;
  }

  .order-item-image {
    width: 60px;
    height: 60px;
    border-radius: 10px;
    object-fit: cover;
    background: linear-gradient(135deg, #fff5f8, #ffeef3);
    padding: 0.25rem;
  }

  .order-item-info {
    flex: 1;
  }

  .order-item-name {
    font-weight: 600;
    color: var(--dark);
    font-size: 0.95rem;
    margin-bottom: 0.25rem;
  }

  .order-item-details {
    font-size: 0.85rem;
    color: var(--dark-light);
  }

  .order-item-price {
    font-weight: 600;
    color: var(--dark);
    white-space: nowrap;
  }

  /* Total Section */
  .order-total {
    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
    padding: 1.25rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .order-total-label {
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    font-size: 1.1rem;
    color: var(--dark);
  }

  .order-total-value {
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    font-size: 1.35rem;
    color: var(--primary);
  }

  /* Action Buttons */
  .btn-place-order {
    width: 100%;
    background: var(--gradient-primary);
    border: none;
    color: white;
    font-weight: 700;
    padding: 1rem;
    border-radius: 50px;
    font-size: 1.1rem;
    transition: all 0.3s ease;
    text-transform: uppercase;
    letter-spacing: 0.5px;
  }

  .btn-place-order:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(255, 107, 157, 0.4);
    color: white;
  }

  .btn-back-cart {
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
    margin-top: 0.75rem;
  }

  .btn-back-cart:hover {
    background: var(--gradient-primary);
    border-color: var(--primary);
    color: white;
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
    .checkout-hero {
      padding: 1.5rem 0;
    }

    .hero-title {
      font-size: 1.75rem;
    }

    .checkout-steps {
      flex-direction: column;
      align-items: center;
    }

    .checkout-card .card-body {
      padding: 1.5rem;
    }

    .order-total-value {
      font-size: 1.15rem;
    }
  }
</style>