(function () {
    const path = window.location.pathname;
    document.querySelectorAll(".nav a").forEach(a => {
        const href = a.getAttribute("href");
        if (!href) return;
        if (path === href || (href !== "/" && path.endsWith(href))) {
            a.setAttribute("aria-current", "page");
        }
    });

    const prefersReducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
    if (prefersReducedMotion) return;

    const revealTargets = document.querySelectorAll("[data-reveal]");
    if (!revealTargets.length) return;

    const revealObserver = new IntersectionObserver(entries => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add("is-visible");
                revealObserver.unobserve(entry.target);
            }
        });
    }, { threshold: 0.2 });

    revealTargets.forEach(target => revealObserver.observe(target));
})();
