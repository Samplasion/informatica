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
<div class="minimal">
    <a class="ac-trigger" href="{{ "/linguaggio/" | append: lang_hash[0] | append: "/" | relative_url }}">
        <h2>{{ plang.name }}</h2>
        {{ plang.description | markdownify }}
    </a>
</div>
{%- endfor -%}
</div>
