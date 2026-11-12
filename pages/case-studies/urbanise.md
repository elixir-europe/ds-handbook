---
# ============================================================================
# Case study (campfire) template
# Copy this file into pages/case-studies/<your-case>.md and fill it in.
# Required fields are marked (mandatory). Everything else is optional but
# encouraged – the more you fill in, the more useful the case is to others.
#
# Some fields use a controlled vocabulary – you set a key, and the layout
# looks up the human-readable label from a YAML in _data/case_study/.
# If you need a value that isn't there, propose it in your PR rather than
# inventing one inline (so filtering and counts stay consistent).
# ============================================================================

title: "When your research community is a whole city: The URBANISE Project"
layout: case-study                 # mandatory – leave as-is
type: Case Study                   # mandatory – leave as-is
search_exclude: true               # – leave as-is

description: "The URBANISE (Urban Research and Data Stewardship for Innovation, Sustainability and Engagement) project funds a transdisciplinary data steward. Challenges include networking and providing support for diverse stakeholders; it highlights the importance of onboarding and personal connections."

contributors: [Jeanne Wilbrandt]          # mandatory – names must match _data/CONTRIBUTORS.yaml
page_id: urbanise      # mandatory – lowercase, hyphenated

# ---------------------------------------------------------------------------
# Context card – populates the at-a-glance box at the top of the page.
# Fields tagged [vocab] use a key from _data/case_study/<file>.yml.
# Fields tagged [free] are typed verbatim by you.
# ---------------------------------------------------------------------------

lead_org: "University of Vienna: Research and Publication Services of the University Library and Research Services and Career Development" 
country: AT                        # [vocab] countries.yml – 2-letter key

partners: "Funded by the Austrian Research Promotion Agency (FFG)"                # [free] optional – vendors, universities, funders as a list

scale: individual               # [vocab] scales.yml

domain: cross-domain             # [vocab] domains.yml

# One or more – pick the PROBLEMS this case addresses, not the solution.
# Full list in themes.yml: training-gap, unclear-roles, policy-gap,
# tooling-gap, sustainability, legal-compliance, stakeholder-engagement,
# community-building.
themes:                            # [vocab] themes.yml
  - careers
  - stakeholder-engagement

start: 2026                        # [free] year the work began

status: active                     # [vocab] outcome_status.yml

# Project website
external_url: https://urbanise.univie.ac.at
external_url_label: Visit the URBANISE page

# ---------------------------------------------------------------------------
# Lead quote – one sentence you wish someone had told you at the start.
# Renders as a pull-quote near the top. Skip if you can't think of one.
# ---------------------------------------------------------------------------
lead_quote: Working as a transdisciplinary data steward with city and research stakeholders adds a broader networking focus to skills also used by embedded data stewards.

# ---------------------------------------------------------------------------
# Cross-references (optional but encouraged) – page_ids of related guidance
# pages and maturity indicators. Both render as a "Related" block at the
# bottom of the page.
# ---------------------------------------------------------------------------
# Cross-references – rendered as a "Related pages" block at the bottom.
# Nested by type; each section becomes a row of slim tone-aware tiles.
# Type keys recognised: Guidance, Case_Study, Maturity_Indicator.
related_pages:
  Guidance:
    - g-support-rdm-information
#  Case_Study:
#    - other-case-shortname
#  Maturity_Indicator:
#    - mm-strategy-defined

# ---------------------------------------------------------------------------
# Resources – render as ELITMA-style tables (Templates / Internal /
# External) at the end of the page. Two ways to add an entry:
#
# 1. Reference an ID from _data/tool_and_resource_list.yml (preferred
#    for shared resources like RDMkit, FAIR Cookbook, DSW…):
#
#        resources: [rdmkit, fair-cookbook, ssi]
#
# 2. Add an inline entry for one-off resources unique to this case study
#    (the SOP, the grant reference, the institutional URL):
#
#        - name: "Resource title"
#          url: https://example.org/resource
#          description: One-line context.
#          category: external_resource   # or template, internal_resource
#
# Both forms can be mixed in the same list.
# ---------------------------------------------------------------------------
resources:
  - name: "Vienna's Research Questions"
    url: https://www.digital.wienbibliothek.at/urn/urn:nbn:at:AT-WBR-1937995
    description: The City of Vienna actively invites urban researchers to collaborate.
  - name: "EU Mission: Climate-Neutral and Smart Cities"
    url: https://research-and-innovation.ec.europa.eu/funding/funding-opportunities/funding-programmes-and-open-calls/horizon-europe/eu-missions-horizon-europe/climate-neutral-and-smart-cities_en
    description: Contextualizes the project and provides the funding rationale.
