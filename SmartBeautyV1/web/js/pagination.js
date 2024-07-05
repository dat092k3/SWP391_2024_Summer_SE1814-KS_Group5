document.addEventListener('DOMContentLoaded', function () {
    const rows = document.querySelectorAll('#content tr');
    const rowsPerPage = 5;
    let currentPage = 1;

    function displayPage(page) {
        const start = (page - 1) * rowsPerPage;
        const end = start + rowsPerPage;

        rows.forEach((row, index) => {
            if (index >= start && index < end) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });

        updatePagination();
    }

    function updatePagination() {
        const totalPages = Math.ceil(rows.length / rowsPerPage);
        const pagination = document.getElementById('pagination');
        pagination.innerHTML = '';

        for (let i = 1; i <= totalPages; i++) {
            const button = document.createElement('button');
            button.innerText = i;
            button.classList.add('btn', 'btn-primary', 'pagination-btn');
            if (i === currentPage) {
                button.classList.add('active');
            }
            button.addEventListener('click', function () {
                currentPage = i;
                displayPage(i);
            });
            pagination.appendChild(button);
        }
    }

    displayPage(currentPage);

    // Updating serial numbers
    rows.forEach((row, index) => {
        row.querySelector('.serial-number').textContent = index + 1;
    });
});





