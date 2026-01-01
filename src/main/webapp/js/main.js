document.addEventListener('DOMContentLoaded', () => {
    // 1. Form Submission Animation
    const form = document.querySelector('form');
    if (form) {
        form.addEventListener('submit', (e) => {
            const btn = form.querySelector('button');
            btn.innerHTML = '<span class="loader"></span> Registering...';
            btn.style.opacity = '0.8';
            btn.style.pointerEvents = 'none';
        });
    }

    // 2. Simple Field Validation Feedback
    const inputs = document.querySelectorAll('input');
    inputs.forEach(input => {
        input.addEventListener('focus', () => {
            input.parentElement.classList.add('focused');
        });
        input.addEventListener('blur', () => {
            if (input.value === '') {
                input.parentElement.classList.remove('focused');
            }
        });
    });

    // 3. Table Row Animations
    const rows = document.querySelectorAll('tbody tr');
    rows.forEach((row, index) => {
        row.style.opacity = '0';
        row.style.transform = 'translateY(10px)';
        setTimeout(() => {
            row.style.transition = 'all 0.4s ease-out';
            row.style.opacity = '1';
            row.style.transform = 'translateY(0)';
        }, 100 * index);
    });
});
