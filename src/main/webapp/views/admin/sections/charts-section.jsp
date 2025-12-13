<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <div class="dashboard-card chart-card">
      <div class="card-header-custom">
        <div class="header-left">
          <h5 class="card-title-custom">
            <i class="fas fa-chart-line me-2"></i>Biểu đồ doanh thu
          </h5>
          <p class="card-subtitle-custom">Xu hướng doanh thu 7 ngày gần đây</p>
        </div>
        <div class="time-range-selector">
          <button class="btn btn-sm btn-time active" data-range="week">
            <i class="fas fa-calendar-week me-1"></i>Tuần
          </button>
          <button class="btn btn-sm btn-time" data-range="month">
            <i class="fas fa-calendar-alt me-1"></i>Tháng
          </button>
          <button class="btn btn-sm btn-time" data-range="quarter">
            <i class="fas fa-calendar me-1"></i>Quý
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
            <span class="legend-label">Doanh thu</span>
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
      // Revenue Chart Configuration
      const ctx = document.getElementById('revenueChart');
      if (ctx) {
        const revenueChart = new Chart(ctx, {
          type: 'line',
          data: {
            labels: ['01/12', '02/12', '03/12', '04/12', '05/12', '06/12', '07/12'],
            datasets: [{
              label: 'Doanh thu (triệu ₫)',
              data: [15.2, 18.5, 16.8, 22.3, 19.7, 24.1, 21.5],
              borderColor: '#ff6b9d',
              backgroundColor: 'rgba(255, 107, 157, 0.1)',
              borderWidth: 3,
              fill: true,
              tension: 0.4,
              pointRadius: 5,
              pointBackgroundColor: '#ff6b9d',
              pointBorderColor: '#fff',
              pointBorderWidth: 2,
              pointHoverRadius: 7
            }, {
              label: 'Đơn hàng',
              data: [142, 165, 158, 189, 172, 201, 186],
              borderColor: '#74b9ff',
              backgroundColor: 'rgba(116, 185, 255, 0.1)',
              borderWidth: 3,
              fill: true,
              tension: 0.4,
              pointRadius: 5,
              pointBackgroundColor: '#74b9ff',
              pointBorderColor: '#fff',
              pointBorderWidth: 2,
              pointHoverRadius: 7
            }]
          },
          options: {
            responsive: true,
            maintainAspectRatio: false,
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
                        label += context.parsed.y.toFixed(1) + 'M';
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
                beginAtZero: true,
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
                    return value + 'M';
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

        // Time range selector
        document.querySelectorAll('.btn-time').forEach(btn => {
          btn.addEventListener('click', function () {
            document.querySelectorAll('.btn-time').forEach(b => b.classList.remove('active'));
            this.classList.add('active');

            const range = this.dataset.range;
            // Update chart data based on selected range
            // This would typically fetch data from backend
          });
        });
      }
    </script>