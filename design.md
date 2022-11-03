---
layout: page
---

{% include alert.html
    color="warning"
    icon="exclamation-triangle"
    title="Avvertenza"
    content="Questa pagina è usata per definire il design del sito."
%}

## Alerts

{% assign types = "primary, secondary, success, danger, warning, info" | split: ", " %}
{% for type in types %}
{% capture content %}
A simple {{ type }} alert with [an example link]({{ "/" | relative_url }}).
Give it a click if you like.
{% endcapture %}
{% include alert.html
    color=type
    content=content
%}
{% endfor %}