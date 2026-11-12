---
title: IT security              
layout: guidance 
type: Guidance   
search_exclude: true   
contributors: [Aina Jené, Heleri Inno, Hana Marčetić, Jana Martínková, Saliha Zenboudji-Beddek, Diana Pilvar, Vilem Ded, Marina Popleteeva]          
page_id: g-security          

# ---------------------------------------------------------------------------
# At a glance box
# ---------------------------------------------------------------------------

# Tab 1: At a glance
description: “Embedding IT security into RDM, workflows and researcher support.”  
last_update: 2026-11-12         
topics:                         
  - information security
  - data protection
  - risk management
  - security awareness

# Tab 2: Introduced skills
skills:                            # mandatory – 3–5 skills; use the exact ESCO label, and make sure it is listed in _data/guidance/skills.yml (add it there in your Pull Request if not – see var/esco_skill.py)
  - apply data protection policies
  - identify security risks
  - liaise with colleagues
  - promote awareness of information security

# Tab 3: Takeaways
takeaways:                         # mandatory – 2–3 short bullets with the main message of the page; write these last
  - Make security guidance practical, visible and part of everyday research workflows.
  - Work regularly with information security colleagues to identify risks and improve support.

# ---------------------------------------------------------------------------
# Related pages
# ---------------------------------------------------------------------------
related_pages:
  Guidance:
    - g-data-protection
    - g-rdm-strategy
  Maturity_Indicator:
    - mm-data-accessibility
    - mm-data-assets
    - mm-data-infrastructure
    - mm-data-resources
    - mm-data-standards-documentation
    - mm-data-standards-rdm
    
# ---------------------------------------------------------------------------
# Resources
# ---------------------------------------------------------------------------

resources:
  - name: "NIST Cybersecurity Framework 2.0"
    url: https://www.nist.gov/cyberframework
    description: "A widely used framework for managing cybersecurity risk, including governance, protection, detection, response and recovery."
    category: external_resource

  - name: "ENISA – Cybersecurity Skills Development"
    url: https://www.enisa.europa.eu/topics/skills-and-competences/skills-development
    description: "European Cybersecurity Skills Framework (ECSF) to address Europe’s growing need for a unified approach to defining roles and skills in the cybersecurity field."
    category: external_resource

  - name: "RDMkit – Sensitive data"
    url: https://rdmkit.elixir-europe.org/sensitive_data
    description: "Practical RDM guidance for handling sensitive data, including security, access and legal considerations."
    category: external_resource

---

IT security is essential to responsible research data management (RDM). It protects research data, participants and institutional 
reputation from loss, misuse and breaches across the data lifecycle.

Mature practice combines clear policies, regular training, appropriate controls and ongoing review. As a data steward, you help 
researchers apply these measures in daily work by translating institutional requirements into practical, research-friendly guidance 
and connecting them with IT and information security specialists.

Read the activities in order if you are establishing security support for the first time. If you already have a relationship 
with your information security office, start with the activity that addresses the weakest part of your current approach.

# Make IT security guidance visible
Help researchers find security guidance before a problem occurs. Include clear, practical references to IT security policies 
and procedures in your institutional RDM and data management plan (DMP) guidance.

## Add IT security to existing researcher guidance
Include IT security guidance in:
- RDM guidance and DMP templates;
- project-registration information;
- onboarding and offboarding materials;
- your general RDM training portfolio.
Keep the advice close to the point where researchers need it. For example, link to secure-storage guidance from your DMP template
rather than expecting researchers to find it on a separate IT site.

### Use regular reminders
Share short reminders about everyday security practices through newsletters, internal communication channels or researcher 
communities. Focus each reminder on one action, such as using multi-factor authentication (MFA), managing passwords safely or 
choosing approved storage.

### Keep guidance practical
Translate high-level policies into steps researchers can follow in their daily work. Avoid simply reproducing policy text. 
Explain what the requirement means in a research setting, what action the researcher should take, and where to get help. 
Practical, discoverable and regularly maintained guidance helps researchers use it without relying entirely on ad hoc support.

