<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <style>
    /* ===== ORDER EDIT STYLES ===== */

    /* Hero Section */
    .order-hero {
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

    /* Section Card */
    .section-card {
      border: none;
      border-radius: 15px;
      box-shadow: var(--shadow-md);
      overflow: hidden;
      margin-bottom: 1.5rem;
    }

    .section-card .card-header {
      background: var(--gradient-primary);
      color: white;
      padding: 1rem 1.25rem;
      border: none;
      font-weight: 700;
      font-family: 'Quicksand', sans-serif;
    }

    .section-card.info-card .card-header {
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
      color: var(--dark);
    }

    .section-card.info-card .card-header i {
      color: var(--primary);
    }

    /* Order Info Display */
    .info-row {
      display: flex;
      padding: 1rem 0;
      border-bottom: 1px solid #f0f0f0;
    }

    .info-row:last-child {
      border-bottom: none;
    }

    .info-label {
      width: 140px;
      font-weight: 600;
      color: var(--dark-light);
      font-size: 0.9rem;
    }

    .info-value {
      flex: 1;
      font-weight: 500;
      color: var(--dark);
    }

    .info-value.highlight {
      color: var(--primary);
      font-weight: 700;
      font-size: 1.1rem;
    }

    /* Customer Info Card */
    .customer-card {
      display: flex;
      align-items: center;
      gap: 15px;
      padding: 1rem;
      background: #fff5f8;
      border-radius: 12px;
    }

    .customer-avatar-lg {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      background: var(--gradient-primary);
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-weight: 700;
      font-size: 1.5rem;
      font-family: 'Quicksand', sans-serif;
      box-shadow: 0 4px 16px rgba(255, 107, 157, 0.25);
    }

    .customer-details-lg {
      flex: 1;
    }

    .customer-name-lg {
      font-weight: 700;
      color: var(--dark);
      font-size: 1.1rem;
      font-family: 'Quicksand', sans-serif;
    }

    .customer-username {
      font-size: 0.85rem;
      color: var(--dark-light);
    }

    /* Form Groups */
    .form-group {
      position: relative;
      margin-bottom: 1.5rem;
    }

    .form-label {
      font-weight: 700;
      color: var(--dark);
      margin-bottom: 0.75rem;
      font-family: 'Quicksand', sans-serif;
      font-size: 0.95rem;
    }

    .form-label .text-danger {
      color: #e74c3c !important;
    }

    /* Input Group Styling */
    .input-group-text {
      background-color: #fff;
      border: 2px solid var(--primary);
      border-right: none;
      color: var(--primary);
      border-radius: 15px 0 0 15px;
      padding: 12px 15px;
      font-size: 1.1rem;
    }

    .input-group .form-control,
    .input-group .form-select {
      border: 2px solid var(--primary);
      border-left: none;
      border-radius: 0 15px 15px 0;
      padding: 12px 15px;
      font-size: 0.95rem;
      transition: all 0.3s ease;
      font-family: 'Inter', sans-serif;
    }

    .input-group .form-control:focus,
    .input-group .form-select:focus {
      border-color: var(--primary);
      box-shadow: none;
      outline: none;
    }

    .input-group:focus-within .input-group-text {
      border-color: var(--primary-dark);
      color: var(--primary-dark);
    }

    .form-control::placeholder {
      color: #6c757d;
      opacity: 0.7;
    }

    /* Standalone Input */
    .form-control.standalone,
    .form-select.standalone {
      border: 2px solid var(--primary);
      border-radius: 15px;
      padding: 12px 15px;
      font-size: 0.95rem;
      transition: all 0.3s ease;
    }

    .form-control.standalone:focus,
    .form-select.standalone:focus {
      border-color: var(--primary-dark);
      box-shadow: 0 0 0 0.2rem rgba(255, 107, 157, 0.15);
    }

    /* Form Text Helper */
    .form-text {
      color: var(--dark-light);
      font-size: 0.85rem;
      margin-top: 0.5rem;
      display: block;
      font-style: italic;
    }

    /* Status Selection */
    .status-options {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 1rem;
    }

    .status-option {
      position: relative;
    }

    .status-option input[type="radio"] {
      display: none;
    }

    .status-option label {
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 15px 20px;
      border: 2px solid #e9ecef;
      border-radius: 12px;
      cursor: pointer;
      transition: all 0.3s ease;
      font-weight: 600;
      gap: 8px;
    }

    .status-option label:hover {
      border-color: #ffd1dc;
      background: #fff5f8;
    }

    .status-option input[type="radio"]:checked+label.status-pending {
      background: linear-gradient(135deg, #fdcb6e, #ffeaa7);
      border-color: #fdcb6e;
      color: #d63031;
    }

    .status-option input[type="radio"]:checked+label.status-shipping {
      background: linear-gradient(135deg, #74b9ff, #a29bfe);
      border-color: #74b9ff;
      color: white;
    }

    .status-option input[type="radio"]:checked+label.status-delivered {
      background: linear-gradient(135deg, #00b894, #55efc4);
      border-color: #00b894;
      color: white;
    }

    .status-option input[type="radio"]:checked+label.status-cancelled {
      background: linear-gradient(135deg, #ff7675, #fd79a8);
      border-color: #ff7675;
      color: white;
    }

    /* Action Buttons */
    .btn-back {
      background: transparent;
      border: 2px solid #636e72;
      color: #636e72;
      padding: 12px 30px;
      border-radius: 50px;
      font-weight: 600;
      transition: all 0.3s ease;
    }

    .btn-back:hover {
      background: #636e72;
      color: white;
      transform: translateY(-2px);
      box-shadow: 0 4px 16px rgba(99, 110, 114, 0.2);
    }

    .btn-submit {
      background: linear-gradient(135deg, #ff6b9d, #ffb6c1);
      border: none;
      color: white;
      padding: 12px 30px;
      border-radius: 50px;
      font-weight: 600;
      box-shadow: var(--shadow-sm);
      transition: all 0.3s ease;
    }

    .btn-submit:hover {
      transform: translateY(-2px);
      box-shadow: var(--shadow-hover);
      color: white;
    }

    /* Order Items Table */
    .items-table {
      width: 100%;
    }

    .items-table thead {
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
    }

    .items-table thead th {
      color: var(--dark);
      font-weight: 700;
      font-size: 0.85rem;
      padding: 0.75rem;
      border: none;
      font-family: 'Quicksand', sans-serif;
    }

    .items-table tbody td {
      padding: 0.75rem;
      vertical-align: middle;
      border-bottom: 1px solid #f0f0f0;
    }

    .item-image {
      width: 50px;
      height: 50px;
      border-radius: 8px;
      object-fit: cover;
    }

    .item-name {
      font-weight: 600;
      color: var(--dark);
    }

    .item-price {
      color: var(--primary);
      font-weight: 600;
    }

    /* Summary */
    .order-summary {
      background: #fff5f8;
      border-radius: 12px;
      padding: 1.5rem;
    }

    .summary-row {
      display: flex;
      justify-content: space-between;
      padding: 0.5rem 0;
    }

    .summary-row.total {
      border-top: 2px solid #ffd1dc;
      margin-top: 0.5rem;
      padding-top: 1rem;
    }

    .summary-label {
      color: var(--dark-light);
      font-weight: 500;
    }

    .summary-value {
      font-weight: 600;
      color: var(--dark);
    }

    .summary-value.total {
      color: var(--primary);
      font-size: 1.25rem;
      font-weight: 700;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .order-hero {
        padding: 1.5rem;
      }

      .page-title {
        font-size: 1.5rem;
      }

      .section-card .card-body {
        padding: 1.25rem !important;
      }

      .info-row {
        flex-direction: column;
        gap: 0.25rem;
      }

      .info-label {
        width: 100%;
      }

      .status-options {
        grid-template-columns: 1fr;
      }

      .btn-back,
      .btn-submit {
        padding: 10px 20px;
        font-size: 0.9rem;
      }
    }

    @media (max-width: 576px) {
      .order-hero .d-flex {
        flex-direction: column;
        align-items: flex-start !important;
      }

      .customer-card {
        flex-direction: column;
        text-align: center;
      }

      .d-flex.gap-2 {
        flex-direction: column;
        width: 100%;
      }

      .btn-back,
      .btn-submit {
        width: 100%;
        justify-content: center;
      }
    }

    /* Animation */
    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(20px);
      }

      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .section-card {
      animation: fadeIn 0.5s ease-out;
    }

    .section-card:nth-child(2) {
      animation-delay: 0.1s;
    }

    .section-card:nth-child(3) {
      animation-delay: 0.2s;
    }

    .section-card:nth-child(4) {
      animation-delay: 0.3s;
    }

    /* Select Dropdown Enhancement */
    .form-select {
      background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23ff6b9d' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
      background-repeat: no-repeat;
      background-position: right 15px center;
      background-size: 16px 12px;
    }
  </style>