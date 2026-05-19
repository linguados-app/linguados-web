document.addEventListener('DOMContentLoaded', () => {
    const btn = document.getElementById('toggle-btn');
    const sidebar = document.getElementById('sidebar');

    if (localStorage.getItem('sidebar-collapsed') === 'true') {
        sidebar.classList.add('collapsed');
    }

    if (btn && sidebar) {
        btn.addEventListener('click', () => {
            sidebar.classList.toggle('collapsed');

            localStorage.setItem(
                'sidebar-collapsed',
                sidebar.classList.contains('collapsed')
            );
        });
    }
});