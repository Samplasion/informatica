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
    {%- assign lang = lang_hash[1] %}

    {% capture header %}
<h2>{{ lang.name }}</h2>
{{ lang.description | markdownify }}
    {% endcapture %}

    {%- capture content -%}
    {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
    {%- assign filtered_posts = site.posts | where: "lang", lang_hash[0] %}
<ul class="post-list">
    {%- for post in filtered_posts -%}
    <li>
        <span class="post-meta">{% include date.html date=post.date format=date_format %}</span>
        <h3>
            <a class="post-link" href="{{ post.url | relative_url }}">
            {{ post.title | escape }}
            </a>
        </h3>
        {%- if site.show_excerpts -%}
            {{ post.excerpt }}
        {%- endif -%}
    </li>
    {% else %}
    Nessun contenuto relativo a {{ lang.name }}.
    {%- endfor -%}
</ul>
    {%- endcapture %}

    {% include accordion.html header=header content=content %}
{%- endfor -%}
</div>
