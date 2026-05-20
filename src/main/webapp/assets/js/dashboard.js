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

    // Ajusta visibilidade das barras com valor zero
    const bars = document.querySelectorAll('.bar');
    bars.forEach(bar => {
        const valueSpan = bar.querySelector('.bar-value');
        if (valueSpan) {
            const value = parseInt(valueSpan.innerText);
            if (value === 0) {
                bar.style.opacity = '0.4';
            } else {
                bar.style.opacity = '1';
            }
        }
    });

    // Adiciona tooltip dinâmico nas barras
    const barItems = document.querySelectorAll('.bar-item');
    barItems.forEach(item => {
        const bar = item.querySelector('.bar');
        const value = bar?.querySelector('.bar-value')?.innerText;
        const day = item.querySelector('.bar-day')?.innerText;

        if (value && parseInt(value) > 0) {
            item.setAttribute('title', `${day}: ${value} lição(ões) concluída(s)`);
        }
    });

    // Efeito de clique nos módulos
    const trailItems = document.querySelectorAll('.trail-item');
    trailItems.forEach(item => {
        item.addEventListener('click', () => {
            // Adiciona efeito de clique
            item.style.transform = 'scale(0.98)';
            setTimeout(() => {
                item.style.transform = '';
            }, 150);
        });
    });

    // Adiciona efeito de brilho nas barras ao carregar
    setTimeout(() => {
        bars.forEach((bar, index) => {
            setTimeout(() => {
                bar.style.opacity = '1';
            }, index * 50);
        });
    }, 100);
});