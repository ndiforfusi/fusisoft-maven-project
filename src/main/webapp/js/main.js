// Simple UI helpers (safe, no dependencies)
(function () {
    // Highlight current nav link if it matches pathname
    const path = window.location.pathname;
    document.querySelectorAll(".nav a").forEach(a => {
        const href = a.getAttribute("href");
        if (!href) return;
        // Match end of path or exact
        if (path === href || path.endsWith(href)) {
            a.setAttribute("aria-current", "page");
        }
    });
})();
