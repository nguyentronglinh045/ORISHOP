<style>
  /* ===== FORGOT PASSWORD PAGE STYLES ===== */

  .forgot-page {
    min-height: 80vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #fff5f8 0%, #ffd1dc 50%, #ffb6c1 100%);
    padding: 3rem 1rem;
    position: relative;
    overflow: hidden;
  }

  .forgot-page::before {
    content: '';
    position: absolute;
    top: -30%;
    right: -20%;
    width: 500px;
    height: 500px;
    background: radial-gradient(circle, rgba(255, 107, 157, 0.15) 0%, transparent 70%);
    border-radius: 50%;
  }

  .forgot-page::after {
    content: '';
    position: absolute;
    bottom: -30%;
    left: -15%;
    width: 400px;
    height: 400px;
    background: radial-gradient(circle, rgba(212, 165, 116, 0.1) 0%, transparent 70%);
    border-radius: 50%;
  }

  .forgot-card {
    background: white;
    border-radius: 25px;
    box-shadow: 0 15px 50px rgba(255, 107, 157, 0.15);
    overflow: hidden;
    max-width: 450px;
    width: 100%;
    position: relative;
    z-index: 1;
  }

  .forgot-header {
    background: var(--gradient-primary);
    padding: 2rem;
    text-align: center;
  }

  .forgot-icon {
    width: 80px;
    height: 80px;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 1rem;
  }

  .forgot-icon i {
    font-size: 2.5rem;
    color: white;
  }

  .forgot-title {
    font-family: 'Quicksand', sans-serif;
    font-size: 1.75rem;
    font-weight: 700;
    color: white;
    margin: 0;
  }

  .forgot-body {
    padding: 2rem;
  }

  .forgot-description {
    text-align: center;
    color: var(--dark-light);
    margin-bottom: 1.5rem;
    line-height: 1.6;
  }

  /* Alert */
  .forgot-alert {
    border: none;
    border-radius: 12px;
    padding: 1rem 1.25rem;
    margin-bottom: 1.5rem;
    display: flex;
    align-items: center;
    gap: 0.75rem;
  }

  .forgot-alert.alert-info {
    background: linear-gradient(135deg, rgba(116, 185, 255, 0.15), rgba(116, 185, 255, 0.05));
    color: #0984e3;
  }

  .forgot-alert.alert-success {
    background: linear-gradient(135deg, rgba(0, 184, 148, 0.15), rgba(0, 184, 148, 0.05));
    color: #00b894;
  }

  .forgot-alert.alert-danger {
    background: linear-gradient(135deg, rgba(231, 76, 60, 0.15), rgba(231, 76, 60, 0.05));
    color: #e74c3c;
  }

  .forgot-alert i {
    font-size: 1.25rem;
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

  .input-wrapper {
    position: relative;
  }

  .input-wrapper .form-control {
    border: 2px solid #ffd1dc;
    padding: 14px 15px 14px 50px;
    border-radius: 50px;
    font-size: 1rem;
    transition: all 0.3s ease;
  }

  .input-wrapper .form-control:focus {
    border-color: var(--primary);
    box-shadow: 0 0 0 4px rgba(255, 107, 157, 0.15);
  }

  .input-wrapper .input-icon {
    position: absolute;
    left: 18px;
    top: 50%;
    transform: translateY(-50%);
    color: var(--primary);
    font-size: 1.1rem;
  }

  /* Submit Button */
  .btn-submit {
    width: 100%;
    background: var(--gradient-primary);
    border: none;
    color: white;
    font-weight: 600;
    padding: 14px;
    border-radius: 50px;
    font-size: 1.1rem;
    transition: all 0.3s ease;
  }

  .btn-submit:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(255, 107, 157, 0.4);
    color: white;
  }

  /* Footer Links */
  .forgot-footer {
    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
    padding: 1.5rem;
    text-align: center;
  }

  .footer-link {
    display: block;
    margin-bottom: 0.75rem;
  }

  .footer-link:last-child {
    margin-bottom: 0;
  }

  .footer-link a {
    color: var(--primary);
    font-weight: 600;
    text-decoration: none;
    transition: all 0.3s ease;
  }

  .footer-link a:hover {
    color: var(--primary-dark);
    text-decoration: underline;
  }

  .footer-link span {
    color: var(--dark-light);
  }

  /* Responsive */
  @media (max-width: 575px) {
    .forgot-card {
      margin: 1rem;
    }

    .forgot-header {
      padding: 1.5rem;
    }

    .forgot-icon {
      width: 70px;
      height: 70px;
    }

    .forgot-icon i {
      font-size: 2rem;
    }

    .forgot-title {
      font-size: 1.5rem;
    }

    .forgot-body {
      padding: 1.5rem;
    }
  }
</style>