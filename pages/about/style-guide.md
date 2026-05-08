---
title: Style guide
description: How the Data Stewardship Handbook reads, looks, and behaves – voice, typography, palette, components, accessibility.
contributors: [Xenia Perez Sitja]
page_id: style_guide
---

<p class="section-eyebrow">§ STYLE GUIDE</p>

<p class="drop-cap">This is how the handbook reads and looks. The voice rules apply to everyone writing content; the visual rules apply to anyone touching the design system. Most of it is practical – short rules with examples – and there's a copy-pasteable kit of components for contributors.</p>

This guide is built on top of the [RDMkit style guide](https://rdmkit.elixir-europe.org/style_guide), the European Commission's [Web Writing Style Guide](https://wikis.ec.europa.eu/display/WEBGUIDE/02.+Web+writing+guidelines), and the [English Style Guide](https://commission.europa.eu/system/files/2023-01/styleguide_english_dgt_en.pdf). When in doubt, defer to those.

## Voice and tone

The handbook sounds like a colleague who's done the work before – friendly, plain, practical. Not a policy document, not a research paper, not a marketing site.

Five rules of thumb:

1. **Talk to your future self after a long week.** If the version of you who's tired on Friday-at-5pm wouldn't read past the first paragraph, rewrite it.
2. **Use "you" and "we".** Address the reader directly. Don't write *"the data steward should…"* when you mean *"you should…"*.
3. **Concrete beats abstract.** *"We held a 30-minute intake call with the PI before each new project"* beats *"We instituted a stakeholder-engagement protocol"*.
4. **Say what didn't work.** Lessons learned are more useful than wins.
5. **Cut bureaucratic stuff.** Words like "leverage", "utilise", "stakeholders" earn their place by being more accurate than the simpler word, not less.

{% include callout.html type="tip" content="Read your draft aloud. If you stumble, rewrite that sentence. Sentences that read well aloud read well silently too." %}

## Language

- **British English.** Colour, organise, behaviour, programme.
- **Short sentences and short paragraphs.** 3-4 sentences per paragraph as a rule of thumb.
- **Active voice.** *"We send the consent form to the PI"* – not *"The consent form is sent to the PI"*.
- **No jargon without unpacking.** First mention of a term gets a quick definition or a link. *"…the [DMP (data management plan)](https://rdmkit.elixir-europe.org/data_management_plan) we wrote in 2023…"*.
- **Don't capitalise role titles** unless they're proper nouns. *"data steward"*, not *"Data Steward"*.

## Page structure

Every chapter follows the same skeleton:

1. **Title** (H1) – one per page, set in the front matter as `title:`.
2. **Front matter:** description, contributors, page_id, type.
3. **Lede paragraph** – what this page is about, in one or two sentences. Optionally with a `.drop-cap` for chapter-opener feel.
4. **Body** broken into H2 sections for the major moves, H3 for sub-points.
5. **Don't use H1 inside the body** – Jekyll renders the front-matter `title:` as the H1.
6. **Internal links** – use full paths from the site root, e.g. `[case studies](/case-studies)`.

## Typography

The handbook runs on four fonts. Each one earns its keep:

| Font | Role | Where it shows up |
|---|---|---|
| **Bricolage Grotesque** | Display + headings | H1, H2, H3, door titles, sidebar trailhead title |
| **Inter** | Body, UI | All body paragraphs, list items, the topnav, buttons |
| **JetBrains Mono** | Data accents | Code, page IDs, mono labels, eyebrows, breadcrumbs |
| **Caveat** | Marginalia | Taglines, callout type labels, the magpie's voice, footer headline |

You don't choose the font as a writer – pages render in the right font automatically. But understanding the system helps when you write copy for a specific role (e.g. a Caveat-style aside reads as the magpie's voice; mono labels read as data).

## Colour palette

Trailhead – modern outdoor handbook, greens grounded with amber and brick.

| Token | Hex | Role |
|---|---|---|
| **Ink** | `#1F3A2E` | Body text, dark surfaces, footer |
| **Sage** | `#6B9E7E` | Surface accents, Waypoints landmark |
| **Spring** | `#C7E8B5` | Highlights, the backlight effect, Signposts landmark |
| **Amber** | `#E8B547` | Surface fills, decorative accents |
| **Brick** | `#C44536` | Campfires landmark, link colour |
| **Cream** | `#F4EFE4` | Body background |
| **Paper** | `#FFFFFF` | Cards, sidebars floating on cream |
| **Rule** | `#E0DACE` | Hairlines, dividers |

