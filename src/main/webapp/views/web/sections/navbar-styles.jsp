<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    /* === NAVBAR STYLES === */
    /* --- 1. TOP BAR --- */
    .top-bar {
        background: var(--gradient-primary);
        color: var(--white);
        padding: 10px 0;
        font-size: 0.9rem;
    }

    .top-bar a {
        color: var(--white);
        text-decoration: none;
        margin-left: 15px;
        transition: all var(--transition-base);
    }

    .top-bar a:hover {
        opacity: 0.8;
        transform: translateY(-2px);
    }

    .top-bar i {
        margin-right: 5px;
    }

    /* --- 2. MAIN HEADER (Sticky) --- */
    .main-header {
        background: var(--white);
        box-shadow: var(--shadow-md);
        position: sticky;
        top: 0;
        z-index: 1020;
        padding: 18px 0;
    }

    /* Logo */
    .brand-logo {
        font-family: 'Quicksand', sans-serif;
        font-size: 26px;
        font-weight: 700;
        background: var(--gradient-primary);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        text-transform: uppercase;
        letter-spacing: 1.5px;
        display: flex;
        align-items: center;
        gap: 10px;
        transition: all var(--transition-base);
        text-decoration: none;
    }

    .brand-logo:hover {
        transform: scale(1.05);
    }

    /* Search Bar */
    .search-container {
        position: relative;
        display: flex;
        align-items: center;
    }

    .search-input {
        width: 100%;
        padding: 12px 50px 12px 20px;
        border: 2px solid var(--border);
        border-radius: var(--radius-full);
        font-size: 0.95rem;
        transition: all var(--transition-base);
    }

    .search-input:focus {
        outline: none;
        border-color: var(--primary);
        box-shadow: 0 0 0 3px rgba(255, 107, 157, 0.1);
    }

    .search-btn {
        position: absolute;
        right: 5px;
        background: var(--gradient-primary);
        border: none;
        color: var(--white);
        width: 40px;
        height: 40px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all var(--transition-base);
    }

    .search-btn:hover {
        transform: scale(1.1);
        box-shadow: var(--shadow-md);
    }

    /* Header Icons (User, Cart) */
    .header-actions {
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .action-btn {
        position: relative;
        width: 42px;
        height: 42px;
        background: var(--light);
        border: none;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: var(--primary);
        font-size: 18px;
        transition: all var(--transition-base);
        text-decoration: none;
    }

    .action-btn:hover {
        background: var(--gradient-primary);
        color: var(--white);
        transform: translateY(-3px);
        box-shadow: var(--shadow-md);
    }

    .cart-badge {
        position: absolute;
        top: -2px;
        right: -6px;
        background: var(--gradient-primary);
        color: var(--white);
        font-size: 10px;
        font-weight: 700;
        min-width: 20px;
        height: 20px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 2px solid var(--white);
        box-shadow: var(--shadow-sm);
    }

    /* --- 3. NAVIGATION MENU --- */
    .navbar-custom {
        padding: 0;
        margin-top: 18px;
        border-top: 2px solid var(--light);
    }

    .nav-link {
        font-family: 'Quicksand', sans-serif;
        font-weight: 600;
        text-transform: uppercase;
        color: var(--dark) !important;
        padding: 18px 24px !important;
        font-size: 14px;
        position: relative;
        letter-spacing: 0.5px;
        transition: all var(--transition-base);
    }

    .nav-link:hover,
    .nav-link.active {
        color: var(--primary) !important;
        background: var(--light);
        border-radius: var(--radius-md);
    }

    /* Hiệu ứng gạch chân khi hover menu */
    .nav-link::after {
        content: '';
        position: absolute;
        bottom: 10px;
        left: 50%;
        transform: translateX(-50%) scaleX(0);
        width: 60%;
        height: 3px;
        background: var(--gradient-primary);
        border-radius: var(--radius-full);
        transition: transform var(--transition-base);
    }

    .nav-link:hover::after,
    .nav-link.active::after {
        transform: translateX(-50%) scaleX(1);
    }

    /* Dropdown Menu Đa cấp */
    .dropdown-menu {
        border: none;
        box-shadow: var(--shadow-lg);
        border-radius: var(--radius-md);
        padding: 10px 0;
        margin-top: 10px;
        min-width: 220px;
    }

    .dropdown-item {
        padding: 12px 20px;
        font-size: 0.95rem;
        transition: all var(--transition-base);
        color: var(--dark);
    }

    .dropdown-item:hover {
        background: var(--light);
        color: var(--primary);
        padding-left: 25px;
    }

    .dropdown-item.has-child {
        position: relative;
    }

    /* Logic CSS cho Menu con (Submenu) */
    .dropdown-menu li {
        position: relative;
    }

    .dropdown-menu .submenu {
        position: absolute;
        left: 100%;
        top: 0;
        background: var(--white);
        box-shadow: var(--shadow-lg);
        border-radius: var(--radius-md);
        min-width: 200px;
        opacity: 0;
        visibility: hidden;
        transform: translateX(-10px);
        transition: all var(--transition-base);
        z-index: 1000;
        padding: 10px 0;
        margin-left: 5px;
    }

    .dropdown-menu>li:hover>.submenu {
        opacity: 1;
        visibility: visible;
        transform: translateX(0);
    }

    /* Responsive Mobile */
    @media (max-width: 991px) {
        .navbar-custom {
            display: none;
        }

        .header-actions span {
            display: none;
        }

        .logo-text {
            font-size: 20px;
        }
    }
</style>

