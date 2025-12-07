<style>
  /* ========================================
   CHARTS SECTION STYLES
   ======================================== */

  .chart-card {
    min-height: 400px;
  }

  .chart-container {
    position: relative;
    height: 320px;
    margin-bottom: 1.5rem;
  }

  .chart-legend {
    display: flex;
    justify-content: center;
    gap: 2rem;
    padding: 1rem 0;
    border-top: 2px solid rgba(255, 107, 157, 0.1);
  }

  .legend-item {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    font-family: 'Inter', sans-serif;
  }

  .legend-color {
    width: 32px;
    height: 16px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }

  .legend-label {
    font-size: 0.9rem;
    color: #636e72;
    font-weight: 500;
  }

  /* Time Range Selector */
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
    background: transparent;
    color: #636e72;
    border-radius: 20px;
    font-size: 0.85rem;
    font-weight: 600;
    font-family: 'Inter', sans-serif;
    transition: all 0.3s ease;
    cursor: pointer;
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

  .btn-time i {
    font-size: 0.75rem;
  }

  /* Responsive */
  @media (max-width: 768px) {
    .chart-container {
      height: 250px;
    }

    .chart-legend {
      gap: 1rem;
    }

    .legend-color {
      width: 24px;
      height: 12px;
    }

    .legend-label {
      font-size: 0.8rem;
    }

    .time-range-selector {
      flex-wrap: wrap;
    }

    .btn-time {
      padding: 5px 12px;
      font-size: 0.75rem;
    }

    .btn-time i {
      display: none;
    }
  }

  @media (max-width: 576px) {
    .chart-card {
      min-height: 350px;
    }

    .chart-container {
      height: 200px;
    }

    .chart-legend {
      flex-direction: column;
      gap: 0.5rem;
      align-items: flex-start;
      padding-left: 1rem;
    }
  }
</style>