## Build a security-conscious research culture
Make it normal and safe for researchers and staff to raise security questions, report possible vulnerabilities and admit 
mistakes. A culture of early reporting gives your institution a chance to address risks before they become incidents.

### Create space for questions
Encourage researchers to ask about potential risks, incident reporting and security measures. Face-to-face moments, such as 
project kick-offs, data-management consultations and DMP reviews, can be particularly useful: researchers may be more willing 
to share doubts there than through a formal IT-security channel.
Make clear that raising a concern is helpful, not a failure.

### Provide checklists for common tasks
Offer short checklists or templates for recurring decisions, such as:
- selecting approved storage;
- setting up access permissions;
- sharing data with collaborators;
- managing passwords and MFA;
- preparing data for long-term preservation.
Keep these checklists short enough to use during real work. Link to fuller institutional guidance where needed.

### Learn from questions and incidents
Review RDM helpdesk questions and requests for signs of recurring security gaps, misunderstandings or possible incidents. 
Use what you find to improve guidance, training and tools, or to alert the information security office to a wider issue.
Tell researchers what changed as a result of their input. For example: “Several teams asked about external sharing, so we 
added a checklist and updated the approved-tools guidance.” This shows that reporting concerns leads to practical improvements.

## Put security checks into research workflows
Security works best when it is part of normal research activity, rather than an extra task at the end of a project. 
Build security guidance and checks into the points where research teams make decisions about data.

### Identify the key milestones
Align security checks with relevant milestones, including:
- project registration and planning;
- data collection and consent management;
- data storage and access setup;
- sharing data with collaborators or external services;
- publication, archiving and long-term preservation.
At each point, explain the decisions researchers need to make and who can help them make those decisions.

### Check the right controls at the right time
Ensure that access controls and risk assessments are considered early enough to be useful. For example, researchers 
should decide who needs access to sensitive data before the team starts collecting it, not only when they are ready to share it.
For sensitive systems and data, explain when MFA, restricted permissions, secure storage or additional review are required. 
Mature security practice includes tested incident-response and disaster-recovery arrangements, proactive assessment of 
vulnerabilities, and appropriate advanced protections.

### Turn policy into actions
Give researchers concrete actions instead of abstract instructions. For example:
- use the institution’s password manager and follow password requirements;
- enable MFA (using which tool) for sensitive systems;
- store research data only in approved, secure locations;
- apply the agreed access permissions;
- ask for advice before using a new external tool or sharing sensitive data.

## Work with the information security office
Build a regular working relationship with your information security office and Information Security Officer (ISO). 
You can help them understand research-specific needs, while they help you ensure that your RDM guidance reflects 
institutional security requirements.

### Agree on roles and expectations
Clarify what you, the information security office and researchers are each responsible for. Discuss:
relevant domain-specific requirements and standards;
the likely effect of new security measures on research activities;
how you will contribute to policy development and awareness campaigns;
who researchers should contact for advice, incident reporting and urgent concerns.
Your role is not to replace security specialists. It is to help make their expertise usable in research workflows.

### Involve security colleagues when selecting RDM tools
Collaborate with IT security when you introduce new RDM tools or services. Involve them early, before researchers have 
adopted a tool or stored data in it.
Discuss issues such as data sensitivity, access management, hosting location, encryption, backups, sharing arrangements 
and contractual requirements. Institutionally supported tools should have documented guidance, targeted support and clear 
ownership for maintenance.

### Set up a regular communication channel
Agree a named contact and a regular way to exchange information with the information security office. Meet routinely, 
e.g., every three to six months, to review:
- incident logs;
- recurring security questions;
- helpdesk trends;
- planned changes to security measures or RDM tools;
- areas where guidance, training or processes need updating.
If you notice a possible security issue, raise it promptly with the agreed IT-security contact. Do not try to investigate 
or resolve a suspected incident alone.

### Document and share the collaboration arrangement
Write down how the collaboration works, including roles, contacts, escalation routes, meeting frequency and how you share 
updates. Inform management about the arrangement so that it is supported and can continue if staff change.
Regular review, feedback and updates help keep security guidance relevant as technology, research practices and threats evolve.



