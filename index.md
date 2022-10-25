---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
---

<div class="home accordion-container">
    <header class="post-header">
        <h1 class="post-title">Linguaggi</h1>
    </header>

{%- for lang_hash in site.data.langs -%}
    {%- assign plang = lang_hash[1] %}

    {% capture header %}
<h2>{{ plang.name }}</h2>
{{ plang.description | markdownify }}
    {% endcapture %}

    {%- capture content -%}
    {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
    {%- assign filtered_posts = site.posts | where: "tag", lang_hash[0] %}
    {%- assign filtered_size = site.posts | size %}
    {%- assign limit = 5 -%}

<ul class="post-list">
    {%- for post in filtered_posts limit: limit -%}
    {%- include post-listing.html post=post -%}
    {% if filtered_size > limit %}
    <a href="{{ "/linguaggio/" | append: lang_hash[0] | append: "/" | relative_url }}">
        Tutti i post relativi a {{ plang.name }} →
    </a>
    {% endif %}
    {% else %}
    Nessun contenuto relativo a {{ plang.name }}.
    {%- endfor -%}
</ul>
    {%- endcapture %}

    {% include accordion.html header=header content=content %}
{%- endfor -%}
</div>
