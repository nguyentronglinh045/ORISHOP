<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <style>
    /* ========================================
       STAT CARDS STYLES - Design System Compliant
       ======================================== */
    .stat-card {
      background: #ffffff;
      border-radius: 15px;
      box-shadow: 0 2px 8px rgba(255, 107, 157, 0.1);
      transition: all 0.3s ease;
      overflow: hidden;
      height: 100%;
      border: none;
    }

    .stat-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 32px rgba(255, 107, 157, 0.2);
    }

    .stat-card-body {
      padding: 1.5rem;
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      gap: 1rem;
    }

    .stat-info {
      flex: 1;
    }

    .stat-label {
      font-size: 0.85rem;
      color: #636e72;
      margin-bottom: 0.5rem;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      font-family: 'Inter', sans-serif;
    }

    .stat-value {
      font-size: 2rem;
      font-weight: 700;
      color: #2d3436;
      margin: 0;
      font-family: 'Quicksand', sans-serif;
      line-height: 1.2;
    }

    .stat-trend {
      display: inline-flex;
      align-items: center;
      gap: 0.4rem;
      font-size: 0.8rem;
      font-weight: 600;
      padding: 6px 14px;
      border-radius: 50px;
      margin-top: 0.75rem;
      font-family: 'Inter', sans-serif;
    }

    .trend-up {
      background: rgba(0, 184, 148, 0.1);
      color: #00b894;
    }

    .trend-pending {
      background: rgba(116, 185, 255, 0.1);
      color: #74b9ff;
    }

    .trend-new {
      background: rgba(255, 107, 157, 0.1);
      color: #ff6b9d;
    }

    .trend-warning {
      background: rgba(253, 203, 110, 0.15);
      color: #fdcb6e;
    }

    .stat-icon {
      width: 64px;
      height: 64px;
      border-radius: 15px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.75rem;
      color: #ffffff;
      flex-shrink: 0;
      box-shadow: 0 4px 16px rgba(255, 107, 157, 0.15);
    }

    .icon-revenue {
      background: linear-gradient(135deg, #ff6b9d, #ffb6c1);
    }

    .icon-orders {
      background: linear-gradient(135deg, #74b9ff, #a29bfe);
    }

    .icon-customers {
      background: linear-gradient(135deg, #a29bfe, #dfe6e9);
    }

    .icon-products {
      background: linear-gradient(135deg, #fdcb6e, #ffeaa7);
    }

    .stat-footer {
      padding: 0.75rem 1.5rem;
      background: linear-gradient(135deg, #fff5f8, #ffd1dc);
      border-top: none;
      font-size: 0.85rem;
      color: #636e72;
      display: flex;
      align-items: center;
      font-family: 'Inter', sans-serif;
      font-weight: 500;
    }

    .stat-footer i {
      color: #ff6b9d;
    }

    /* ========================================
       RESPONSIVE DESIGN
       ======================================== */
    @media (max-width: 1200px) {
      .stat-value {
        font-size: 1.75rem;
      }

      .stat-icon {
        width: 58px;
        height: 58px;
        font-size: 1.5rem;
      }
    }

    @media (max-width: 768px) {
      .stat-card-body {
        padding: 1.25rem;
      }

      .stat-value {
        font-size: 1.5rem;
      }

      .stat-label {
        font-size: 0.75rem;
      }

      .stat-icon {
        width: 52px;
        height: 52px;
        font-size: 1.3rem;
      }

      .stat-trend {
        font-size: 0.75rem;
        padding: 5px 12px;
      }

      .stat-footer {
        padding: 0.65rem 1.25rem;
        font-size: 0.8rem;
      }
    }

    @media (max-width: 576px) {
      .stat-card-body {
        flex-direction: column;
        align-items: center;
        text-align: center;
        padding: 1.25rem 1rem;
        gap: 0.75rem;
      }

      .stat-info {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
      }

      .stat-icon {
        width: 56px;
        height: 56px;
        font-size: 1.4rem;
        order: -1;
        margin-bottom: 0.5rem;
      }

      .stat-value {
        font-size: 1.5rem;
      }

      .stat-label {
        font-size: 0.75rem;
      }

      .stat-trend {
        margin-top: 0.5rem;
      }

      .stat-footer {
        justify-content: center;
        padding: 0.75rem 1rem;
      }
    }
  </style>