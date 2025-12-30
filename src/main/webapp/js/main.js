(function () {
    const path = window.location.pathname;
    document.querySelectorAll(".nav a").forEach(a => {
        const href = a.getAttribute("href");
        if (!href) return;
        if (path === href || (href !== "/" && path.endsWith(href))) {
            a.setAttribute("aria-current", "page");
        }
    });
})();
