---
title: Maturity model
description: A self-assessment framework for benchmarking your institution's data stewardship maturity across four domains – strategy, data management, legal and governance, and support.
page_id: maturity-model-index
---

<p class="section-eyebrow">WAYPOINTS</p>

<p class="drop-cap">Waypoints are the handbook's <em>self-assessment framework</em>. The maturity model lets you benchmark your institution's data stewardship practice across four domains. Use it to see where you are, identify where to invest next, and make the case for resources or organisational change.</p>

{% include auto-expand.html %}

## How to use this page and the DSW knowledge model

This page is the **reference guide** for the RDM Maturity Model. It lists all domains, indicators, and maturity levels, and links to detailed guidance for each indicator. Use it to understand what each indicator means, how maturity levels are defined, and what good practice looks like at each stage.

To run an **interactive self-assessment**, use the RDM Maturity Model knowledge model published in the [DSW Registry](https://registry.ds-wizard.org/knowledge-models/). Import it into your [Data Stewardship Wizard](https://ds-wizard.org/) instance to get a structured questionnaire that mirrors the indicators below. DSW lets you record your institution's responses, track progress over time, collaborate with colleagues, and export results — making it suitable for periodic benchmarking or reporting.

## Indicators
<div class="accordion accordion-flush" id="indicatorsAccordion">
 {% for domain in site.data.shared.maturity_model.domains %}
  <div class="accordion-item">
    <h3 class="accordion-header">
      <button class="accordion-button collapsed" 
              type="button"
              data-bs-toggle="collapse" 
              data-bs-target="#collapse2{{forloop.index}}" 
              aria-expanded="false" 
              aria-controls="collapse2{{forloop.index}}">
          <div class="container-fluid">
            <div class="row pb-1">
              <div class="col">
                <strong>{{ domain.domainName }}</strong>
              </div>
            </div>
            <div class="row">
              <div class="col">
                {{ domain.domainDescription }}
              </div>
            </div>
          </div>
      </button>
    </h3>
    <div id="collapse2{{forloop.index}}" class="accordion-collapse collapse" data-bs-parent="#indicatorsAccordion">
      <div class="accordion-body">
        {% assign domain_indicators = site.data.shared.maturity_model.indicators | where:"domain", domain.domainName %}
        {% if domain_indicators != empty %}
        <table class="table table-bordered table-striped">
          <thead>
            <tr>
              <th>Indicator</th>
              <th>Maturity Levels</th>
            </tr>
          </thead>
          <tbody>
            {% for indicator in domain_indicators %}
            {% assign entry_page = indicator.indicatorId %}
            <tr id="{{ entry_page }}">
                {% if entry_page %}
                <td><a href="{{ entry_page }}">{{ indicator.indicator }}</a></td>
                {% else %}
                <td>{{ indicator.indicator }}</td>
                {% endif %}
              <td>
                <ol>
                  {% for level in indicator.maturityLevels %}
                  <li>{{ level }}</li>
                  {% endfor %}
                </ol>
              </td>
            </tr>
            {% endfor %}
          </tbody>
        </table>
        {% endif %}
      </div>
    </div>
  </div>
  {% endfor %}
</div>


## Version information

- Version: [{{ site.data.shared.maturity_model.version.versionNumber }} {{ site.data.shared.maturity_model.version.versionDescription }}](https://github.com/elixir-europe/rdm-maturity-model/blob/main/_data/maturity_model.json)
- Release date: {{ site.data.shared.maturity_model.version.timestamp | date: '%F' }}