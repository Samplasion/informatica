---
layout: page
---

{% assign types = "primary, secondary, success, danger, warning, info" | split: ", " %}

{% include alert.html
    color="warning"
    icon="exclamation-triangle"
    title="Avvertenza"
    content="Questa pagina è usata per definire il design del sito."
%}

## Alerts

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

Text can be **bold**, _italic_, or ~~strikethrough~~.

[Link to another page](./another-page.html).

There should be whitespace between paragraphs.

There should be whitespace between paragraphs. We recommend including a README, or a file with information about your project.

# Header 1

This is a normal paragraph following a header. GitHub is a code hosting platform for version control and collaboration. It lets you and others work together on projects from anywhere.

## Header 2

> This is a blockquote following a header.
>
> When something is important enough, you do it even if the odds are not in your favor.

### Header 3

```js
// JavaScript code with syntax highlighting.

/**
 * `lang` function
 * 
 * @param {string} l lang
 * @returns "Hello world"
 */
var fun = function lang(l) {
  dateformat.i18n = require('./lang/' + l);
  console.log(`Today is ${new Date()}`);
  return "Hello wrold".replace(/ro/, 'or');
}
```

```ruby
# Ruby code with syntax highlighting
GitHubPages::Dependencies.gems.each do |gem, version|
  s.add_dependency(gem, "= #{version}")
end
```

```cpp
/**
 * Fake Header
 * (c) 2022 {{ site.author.name }}
 */
// C++ code with syntax highlighting
#include <iostream>
#define SIX 6

using namespace std;

template <typename T>
void print(T &name) {
    cout << name;
}

int main() {
    struct String {
        string content;
        int length;
    } s{ "hello\n", SIX };

    print(s.content);
    return 0;
}
```

{% capture _alert_content_1 %}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis nulla nunc.
Vestibulum ante ipsum primis in faucibus orci luctus:

```js
function test() {
    return "√ Test done!";
}
```

Integer non ex quis orci dignissim mollis eu sit amet mi. Pellentesque eget
interdum lacus. Nulla bibendum `mollis mi in elementum`. Praesent fringilla
accumsan nibh, ac porta `nulla`. Curabitur sed pellentesque enim. Donec
efficitur imperdiet eros, ac luctus dolor aliquam ut. Ut sed diam sit amet lacus
rutrum laoreet et at leo. Orci varius natoque penatibus et magnis dis parturient
montes, nascetur ridiculus mus.
{% endcapture %}
{% capture _alert_content_2 %}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis nulla nunc.
Vestibulum ante ipsum primis in faucibus orci luctus:

```js
function test() {
    return "∆ Test failed!";
}
```
{% endcapture %}

{% include alert.html
    markdown="1"
    title="Code in alert test"
    content=_alert_content_1
%}

{% include alert.html
    markdown="1"
    color="warning"
    title="Code in alert test"
    content=_alert_content_2
%}

{% capture content %}
{% for code in site.snippets %}
{%- include remote-code.html name=code.name static=true -%}
{% endfor %}
{% endcapture %}

<div class="accordion-container">
{% include accordion.html header="More code" content=content %}
</div>

#### Header 4

*   This is an unordered list following a header.
*   This is an unordered list following a header.
*   This is an unordered list following a header.

{% for type in types -%}
-   <span class="text-{{ type }}">
        This is a text with `text-{{type}}`.
    </span>
{% endfor %}

##### Header 5

1.  This is an ordered list following a header.
2.  This is an ordered list following a header.
3.  This is an ordered list following a header.

###### Header 6

| head1        | head two          | three |
|:-------------|:------------------|:------|
| ok           | good swedish fish | nice  |
| out of stock | good and plenty   | nice  |
| ok           | good `oreos`      | hmm   |
| ok           | good `zoute` drop | yumm  |

### There's a horizontal rule below this.

* * *

### Here is an unordered list:

*   Item foo
*   Item bar
*   Item baz
*   Item zip

### And an ordered list:

1.  Item one
1.  Item two
1.  Item three
1.  Item four

### And a nested list:

- level 1 item
  - level 2 item
  - level 2 item
    - level 3 item
    - level 3 item
- level 1 item
  - level 2 item
  - level 2 item
  - level 2 item
- level 1 item
  - level 2 item
  - level 2 item
- level 1 item

### Small image

![Octocat](https://github.githubassets.com/images/icons/emoji/octocat.png)

### Definition lists can be used with HTML syntax.

<dl>
<dt>Name</dt>
<dd>Godzilla</dd>
<dt>Born</dt>
<dd>1952</dd>
<dt>Birthplace</dt>
<dd>Japan</dd>
<dt>Color</dt>
<dd>Green</dd>
</dl>

```
Long, single-line code blocks should not wrap. They should horizontally scroll if they are too long. This line should be long enough to demonstrate this.
```

```
The final element.
```