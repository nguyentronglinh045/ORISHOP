<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <style>
    /* ========================================
       DASHBOARD HERO SECTION - Design System Compliant
       ======================================== */
    .dashboard-hero {
      background: linear-gradient(135deg, #ff6b9d, #ffb6c1);
      border-radius: 15px;
      padding: 2rem;
      margin-bottom: 1.75rem;
      box-shadow: 0 8px 32px rgba(255, 107, 157, 0.2);
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 1.5rem;
      position: relative;
      overflow: hidden;
    }

    .dashboard-hero::before {
      content: '';
      position: absolute;
      top: -50%;
      right: -10%;
      width: 400px;
      height: 400px;
      background: radial-gradient(circle, rgba(255, 255, 255, 0.15) 0%, transparent 70%);
      border-radius: 50%;
    }

    .hero-content {
      display: flex;
      align-items: center;
      gap: 1.25rem;
      position: relative;
      z-index: 2;
    }

    .hero-icon {
      width: 70px;
      height: 70px;
      background: rgba(255, 255, 255, 0.2);
      backdrop-filter: blur(10px);
      border-radius: 15px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 2rem;
      color: #ffffff;
      flex-shrink: 0;
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
    }

    .hero-text {
      color: #ffffff;
    }

    .hero-title {
      font-family: 'Quicksand', sans-serif;
      font-size: 2.25rem;
      font-weight: 700;
      margin: 0;
      letter-spacing: -0.5px;
    }

    .hero-subtitle {
      font-size: 1rem;
      margin: 0.5rem 0 0.75rem;
      opacity: 0.95;
      font-weight: 400;
      font-family: 'Inter', sans-serif;
    }

    .hero-breadcrumb {
      background: transparent;
      margin: 0;
      padding: 0;
      font-size: 0.9rem;
      font-family: 'Inter', sans-serif;
    }

    .hero-breadcrumb .breadcrumb-item {
      color: rgba(255, 255, 255, 0.9);
    }

    .hero-breadcrumb .breadcrumb-item.active {
      color: #ffffff;
      font-weight: 600;
    }

    .hero-breadcrumb .breadcrumb-item+.breadcrumb-item::before {
      color: rgba(255, 255, 255, 0.7);
    }

    .hero-badge {
      display: flex;
      align-items: center;
      gap: 1rem;
      position: relative;
      z-index: 2;
    }

    .brand-info {
      text-align: right;
      color: #ffffff;
    }

    .brand-name {
      font-size: 1.1rem;
      font-weight: 700;
      margin: 0;
      font-family: 'Quicksand', sans-serif;
    }

    .brand-desc {
      font-size: 0.85rem;
      margin: 0.25rem 0 0;
      opacity: 0.9;
      font-family: 'Inter', sans-serif;
    }

    .version-badge {
      background: rgba(255, 255, 255, 0.25);
      backdrop-filter: blur(10px);
      color: #ffffff;
      padding: 10px 20px;
      border-radius: 50px;
      font-weight: 600;
      font-size: 0.9rem;
      border: 2px solid rgba(255, 255, 255, 0.3);
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
      font-family: 'Inter', sans-serif;
    }

    /* ========================================
       RESPONSIVE DESIGN
       ======================================== */
    @media (max-width: 992px) {
      .dashboard-hero {
        flex-direction: column;
        text-align: center;
      }

      .hero-content {
        flex-direction: column;
        width: 100%;
      }

      .hero-badge {
        flex-direction: column;
        width: 100%;
      }

      .brand-info {
        text-align: center;
      }
    }

    @media (max-width: 768px) {
      .dashboard-hero {
        padding: 1.5rem;
      }

      .hero-title {
        font-size: 1.75rem;
      }

      .hero-subtitle {
        font-size: 0.9rem;
      }

      .hero-icon {
        width: 60px;
        height: 60px;
        font-size: 1.75rem;
      }

      .brand-name {
        font-size: 1rem;
      }

      .brand-desc {
        font-size: 0.8rem;
      }

      .version-badge {
        padding: 8px 16px;
        font-size: 0.85rem;
      }
    }

    @media (max-width: 576px) {
      .dashboard-hero {
        padding: 1.25rem;
      }

      .hero-title {
        font-size: 1.5rem;
      }

      .hero-subtitle {
        font-size: 0.85rem;
      }

      .hero-icon {
        width: 52px;
        height: 52px;
        font-size: 1.5rem;
      }

      .hero-breadcrumb {
        font-size: 0.8rem;
      }

      .brand-name {
        font-size: 0.95rem;
      }

      .brand-desc {
        font-size: 0.75rem;
      }

      .version-badge {
        padding: 6px 14px;
        font-size: 0.8rem;
      }
    }
  </style>