---


## Why this case

How do you begin RDM support when the “research community” is not a department or discipline, but an emerging 
network across a university, a city, public bodies, industry and civil society? 

Data stewards often support a defined research community: one lab, department, faculty or discipline and are thus embedded. Most 
RDM guidance, training and service models assume that this community already exists. 

My role starts somewhere less settled. I work in a two-year project linked to the EU Mission for climate-neutral 
and smart cities. The work brings together urban researchers from different parts of the University of Vienna with people 
outside academia, including city administration, funders, infrastructure providers, industry partners and, in 
some cases, community groups. 

This changes the stewardship task. I still support familiar RDM work, such as data management plans (DMPs), 
documentation, sharing and curation. Additionally, I also need to help people find each other, understand each other’s 
work and recognise where their data may connect. 

Good RDM will not make a city climate-neutral by itself. It can, however, make research evidence easier to find, 
understand, assess and reuse across projects and organisational boundaries. 

I tell this story because this role is still unusual. It shows what happens when a data steward moves from a 
disciplinary setting into a transdisciplinary network that is still being built.  

> The following terms are often used loosely, so here is how I use them in this case study: 
> - **embedded data steward**: a steward who works mainly with one faculty, department, institute or research community;
> - **disciplinary**: work grounded in one research field and its methods, standards and practices;
> - **interdisciplinary**: researchers from different disciplines work together;
> - **transdisciplinary**: research also involves people outside academia, such as public bodies, industry, community groups or citizens. 
>
> In practice, the boundaries blur. The point is not to sort people into neat boxes, but to notice when your usual support model no longer fits. 
>
> Side note: A steward can be embedded and still work across disciplines. My role, in contrast, is designed to move between communities.


## What we did

Hi! I just sat down for a break here, my path is still ahead of me. However, I can already tell 
you about some bumps in the road. I will come back some time and tell you the rest of the tale. 

### The Setting 
Most data steward roles start with a defined community: a faculty, institute, department 
or research group. My role started with a much less tidy question: who needs to work together to 
support data-informed research on climate-neutral cities? 

So, within the University of Vienna, there is a network of embedded data stewards with a central 
coordination. However, urban research spans many faculties and reaches beyond the University, and 
so they wanted to start an experiment: what if a data steward is not fixed to one department or 
somesuch but floating across and through the many areas. Funding was found and a project position 
was created for the duration of 2 years. 

They hired me, a seasoned data steward with life science background, and threw me right in.   

The project team brings together a data steward, the coordinator of the data steward network, a 
technology transfer lead and a colleague working on the EU Mission. Our work includes RDM support 
for selected projects, connections between relevant people and organisations, and training for 
people involved in the Mission, i.e., urban research. 

This is an experiment for all of us. There was no established service model, contact list or 
workflow to inherit. We knew the broad aim. We still had to work out who needed to be involved, 
what support they needed and where RDM could make a practical difference. 

This case study captures the beginning of that work. It is too early to claim long-term impact 
but not too early to share the setup work, the pressure points and the choices we are making. 

