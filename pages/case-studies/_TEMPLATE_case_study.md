---
# ============================================================================
# Case study (campfire) template
# Copy this file into pages/case-studies/<your-case>.md and fill it in.
# Required fields are marked (mandatory). Everything else is optional but
# encouraged — the more you fill in, the more useful the case is to others.
#
# Some fields use a controlled vocabulary — you set a key, and the layout
# looks up the human-readable label from a YAML in _data/case_study/.
# If you need a value that isn't there, propose it in your PR rather than
# inventing one inline (so filtering and counts stay consistent).
# ============================================================================

title: "Case study title"          # mandatory — short, specific
layout: case-study                 # mandatory — leave as-is
type: [Case Study]                 # mandatory — leave as-is
search_exclude: true               # remove this line when ready to publish

# 20–30 words. Used in meta tags, search results, and the highlights box at
# the top of the page. Easier to write last, once the rest of the page exists.
description: One or two sentences capturing the core outcome or insight of this case.

contributors: [Your Name]          # mandatory — names must match _data/CONTRIBUTORS.yaml
page_id: case-study-shortname      # mandatory — lowercase, hyphenated

# ---------------------------------------------------------------------------
# Context card — populates the at-a-glance box at the top of the page.
# Fields tagged [vocab] use a key from _data/case_study/<file>.yml.
# Fields tagged [free] are typed verbatim by you.
# ---------------------------------------------------------------------------

lead_org: "Your institution"       # [free] main org behind the work
country: FI                        # [vocab] countries.yml — 2-letter key
# If your ELIXIR node matters, mention it inside lead_org — e.g. "CSC (ELIXIR-FI)".

partners:                          # [free] optional — vendors, universities, funders
  - "Partner A"
  - "Partner B"

# Pick the right size of the work.
# individual | team | institutional | national | international
scale: institutional               # [vocab] scales.yml

# Pick the discipline the work ORIGINATED in, not who could adapt it later.
# life-sciences | physical-sciences | humanities | cross-domain | domain-agnostic
domain: life-sciences              # [vocab] domains.yml

# One or more — pick the PROBLEMS this case addresses, not the solution.
# Full list in themes.yml: training-gap, unclear-roles, policy-gap,
# tooling-gap, sustainability, legal-compliance, stakeholder-engagement,
# community-building.
themes:                            # [vocab] themes.yml
  - tooling-gap
  - stakeholder-engagement

start: 2024                        # [free] year the work began

# Lifecycle of the work today.
# active | evolved | paused | archived
status: active                     # [vocab] outcome_status.yml

# Optional link to the official activity / project page outside this
# handbook (the institutional page, the funder page, the project site).
# Renders as a "Visit the activity page" link inside the context card.
# Override the link text with `external_url_label` if you need to.
external_url: https://example.org/activity
external_url_label: Visit the activity page

# ---------------------------------------------------------------------------
# Lead quote — one sentence you wish someone had told you at the start.
# Renders as a pull-quote near the top. Skip if you can't think of one.
# ---------------------------------------------------------------------------
lead_quote: The single most useful thing we learned, in one sentence.

# ---------------------------------------------------------------------------
# Cross-references (optional but encouraged) — page_ids of related guidance
# pages and maturity indicators. Both render as a "Related" block at the
# bottom of the page.
# ---------------------------------------------------------------------------
# Cross-references — rendered as a "Related pages" block at the bottom.
# Nested by type; each section becomes a row of slim tone-aware tiles.
# Type keys recognised: Guidance, Case_Study, Maturity_Indicator.
related_pages:
  Guidance:
    - g-writing-rdm-strategy
  Case_Study:
    - other-case-shortname
  Maturity_Indicator:
    - mm-strategy-defined

# ---------------------------------------------------------------------------
# Resources — external links worth keeping handy. Render as a structured
# table at the end of the page (no need for a `## Resources` section in
# the body). Keep the list short and specific.
# ---------------------------------------------------------------------------
resources:
  - name: "Resource title"
    url: https://example.org/resource
    description: One-line context — why this resource matters here.
---


## Why this case (mandatory)

What problem or gap did this work address, and why was it worth doing?
Set up enough institutional context that a reader from a different
country or sector can follow.

- What was the situation before?
- Who was affected (researchers, stewards, leadership)?
- Why now — what made this the moment to act?

Two or three short paragraphs. Don't recite policy — tell the story of
the gap. Concrete details (sizes, dates, the specific incident that
triggered it) help more than abstractions.


## What we did (mandatory)

The actual approach. Walk through what you tried, in roughly the order
you tried it. Bring people and tools in as they appear — no need for a
separate "stakeholders" or "tools" section.

- What was the first move?
- Which tools, frameworks, or existing resources did you use? (e.g.
  RDMkit pages, DSW templates, internal SOPs, the FAIR Cookbook)
- How were researchers / leadership / partners engaged at each step?
- Was this brand-new, or built on something existing?
- Roughly how much effort was involved (FTE, calendar time)?

Be concrete. *"We held a 30-minute intake call with the PI before each
new project"* beats *"We instituted a stakeholder-engagement protocol"*.
If you got something wrong and pivoted, say so here — the pivot is part
of the story.


## What changed (encouraged)

What's different now? Concrete outputs are most useful — a training
course delivered, a workflow adopted, a policy written, a tool deployed,
a number that moved.

- What was produced or implemented?
- What's the evidence it worked? (uptake numbers, feedback, metrics,
  anecdotes — all valid; pick what you actually have.)
- What barriers came up, and which factors helped you push through?
  (Leadership backing, an existing community, a deadline, a champion?)

If the work hasn't produced visible change yet, say so — *"too early to
tell, will revisit in 12 months"* is a fine answer when it's honest.
Better than reaching for impact that isn't there.


## What we'd tell others (mandatory)

The lesson, the caveats, the conditions for replication, and what
happens next — bundled because they overlap in practice.

- **What worked, and why.** The one or two things you'd repeat without
  hesitation if you were starting over.
- **What didn't work, and how you adapted.** The corner you painted
  yourself into. Future contributors learn most from these.
- **Transferability and scaling potential.** Can this approach be reused
  by another institution or individual? What conditions are required
  (leadership buy-in, existing service, specific funding, a particular
  legal context)? What adaptations might be needed? Be honest about
  what was special about your setting.
- **Sustainability and next steps.** How is the work currently supported
  or funded? Who maintains or owns it? What are the plans for
  continuation, embedding, or scaling? If continuity is uncertain, say
  so.


<!--
  Don't add a `## Resources` heading here — the layout renders the
  `resources:` frontmatter list automatically as a table at the bottom
  of the page.
-->
