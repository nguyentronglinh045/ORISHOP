<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <style>
    /* ===== USER FORM STYLES (ADD/EDIT) ===== */

    /* Hero Section */
    .user-hero {
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

    /* Form Card */
    .form-card {
      border: none;
      border-radius: 15px;
      box-shadow: var(--shadow-md);
      overflow: hidden;
    }

    .form-card .card-header {
      background: var(--gradient-primary);
      color: white;
      padding: 1.25rem 1.5rem;
      border: none;
    }

    .form-card .card-header h5 {
      font-family: 'Quicksand', sans-serif;
    }

    /* Section Card */
    .section-card {
      border: none;
      border-radius: 15px;
      box-shadow: var(--shadow-sm);
      overflow: hidden;
      margin-bottom: 1.5rem;
    }

    .section-card .card-header {
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
      color: var(--dark);
      padding: 1rem 1.25rem;
      border: none;
      font-weight: 700;
      font-family: 'Quicksand', sans-serif;
    }

    .section-card .card-header i {
      color: var(--primary);
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

    /* Readonly Input */
    .form-control.readonly-field {
      background-color: #f8f9fa;
      cursor: not-allowed;
    }

    /* Form Text Helper */
    .form-text {
      color: var(--dark-light);
      font-size: 0.85rem;
      margin-top: 0.5rem;
      display: block;
      font-style: italic;
    }

    /* Role Selection */
    .role-options {
      display: flex;
      gap: 1rem;
    }

    .role-option {
      flex: 1;
    }

    .role-option input[type="radio"] {
      display: none;
    }

    .role-option label {
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

    .role-option label:hover {
      border-color: #ffd1dc;
      background: #fff5f8;
    }

    .role-option input[type="radio"]:checked+label.role-admin {
      background: linear-gradient(135deg, #ff7675, #fd79a8);
      border-color: #ff7675;
      color: white;
    }

    .role-option input[type="radio"]:checked+label.role-user {
      background: linear-gradient(135deg, #74b9ff, #a29bfe);
      border-color: #74b9ff;
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

    .btn-reset {
      background: transparent;
      border: 2px solid #fdcb6e;
      color: #fdcb6e;
      padding: 12px 30px;
      border-radius: 50px;
      font-weight: 600;
      transition: all 0.3s ease;
    }

    .btn-reset:hover {
      background: linear-gradient(135deg, #fdcb6e, #ffeaa7);
      border-color: #fdcb6e;
      color: white;
      transform: translateY(-2px);
      box-shadow: 0 4px 16px rgba(253, 203, 110, 0.3);
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

    /* User Avatar Preview */
    .user-avatar-preview {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      background: var(--gradient-primary);
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-weight: 700;
      font-size: 2.5rem;
      font-family: 'Quicksand', sans-serif;
      box-shadow: 0 4px 16px rgba(255, 107, 157, 0.25);
      margin: 0 auto 1rem;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .user-hero {
        padding: 1.5rem;
      }

      .page-title {
        font-size: 1.5rem;
      }

      .form-card .card-body {
        padding: 1.5rem !important;
      }

      .input-group-text {
        padding: 10px 12px;
        font-size: 1rem;
      }

      .input-group .form-control,
      .input-group .form-select {
        padding: 10px 12px;
        font-size: 0.9rem;
      }

      .role-options {
        flex-direction: column;
      }

      .btn-back,
      .btn-reset,
      .btn-submit {
        padding: 10px 20px;
        font-size: 0.9rem;
      }
    }

    @media (max-width: 576px) {
      .user-hero .d-flex {
        flex-direction: column;
        align-items: flex-start !important;
      }

      .d-flex.gap-3 {
        width: 100%;
      }

      .btn-back,
      .btn-reset,
      .btn-submit {
        width: 100%;
        justify-content: center;
      }

      .d-flex.gap-2 {
        flex-direction: column;
        width: 100%;
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

    .form-card,
    .section-card {
      animation: fadeIn 0.5s ease-out;
    }

    .section-card:nth-child(2) {
      animation-delay: 0.1s;
    }

    .section-card:nth-child(3) {
      animation-delay: 0.2s;
    }

    /* Select Dropdown Enhancement */
    .form-select {
      background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23ff6b9d' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
      background-repeat: no-repeat;
      background-position: right 15px center;
      background-size: 16px 12px;
    }
  </style>
