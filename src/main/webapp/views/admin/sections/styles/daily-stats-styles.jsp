<style>
  /* ========================================
   DAILY STATS SECTION STYLES
   ======================================== */

  .daily-stats-card {
    background: linear-gradient(135deg, #fff5f8, #ffffff);
    position: sticky;
    top: 20px;
  }

  .daily-stats-card .card-subtitle-custom {
    color: #ff6b9d;
    font-weight: 500;
  }

  #updateTime {
    font-weight: 700;
    color: #ff6b9d;
  }

  .btn-refresh {
    padding: 6px 14px;
    border: 2px solid rgba(255, 107, 157, 0.2);
    background: #ffffff;
    color: #ff6b9d;
    border-radius: 20px;
    font-size: 0.85rem;
    font-weight: 600;
    transition: all 0.3s ease;
  }

  .btn-refresh:hover {
    background: linear-gradient(135deg, #ff6b9d, #ffb6c1);
    color: #ffffff;
    border-color: transparent;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(255, 107, 157, 0.3);
  }

  .btn-refresh i {
    font-size: 0.8rem;
  }

  /* Daily Stat Item */
  .daily-stat-item {
    margin-bottom: 1.5rem;
  }

  .daily-stat-item:last-child {
    margin-bottom: 0;
  }

  .daily-stat-header {
    display: flex;
    align-items: flex-start;
    gap: 1rem;
    margin-bottom: 1rem;
  }

  .daily-stat-icon {
    width: 52px;
    height: 52px;
    border-radius: 15px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.5rem;
    color: #ffffff;
    flex-shrink: 0;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  }

  .daily-stat-icon.icon-revenue {
    background: linear-gradient(135deg, #00b894, #55efc4);
  }

  .daily-stat-icon.icon-orders {
    background: linear-gradient(135deg, #ff6b9d, #ffb6c1);
  }

  .daily-stat-icon.icon-visitors {
    background: linear-gradient(135deg, #74b9ff, #a29bfe);
  }

  .daily-stat-icon.icon-customers {
    background: linear-gradient(135deg, #fdcb6e, #ffeaa7);
  }

  .daily-stat-content {
    flex: 1;
  }

  .daily-stat-label {
    font-size: 0.85rem;
    color: #636e72;
    margin-bottom: 0.25rem;
    font-weight: 500;
    font-family: 'Inter', sans-serif;
  }

  .daily-stat-value {
    font-size: 1.75rem;
    font-weight: 700;
    color: #2d3436;
    font-family: 'Quicksand', sans-serif;
    margin-bottom: 0.25rem;
    line-height: 1.2;
  }

  .daily-stat-compare {
    display: flex;
    align-items: center;
    gap: 0.35rem;
    font-size: 0.8rem;
    color: #00b894;
    font-weight: 600;
  }

  .daily-stat-compare i {
    font-size: 0.75rem;
  }

  .daily-stat-compare.compare-down {
    color: #e74c3c;
  }

  .daily-stat-compare.compare-neutral {
    color: #636e72;
  }

  /* Progress */
  .daily-stat-progress {
    margin-top: 1rem;
  }

  .progress-info {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 0.5rem;
    font-size: 0.85rem;
    color: #636e72;
    font-family: 'Inter', sans-serif;
  }

  .daily-stat-progress .progress {
    height: 8px;
    background-color: rgba(255, 107, 157, 0.1);
    border-radius: 10px;
    overflow: hidden;
  }

  .bg-gradient-primary {
    background: linear-gradient(135deg, #ff6b9d, #ffb6c1) !important;
  }

  /* Order Status Mini */
  .order-status-mini {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 0.75rem;
    margin-top: 1rem;
  }

  .status-mini-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.35rem;
    padding: 0.75rem;
    background: rgba(255, 107, 157, 0.03);
    border-radius: 12px;
    transition: all 0.3s ease;
  }

  .status-mini-item:hover {
    background: rgba(255, 107, 157, 0.08);
    transform: translateY(-2px);
  }

  .status-mini-badge {
    width: 32px;
    height: 32px;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #ffffff;
    font-size: 0.85rem;
  }

  .status-mini-badge.badge-pending {
    background: linear-gradient(135deg, #fdcb6e, #ffeaa7);
  }

  .status-mini-badge.badge-shipping {
    background: linear-gradient(135deg, #74b9ff, #a29bfe);
  }

  .status-mini-badge.badge-completed {
    background: linear-gradient(135deg, #00b894, #55efc4);
  }

  .status-mini-count {
    font-size: 1.1rem;
    font-weight: 700;
    color: #2d3436;
    font-family: 'Quicksand', sans-serif;
  }

  .status-mini-label {
    font-size: 0.7rem;
    color: #636e72;
    text-align: center;
    font-weight: 500;
  }

  /* Divider */
  .daily-stats-divider {
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(255, 107, 157, 0.2), transparent);
    margin: 1.5rem 0;
  }

  /* Responsive */
  @media (max-width: 1200px) {
    .daily-stats-card {
      position: static;
    }
  }

  @media (max-width: 768px) {
    .daily-stat-value {
      font-size: 1.5rem;
    }

    .daily-stat-icon {
      width: 44px;
      height: 44px;
      font-size: 1.2rem;
    }

    .order-status-mini {
      grid-template-columns: repeat(3, 1fr);
      gap: 0.5rem;
    }

    .status-mini-item {
      padding: 0.5rem;
    }

    .status-mini-badge {
      width: 28px;
      height: 28px;
      font-size: 0.75rem;
    }

    .status-mini-count {
      font-size: 1rem;
    }

    .status-mini-label {
      font-size: 0.65rem;
    }
  }

  @media (max-width: 576px) {
    .btn-refresh span {
      display: none;
    }

    .btn-refresh {
      padding: 6px 10px;
    }

    .daily-stat-header {
      gap: 0.75rem;
    }

    .order-status-mini {
      gap: 0.4rem;
    }

    .status-mini-item {
      padding: 0.4rem;
    }
  }
</style>
