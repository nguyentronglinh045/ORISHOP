<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <style>
    /* ========================================
       QUICK ACTIONS SECTION - Design System Compliant
       ======================================== */
    .quick-action-btn {
      display: flex;
      align-items: center;
      gap: 1rem;
      padding: 1.25rem;
      background: #ffffff;
      border: 2px solid rgba(255, 107, 157, 0.1);
      border-radius: 15px;
      text-decoration: none;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
      box-shadow: 0 2px 8px rgba(255, 107, 157, 0.05);
    }

    .quick-action-btn::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255, 107, 157, 0.08), transparent);
      transition: left 0.5s ease;
    }

    .quick-action-btn:hover {
      border-color: #ff6b9d;
      background: #fff5f8;
      transform: translateY(-3px);
      box-shadow: 0 8px 32px rgba(255, 107, 157, 0.2);
    }

    .quick-action-btn:hover::before {
      left: 100%;
    }

    .action-icon {
      width: 56px;
      height: 56px;
      border-radius: 15px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.5rem;
      color: #ffffff;
      flex-shrink: 0;
      box-shadow: 0 4px 16px rgba(255, 107, 157, 0.15);
      transition: transform 0.3s ease;
    }

    .quick-action-btn:hover .action-icon {
      transform: scale(1.1) rotate(5deg);
    }

    .icon-add-product {
      background: linear-gradient(135deg, #ff6b9d, #ffb6c1);
    }

    .icon-track-order {
      background: linear-gradient(135deg, #74b9ff, #a29bfe);
    }

    .icon-manage-category {
      background: linear-gradient(135deg, #00b894, #55efc4);
    }

    .icon-manage-users {
      background: linear-gradient(135deg, #a29bfe, #dfe6e9);
    }

    .icon-reports {
      background: linear-gradient(135deg, #fdcb6e, #ffeaa7);
    }

    .icon-settings {
      background: linear-gradient(135deg, #636e72, #b2bec3);
    }

    .action-content {
      flex: 1;
      position: relative;
      z-index: 1;
    }

    .action-title {
      font-weight: 700;
      font-size: 1rem;
      color: #2d3436;
      margin-bottom: 0.25rem;
      font-family: 'Quicksand', sans-serif;
    }

    .action-desc {
      font-size: 0.85rem;
      color: #636e72;
      font-family: 'Inter', sans-serif;
    }

    .action-arrow {
      width: 40px;
      height: 40px;
      border-radius: 50px;
      background: rgba(255, 107, 157, 0.1);
      display: flex;
      align-items: center;
      justify-content: center;
      color: #ff6b9d;
      font-size: 1rem;
      flex-shrink: 0;
      transition: all 0.3s ease;
      position: relative;
      z-index: 1;
    }

    .quick-action-btn:hover .action-arrow {
      background: linear-gradient(135deg, #ff6b9d, #ffb6c1);
      color: #ffffff;
      transform: translateX(4px);
      box-shadow: 0 4px 12px rgba(255, 107, 157, 0.3);
    }

    /* ========================================
       RESPONSIVE DESIGN
       ======================================== */
    @media (max-width: 768px) {
      .quick-action-btn {
        padding: 1rem;
      }

      .action-icon {
        width: 50px;
        height: 50px;
        font-size: 1.3rem;
      }

      .action-title {
        font-size: 0.95rem;
      }

      .action-desc {
        font-size: 0.8rem;
      }

      .action-arrow {
        width: 36px;
        height: 36px;
        font-size: 0.9rem;
      }
    }

    @media (max-width: 576px) {
      .quick-action-btn {
        padding: 0.85rem;
        gap: 0.75rem;
      }

      .action-icon {
        width: 44px;
        height: 44px;
        font-size: 1.2rem;
      }

      .action-title {
        font-size: 0.9rem;
      }

      .action-desc {
        font-size: 0.75rem;
      }

      .action-arrow {
        display: none;
      }
    }
  </style>
