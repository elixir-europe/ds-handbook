---
title: How to contribute
description: A guide for adding signposts, campfires, and waypoints to the Data Stewardship Handbook.
contributors: [Xenia Perez Sitja]
page_id: how-to-contribute
---

<p class="section-eyebrow">§ FOR CONTRIBUTORS</p>

<p class="drop-cap">The handbook is built by data stewards, for data stewards. Every signpost, campfire, and waypoint comes from someone who's done the work and decided to write it down. If you've got a story, a pattern, or a hard-won lesson – we'd love to add it.</p>

This page walks you through what we're looking for, how to write in the handbook's voice, and how to actually get your contribution on the site.

{% include callout.html type="magpie" content="The handbook is open. There's no editorial board approving topics top-down – if a chapter is missing or thin, you're invited to fill it in." %}

## Who we're looking for

Three kinds of help, all welcome:

- **Writers** – data stewards (any level) with experience to share. You don't need to be senior to contribute. Often the most useful pages come from people who learned something the hard way last week.
- **Reviewers** – people who can read draft pages and tell us what's missing, unclear, or wrong. You don't have to write to help.
- **Designers and developers** – anyone who can improve the look-and-feel, accessibility, or tooling of the site itself.

## Pick your contribution

You can write in any of the three landmarks (or all of them, over time):

### 🪶 Write a Signpost

Step-by-step practical guidance on something you do – *"how to set up an institutional DMP service"*, *"how to run an RDM intake meeting"*. Signposts are the most-read content because they're often what data stewards open Google for. If you've solved a recurring problem, please write it down.

### 🪶 Light a Campfire

A case study from your institution. **Be specific** – readers want to know what your institution looks like, what you tried, what didn't work, and what you'd do differently. Generic advice goes in Signposts; **lived experience** goes here.

### 🪶 Plant a Waypoint

