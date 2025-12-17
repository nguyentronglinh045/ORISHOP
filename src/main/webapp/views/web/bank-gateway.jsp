<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cổng thanh toán an toàn - NCB Bank</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f0f2f5; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .payment-container { max-width: 900px; margin: 50px auto; background: white; border-radius: 15px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); overflow: hidden; }
        .bank-sidebar { background: linear-gradient(135deg, #005baa, #004a8b); color: white; padding: 40px; }
        .bank-logo { font-size: 2rem; font-weight: bold; margin-bottom: 30px; display: flex; align-items: center; gap: 10px; }
        .order-summary { background: rgba(255,255,255,0.1); padding: 20px; border-radius: 10px; margin-top: 20px; }
        .form-section { padding: 40px; }
        .card-input { position: relative; }
        .card-icon { position: absolute; right: 15px; top: 12px; color: #005baa; font-size: 1.5rem; }
        .btn-pay { background: #005baa; color: white; padding: 12px 30px; font-weight: bold; width: 100%; border-radius: 8px; border: none; transition: all 0.3s; }
        .btn-pay:hover { background: #004a8b; transform: translateY(-2px); }
        .verified-badge { text-align: center; margin-top: 20px; color: #28a745; font-size: 0.9rem; }
    </style>
</head>
<body>

<div class="container">
    <div class="row payment-container">
        <div class="col-md-5 bank-sidebar">
            <div class="bank-logo">
                <i class="fas fa-university"></i> NCB BANK
            </div>
            <h5 class="mb-4">Thông tin thanh toán</h5>
            <div class="order-summary">
                <p class="mb-2"><small>Đơn vị chấp nhận thẻ:</small><br><strong>ORISHOP VIETNAM</strong></p>
                <p class="mb-2"><small>Mã đơn hàng:</small><br><strong>${sessionScope.tempTxnRef}</strong></p>
                <p class="mb-0"><small>Số tiền thanh toán:</small></p>
                <h2 class="mb-0 text-warning">
                    <fmt:formatNumber value="${sessionScope.tempAmount}" type="currency" currencySymbol="₫"/>
                </h2>
            </div>
            <div class="mt-4 small opacity-75">
                <i class="fas fa-lock me-1"></i> Giao dịch được bảo mật bởi chuẩn SSL 256-bit.
            </div>
        </div>

        <div class="col-md-7 form-section">
            <h4 class="mb-4 text-primary">Nhập thông tin thẻ ATM/Internet Banking</h4>
            
            <form action="<c:url value='/payment/process'/>" method="post" id="paymentForm">
                <div class="mb-3">
                    <label class="form-label">Ngân hàng</label>
                    <select class="form-select" disabled>
                        <option selected>Ngân hàng Quốc Dân (NCB)</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Số thẻ</label>
                    <div class="card-input">
                        <input type="text" class="form-control form-control-lg" placeholder="9704 1985 ..." value="9704 1985 2619 1432 198" required>
                        <i class="fab fa-cc-visa card-icon"></i>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Tên chủ thẻ (Không dấu)</label>
                        <input type="text" class="form-control" placeholder="NGUYEN VAN A" value="NGUYEN VAN A" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Ngày phát hành</label>
                        <input type="text" class="form-control" placeholder="MM/YY" value="07/15" required>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label">Mã xác thực OTP</label>
                    <input type="text" class="form-control" placeholder="Nhập mã OTP gửi về điện thoại" required>
                    <div class="form-text text-end"><a href="#" class="text-decoration-none">Gửi lại mã?</a></div>
                </div>

                <button type="submit" class="btn btn-pay" id="btnPay">
                    <i class="fas fa-check-circle me-2"></i>XÁC NHẬN THANH TOÁN
                </button>
                
                <div class="text-center mt-3">
                    <a href="<c:url value='/cart'/>" class="text-muted text-decoration-none small">
                        <i class="fas fa-arrow-left me-1"></i>Hủy giao dịch
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    // Giả lập loading khi bấm thanh toán
    document.getElementById('paymentForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const btn = document.getElementById('btnPay');
        btn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>ĐANG XỬ LÝ...';
        btn.disabled = true;
        
        // Đợi 2 giây cho giống thật rồi mới submit
        setTimeout(() => {
            this.submit();
        }, 1500);
    });
</script>

</body>
</html>