{% include callout.html type="note" content="A fixed-term project can be a useful place to test 
a new service model. It can also make continuity difficult. We started planning for handover and 
potential long-term ownership early, even though we do not yet have all the answers." %}

### First moves and starting difficulties 

#### Onboarding 
My first task was onboarding. This included the usual practical work, but it also meant learning a 
new university, a new city and new research environments. Joining the team of data stewards was the most fun! 
 
I met key people in informal one-hour conversations. These meetings helped me grasp their work, 
their priorities and the networks they already relied on. They also made my new role visible. In a 
new transversal role, people need to know not only who you are, but why they might want to talk to you. 
 
An ally who can make introductions is especially valuable. In my case, colleagues from the data 
steward network and the project team opened doors that I would not have known existed. Their introductions 
carried more weight than a general announcement email. 

<aside class="margin-note">A short introduction from a trusted colleague can be more impactful than a webpage, 
  launch event or flyer. </aside>
 

#### Preparing three versions of my introduction 
I found it useful to prepare three versions of my introduction: 

- one-sentence version for handshakes; 
- 30-second version for new contacts; 
- two-minute version for people who wanted to know how the role connected to their work.

Instead of trying to explain RDM in its entirety or the general role of data stewards, the crucial 
message is rather what I could help with and why that might matter to the person in front of me. Only 
when people are interested then, it makes sense to expand on the available options. 

#### Building a contact map 
My main practical task in the first months was building a contact map. I needed a clearer 
picture of who was already active in urban research, what they worked on, which data questions 
they faced and where existing connections already existed. 
 
This was more difficult than it sounds. In one department, people usually know who does what. Across 
a whole university and a city-wide network, that shared map does not exist. I was working to identify 
and eventually reach group leaders and researchers, research support staff, repository and infrastructure 
providers, funders, city administration, industry contacts and community initiatives at the same time. 
 
For each contact, I record only information that is useful for the work and appropriate to keep, 
standardized with a template. I avoid storing personal impressions or information 
that does not have a clear purpose. The template remains under review: if a field does not help to 
make a decision or follow up, I will remove it eventually. 

The contact template for people includes:  
- name and professional role;  
- organisation or department;  
- area of work;  
- relevant projects, networks or infrastructures;  
- data or RDM topics mentioned in conversation;  
- public or agreed contact route;  
- links to related people, projects and events;  
- next action and date of last update.  
 
The contact map is a working tool, not a directory of everyone connected to urban research. Here, 
deciding what information is needed, keeping it proportionate and making links between people, projects 
and services visible is key to a useful map. It should help me prepare introductions, spot missing 
connections, and plan events targeted to connect or inform specific groups from the contact map. 

{% include callout.html type="important" content="A relationship map contains personal data. Before you build one, 
agree where it will be stored, who can access it, what information is necessary, how long you will retain it and 
how you will keep it up to date. Follow your organisation’s data protection and information security rules." %}

I expect the first version of the map to take several months to build. Keeping it current will be 
ongoing work, not a one-off task. 

#### Choosing a tool 
I chose Obsidian as central note taking tool and to build the first version of the contact map 
because it lets me keep all kinds of notes (i.e., contact info alongside other notes and background 
info) in Markdown format and link people, projects, organisations and topics in a wiki-like way. The 
structured template for contacts (see above) ensures that entries are consistent and can be easily 
displayed and filtered in a tabular way using the native Bases-Plugin. Obsidian may or may not remain 
the right tool as the work grows. 

### What was difficult from the start 
The work is difficult because the community, the service model and the working relationships are 
all still taking shape at the same time. Additionally, the short project timeline, discipline differences 
and the aim beyond the university pose expectable difficulties. 

#### A two-year project creates a different kind of pressure 
An embedded steward can build relationships over years while a two-year project has clearer deadlines, 
formal deliverables and a more uncertain future. This necessitates to prioritise carefully and decline 
intensive one-to-one support to every possible urban research project. At the same time, a programme 
made only of events can remain too general to change day-to-day practice. 

There is a balance to be found. For now, I combine on-demand targeted support offers and training input for selected 
projects with broader events that help people meet, compare approaches and see where RDM matters in the wider Mission. 

#### Different disciplines use familiar words differently 
Urban research can involve life sciences, social sciences, humanities, engineering, planning and other fields. 
These disciplines may use the same words while meaning different things. For example, “data”, “consent”, “metadata”, 
“validation” or even “sharing” can carry different practical expectations. A method that is routine in one field 
may be unfamiliar or inappropriate in another. 
 
This makes the data steward’s translator role more visible. I need to understand enough of each context to ask useful 
questions, while avoiding the assumption that one discipline’s workflow should become the default for everyone else. 

{% include callout.html type="tip" content="When someone uses a familiar term, do not assume you know its implications. 
Ask for an example: What would that look like in your project?" %}

#### Working beyond the university changes the conversation 
External partners may have different timelines, language, incentives and ways of making decisions. A city 
official may need a short, practical answer for a current policy question. A researcher may be thinking 
about a publication in two years. An infrastructure provider may need technical detail. A community group 
may need clarity about what will happen with their contribution. 
 
One communication format will not work for all of them. This is why the contact map, introductions and 
repeated conversations matter. They help me learn what each group needs before I ask them to join a new 
process or event. 

## What is changing so far 
I have only recently started building the network, and many relationships need time before they lead to 
RDM requests or joint work. It is too early to claim or expect that the project has changed data practice across urban research. 
 
What has changed already is the framing of RDM within conversations. I bring a transdisciplinary and 
networking perspective into the work of the wider RDM team: not only “how do we manage this dataset?”, 
but also “who else may need to find, understand or reuse this data?” 
 
One early example is an event I organised for urban researchers in Vienna. It brought together a 
social-science repository, AUSSDA; a register-data provider, AMDC; a funder, the Austrian Academy of 
Sciences (ÖAW); and a city representative presenting Vienna’s existing research questions. The goal 
was practical, namely to invite researchers to take a research question of policy relevance, tap into 
existing data sources and support routes, and know where to get funding for such a project. More 
generally, the aim was to show where repository, register and city data may connect. The event is 
not evidence of impact by itself. I will look at attendance, feedback, follow-up requests and any 
new connections or project ideas that emerge afterwards. 

### What I am tracking
For the first year, I am tracking simple signs that the network is becoming more useful: 
- the number and range of people and organisations reached; 
- attendance and feedback from events; 
- follow-up conversations and support requests; 
- introductions that lead to further meetings or collaborations; 
- selected projects that receive RDM support; 
- examples where partners identify a concrete data-sharing, documentation or interoperability need. 

These indicators will not measure long-term societal impact but rather show whether the conditions 
required for transdisciplinary data stewardship are being built. 

### What happens next 
 
Over the next months, I will continue building the contact map, run cross-sector events and identify selected 
projects for more focused RDM support. 
 
For a meaningful review it would be good to know:
- which connections led to useful follow-up; 
- whether events reached the people we intended to reach; 
- which RDM questions recur across disciplines; 
- whether the contact map is useful enough to justify the effort required to maintain it; and 
- what would be needed to continue the role after the project ends. 
 
The intermediate and final report required by the funder will be linked here for further information after their publication, so you can check them if you are invested in the story.


## What I'd tell others 
### Start with relationships, not a service catalogue 
In an established department, you may be able to begin with a clear list of RDM services. 
In a new transdisciplinary setting, first find out who is already doing related work and where 
people need help. Thus, relationship-building needs to be acknowledged and executed as part of 
stewardship work, rather than as something you do only when the “real” work is finished. 

### Make onboarding an explicit work package 
A new steward needs more than accounts, access and policy documents. You need introductions, 
context and someone who can explain how decisions are really made. 
 
Ask for an ally who can introduce you to key people. Prepare a short explanation of your role in 
several lengths. Expect that work cultures may differ even when institutions or countries seem familiar. 
 
Small misunderstandings can grow when nobody notices them. Ask questions early, especially 
about expectations, decision-making, communication and ownership. 

{% include callout.html type="tip" content="Keep a small “things I learned the hard way” note during your first months. It will become useful onboarding material for the next person." %}

### Do not treat one discipline’s practice as the default 
The core skills of a disciplinary data steward still matter: asking good questions, understanding 
workflows, improving documentation, supporting storage and sharing, and helping people make realistic 
plans for their specific datasets. 
In a transdisciplinary role, you need an additional layer: translating between disciplines 
and between research and non-academic partners. The aim is not to make every project use the same 
standards. It is to make differences visible early and identify where shared documentation, formats, 
vocabularies or access arrangements are needed. 

### Balance events with direct support 
Events are efficient when you need to bring a new community together. They can create visibility, 
surface common questions and help people discover each other. Events do not replace project-level support, 
though. Researchers often need help applying a general message to their own data, methods and constraints. 

We are testing a mixed model: broad events to create connections and shared awareness, plus more focused 
support for selected projects. The right balance will depend on your capacity, mandate and time frame. 

### Build for continuity from day one 
Relationship-building, trust, and regular exchange take time. A two-year project can start this work, but 
it may not be long enough to stabilize it. 

If you create a transversal data steward role, decide early who will maintain the network, contact map, 
training materials, and support routes after the project ends. A permanent role, or at least a clear 
handover into an existing service, will make the work more sustainable. 
Urban research is especially well suited to this model because data often needs to move across disciplines 
and organisations. That also means the coordination work cannot be treated as an optional extra. 

 



<!--
  Don't add a `## Resources` heading here – the layout renders the
  `resources:` frontmatter list automatically as a table at the bottom
  of the page.
-->
