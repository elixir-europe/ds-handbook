/* custom.js — the theme's own extension point (it ships this file empty and
   loads it from <head> on every page). */

(function () {
    // The theme's head.html emits only favicon.ico plus 16px and 32px PNGs.
    // On a high-DPI screen a 32px bitmap is drawn into 32 device pixels at
    // best, and often upscaled from the 16 — which is why the tab icon looks
    // soft. Browsers prefer an SVG icon when one is offered and rasterise it
    // at whatever size the display needs, so add that link here.
    //
    // The base path is taken from the icon link the theme already wrote, so
    // this keeps working under a --baseurl build.
    var existing = document.querySelector('link[rel="icon"], link[rel="shortcut icon"]');
    var base = existing
        ? existing.getAttribute('href').replace(/[^/]+$/, '')
        : '/assets/img/';

    var link = document.createElement('link');
    link.rel = 'icon';
    link.type = 'image/svg+xml';
    link.href = base + 'logo/logomark.svg';
    document.head.appendChild(link);
})();
