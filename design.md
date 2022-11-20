---
layout: page
annotations:
  - key: test
    content: "**Markdown** _test_"
  - key: fake real annotation
    content: |-
      Lorem ipsum dolor sit amet, consectetur adipiscing
      elit. Duis `viverra velit` vitae purus lacinia,
      in varius.

      ```cpp
      // code example
      int main() {
        return 0; // (+test)
      }
      ```
---

{% assign types = "primary, secondary, success, danger, warning, info, red, orange, yellow, green, cyan, blue, purple" | split: ", " %}

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

{% highlight js %}
// JavaScript code with syntax highlighting.

/**
 * `lang` function
 * 
 * @param {string} l lang
 * @returns "Hello world"
 */
var fun = function lang(l) {
  // This is a test (+test) annotation
  dateformat.i18n = require('./lang/' + l);
  console.log(`Today is ${new Date()}`);
  return "Hello wrold".replace(/ro/, 'or');
}
{% endhighlight %}

{% highlight ts %}
// TypeScript code with syntax highlighting.

/**
 * `lang` function
 */
const fun = function lang(l: string): string {
  // This is a test (+test) annotation
  dateformat.i18n = require('./lang/' + l) as any;
  console.log(`Today is ${new Date()}`);
  return "Hello wrold".replace(/ro/, 'or');
}
{% endhighlight %}

{% highlight java %}
package informatica.io.github.samplasion;

// This is a test (+fake real annotation) annotation

class DesignMD {
    public static void main(String args[]) {
        System.out.println("Hello World");
    }
}
{% endhighlight %}

{% highlight ruby %}
# Ruby code with syntax highlighting
# This is a test (+test) annotation
GitHubPages::Dependencies.gems.each do |gem, version|
  "a" =~ %r(a)i
  s.add_dependency(gem, "= #{version}")
end
{% endhighlight %}

{% highlight cpp %}
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

// This is a test (+test) annotation

int main() {
    struct String {
        string content;
        int length;
    } s{ "hello\n", SIX };

    print(s.content);
    return 0;
}
{% endhighlight %}

{% highlight pseudo mark_lines="3 5 6" %}
ALGORITMO Preparare una torta farcita
INIZIO
  Preparare la base della torta
  Preparare la farcitura
  Farcire la torta
  Servire
FINE

// This is a test (+test) annotation

SOTTOALGORITMO Preparare la base della torta
INIZIO
  Preparare l'impasto
  Preparare la teglia
  Scaldare il forno
  Infornare
  Sfornare
FINE

SOTTOALGORITMO Preparare la farcitura
INIZIO
  // ...
FINE

SOTTOALGORITMO Farcire la torta
INIZIO
  // ...
FINE

FUNZIONE RicercaBinaria(VAL Vet: Vettore, VAL N: INTERO, VAL X: INTERO): BOOLEANO
VARIABILI
    Primo, Ultimo, Centro: INTERO
    Trovato: BOOLEANO
INIZIO
    Primo = 1
    Ultimo = N
    Trovato = falso
    MENTRE ((Primo ≤ Ultimo) AND (NOT Trovato)) ESEGUI
        Centro = (Primo + Ultimo) DIV 2
        SE (Vet[Centro] == X) ALLORA
            Trovato = vero
        ALTRIMENTI SE (Vet[Centro] < X) ALLORA
            Primo = Centro + 1
        ALTRIMENTI
            Ultimo = Centro - 1
        FINESE
    FINEMENTRE
    RITORNO(Trovato)
FINE

ALGORITMO CaricaVettore
TIPO Vettore = ARRAY[10] di INTERO
VARIABILI
    V: Vettore
    NumElementi: INTERO
INIZIO
    NumElementi = OttieniDimensione()
    Caricamento(V, NumElementi)
FINE

FUNZIONE OttieniDimensione(): INTERO
VARIABILI
    Dim: INTERO
INIZIO
    RIPETI
        SCRIVI("Inserisci il numero di elementi")
        LEGGI(Dim)
    FINCHÉ ((Dim > 0) AND (Dim < 10))
    RITORNO(Dim)
FINE

// Ugh...
PROCEDURA Caricamento(REF Vet: Vettore, VAL N: INTERO)
VARIABILI
    I: INTERO
INIZIO
    PER I = 1 A N ESEGUI
        SCRIVI("Inserisci il ", I, "° elemento")
        LEGGI(Vet[I])
    FINEPER
FINE

// Array right shift ([a, b, c, d] => [a, a, b, c])
PROCEDURA ShiftDestro(REF Vet: Vettore, VAL N: INTERO)
VARIABILI
    I: INTERO
INIZIO
    PER I = N INDIETRO A 1 ESEGUI
        Vet[I] = Vet[I - 1]
    FINEPER
FINE

TIPO Tavolo: RECORD
    modello: STRINGA[100]
    lunghezza: INTERO
    larghezza: INTERO
    profondita: INTERO
FINERECORD
{% endhighlight %}

```plsql
SELECT q'{a quoted string}' AS s, TO_CHAR(SYSDATE,'MM/DD/YYYY') AS "Current Date" FROM DUAL
WHERE 1=1;
```

```moonscript
util = require "my.module"

a_table = {
  foo: 'bar'
  interpolated: "foo-#{other.stuff 2 + 3}"
  "string": 2
  do: 'keyword'
}

class MyClass extends SomeClass
  new: (@init, arg2 = 'default') =>
    @derived = @init + 2
    super!

  other: =>
    @foo + 2
```

```objective_cpp
@import Foundation;
#import <array>
#include <vector>

@interface IntegerArray : NSObject {
    std::vector<NSUInteger> _numbers;
}
@property(readonly) NSUInteger count;

- (instancetype)initWithNumbers:(NSUInteger *)numbers count:(NSUInteger)count;
- (NSUInteger)numberAtIndex:(NSUInteger)index;
@end

int main(int argc, char **argv) {
    auto numbers = std::array<NSUInteger, 3>{1, 2, 3};
    NSLog(@"%@", [[IntegerArray alloc] initWithNumbers:numbers.data() count:numbers.size()]);
}
```

```http
POST /demo/submit/ HTTP/1.1
Host: {{ site.url | replace: "https://", "" | replace: "http://", "" | replace: "/", "" }}
Cache-Control: max-age=0
Origin: {{ site.url }}
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_2)
    AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.63 Safari/535.7
Content-Type: application/json
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Referer: http://pygments.org/
Accept-Encoding: gzip,deflate,sdch
Accept-Language: en-US,en;q=0.8
Accept-Charset: windows-949,utf-8;q=0.7,*;q=0.3

{"name":"test","lang":"text","boring":true}
```

```html
<!doctype html>
<html>
  <head><title>Title!</title></head>
  <body>
    <p id="foo">Hello, World!</p>
    <script type="text/javascript">var a = 1;</script>
    <style type="text/css">#foo { font-weight: bold; }</style>
  </body>
</html>
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

<span class="c">Useless, super hacky yet possible annotation: (+test)</span>

```c
// Single-annotation comment (with spaces around):
3; //   (+test)    
// Should be rendered as just the (+)
```

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