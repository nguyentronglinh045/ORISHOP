<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <style>
    /* ========================================
       DASHBOARD CARD BASE - Design System Compliant
       ======================================== */
    .dashboard-card {
      background: #ffffff;
      border-radius: 15px;
      box-shadow: 0 2px 8px rgba(255, 107, 157, 0.1);
      overflow: hidden;
      border: none;
      margin-bottom: 1.5rem;
      transition: all 0.3s ease;
    }

    .dashboard-card:hover {
      box-shadow: 0 4px 16px rgba(255, 107, 157, 0.15);
    }

    .card-header-custom {
      padding: 1.5rem;
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
      border-bottom: none;
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 1rem;
      flex-wrap: wrap;
    }

    .header-left {
      flex: 1;
      min-width: 200px;
    }

    .card-title-custom {
      font-size: 1.25rem;
      font-weight: 700;
      color: #2d3436;
      margin: 0;
      font-family: 'Quicksand', sans-serif;
      display: flex;
      align-items: center;
    }

    .card-title-custom i {
      color: #ff6b9d;
    }

    .card-subtitle-custom {
      font-size: 0.85rem;
      color: #636e72;
      margin: 0.5rem 0 0;
      font-family: 'Inter', sans-serif;
    }

    .card-body-custom {
      padding: 1.5rem;
    }

    /* ========================================
       ORDERS TABLE
       ======================================== */
    .table-responsive {
      border-radius: 0;
      margin: 0;
    }

    .table {
      margin: 0;
      font-family: 'Inter', sans-serif;
    }

    .table-header-custom {
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
      border-bottom: none;
    }

    .table-header-custom th {
      font-weight: 700;
      font-size: 0.85rem;
      color: #2d3436;
      padding: 1rem 1.25rem;
      border: none;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      font-family: 'Quicksand', sans-serif;
    }

    .table tbody td {
      padding: 1rem 1.25rem;
      vertical-align: middle;
      border-color: rgba(255, 107, 157, 0.08);
      color: #2d3436;
    }

    .table tbody tr {
      transition: all 0.3s ease;
    }

    .table tbody tr:hover {
      background: #fff5f8;
      transform: scale(1.01);
      box-shadow: 0 2px 8px rgba(255, 107, 157, 0.1);
    }

    .order-id {
      color: #ff6b9d;
      font-weight: 700;
      font-family: 'Courier New', monospace;
      font-size: 0.95rem;
    }

    .customer-info {
      display: flex;
      align-items: center;
      gap: 0.75rem;
    }

    .customer-avatar {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background: linear-gradient(135deg, #ff6b9d, #ffb6c1);
      color: #ffffff;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: 700;
      font-size: 0.85rem;
      flex-shrink: 0;
      box-shadow: 0 2px 8px rgba(255, 107, 157, 0.2);
      font-family: 'Quicksand', sans-serif;
    }

    .customer-info span {
      font-weight: 500;
      color: #2d3436;
    }

    .price-text {
      color: #ff6b9d;
      font-weight: 700;
      font-size: 1rem;
      font-family: 'Quicksand', sans-serif;
    }

    .status-badge {
      display: inline-flex;
      align-items: center;
      gap: 0.4rem;
      padding: 6px 15px;
      border-radius: 50px;
      font-size: 0.8rem;
      font-weight: 600;
      white-space: nowrap;
    }

    .status-pending {
      background: rgba(253, 203, 110, 0.15);
      color: #fdcb6e;
    }

    .status-shipping {
      background: rgba(116, 185, 255, 0.15);
      color: #74b9ff;
    }

    .status-completed {
      background: rgba(0, 184, 148, 0.1);
      color: #00b894;
    }

    .status-returned {
      background: rgba(231, 76, 60, 0.1);
      color: #e74c3c;
    }

    .btn-action-view {
      background: rgba(255, 107, 157, 0.1);
      color: #ff6b9d;
      border: none;
      width: 36px;
      height: 36px;
      border-radius: 10px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      transition: all 0.3s ease;
    }

    .btn-action-view:hover {
      background: linear-gradient(135deg, #ff6b9d, #ffb6c1);
      color: #ffffff;
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(255, 107, 157, 0.3);
    }

    /* ========================================
       RESPONSIVE DESIGN
       ======================================== */
    @media (max-width: 992px) {
      .card-header-custom {
        flex-direction: column;
        align-items: flex-start;
      }
    }

    @media (max-width: 768px) {

      .card-header-custom,
      .card-body-custom {
        padding: 1.25rem;
      }

      .card-title-custom {
        font-size: 1.1rem;
      }

      .table-header-custom th,
      .table tbody td {
        padding: 0.75rem 0.85rem;
        font-size: 0.8rem;
      }

      .customer-avatar {
        width: 36px;
        height: 36px;
        font-size: 0.75rem;
      }

      .status-badge {
        font-size: 0.75rem;
        padding: 5px 12px;
      }

      .price-text {
        font-size: 0.9rem;
      }
    }

    @media (max-width: 576px) {

      .card-header-custom,
      .card-body-custom {
        padding: 1rem;
      }

      .card-title-custom {
        font-size: 1rem;
      }

      .card-subtitle-custom {
        font-size: 0.75rem;
      }

      /* Mobile: Stack table layout */
      .table-responsive {
        overflow-x: auto;
        -webkit-overflow-scrolling: touch;
      }

      .table {
        min-width: 650px;
      }

      .table-header-custom th,
      .table tbody td {
        padding: 0.75rem 0.5rem;
        font-size: 0.75rem;
        white-space: nowrap;
      }

      .customer-info {
        gap: 0.5rem;
      }

      .customer-info span {
        font-size: 0.75rem;
      }

      .customer-avatar {
        width: 32px;
        height: 32px;
        font-size: 0.7rem;
      }

      .order-id {
        font-size: 0.8rem;
      }

      .price-text {
        font-size: 0.85rem;
      }

      .status-badge {
        font-size: 0.7rem;
        padding: 4px 10px;
      }

      .btn-action-view {
        width: 32px;
        height: 32px;
        font-size: 0.75rem;
      }

      /* Scroll hint */
      .table-responsive::after {
        content: '';
        position: absolute;
        right: 0;
        top: 0;
        bottom: 0;
        width: 30px;
        background: linear-gradient(to right, transparent, rgba(255, 255, 255, 0.9));
        pointer-events: none;
      }
    }

    @media (max-width: 480px) {
      .table {
        min-width: 600px;
      }

      .table-header-custom th,
      .table tbody td {
        padding: 0.65rem 0.4rem;
        font-size: 0.7rem;
      }

      .customer-avatar {
        width: 28px;
        height: 28px;
        font-size: 0.65rem;
      }

      .btn-action-view {
        width: 28px;
        height: 28px;
        padding: 0;
      }
    }
  </style>