Propose or refine a maturity indicator. The maturity model lives in the [rdm-maturity-model](https://github.com/elixir-europe/rdm-maturity-model) repository – contributions there flow into this handbook automatically.

### 🪶 Just review

Open any page, hit the GitHub edit link in the metadata block at the bottom, and leave comments on a draft. The most useful reviews ask *"would I know what to do after reading this?"*

## Write in the handbook's voice

The handbook tries to sound like a colleague who's done this before – friendly, plain, practical. Not a policy document, not a research paper. Three rules of thumb:

{% include callout.html type="tip" content="Talk to your future self after a long week. Would the version of you on Friday-at-5pm find this useful, or would you skim past?" %}

1. **Tell us what you actually did.** Don't recite what other resources say. We can link to those. We want *your* take.
2. **Concrete > abstract.** "We held a 30-minute intake call with the PI before each new project" beats "We instituted a stakeholder-engagement protocol".
3. **Don't hide the rough bits.** A campfire that says "this didn't work and here's why" is more useful than one that says "everything went smoothly".

{% include callout.html type="warning" content="Avoid copy-pasting policy text from your institution's intranet. Quote it briefly, link to the source, and tell us what it means in practice." %}

## Reusable components

The handbook has a small set of editorial components you can drop into any page. Use them to give your writing structure and personality.

### Callouts

Five flavours, all spoken by the magpie. Pick the type that matches the *intensity*: `tip` for friendly suggestions, `note` for context, `important` for things that need attention, `warning` for things that can cause real harm, `magpie` for the mascot's voice in general asides.

```liquid
{% raw %}{% include callout.html type="tip" content="Skim the campfires for nearest-fit institutions before reinventing the wheel." %}

{% include callout.html type="note" content="The maturity model has three levels per indicator." %}

{% include callout.html type="important" content="Always cite this handbook when adapting its content elsewhere." %}

{% include callout.html type="warning" content="Don't share patient data without DPIA approval, no matter how anonymous it looks." %}

{% include callout.html type="magpie" content="When in doubt, ask the data producer themselves." %}{% endraw %}
```

**Renders as:**

{% include callout.html type="tip" content="Skim the campfires for nearest-fit institutions before reinventing the wheel." %}

{% include callout.html type="note" content="The maturity model has three levels per indicator." %}

{% include callout.html type="important" content="Always cite this handbook when adapting its content elsewhere." %}

{% include callout.html type="warning" content="Don't share patient data without DPIA approval, no matter how anonymous it looks." %}

{% include callout.html type="magpie" content="When in doubt, ask the data producer themselves." %}

{% include callout.html type="tip" content="Use callouts sparingly. A page with one callout reads like a chapter; a page with eight reads like an alarm system." %}

### Drop cap

Open a chapter intro with a Bricolage drop cap – gives the page weight and editorial character.

```html
<p class="drop-cap">First paragraph of your chapter goes here. The first letter renders large in the brand's amber-brick.</p>
```

**Renders as:**

<p class="drop-cap">First paragraph of your chapter goes here. The first letter renders large in the brand's amber-brick. Use this only on the lede paragraph of a chapter – it loses meaning if every section opens with one.</p>

### Section eyebrow

A small mono uppercase eyebrow above a heading – useful for chapter labels and section markers. Tone variants pick up landmark colour: `tone--signposts`, `tone--campfires`, `tone--waypoints`, `tone--amber`.

```html
<p class="section-eyebrow">§ TRAIL NOTES</p>
<p class="section-eyebrow tone--signposts">§ SIGNPOSTS</p>
<p class="section-eyebrow tone--campfires">§ CAMPFIRES</p>
<p class="section-eyebrow tone--waypoints">§ WAYPOINTS</p>
<p class="section-eyebrow tone--amber">§ AMBER</p>
```

**Renders as:**

<p class="section-eyebrow">§ TRAIL NOTES</p>
<p class="section-eyebrow tone--signposts">§ SIGNPOSTS</p>
<p class="section-eyebrow tone--campfires">§ CAMPFIRES</p>
<p class="section-eyebrow tone--waypoints">§ WAYPOINTS</p>
<p class="section-eyebrow tone--amber">§ AMBER</p>

### Margin note

A handwritten Caveat aside that sits in the margin. Useful for a tiny detail that would interrupt the main flow.

```html
<aside class="margin-note">A small handwritten aside, like a sticky note.</aside>
```

**Renders as:**

<aside class="margin-note">A small handwritten aside, like a sticky note. Tilted slightly so it feels stuck on, not typeset.</aside>

### Pull quote

For when something a colleague said deserves to stand on its own. Don't use it for your own copy – it's for *quoting*.

```html
<blockquote class="pull-quote">
  <p>The hardest part of data stewardship isn't the data – it's the conversations around the data.</p>
  <cite>A senior data steward, somewhere in Europe</cite>
</blockquote>
```

**Renders as:**

<blockquote class="pull-quote">
  <p>The hardest part of data stewardship isn't the data – it's the conversations around the data.</p>
  <cite>A senior data steward, somewhere in Europe</cite>
</blockquote>

### Saving and printing

Your readers can save any page to **the magpie's nest** (a browser-side reading list), and print the lot as a PDF. You don't need to do anything to enable it – every published chapter gets the bookmark button automatically.

## Submitting a contribution

We work on GitHub. The flow is the standard fork-and-PR:

1. **Fork** the [Data Steward Handbook repository](https://github.com/elixir-europe/ds-handbook) on GitHub.
2. **Clone** your fork locally and make a branch named after your contribution (e.g. `signpost/intake-meetings`).
3. **Add yourself** to `_data/CONTRIBUTORS.yaml` if you're not already there.
4. **Write your page** in the right folder:
   - Signposts → `pages/guidance/`
   - Campfires → `pages/case-studies/`
   - About / meta → `pages/about/`
5. **Add the right front matter** at the top of the file (see existing pages for examples – `title`, `type`, `description`, `contributors`, `page_id` are the minimum).
6. **Open a Pull Request** against `main`. The site builds a preview automatically; you'll get a link in the PR comments.
7. **Reviewers** will give feedback. Once two contributors approve, we merge.

{% include callout.html type="note" content="If you're not comfortable with Git, [open an issue](https://github.com/elixir-europe/ds-handbook/issues) describing your contribution. Someone will help turn it into a PR with you." %}

## What's out of scope

Some things belong in sister projects:

- **Researcher-facing how-tos** → [RDMkit](https://rdmkit.elixir-europe.org/)
- **FAIR principle recipes** → [FAIR Cookbook](https://faircookbook.elixir-europe.org/)
- **Data Management Plan templates** → [DSW](https://ds-wizard.org/)
- **Standards / databases / policies registry** → [FAIRsharing](https://fairsharing.org/)
- **Training courses and materials** → [TeSS](https://tess.elixir-europe.org/)
- **Content for non-steward roles** (DPOs, security officers, funders) → wherever those communities maintain their own resources

When in doubt, link to the existing resource and add the steward-specific context here.

## Get help

Stuck on the GitHub flow, the editorial voice, or the scope of your contribution? Reach out:

- **Co-leads:** [Mijke Jetten](mailto:mijke.jetten@health-ri.nl) (ELIXIR-NL)
- **GitHub issues:** [github.com/elixir-europe/ds-handbook/issues](https://github.com/elixir-europe/ds-handbook/issues)
- **Editorial style guide:** [Style guide](/style-guide)

{% include callout.html type="magpie" content="The handbook only works because people keep adding to it. Thank you in advance – yours is the next chapter." %}
