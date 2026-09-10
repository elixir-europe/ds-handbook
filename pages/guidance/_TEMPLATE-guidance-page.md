---
# ============================================================================
# Guidance (signpost) template
# Copy the content of this file into your newly create page at pages/guidance/<your-page>.md and fill it in. Choose a page name that matches the conventions: g-shortname. 
# Required fields are marked (mandatory). Everything else is optional but 
# encouraged – the more you fill in, the more useful the guidance is to others.
#
# Some fields use a controlled vocabulary – you set a key, and the layout
# looks up the human-readable label from a YAML in _data/guidance/.
# If you need a value that isn't there, propose it in your Pull Request.
# ============================================================================

title: [add title]                 # mandatory – short, not a full sentence, be specific, align with file name, check existing pages for inspiration
layout: page                       # mandatory – leave as-is
type: Guidance                     # mandatory – leave as-is
search_exclude: true               # – leave as-is
contributors: [add names]          # mandatory – names must match _data/CONTRIBUTORS.yaml - if you or co-writers are not in yaml file, update it or propose it in your Pull Request - TODO: add location of yaml file
page_id: g-[shortname]             # mandatory – lowercase, hyphenated - this should match your page name

# ---------------------------------------------------------------------------
# At a glance box – populates the box at the top of the page. Easier to write last, once the rest of the page exists.

  # first tab
description: [add sentence]        # optional - one sentence, max 10-20 words, capturing the core outcome or insight of this page. Used in meta tags, search results - TO DO: change highlight box tab name
last update: [add date]            # date page last updated, substantial changes or last review, not typos etc, use ISO 8601
status: [add status]               # tag, choose from: in progress, in review, reviewed - TO: check with tech team for the controlled vocab/tags  
topics:                            # mandatory - include important keywords that will be useful for the user but also for search engine optimisation, add words that indicate the (sub)topic(s) of the page, use term in file x - TODO: create controlled vocabulary   
  - [topic 1]
  - [topic 2]
  - [topic 3]
who-to-involve:                    # optional – name a list of roles/people – need to create a controlled vocabulary inside _data/guidance
  - [role 1]
  - [role 2]
  - [role 3]

  # second tab
takeaways:                          # mandatory – write this once you have finished the page, 2-3 short bullet points containing the main takeaway message for the reader after going through the content on this page
  - [takeaway 1]
  - [takeaway 1]

# ---------------------------------------------------------------------------
# Cross-references – optional, rendered as a "Related pages" block at the bottom.
# Nested by type; each section becomes a row of slim tone-aware tiles.
# Type keys recognised: Guidance, Case_Study, Maturity_Indicator.
# e.g., 
# Guidance:
#    - g-writing-rdm-strategy
#  Case_Study:
#    - other-case-shortname
#  Maturity_Indicator:
#    - mm-strategy-defined
# ---------------------------------------------------------------------------
related_pages:
  [Type]:
    - [page_id]
  [Type]:
    - [page_id]

# ---------------------------------------------------------------------------
# Resources – render as tables (Templates / Internal /
# External) at the end of the page. 

# Add an inline entry resources:
#  - name: "Resource title"
#    url: https://example.org/resource
#    description: One-line context.
#    category: external_resource   # or template, internal_resource
# e.g., 
# resources:
#  - name: rdmkit
#    url: https://example.org/resource
#    description: One-line context – why this resource matters here.
# ---------------------------------------------------------------------------
resources:
  - name: [add name]
    url: [add URL]
    description: [Add sentence]
---


## Context
<!-- mandatory 
Instructions: 
- Mandatory, short paragraph (two to three sentences) explaining the relevance of the topic and its context
- Check DS Handbook Style Guide and How to Contribute (under About section)., a
- Additional paragraphs will be collapsable content

Consider ordering the steps if this is a linear manual using heading 3 for each step
- Consider different formats if the guidance is not linear or requires a more complex explanation
- Check DS Handbook Style Guide and How to Contribute (under About section).
- Make sure all to-do's are in the scope of the page, otherwise start a new page or re-adjust outcomes in the Top card.
# mandatory – Write a sentence or two before to-dos how to read this section, what is the order of the to-do's 

### To-do 1
 
It is a tip for data stewards not researchers.
It should be practical, feasible. 
Depending on the structure of your tips you could have different dificulties levels for different experience of data stewards.

### To-do 2

-->


## What to do
<!-- mandatory 
Instructions: 
- Consider ordering the steps if this is a linear manual using heading 3 for each step
- Consider different formats if the guidance is not linear or requires a more complex explanation
- Check DS Handbook Style Guide and How to Contribute (under About section).
- Make sure all to-do's are in the scope of the page, otherwise start a new page or re-adjust outcomes in the Top card.
# mandatory – Write a sentence or two before to-dos how to read this section, what is the order of the to-do's 

### To-do 1
 
It is a tip for data stewards not researchers.
It should be practical, feasible. 
Depending on the structure of your tips you could have different dificulties levels for different experience of data stewards.

### To-do 2

-->


## Quick checklist 
<!-- mandatory 
note to self: add feature of checklist (copy from ELITMa repo)
-->

<!--
  Don't add a `## Resources` heading here – the layout renders the
  `resources:` frontmatter list automatically as a table at the bottom
  of the page.
-->
