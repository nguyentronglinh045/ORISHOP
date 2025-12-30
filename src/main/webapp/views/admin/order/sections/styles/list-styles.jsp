<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <style>
    /* ===== ORDER LIST STYLES ===== */

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

    /* Order Card */
    .order-card {
      border: none;
      border-radius: 15px;
      box-shadow: var(--shadow-md);
      overflow: hidden;
      transition: var(--transition-base);
    }

    .order-card .card-header {
      background: var(--gradient-primary);
      color: white;
      padding: 1.25rem 1.5rem;
      border: none;
    }

    .order-card .card-header h5 {
      font-family: 'Quicksand', sans-serif;
    }

    .order-card .card-header .badge {
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

    /* Order Table */
    .order-table {
      width: 100%;
    }

    .order-table thead {
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
    }

    .order-table thead th {
      color: var(--dark);
      font-weight: 700;
      text-transform: uppercase;
      font-size: 0.85rem;
      letter-spacing: 0.5px;
      padding: 1rem;
      border: none;
      font-family: 'Quicksand', sans-serif;
    }

    .order-table tbody tr {
      transition: var(--transition-base);
      border-bottom: 1px solid #f0f0f0;
    }

    .order-table tbody tr:hover {
      background-color: #fff5f8;
      transform: scale(1.01);
      box-shadow: var(--shadow-sm);
    }

    .order-table tbody td {
      padding: 1rem;
      vertical-align: middle;
    }

    /* Order ID */
    .order-id {
      font-weight: 700;
      color: var(--primary);
      font-size: 1rem;
      font-family: 'Quicksand', sans-serif;
    }

    /* Customer Info */
    .customer-info {
      display: flex;
      align-items: center;
      gap: 12px;
    }

    .customer-avatar {
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

    .customer-details {
      display: flex;
      flex-direction: column;
    }

    .customer-name {
      font-weight: 600;
      color: var(--dark);
      font-size: 0.95rem;
    }

    .customer-phone {
      font-size: 0.85rem;
      color: var(--dark-light);
    }

    /* Order Date */
    .order-date {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .order-date-day {
      font-weight: 700;
      color: var(--dark);
      font-size: 1rem;
    }

    .order-date-time {
      font-size: 0.8rem;
      color: var(--dark-light);
    }

    /* Amount Display */
    .amount-display {
      font-weight: 700;
      color: var(--primary);
      font-size: 1.05rem;
      font-family: 'Quicksand', sans-serif;
    }

    /* Order Status Badges */
    .status-badge {
      padding: 8px 16px;
      border-radius: 50px;
      font-size: 0.8rem;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      gap: 6px;
    }

    .status-badge.pending {
      background: linear-gradient(135deg, #fdcb6e, #ffeaa7);
      color: #d63031;
    }

    .status-badge.shipping {
      background: linear-gradient(135deg, #74b9ff, #a29bfe);
      color: white;
    }

    .status-badge.delivered {
      background: linear-gradient(135deg, #00b894, #55efc4);
      color: white;
    }

    .status-badge.cancelled {
      background: linear-gradient(135deg, #ff7675, #fd79a8);
      color: white;
    }

    /* Action Buttons */
    .action-buttons {
      display: flex;
      gap: 0.5rem;
      justify-content: center;
      align-items: center;
    }

    .btn-view,
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

    .btn-view {
      background: linear-gradient(135deg, #00b894, #55efc4);
      color: white;
      box-shadow: 0 2px 8px rgba(0, 184, 148, 0.2);
    }

    .btn-view:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 16px rgba(0, 184, 148, 0.3);
      color: white;
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
      .order-hero {
        padding: 1.5rem;
      }

      .page-title {
        font-size: 1.5rem;
      }

      .order-table thead th {
        font-size: 0.75rem;
        padding: 0.75rem 0.5rem;
      }

      .order-table tbody td {
        padding: 0.75rem 0.5rem;
        font-size: 0.9rem;
      }

      .customer-avatar {
        width: 35px;
        height: 35px;
        font-size: 0.85rem;
      }

      .customer-info {
        gap: 8px;
      }

      .action-buttons {
        flex-direction: column;
        gap: 0.25rem;
      }

      .btn-view,
      .btn-edit,
      .btn-delete {
        width: 32px;
        height: 32px;
        font-size: 0.85rem;
      }
    }

    @media (max-width: 576px) {
      .order-hero .d-flex {
        flex-direction: column;
        align-items: flex-start !important;
      }

      .table-responsive {
        font-size: 0.85rem;
      }

      .order-table {
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

    .order-row {
      animation: fadeInUp 0.3s ease-out;
      animation-fill-mode: both;
    }

    .order-row:nth-child(1) {
      animation-delay: 0.05s;
    }

    .order-row:nth-child(2) {
      animation-delay: 0.1s;
    }

    .order-row:nth-child(3) {
      animation-delay: 0.15s;
    }

    .order-row:nth-child(4) {
      animation-delay: 0.2s;
    }

    .order-row:nth-child(5) {
      animation-delay: 0.25s;
    }

    .order-row:nth-child(6) {
      animation-delay: 0.3s;
    }

    .order-row:nth-child(7) {
      animation-delay: 0.35s;
    }

    .order-row:nth-child(8) {
      animation-delay: 0.4s;
    }

    .order-row:nth-child(9) {
      animation-delay: 0.45s;
    }

    .order-row:nth-child(10) {
      animation-delay: 0.5s;
    }
  </style>
