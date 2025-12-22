---
title: Maturity model
page_img: "icons/icon-mm.svg"
---
{% include auto-expand.html %}

## Indicators
<div class="accordion accordion-flush" id="indicatorsAccordion">
 {% for domain in site.data.shared.maturity_model.domains %}
  <div class="accordion-item">
    <h3 class="accordion-header">
      <button class="accordion-button {% unless forloop.first %}collapsed{% endunless %}" 
              type="button"
              data-bs-toggle="collapse" 
              data-bs-target="#collapse2{{forloop.index}}" 
              aria-expanded="{% if forloop.first %}true{% else %}false{% endif %}" 
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
    <div id="collapse2{{forloop.index}}" class="accordion-collapse collapse {% if forloop.first %}show{% endif %}" data-bs-parent="#indicatorsAccordion">
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