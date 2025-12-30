<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <div class="dashboard-card chart-card">
      <div class="card-header-custom">
        <div class="header-left">
          <h5 class="card-title-custom">
            <i class="fas fa-chart-line me-2"></i>Biểu đồ doanh thu
          </h5>
          <p class="card-subtitle-custom">Xu hướng doanh thu theo thời gian (chỉ đơn "Đã giao")</p>
        </div>
        <div class="time-range-selector">
          <button class="btn btn-sm btn-time" data-range="week">
            <i class="fas fa-calendar-week me-1"></i>Tuần
          </button>
          <button class="btn btn-sm btn-time active" data-range="month">
            <i class="fas fa-calendar-alt me-1"></i>Tháng
          </button>
        </div>
      </div>
      <div class="card-body-custom">
        <div class="chart-container">
          <canvas id="revenueChart"></canvas>
        </div>
        <div class="chart-legend">
          <div class="legend-item">
            <span class="legend-color" style="background: linear-gradient(135deg, #ff6b9d, #ffb6c1);"></span>
            <span class="legend-label">Doanh thu (₫)</span>
          </div>
          <div class="legend-item">
            <span class="legend-color" style="background: linear-gradient(135deg, #74b9ff, #a29bfe);"></span>
            <span class="legend-label">Đơn hàng</span>
          </div>
        </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
    <script>
      // ===================== DỮ LIỆU TỪ CONTROLLER (INITIAL LOAD) =====================
      // Dữ liệu được truyền từ AdminHomeController (tháng hiện tại)
      let chartLabels = ${ not empty chartLabels ?chartLabels: "[]"};
      let chartRevenues = ${ not empty chartRevenues ?chartRevenues: "[]"};
      let chartOrderCounts = ${ not empty chartOrderCounts ?chartOrderCounts: "[]"};

      // ===================== HÀM TÍNH SUGGESTED MAX =====================
      // Tính suggestedMax để biểu đồ scale đẹp (khoảng 1.5-3 lần giá trị max)
      function calculateSuggestedMax(dataArray) {
        if (!dataArray || dataArray.length === 0) return 100;
        const maxVal = Math.max(...dataArray);
        if (maxVal === 0) return 100;

        // Tính giá trị max gợi ý (khoảng 1.5 lần giá trị lớn nhất)
        // Làm tròn lên theo các mức đẹp: 100, 500, 1K, 5K, 10K, 50K, 100K, 500K, 1M, 5M, 10M...
        const multiplier = 1.5;
        let suggested = maxVal * multiplier;

        // Các ngưỡng làm tròn đẹp
        const thresholds = [
          100, 200, 500,
          1000, 2000, 5000,
          10000, 20000, 50000,
          100000, 200000, 500000,
          1000000, 2000000, 5000000,
          10000000, 20000000, 50000000,
          100000000, 200000000, 500000000,
          1000000000, 2000000000, 5000000000
        ];

        // Tìm ngưỡng phù hợp
        for (let i = 0; i < thresholds.length; i++) {
          if (suggested <= thresholds[i]) {
            return thresholds[i];
          }
        }

        // Nếu vượt quá tất cả ngưỡng, làm tròn lên
        return Math.ceil(suggested / 1000000000) * 1000000000;
      }

      // Tính suggestedMax cho số đơn hàng
      function calculateOrderSuggestedMax(dataArray) {
        if (!dataArray || dataArray.length === 0) return 10;
        const maxVal = Math.max(...dataArray);
        if (maxVal === 0) return 10;

        const multiplier = 1.5;
        let suggested = maxVal * multiplier;

        // Ngưỡng cho số đơn hàng (số nguyên đẹp)
        const thresholds = [5, 10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000];

        for (let i = 0; i < thresholds.length; i++) {
          if (suggested <= thresholds[i]) {
            return thresholds[i];
          }
        }

        return Math.ceil(suggested / 1000) * 1000;
      }

      // ===================== KHỞI TẠO BIỂU ĐỒ =====================
      const ctx = document.getElementById('revenueChart');
      let revenueChart = null;

      if (ctx) {
        // Tính suggestedMax ban đầu
        const initialRevenueSuggestedMax = calculateSuggestedMax(chartRevenues);
        const initialOrderSuggestedMax = calculateOrderSuggestedMax(chartOrderCounts);

        revenueChart = new Chart(ctx, {
          type: 'line',
          data: {
            labels: chartLabels,
            datasets: [{
              label: 'Doanh thu (₫)',
              data: chartRevenues,
              borderColor: '#ff6b9d',
              backgroundColor: 'rgba(255, 107, 157, 0.1)',
              borderWidth: 3,
              fill: true,
              tension: 0.4,
              pointRadius: 5,
              pointBackgroundColor: '#ff6b9d',
              pointBorderColor: '#fff',
              pointBorderWidth: 2,
              pointHoverRadius: 7,
              yAxisID: 'y'
            }, {
              label: 'Đơn hàng',
              data: chartOrderCounts,
              borderColor: '#74b9ff',
              backgroundColor: 'rgba(116, 185, 255, 0.1)',
              borderWidth: 3,
              fill: true,
              tension: 0.4,
              pointRadius: 5,
              pointBackgroundColor: '#74b9ff',
              pointBorderColor: '#fff',
              pointBorderWidth: 2,
              pointHoverRadius: 7,
              yAxisID: 'y1'
            }]
          },
          options: {
            responsive: true,
            maintainAspectRatio: false,
            interaction: {
              mode: 'index',
              intersect: false
            },
            plugins: {
              legend: {
                display: false
              },
              tooltip: {
                backgroundColor: 'rgba(255, 255, 255, 0.95)',
                titleColor: '#2d3436',
                bodyColor: '#636e72',
                borderColor: '#ff6b9d',
                borderWidth: 2,
                padding: 12,
                displayColors: true,
                callbacks: {
                  label: function (context) {
                    let label = context.dataset.label || '';
                    if (label) {
                      label += ': ';
                    }
                    if (context.parsed.y !== null) {
                      if (context.datasetIndex === 0) {
                        // Format doanh thu với dấu phân cách hàng nghìn
                        label += new Intl.NumberFormat('vi-VN').format(context.parsed.y) + ' ₫';
                      } else {
                        label += context.parsed.y + ' đơn';
                      }
                    }
                    return label;
                  }
                }
              }
            },
            scales: {
              y: {
                type: 'linear',
                display: true,
                position: 'left',
                beginAtZero: true,
                suggestedMax: initialRevenueSuggestedMax,
                grid: {
                  color: 'rgba(255, 107, 157, 0.1)',
                  drawBorder: false
                },
                ticks: {
                  color: '#636e72',
                  font: {
                    family: 'Inter',
                    size: 12
                  },
                  callback: function (value) {
                    // Format số tiền ngắn gọn
                    if (value >= 1000000) {
                      return (value / 1000000).toFixed(1) + 'M';
                    } else if (value >= 1000) {
                      return (value / 1000).toFixed(0) + 'K';
                    }
                    return value;
                  }
                }
              },
              y1: {
                type: 'linear',
                display: true,
                position: 'right',
                beginAtZero: true,
                suggestedMax: initialOrderSuggestedMax,
                grid: {
                  drawOnChartArea: false
                },
                ticks: {
                  color: '#74b9ff',
                  font: {
                    family: 'Inter',
                    size: 12
                  },
                  stepSize: 1,
                  callback: function (value) {
                    if (Number.isInteger(value)) {
                      return value + ' đơn';
                    }
                    return '';
                  }
                }
              },
              x: {
                grid: {
                  display: false
                },
                ticks: {
                  color: '#636e72',
                  font: {
                    family: 'Inter',
                    size: 12
                  }
                }
              }
            }
          }
        });

        // ===================== XỬ LÝ CHỌN KHOẢNG THỜI GIAN (AJAX) =====================
        document.querySelectorAll('.btn-time').forEach(btn => {
          btn.addEventListener('click', function () {
            // Cập nhật trạng thái active cho button
            document.querySelectorAll('.btn-time').forEach(b => b.classList.remove('active'));
            this.classList.add('active');

            const range = this.dataset.range;

            // Gọi API để lấy dữ liệu mới
            fetch('${pageContext.request.contextPath}/api/revenue?period=' + range)
              .then(response => response.json())
              .then(data => {
                // Cập nhật dữ liệu cho biểu đồ
                const statistics = data.statistics;
                const newLabels = statistics.map(s => s.date);
                const newRevenues = statistics.map(s => s.revenue);
                const newOrderCounts = statistics.map(s => s.orderCount);

                // Cập nhật chart data
                revenueChart.data.labels = newLabels;
                revenueChart.data.datasets[0].data = newRevenues;
                revenueChart.data.datasets[1].data = newOrderCounts;

                // Cập nhật suggestedMax để biểu đồ scale đẹp
                revenueChart.options.scales.y.suggestedMax = calculateSuggestedMax(newRevenues);
                revenueChart.options.scales.y1.suggestedMax = calculateOrderSuggestedMax(newOrderCounts);

                revenueChart.update();

                // Cập nhật subtitle
                const subtitleMap = {
                  'week': 'Xu hướng doanh thu tuần này (Thứ 2 - Chủ nhật)',
                  'month': 'Xu hướng doanh thu tháng hiện tại'
                };
                document.querySelector('.card-subtitle-custom').textContent = subtitleMap[range] + ' (chỉ đơn "Đã giao")';
              })
              .catch(error => {
                console.error('Lỗi khi tải dữ liệu biểu đồ:', error);
              });
          });
        });
      }
    </script>
