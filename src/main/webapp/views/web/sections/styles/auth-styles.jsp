<style>
  /* ===== AUTH PAGE STYLES (Login & Register) ===== */

  /* Hide navbar and footer for auth pages */
  .top-bar,
  .main-header,
  .navbar-custom,
  footer {
    display: none !important;
  }

  /* Full height centered layout */
  body {
    min-height: 100vh;
    background: linear-gradient(135deg, #ffeef4 0%, #fff5f8 100%);
    padding: 50px 0;
  }

  .container {
    width: 100%;
    max-width: 100%;
  }

  /* Custom input styling with pink theme */
  .input-group-text {
    background-color: #fff;
    border: 2px solid #ff6b9d;
    border-right: none;
    color: #ff6b9d;
  }

  .input-group .form-control {
    border: 2px solid #ff6b9d;
    border-left: none;
    padding: 0.75rem 1rem;
  }

  .input-group .form-control:focus {
    border-color: #ff6b9d;
    box-shadow: none;
    outline: none;
  }

  .input-group .form-control::placeholder {
    color: #999;
    opacity: 0.7;
  }

  /* Ensure icon stays pink on focus */
  .input-group:focus-within .input-group-text {
    border-color: #ff6b9d;
    color: #c44569;
  }

  /* Home button styling */
  .btn-home {
    position: absolute;
    top: 20px;
    left: 20px;
    background: white;
    border: 2px solid #ff6b9d;
    color: #ff6b9d;
    padding: 10px 20px;
    border-radius: 50px;
    text-decoration: none;
    font-weight: 600;
    transition: all 0.3s;
    box-shadow: 0 2px 8px rgba(255, 107, 157, 0.2);
  }

  .btn-home:hover {
    background: linear-gradient(135deg, #ff6b9d, #c44569);
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(255, 107, 157, 0.3);
  }
</style>
