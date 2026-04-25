document.addEventListener('DOMContentLoaded', () => {
    const btn = document.getElementById('toggle-btn');
    const sidebar = document.getElementById('sidebar');

    // Recupera preferência do navegador
    if (localStorage.getItem('sidebar-collapsed') === 'true') {
        sidebar.classList.add('collapsed');
    }

    btn.addEventListener('click', () => {
        sidebar.classList.toggle('collapsed');
        localStorage.setItem('sidebar-collapsed', sidebar.classList.contains('collapsed'));
    });
});