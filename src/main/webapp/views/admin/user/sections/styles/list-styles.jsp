<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <style>
    /* ===== USER LIST STYLES ===== */

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

    /* User Card */
    .user-card {
      border: none;
      border-radius: 15px;
      box-shadow: var(--shadow-md);
      overflow: hidden;
      transition: var(--transition-base);
    }

    .user-card .card-header {
      background: var(--gradient-primary);
      color: white;
      padding: 1.25rem 1.5rem;
      border: none;
    }

    .user-card .card-header h5 {
      font-family: 'Quicksand', sans-serif;
    }

    .user-card .card-header .badge {
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

    /* User Table */
    .user-table {
      width: 100%;
    }

    .user-table thead {
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
    }

    .user-table thead th {
      color: var(--dark);
      font-weight: 700;
      text-transform: uppercase;
      font-size: 0.85rem;
      letter-spacing: 0.5px;
      padding: 1rem;
      border: none;
      font-family: 'Quicksand', sans-serif;
    }

    .user-table tbody tr {
      transition: var(--transition-base);
      border-bottom: 1px solid #f0f0f0;
    }

    .user-table tbody tr:hover {
      background-color: #fff5f8;
      transform: scale(1.01);
      box-shadow: var(--shadow-sm);
    }

    .user-table tbody td {
      padding: 1rem;
      vertical-align: middle;
    }

    /* User Info */
    .user-info {
      display: flex;
      align-items: center;
      gap: 12px;
    }

    .user-avatar {
      width: 45px;
      height: 45px;
      border-radius: 50%;
      background: var(--gradient-primary);
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-weight: 700;
      font-size: 1rem;
      font-family: 'Quicksand', sans-serif;
      box-shadow: 0 2px 8px rgba(255, 107, 157, 0.2);
    }

    .user-details {
      display: flex;
      flex-direction: column;
    }

    .user-fullname {
      font-weight: 600;
      color: var(--dark);
      font-size: 0.95rem;
    }

    .user-username {
      font-size: 0.85rem;
      color: var(--dark-light);
    }

    /* Contact Info */
    .contact-info {
      display: flex;
      flex-direction: column;
      gap: 4px;
    }

    .contact-item {
      display: flex;
      align-items: center;
      gap: 6px;
      font-size: 0.9rem;
      color: var(--dark);
    }

    .contact-item i {
      color: var(--primary);
      width: 16px;
    }

    /* Role Badge */
    .role-badge {
      padding: 8px 16px;
      border-radius: 50px;
      font-size: 0.8rem;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      gap: 6px;
    }

    .role-badge.admin {
      background: linear-gradient(135deg, #ff7675, #fd79a8);
      color: white;
    }

    .role-badge.user {
      background: linear-gradient(135deg, #74b9ff, #a29bfe);
      color: white;
    }

    /* Date Display */
    .date-display {
      font-size: 0.9rem;
      color: var(--dark);
    }

    /* Action Buttons */
    .action-buttons {
      display: flex;
      gap: 0.5rem;
      justify-content: center;
      align-items: center;
    }

    .btn-edit,
    .btn-delete {
      width: 36px;
      height: 36px;
      border-radius: 8px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      border: none;
      transition: var(--transition-base);
      font-size: 0.9rem;
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

    /* Responsive Design */
    @media (max-width: 768px) {
      .user-hero {
        padding: 1.5rem;
      }

      .page-title {
        font-size: 1.5rem;
      }

      .btn-add {
        padding: 10px 20px;
        font-size: 0.9rem;
      }

      .user-table thead th {
        font-size: 0.75rem;
        padding: 0.75rem 0.5rem;
      }

      .user-table tbody td {
        padding: 0.75rem 0.5rem;
        font-size: 0.9rem;
      }

      .user-avatar {
        width: 35px;
        height: 35px;
        font-size: 0.85rem;
      }

      .user-info {
        gap: 8px;
      }

      .action-buttons {
        flex-direction: column;
        gap: 0.25rem;
      }

      .btn-edit,
      .btn-delete {
        width: 32px;
        height: 32px;
        font-size: 0.85rem;
      }
    }

    @media (max-width: 576px) {
      .user-hero .d-flex {
        flex-direction: column;
        align-items: flex-start !important;
      }

      .btn-add {
        width: 100%;
        justify-content: center;
      }

      .table-responsive {
        font-size: 0.85rem;
      }

      .user-table {
        min-width: 800px;
      }
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

    .user-row {
      animation: fadeInUp 0.3s ease-out;
      animation-fill-mode: both;
    }

    .user-row:nth-child(1) {
      animation-delay: 0.05s;
    }

    .user-row:nth-child(2) {
      animation-delay: 0.1s;
    }

    .user-row:nth-child(3) {
      animation-delay: 0.15s;
    }

    .user-row:nth-child(4) {
      animation-delay: 0.2s;
    }

    .user-row:nth-child(5) {
      animation-delay: 0.25s;
    }

    .user-row:nth-child(6) {
      animation-delay: 0.3s;
    }

    .user-row:nth-child(7) {
      animation-delay: 0.35s;
    }

    .user-row:nth-child(8) {
      animation-delay: 0.4s;
    }

    .user-row:nth-child(9) {
      animation-delay: 0.45s;
    }

    .user-row:nth-child(10) {
      animation-delay: 0.5s;
    }
  </style>