### Text-safe variants

Surface colours (sage, amber, brick at full saturation) **don't pass WCAG AA contrast on cream**, so we use deeper variants whenever a colour appears as text:

| Surface | Text-safe variant | Contrast on cream |
|---|---|---|
| `#6B9E7E` Sage | `#3F6B52` Sage-text | 6.5:1 ✓ AA |
| `#E8B547` Amber | `#8C6516` Amber-text | 5.8:1 ✓ AA |
| `#C44536` Brick | `#B03828` Brick-text | 5.4:1 ✓ AA |

{% include callout.html type="important" content="If you're adding new components, never use the surface variant as a text colour. The compiled CSS already routes text through the safe variants – don't override that." %}

## The three landmarks

The handbook is organised into three landmarks. Each has its own colour identity. We use the matching tone when writing about that section. This is automatically embedded in the tempaltes but you may consider this for images and other items. 

| Landmark | Section | Tone colour | Where you'd write |
|---|---|---|---|
| **🪶 Signposts** | Guidance | Sage | `pages/guidance/` |
| **🪶 Campfires** | Case studies | Brick / Amber | `pages/case-studies/` |
| **🪶 Waypoints** | Maturity model | Sage | (in the maturity-model submodule) |

## The magpie's voice

The magpie is the handbook's mascot – observant, curious, a careful collector. Writing in the magpie's voice means short, friendly, slightly informal asides. Use callouts to give the magpie a turn:

- **`tip`** – encouraging suggestion
- **`note`** – context, an aside
- **`important`** – needs attention
- **`warning`** – actual harm risk
- **`magpie`** – generic mascot voice

{% include callout.html type="magpie" content="The magpie should appear when an aside genuinely helps. A page with 1-3 callouts reads like a chapter; a page with eight reads like an alarm system." %}

## Accessibility

**Always**:

- **Add alt text** to images. Decorative ones get `alt=""` and `aria-hidden="true"`. Meaningful ones get a real description.
- **Use descriptive link text.** "Read the [DMP guidance](/g-writing-rdm-strategy)" – not "[click here](/g-writing-rdm-strategy)".
- **Don't rely on colour alone** to convey meaning. The landmark colour is a hint; the icon and the label do the work.
- **Headings in order.** Don't skip levels (H2 → H4). Screen readers use them as a table of contents.
- **Test the contrast.** All text uses the safe colour variants – if you add a new component, run it through a contrast checker.

## Reusable components

For the full kit of editorial components (callouts, drop-cap, section-eyebrow, margin-note, pull-quote) with copy-pasteable code and rendered examples, see the [contributing guide](/how-to-contribute#reusable-components).

## Images and figures

- **Diagrams** are encouraged – they often communicate faster than prose. Save them as SVG when possible. But remember that all content in the diagram should also be somewhere else in the text. They don't replace text; only help understand. 
- **Screenshots** belong in case studies more than in signposts. Crop tight; don't include browser chrome unless it matters.
- **No stock photography.** The handbook's identity is illustration + typography + the magpie. Stock photos break the voice, tone and style.

## Linking out

Be generous with links to sister projects, but ensure the links are added at the bottom of the page. Links across the entire page distract, they don't help. For example:

- [RDMkit](https://rdmkit.elixir-europe.org/) – researcher-facing RDM
- [FAIR Cookbook](https://faircookbook.elixir-europe.org/) – FAIR principle recipes
- [DSW](https://ds-wizard.org/) – data management plan tool
- [FAIRsharing](https://fairsharing.org/) – standards / databases / policies
- [TeSS](https://tess.elixir-europe.org/) – training resources
- [Turing Way](https://book.the-turing-way.org/) – handbook for reproducible research

Add them all to the front matter, and always link to the most specific page, not just the homepage. **Don't duplicate their content here**.

## When in doubt

- Read two or three existing chapters before writing yours. The voice will rub off.
- Open a draft PR early – feedback is faster on a half-written page than on a polished one.
- Ask in a [GitHub issue](https://github.com/elixir-europe/ds-handbook/issues) if you're not sure where something belongs.
