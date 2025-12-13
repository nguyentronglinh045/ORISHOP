<style>
  /* ===== ORDER HISTORY PAGE STYLES ===== */

  /* Hero Section */
  .history-hero {
    background: var(--gradient-primary);
    padding: 3rem 0;
    margin-bottom: 2rem;
  }

  .history-hero-content {
    text-align: center;
    color: white;
  }

  .history-hero h1 {
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    font-size: 2.25rem;
    margin-bottom: 0.5rem;
  }

  .history-breadcrumb {
    display: flex;
    justify-content: center;
    gap: 0.5rem;
    flex-wrap: wrap;
  }

  .history-breadcrumb a {
    color: rgba(255, 255, 255, 0.8);
    text-decoration: none;
    transition: color 0.3s ease;
  }

  .history-breadcrumb a:hover {
    color: white;
  }

  .history-breadcrumb span {
    color: rgba(255, 255, 255, 0.6);
  }

  /* User Sidebar */
  .user-sidebar {
    background: white;
    border-radius: 20px;
    box-shadow: 0 5px 20px rgba(255, 107, 157, 0.1);
    overflow: hidden;
    position: sticky;
    top: 100px;
  }

  .user-header {
    background: var(--gradient-primary);
    padding: 1.5rem;
    text-align: center;
    color: white;
  }

  .user-avatar {
    width: 80px;
    height: 80px;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 1rem;
    font-size: 2rem;
  }

  .user-name {
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    font-size: 1.25rem;
    margin-bottom: 0;
  }

  .user-menu {
    padding: 0;
    list-style: none;
    margin: 0;
  }

  .user-menu li {
    border-bottom: 1px solid #f5f5f5;
  }

  .user-menu li:last-child {
    border-bottom: none;
  }

  .user-menu a {
    display: flex;
    align-items: center;
    padding: 1rem 1.5rem;
    color: var(--dark);
    text-decoration: none;
    transition: all 0.3s ease;
    gap: 0.75rem;
  }

  .user-menu a:hover {
    background: #fff5f8;
    color: var(--primary);
  }

  .user-menu a.active {
    background: linear-gradient(135deg, rgba(255, 107, 157, 0.1), rgba(255, 143, 171, 0.05));
    color: var(--primary);
    border-left: 3px solid var(--primary);
  }

  .user-menu a i {
    width: 20px;
    text-align: center;
  }

  .user-menu .logout-link {
    color: #e74c3c;
  }

  .user-menu .logout-link:hover {
    background: #fff5f5;
  }

  /* Content Area */
  .history-content {
    background: white;
    border-radius: 20px;
    box-shadow: 0 5px 20px rgba(255, 107, 157, 0.1);
    padding: 1.5rem;
  }

  .content-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5rem;
    padding-bottom: 1rem;
    border-bottom: 2px solid #fff5f8;
  }

  .content-title {
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    font-size: 1.25rem;
    color: var(--dark);
    margin: 0;
  }

  .order-count {
    background: var(--gradient-primary);
    color: white;
    font-size: 0.85rem;
    padding: 0.35rem 0.75rem;
    border-radius: 50px;
  }

  /* Empty State */
  .empty-state {
    text-align: center;
    padding: 3rem 1rem;
  }

  .empty-icon {
    width: 100px;
    height: 100px;
    background: linear-gradient(135deg, rgba(255, 107, 157, 0.1), rgba(255, 143, 171, 0.05));
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 1.5rem;
  }

  .empty-icon i {
    font-size: 2.5rem;
    color: var(--primary);
  }

  .empty-title {
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    color: var(--dark);
    margin-bottom: 0.5rem;
  }

  .empty-text {
    color: var(--dark-light);
    margin-bottom: 1.5rem;
  }

  .btn-shop {
    background: var(--gradient-primary);
    border: none;
    color: white;
    padding: 12px 30px;
    border-radius: 50px;
    font-weight: 600;
    text-decoration: none;
    display: inline-block;
    transition: all 0.3s ease;
  }

  .btn-shop:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(255, 107, 157, 0.4);
    color: white;
  }

  /* Order Cards */
  .order-list {
    display: flex;
    flex-direction: column;
    gap: 1rem;
  }

  .order-card {
    border: 2px solid #f5f5f5;
    border-radius: 15px;
    transition: all 0.3s ease;
  }

  .order-card:hover {
    border-color: var(--primary);
    box-shadow: 0 5px 20px rgba(255, 107, 157, 0.1);
  }

  .order-card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem 1.25rem;
    background: linear-gradient(135deg, #fff5f8, #ffeef2);
    border-radius: 13px 13px 0 0;
    flex-wrap: wrap;
    gap: 0.5rem;
  }

  .order-id {
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    color: var(--primary);
  }

  .order-date {
    color: var(--dark-light);
    font-size: 0.9rem;
  }

  .order-date i {
    margin-right: 5px;
  }

  .order-card-body {
    padding: 1.25rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 1rem;
  }

  .order-info {
    display: flex;
    gap: 2rem;
    flex-wrap: wrap;
  }

  .info-item {
    display: flex;
    flex-direction: column;
  }

  .info-label {
    font-size: 0.85rem;
    color: var(--dark-light);
    margin-bottom: 0.25rem;
  }

  .info-value {
    font-weight: 600;
    color: var(--dark);
  }

  .info-value.price {
    color: var(--primary);
    font-size: 1.1rem;
  }

  /* Status Badge */
  .status-badge {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.5rem 1rem;
    border-radius: 50px;
    font-weight: 600;
    font-size: 0.85rem;
  }

  .status-pending {
    background: linear-gradient(135deg, rgba(255, 193, 7, 0.2), rgba(255, 193, 7, 0.05));
    color: #f39c12;
  }

  .status-shipping {
    background: linear-gradient(135deg, rgba(52, 152, 219, 0.2), rgba(52, 152, 219, 0.05));
    color: #3498db;
  }

  .status-delivered {
    background: linear-gradient(135deg, rgba(0, 184, 148, 0.2), rgba(0, 184, 148, 0.05));
    color: #00b894;
  }

  .status-cancelled {
    background: linear-gradient(135deg, rgba(231, 76, 60, 0.2), rgba(231, 76, 60, 0.05));
    color: #e74c3c;
  }

  .status-default {
    background: linear-gradient(135deg, rgba(108, 117, 125, 0.2), rgba(108, 117, 125, 0.05));
    color: #6c757d;
  }

  /* Action Button */
  .btn-view {
    background: white;
    border: 2px solid var(--primary);
    color: var(--primary);
    padding: 8px 20px;
    border-radius: 50px;
    font-weight: 600;
    text-decoration: none;
    transition: all 0.3s ease;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
  }

  .btn-view:hover {
    background: var(--gradient-primary);
    border-color: transparent;
    color: white;
  }

  /* Responsive */
  @media (max-width: 991px) {
    .user-sidebar {
      position: relative;
      top: 0;
      margin-bottom: 1.5rem;
    }

    .user-header {
      padding: 1rem;
    }

    .user-avatar {
      width: 60px;
      height: 60px;
      font-size: 1.5rem;
    }

    .user-menu {
      display: flex;
      overflow-x: auto;
    }

    .user-menu li {
      border-bottom: none;
      border-right: 1px solid #f5f5f5;
      white-space: nowrap;
    }

    .user-menu li:last-child {
      border-right: none;
    }

    .user-menu a.active {
      border-left: none;
      border-bottom: 3px solid var(--primary);
    }
  }

  @media (max-width: 767px) {
    .history-hero {
      padding: 2rem 0;
    }

    .history-hero h1 {
      font-size: 1.75rem;
    }

    .order-card-header {
      flex-direction: column;
      align-items: flex-start;
    }

    .order-card-body {
      flex-direction: column;
      align-items: flex-start;
    }

    .order-info {
      gap: 1rem;
    }

    .btn-view {
      width: 100%;
      justify-content: center;
    }
  }

  @media (max-width: 575px) {
    .content-header {
      flex-direction: column;
      gap: 0.75rem;
      align-items: flex-start;
    }

    .user-menu {
      flex-wrap: wrap;
    }
  }
</style>