---
# ============================================================================
# Signpost (Guidance) template
# Copy this file to pages/guidance/g-<shortname>.md and fill it in.
# Fields marked (mandatory) are required. Everything else is optional.
# Write in line with the DS Handbook Style Guide (About > Style guide).
# ============================================================================

title: [add title]                 # mandatory – short, not a full sentence, specific; align with file name
layout: guidance                   # mandatory – leave as-is
type: Guidance                     # mandatory – leave as-is
search_exclude: true               # leave as-is
contributors: [add names]          # mandatory – comma separated list, names must match _data/CONTRIBUTORS.yaml; add missing names in your Pull Request; yaml file is located under data > sidebars > file CONTRIBUTORS
page_id: g-[shortname]             # mandatory – lowercase, hyphenated, same as the file name

# ---------------------------------------------------------------------------
# At a glance box – three tabs at the top of the page. Easiest to write last.
# ---------------------------------------------------------------------------

# Tab 1: At a glance
description: [add sentence]        # mandatory – one sentence (10–20 words) on the core outcome of the page; also used in search results
last_update: [YYYY-MM-DD]          # mandatory – date of the last substantial change or review (ISO 8601), not typo fixes
topics:                            # mandatory – 3–5 short keywords for readers and search engines
  - [topic 1]                      # free text; if a term comes from Terms4FAIRskills (https://terms4fairskills.github.io/) or ESCO (https://esco.ec.europa.eu/en/classification/skills), add its ID as a comment
  - [topic 2]
  - [topic 3]

# Tab 2: Introduced skills
skills:                            # mandatory – 3–5 skills; use the exact ESCO label, and make sure it is listed in _data/guidance/skills.yml (add it there in your Pull Request if not – see var/esco_skill.py)
  - [skill 1]                      # e.g. evaluate training   # http://data.europa.eu/esco/skill/728ad40d-4a79-4b4d-b77b-a48d094d73fa
  - [skill 2]
  - [skill 3]

# Tab 3: Takeaways
takeaways:                         # mandatory – 2–3 short bullets with the main message of the page; write these last
  - [takeaway 1]
  - [takeaway 2]
  - [takeaway 3]

# ---------------------------------------------------------------------------
# Related pages – optional, shown as tiles at the bottom of the page.
# Use page_ids. Type keys: Guidance, Case_Study, Maturity_Indicator.
# Delete the types you don't use.
# ---------------------------------------------------------------------------
related_pages:
  Guidance:
    - [g-page-id]
  Case_Study:
    - [case-study-page-id]
  Maturity_Indicator:
    - [mm-page-id]

# ---------------------------------------------------------------------------
# Resources – optional, shown as a table at the bottom of the page.
# Only add Resources in this section, not in the text body.
# category: external_resource, internal_resource or template
# ---------------------------------------------------------------------------
resources:
  - name: [resource title]
    url: [https://...]
    description: [one line on why this resource is useful here]
    category: [category]
---

[Intro – mandatory. Two or three sentences on why this topic matters and its context. Address the reader as "you".]

[Reading guide – mandatory. One or two sentences on how to read the sections below and whether the order matters.]

## [Activity title]
[One sentence explaining the activity.]

### [Tip title]
[Explain the tip in a few short sentences. Tips are for data stewards, not researchers. Keep them practical and feasible.]

### [Tip title]
[Explanation of the tip.]

## [Activity title]
[One sentence explaining the activity.]

### [Tip title]
[Explanation of the tip.]

### [Tip title]
[Explanation of the tip.]
