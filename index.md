---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
---

<div class="home">
    <h1>Linguaggi</h1>

{%- for lang_hash in site.data.langs -%}
    {%- assign lang = lang_hash[1] %}

    <details {% if forloop.first -%}open{%- endif -%}>
        <summary>
            <h2>{{ lang.name }}</h2>
            {{ lang.description | markdownify }}
        </summary>
    
        <div>
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
        </div>
    </details>
{%- endfor -%}
</div>