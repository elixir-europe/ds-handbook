// The magpie's nest — localStorage-backed bookmarking
// Stores saved pages as { url, title, section, savedAt } in localStorage
// under the key "dsh-notebook". Updates the bookmark button on the current
// page, the sidebar magpie counter, and the notebook page list.

(function () {
    'use strict';

    var KEY = 'dsh-notebook';

    // ---------- storage ----------
    function read() {
        try { return JSON.parse(localStorage.getItem(KEY)) || []; }
        catch (e) { return []; }
    }
    function write(items) {
        try { localStorage.setItem(KEY, JSON.stringify(items)); }
        catch (e) { /* quota or private mode — silently fail */ }
        document.dispatchEvent(new CustomEvent('notebook:updated'));
    }
    function isSaved(url) {
        return read().some(function (i) { return i.url === url; });
    }
    function add(url, title, section) {
        var items = read();
        if (items.some(function (i) { return i.url === url; })) return;
        items.push({ url: url, title: title, section: section || '', savedAt: Date.now() });
        write(items);
    }
    function remove(url) {
        write(read().filter(function (i) { return i.url !== url; }));
    }
    function clearAll() {
        if (!confirm("Empty the magpie's nest? This will remove all collected pages.")) return;
        write([]);
    }

    // ---------- helpers ----------
    function escapeHtml(str) {
        var d = document.createElement('div');
        d.textContent = String(str == null ? '' : str);
        return d.innerHTML;
    }
    function formatDate(ts) {
        try {
            return new Date(ts).toLocaleDateString(undefined, { month: 'long', day: 'numeric' });
        } catch (e) { return ''; }
    }
    function sectionLabel(section) {
        var map = {
            'guidance': 'Signposts',
            'case-studies': 'Campfires',
            'maturity-model': 'Waypoints',
            'about': 'About'
        };
        return map[section] || section || '';
    }

    // ---------- UI sync ----------
    function updateSidebarCounter() {
        var counter = document.querySelector('.trail-magpie-count');
        if (!counter) return;
        var count = read().length;
        if (count > 0) {
            counter.textContent = count + ' shiny ' + (count === 1 ? 'thing' : 'things') + ' collected';
            counter.classList.add('has-items');
        } else {
            counter.textContent = 'your guide';
            counter.classList.remove('has-items');
        }
    }

    function updateToggleButton() {
        var button = document.querySelector('.notebook-toggle');
        if (!button) return;
        var url = button.getAttribute('data-url');
        var label = button.querySelector('.notebook-toggle-label');
        var icon = button.querySelector('.notebook-toggle-icon');
        if (isSaved(url)) {
            button.classList.add('is-saved');
            button.setAttribute('aria-pressed', 'true');
            if (label) label.textContent = "in the magpie's nest";
            if (icon) icon.textContent = '✓';
        } else {
            button.classList.remove('is-saved');
            button.setAttribute('aria-pressed', 'false');
            if (label) label.textContent = "add to the magpie's nest";
            if (icon) icon.textContent = '+';
        }
    }

    function renderNotebookPage() {
        var list = document.getElementById('notebook-list');
        var empty = document.getElementById('notebook-empty');
        var actions = document.getElementById('notebook-actions');
        if (!list) return;

        var items = read();
        list.innerHTML = '';

        if (items.length === 0) {
            list.style.display = 'none';
            if (empty) empty.style.display = '';
            if (actions) actions.style.display = 'none';
            return;
        }
        list.style.display = '';
        if (empty) empty.style.display = 'none';
        if (actions) actions.style.display = '';

        items.sort(function (a, b) { return b.savedAt - a.savedAt; }).forEach(function (item) {
            var li = document.createElement('li');
            var toneClass = item.section ? ' tone--' + item.section.replace(/[^a-z0-9-]/g, '') : '';
            li.className = 'notebook-item' + toneClass;
            li.innerHTML =
                '<a class="notebook-item-link" href="' + escapeHtml(item.url) + '">' +
                    (item.section ? '<span class="notebook-item-section">' + escapeHtml(sectionLabel(item.section)) + '</span>' : '') +
                    '<span class="notebook-item-title">' + escapeHtml(item.title) + '</span>' +
                    '<span class="notebook-item-meta">' +
                        '<span class="notebook-item-url">' + escapeHtml(item.url) + '</span>' +
                        '<span class="notebook-item-date">saved ' + escapeHtml(formatDate(item.savedAt)) + '</span>' +
                    '</span>' +
                '</a>' +
                '<button class="notebook-item-remove" data-url="' + escapeHtml(item.url) + '" aria-label="Remove from notebook">×</button>';
            list.appendChild(li);
        });

        list.querySelectorAll('.notebook-item-remove').forEach(function (btn) {
            btn.addEventListener('click', function (e) {
                e.preventDefault();
                e.stopPropagation();
                remove(this.getAttribute('data-url'));
            });
        });
    }

    // ---------- bookmark button ----------
    function setupToggleButton() {
        var button = document.querySelector('.notebook-toggle');
        if (!button) return;
        button.addEventListener('click', function (e) {
            e.preventDefault();
            var url = this.getAttribute('data-url');
            var title = this.getAttribute('data-title');
            var section = this.getAttribute('data-section');
            var saving = !isSaved(url);

            // Magpie collecting animation on the button
            this.classList.remove('collecting');
            // Force reflow so the animation re-triggers
            void this.offsetWidth;
            this.classList.add('collecting');
            setTimeout(function () {
                if (button) button.classList.remove('collecting');
            }, 750);

            if (saving) {
                add(url, title, section);
                // Bob the sidebar magpie too if it's on the page
                var sidebarMagpie = document.querySelector('.trail-magpie img');
                if (sidebarMagpie) {
                    sidebarMagpie.classList.remove('bobbing');
                    void sidebarMagpie.offsetWidth;
                    sidebarMagpie.classList.add('bobbing');
                    setTimeout(function () { sidebarMagpie.classList.remove('bobbing'); }, 700);
                }
            } else {
                remove(url);
            }
        });
    }

    // ---------- print / clear ----------
    // Build a print bundle: fetch each saved page's content, assemble them
    // into a hidden container, then trigger window.print(). The print
    // stylesheet hides everything else and shows only the bundle.
    function setupPrintButton() {
        var btn = document.getElementById('notebook-print');
        if (!btn) return;
        btn.addEventListener('click', function () { buildPrintBundleAndPrint(btn); });
    }

    function buildPrintBundleAndPrint(btn) {
        var items = read();
        if (items.length === 0) return;

        var originalLabel = btn.innerHTML;
        btn.disabled = true;
        btn.innerHTML = '<span aria-hidden="true">⏳</span> gathering pages…';

        // Reuse or create the bundle container
        var bundle = document.getElementById('notebook-print-bundle');
        if (!bundle) {
            bundle = document.createElement('div');
            bundle.id = 'notebook-print-bundle';
            bundle.className = 'notebook-print-bundle';
            document.body.appendChild(bundle);
        }
        bundle.innerHTML = '';

        // Cover page first
        var cover = buildCoverPage(items);
        bundle.appendChild(cover);

        // Sort newest-first so the printout matches the on-page order
        var sorted = items.slice().sort(function (a, b) { return b.savedAt - a.savedAt; });

        // Fetch each page's content in parallel
        var fetches = sorted.map(function (item) {
            return fetch(item.url, { credentials: 'same-origin', cache: 'no-cache' })
                .then(function (r) { return r.ok ? r.text() : ''; })
                .then(function (html) { return { item: item, html: html }; })
                .catch(function () { return { item: item, html: '' }; });
        });

        Promise.all(fetches).then(function (results) {
            results.forEach(function (result) {
                var article = buildPrintArticle(result.item, result.html);
                if (article) bundle.appendChild(article);
            });

            // Wait one frame so the DOM settles before opening the print dialog
            requestAnimationFrame(function () {
                window.print();
                // Re-enable the button — the print dialog may stay open for a while,
                // but the bundle stays in the DOM so re-prints work.
                btn.disabled = false;
                btn.innerHTML = originalLabel;
            });
        }).catch(function () {
            btn.disabled = false;
            btn.innerHTML = originalLabel;
            alert('Could not gather all pages. Check your connection and try again.');
        });
    }

    function buildCoverPage(items) {
        var cover = document.createElement('article');
        cover.className = 'notebook-print-page notebook-print-cover';

        var dateStr = new Date().toLocaleDateString(undefined, {
            year: 'numeric', month: 'long', day: 'numeric'
        });
        var count = items.length;
        var things = count === 1 ? 'shiny thing' : 'shiny things';

        cover.innerHTML =
            '<img class="notebook-print-magpie" src="/assets/img/magpie-dark.svg" alt="">' +
            '<p class="notebook-print-cover-eyebrow">FROM THE MAGPIE\'S NEST</p>' +
            '<h1 class="notebook-print-cover-title">A handful of<br>shiny things</h1>' +
            '<p class="notebook-print-cover-meta">' + count + ' ' + things + ', collected on ' + dateStr + '</p>' +
            '<p class="notebook-print-cover-source">From the Data Stewardship Handbook</p>';
        return cover;
    }

    function buildPrintArticle(item, html) {
        var article = document.createElement('article');
        article.className = 'notebook-print-page';

        // Header with section + title + URL
        var header = document.createElement('header');
        header.className = 'notebook-print-page-header';
        header.innerHTML =
            (item.section ? '<p class="notebook-print-section">' + escapeHtml(sectionLabel(item.section)) + '</p>' : '') +
            '<h1 class="notebook-print-title">' + escapeHtml(item.title) + '</h1>' +
            '<p class="notebook-print-source">' + escapeHtml(item.url) + '</p>';
        article.appendChild(header);

        // Body — extract from fetched HTML
        var body = document.createElement('div');
        body.className = 'notebook-print-body';

        if (html) {
            var doc;
            try {
                doc = new DOMParser().parseFromString(html, 'text/html');
            } catch (e) { doc = null; }

            if (doc) {
                var content = doc.querySelector('#content');
                if (content) {
                    // Strip pieces that don't belong on a printout
                    var unwanted = content.querySelectorAll(
                        '.notebook-toggle, #toc, nav#breadcrumb, .page-metadata, ' +
                        '#github-buttons-wrapper, .navigation-tiles, .info-card, ' +
                        '.info-collapse, script, style'
                    );
                    unwanted.forEach(function (el) { el.remove(); });

                    body.appendChild(content);
                } else {
                    body.innerHTML = '<p class="notebook-print-body-error">(content unavailable for this page)</p>';
                }
            }
        } else {
            body.innerHTML = '<p class="notebook-print-body-error">(could not load this page — visit ' + escapeHtml(item.url) + ' to read it online)</p>';
        }

        article.appendChild(body);
        return article;
    }
    function setupClearButton() {
        var btn = document.getElementById('notebook-clear');
        if (!btn) return;
        btn.addEventListener('click', clearAll);
    }

    // ---------- init ----------
    document.addEventListener('DOMContentLoaded', function () {
        setupToggleButton();
        setupPrintButton();
        setupClearButton();
        updateSidebarCounter();
        updateToggleButton();
        renderNotebookPage();
    });

    document.addEventListener('notebook:updated', function () {
        updateSidebarCounter();
        updateToggleButton();
        renderNotebookPage();
    });
})();
