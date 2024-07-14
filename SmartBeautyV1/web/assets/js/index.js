$(function () {
    "use strict";

    // chart 1
    var ctx = document.getElementById('chart1').getContext('2d');
    var chart = new Chart(ctx, {
        type: 'bar', // Chỉnh type thành 'bar' để tạo biểu đồ cột
        data: {
            labels: ['Total Customer Orders', 'Employee Salaries'], // Nhãn của các cột
            datasets: [{
                label: 'Financial Overview',
                data: [0, 0], // Giá trị của các cột
                backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)'], // Màu nền của các cột
                borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)'], // Màu viền của các cột
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });



    // chart 2

    var ctx = document.getElementById("chart2").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ["Direct", "Affiliate", "E-mail", "Other"],
            datasets: [{
                    backgroundColor: [
                        "#ffffff",
                        "rgba(255, 255, 255, 0.70)",
                        "rgba(255, 255, 255, 0.50)",
                        "rgba(255, 255, 255, 0.20)"
                    ],
                    data: [5856, 2602, 1802, 1105],
                    borderWidth: [0, 0, 0, 0]
                }]
        },
        options: {
            maintainAspectRatio: false,
            legend: {
                position: "bottom",
                display: false,
                labels: {
                    fontColor: '#ddd',
                    boxWidth: 15
                }
            }
            ,
            tooltips: {
                displayColors: false
            }
        }
    });




});
   