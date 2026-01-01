<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <style>
    /* ========================================
       PERFORMANCE SECTION - Design System Compliant
       ======================================== */
    .time-range-selector {
      display: flex;
      gap: 0.5rem;
      background: rgba(255, 107, 157, 0.05);
      padding: 4px;
      border-radius: 25px;
    }

    .btn-time {
      padding: 6px 16px;
      border: none;
      border-radius: 20px;
      font-size: 0.85rem;
      font-weight: 600;
      color: #636e72;
      background: transparent;
      transition: all 0.3s ease;
      font-family: 'Inter', sans-serif;
    }

    .btn-time:hover {
      background: rgba(255, 107, 157, 0.1);
      color: #ff6b9d;
    }

    .btn-time.active {
      background: linear-gradient(135deg, #ff6b9d, #ffb6c1);
      color: #ffffff;
      box-shadow: 0 2px 8px rgba(255, 107, 157, 0.25);
    }

    .performance-stats {
      margin-bottom: 1.75rem;
    }

    .performance-item {
      margin-bottom: 1.5rem;
    }

    .performance-item:last-child {
      margin-bottom: 0;
    }

    .performance-header {
      display: flex;
      align-items: center;
      gap: 1rem;
      margin-bottom: 0.75rem;
    }

    .performance-icon {
      width: 52px;
      height: 52px;
      border-radius: 15px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.25rem;
      color: #ffffff;
      flex-shrink: 0;
      box-shadow: 0 4px 16px rgba(255, 107, 157, 0.15);
    }

    .icon-success {
      background: linear-gradient(135deg, #00b894, #55efc4);
    }

    .icon-shipping {
      background: linear-gradient(135deg, #74b9ff, #a29bfe);
    }

    .icon-warning {
      background: linear-gradient(135deg, #fdcb6e, #ffeaa7);
    }

    .performance-info {
      flex: 1;
    }

    .performance-label {
      font-weight: 600;
      color: #2d3436;
      font-size: 1rem;
      margin-bottom: 0.25rem;
      font-family: 'Quicksand', sans-serif;
    }

    .performance-count {
      font-size: 0.85rem;
      color: #636e72;
      font-family: 'Inter', sans-serif;
    }

    .performance-percent {
      font-size: 1.5rem;
      font-weight: 700;
      color: #ff6b9d;
      font-family: 'Quicksand', sans-serif;
    }

    .performance-progress {
      height: 10px;
      border-radius: 10px;
      background: rgba(255, 107, 157, 0.1);
      overflow: hidden;
    }

    .performance-progress .progress-bar {
      border-radius: 10px;
      transition: width 0.6s ease;
    }

    .performance-summary {
      display: flex;
      justify-content: space-around;
      align-items: center;
      padding: 1.5rem;
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
      border-radius: 15px;
      gap: 1rem;
    }

    .summary-item {
      display: flex;
      align-items: center;
      gap: 0.75rem;
    }

    .summary-item i {
      font-size: 2rem;
    }

    .summary-value {
      font-size: 1.5rem;
      font-weight: 700;
      color: #2d3436;
      font-family: 'Quicksand', sans-serif;
      line-height: 1.2;
    }

    .summary-label {
      font-size: 0.8rem;
      color: #636e72;
      margin-top: 0.25rem;
      font-family: 'Inter', sans-serif;
    }

    .summary-divider {
      width: 2px;
      height: 50px;
      background: linear-gradient(to bottom, transparent, rgba(255, 107, 157, 0.2), transparent);
    }

    /* ========================================
       RESPONSIVE DESIGN
       ======================================== */
    @media (max-width: 1200px) {
      .performance-summary {
        padding: 1.25rem;
      }

      .summary-item i {
        font-size: 1.75rem;
      }

      .summary-value {
        font-size: 1.35rem;
      }
    }

    @media (max-width: 992px) {
      .performance-summary {
        flex-direction: column;
        gap: 1.25rem;
      }

      .summary-divider {
        width: 80%;
        height: 2px;
        background: linear-gradient(to right, transparent, rgba(255, 107, 157, 0.2), transparent);
      }

      .summary-item {
        width: 100%;
        justify-content: center;
      }
    }

    @media (max-width: 768px) {
      .time-range-selector {
        width: 100%;
      }

      .btn-time {
        flex: 1;
        font-size: 0.8rem;
        padding: 5px 12px;
      }

      .performance-icon {
        width: 44px;
        height: 44px;
        font-size: 1.1rem;
      }

      .performance-label {
        font-size: 0.9rem;
      }

      .performance-count {
        font-size: 0.8rem;
      }

      .performance-percent {
        font-size: 1.3rem;
      }

      .performance-progress {
        height: 8px;
      }

      .performance-summary {
        padding: 1rem;
      }

      .summary-value {
        font-size: 1.25rem;
      }
    }

    @media (max-width: 576px) {
      .performance-header {
        gap: 0.75rem;
      }

      .performance-icon {
        width: 40px;
        height: 40px;
        font-size: 1rem;
      }

      .performance-label {
        font-size: 0.85rem;
      }

      .summary-item {
        gap: 0.5rem;
      }

      .summary-item i {
        font-size: 1.5rem;
      }

      .summary-value {
        font-size: 1.1rem;
      }

      .summary-label {
        font-size: 0.75rem;
      }
    }
  </style>
