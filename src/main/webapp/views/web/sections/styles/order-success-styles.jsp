<style>
  /* ===== ORDER SUCCESS PAGE STYLES ===== */

  .success-page {
    min-height: 80vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #fff5f8 0%, #ffd1dc 50%, #ffb6c1 100%);
    padding: 3rem 1rem;
  }

  .success-card {
    background: white;
    border-radius: 30px;
    box-shadow: 0 20px 60px rgba(255, 107, 157, 0.2);
    padding: 3rem 2rem;
    text-align: center;
    max-width: 550px;
    width: 100%;
    position: relative;
    overflow: hidden;
  }

  .success-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 5px;
    background: linear-gradient(90deg, #ff6b9d, #00b894, #ff6b9d);
    background-size: 200% 100%;
    animation: shimmer 2s infinite;
  }

  @keyframes shimmer {
    0% {
      background-position: -200% 0;
    }

    100% {
      background-position: 200% 0;
    }
  }

  /* Success Icon with Animation */
  .success-icon-wrapper {
    position: relative;
    display: inline-block;
    margin-bottom: 2rem;
  }

  .success-icon {
    width: 120px;
    height: 120px;
    background: linear-gradient(135deg, #00b894, #55efc4);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    animation: successPulse 2s ease-in-out infinite;
    box-shadow: 0 10px 40px rgba(0, 184, 148, 0.3);
  }

  .success-icon i {
    font-size: 3.5rem;
    color: white;
  }

  @keyframes successPulse {

    0%,
    100% {
      transform: scale(1);
      box-shadow: 0 10px 40px rgba(0, 184, 148, 0.3);
    }

    50% {
      transform: scale(1.05);
      box-shadow: 0 15px 50px rgba(0, 184, 148, 0.4);
    }
  }

  /* Confetti circles */
  .confetti {
    position: absolute;
    width: 12px;
    height: 12px;
    border-radius: 50%;
    animation: confettiFall 3s ease-in-out infinite;
  }

  .confetti:nth-child(1) {
    background: #ff6b9d;
    top: -10px;
    left: 20%;
    animation-delay: 0s;
  }

  .confetti:nth-child(2) {
    background: #fdcb6e;
    top: -10px;
    left: 50%;
    animation-delay: 0.5s;
  }

  .confetti:nth-child(3) {
    background: #00b894;
    top: -10px;
    left: 80%;
    animation-delay: 1s;
  }

  @keyframes confettiFall {
    0% {
      transform: translateY(0) rotate(0deg);
      opacity: 1;
    }

    100% {
      transform: translateY(300px) rotate(720deg);
      opacity: 0;
    }
  }

  /* Title */
  .success-title {
    font-family: 'Quicksand', sans-serif;
    font-size: 2rem;
    font-weight: 700;
    color: #00b894;
    margin-bottom: 0.75rem;
  }

  .success-subtitle {
    font-size: 1.25rem;
    color: var(--dark);
    font-weight: 600;
    margin-bottom: 0.5rem;
  }

  .success-message {
    color: var(--dark-light);
    margin-bottom: 2rem;
    line-height: 1.7;
  }

  /* Order Info */
  .order-info {
    background: linear-gradient(135deg, #fff5f8, #ffd1dc);
    border-radius: 15px;
    padding: 1.5rem;
    margin-bottom: 2rem;
  }

  .order-info-item {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
    color: var(--dark);
  }

  .order-info-item i {
    color: var(--primary);
  }

  .order-info-item strong {
    color: var(--primary);
  }

  /* Action Buttons */
  .success-actions {
    display: flex;
    flex-direction: column;
    gap: 1rem;
  }

  .btn-home {
    background: var(--gradient-primary);
    border: none;
    color: white;
    font-weight: 600;
    padding: 1rem 2rem;
    border-radius: 50px;
    font-size: 1.1rem;
    transition: all 0.3s ease;
    text-decoration: none;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .btn-home:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 25px rgba(255, 107, 157, 0.4);
    color: white;
  }

  .btn-continue {
    border: 2px solid var(--primary);
    background: transparent;
    color: var(--primary);
    font-weight: 600;
    padding: 0.875rem 2rem;
    border-radius: 50px;
    transition: all 0.3s ease;
    text-decoration: none;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .btn-continue:hover {
    background: var(--gradient-primary);
    border-color: var(--primary);
    color: white;
  }

  .btn-history {
    color: var(--primary);
    font-weight: 600;
    text-decoration: none;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
    transition: all 0.3s ease;
  }

  .btn-history:hover {
    color: var(--primary-dark);
  }

  /* Responsive */
  @media (max-width: 575px) {
    .success-card {
      padding: 2rem 1.5rem;
      margin: 1rem;
    }

    .success-icon {
      width: 100px;
      height: 100px;
    }

    .success-icon i {
      font-size: 2.5rem;
    }

    .success-title {
      font-size: 1.5rem;
    }

    .success-subtitle {
      font-size: 1.1rem;
    }
  }
</style>