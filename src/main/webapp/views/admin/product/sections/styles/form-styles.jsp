<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <style>
    /* ===== PRODUCT FORM STYLES (ADD/EDIT) ===== */

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

    /* Standalone Input (without icon) */
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

    /* Textarea */
    textarea.form-control {
      border: 2px solid var(--primary);
      border-radius: 15px;
      padding: 12px 15px;
      font-size: 0.95rem;
      min-height: 120px;
      resize: vertical;
    }

    textarea.form-control:focus {
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

    /* File Upload */
    .file-upload-wrapper {
      position: relative;
    }

    .file-input {
      opacity: 0;
      position: absolute;
      z-index: -1;
    }

    .file-upload-label {
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column;
      padding: 3rem 2rem;
      border: 2px dashed #e9ecef;
      border-radius: 15px;
      background: #fff5f8;
      cursor: pointer;
      transition: all 0.3s ease;
      text-align: center;
    }

    .file-upload-label:hover {
      border-color: var(--primary);
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
      transform: translateY(-2px);
    }

    .file-upload-label i {
      color: var(--primary);
      font-size: 2.5rem;
      margin-bottom: 0.75rem;
    }

    .file-label-text {
      color: var(--dark);
      font-weight: 600;
      font-size: 1rem;
    }

    .file-label-hint {
      color: var(--dark-light);
      font-size: 0.85rem;
      margin-top: 0.5rem;
    }

    .file-input:focus+.file-upload-label {
      border-color: var(--primary);
      box-shadow: 0 0 0 0.2rem rgba(255, 107, 157, 0.15);
    }

    /* Image Preview */
    .image-preview {
      position: relative;
      display: inline-block;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: var(--shadow-md);
    }

    .image-preview img {
      max-width: 200px;
      max-height: 200px;
      border-radius: 15px;
      display: block;
      object-fit: cover;
    }

    .btn-remove-image {
      position: absolute;
      top: 10px;
      right: 10px;
      width: 32px;
      height: 32px;
      border-radius: 50%;
      background: rgba(231, 76, 60, 0.9);
      border: none;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .btn-remove-image:hover {
      background: #e74c3c;
      transform: scale(1.1);
    }

    /* Current Image Display */
    .current-image {
      display: inline-block;
      padding: 10px;
      background: #fff5f8;
      border-radius: 15px;
      border: 2px solid #ffd1dc;
    }

    .current-image img {
      width: 120px;
      height: 120px;
      border-radius: 12px;
      object-fit: cover;
    }

    /* Form Divider */
    .form-divider {
      border: none;
      height: 2px;
      background: linear-gradient(90deg, transparent, #ffd1dc, transparent);
      margin: 2rem 0;
    }

    /* Price Input Group */
    .price-input-group .input-group-text {
      background: var(--gradient-primary);
      color: white;
      border: none;
      font-weight: 600;
    }

    .price-input-group .form-control {
      border: 2px solid var(--primary);
      border-left: none;
    }

    /* Status Toggle */
    .status-toggle {
      display: flex;
      gap: 1rem;
    }

    .status-option {
      flex: 1;
    }

    .status-option input[type="radio"] {
      display: none;
    }

    .status-option label {
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 12px 20px;
      border: 2px solid #e9ecef;
      border-radius: 50px;
      cursor: pointer;
      transition: all 0.3s ease;
      font-weight: 600;
    }

    .status-option label i {
      margin-right: 8px;
    }

    .status-option input[type="radio"]:checked+label.status-active {
      background: linear-gradient(135deg, #00b894, #55efc4);
      border-color: #00b894;
      color: white;
    }

    .status-option input[type="radio"]:checked+label.status-inactive {
      background: linear-gradient(135deg, #636e72, #b2bec3);
      border-color: #636e72;
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

    /* Responsive Design */
    @media (max-width: 768px) {
      .product-hero {
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

      .file-upload-label {
        padding: 2rem 1rem;
      }

      .file-upload-label i {
        font-size: 1.5rem;
      }

      .btn-back,
      .btn-reset,
      .btn-submit {
        padding: 10px 20px;
        font-size: 0.9rem;
      }

      .status-toggle {
        flex-direction: column;
      }
    }

    @media (max-width: 576px) {
      .product-hero .d-flex {
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

      .image-preview img {
        max-width: 150px;
        max-height: 150px;
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

    .form-card {
      animation: fadeIn 0.5s ease-out;
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

    /* Select Dropdown Enhancement */
    .form-select {
      background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23ff6b9d' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
      background-repeat: no-repeat;
      background-position: right 15px center;
      background-size: 16px 12px;
    }
  </style>