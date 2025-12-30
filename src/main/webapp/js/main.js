(function () {
  // Highlight nav link based on current path
  const path = window.location.pathname;
  document.querySelectorAll(".nav a").forEach(a => {
    const href = a.getAttribute("href");
    if (!href) return;
    if (path === href || (href !== "/" && path.endsWith(href))) {
      a.setAttribute("aria-current", "page");
    }
  });

  // Smooth scroll for internal anchors
  document.querySelectorAll('a[href^="#"]').forEach(a => {
    a.addEventListener("click", (e) => {
      const id = a.getAttribute("href");
      const el = document.querySelector(id);
      if (!el) return;
      e.preventDefault();
      el.scrollIntoView({behavior: "smooth", block: "start"});
      history.replaceState(null, "", id);
    });
  });
})();
