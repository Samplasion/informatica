---
layout: post
title: Funzioni, procedure e parametri
date: 2022-08-29 15:26:44 +0200
categories: cpp sottoprogrammi
tag: cpp
modified_date: 2022-11-17T17:45:42.448Z
excerpt: Tutto su modello top-down, funzioni, procedure e parametri.
---

## Il modello top-down

Quando si scrive un programma, raramente tutto il codice viene conservato
nel `main`. Spesso, risulta conveniente suddividere il problema principale
in più sottoproblemi su cui è più facile ragionare. 

Questo metodo di analisi è detto **modello _top-down_**, dove *top* e *down* si
riferiscono al livello di dettaglio. L'opposto del modello top-down è il modello
bottom-up, che parte dai dettagli e in seguito li compone per risolvere il
problema principale.

{% figure caption:"I due approcci." %}
{% mermaid %}
graph LR

subgraph TD [Approccio top-down]
  direction TB
  Top --> Down
end

subgraph PD [Problema]
  direction TB
  P(Problema) --- Dettagli
end

subgraph BU [Approccio bottom-up]
  direction BT
  %% viene invertito nel grafico finale
  Bottom --> Up
end

TD --- PD --- BU
{% endmermaid %}
{% endfigure %}

Nella pratica, l'approccio _top-down_ corrisponde nella separazione del programma
principale in più sottoprogrammi. Questo è una parte del programma risolutivo
che non può essere eseguita automaticamente ma solo su richiesta, definita
**chiamata** o **invocazione**. Dal punto di vista del programma principale,
l'interesse non è su _come_ risolvere il sottoproblema, ma solo risolverlo.

## Programmi e sottoprogrammi

È possibile realizzare un sottoprogramma per ogni sottoproblema fino a che
questo non è più scomponibile. L'unione dei sottoprogrammi comporrà il programma
che risolve il problema principale.

Si ha quindi una suddivisione in:

* Programma principale (_main_) che descrive il problema
* Svariati sottoprogrammi che risolvono i sottoproblemi

La figura 1 mostra un esempio di un algoritmo per la preparazione di una torta
pensato con il modello top-down.

{% figure caption:"_Figura 1._ L'approccio _top-down_ nella preparazione di una torta farcita." %}
<!-- TODO: fix this -->
<div class="highlight">
<!-- The empty Liquid tags strip leading and trailing spaces -->
<pre>
<code class="language-pseudocode" data-lang="pseudocode">{{- "" -}}
<span class="kt">ALGORITMO</span> <span class="nf">Preparare una torta farcita</span>
<span class="kt">INIZIO</span>
  <span class="nf">Preparare la base della torta</span>
  <span class="nf">Preparare la farcitura</span>
  <span class="nf">Farcire la torta</span>
  Servire
<span class="kt">FINE</span>

<span class="kt">SOTTOALGORITMO</span> <span class="nf">Preparare la base della torta</span>
<span class="kt">INIZIO</span>
  Preparare l'impasto
  Preparare la teglia
  Scaldare il forno
  Infornare
  Sfornare
<span class="kt">FINE</span>

<span class="kt">SOTTOALGORITMO</span> <span class="nf">Preparare la farcitura</span>
<span class="kt">INIZIO</span>
  ...
<span class="kt">FINE</span>

<span class="kt">SOTTOALGORITMO</span> <span class="nf">Farcire la torta</span>
<span class="kt">INIZIO</span>
  ...
<span class="kt">FINE</span>
{{- "" -}}</code>
</pre>
</div>
{% endfigure %}

Il sottoproblema `Preparare la base della torta` è stato isolato in un
sottoalgoritmo perché è di interesse generale, o banalmente può essere utile in
più situazioni.

È conveniente estrarre una porzione di codice in sottoprogrammi quando:

- È di interesse generale
- Si presenta più volte
- Aumenta la leggibilità

{% capture noteTooManyFunctions %}
Suddividere eccessivamente il problema in piccoli sottoproblemi può avere
l'effetto opposto a quello desiderato. Il programma, così composto da molti
sottoprogrammi composti da pochissime istruioni, sarà più lento e userà più
memoria, oltre ad essere meno leggibile e più frammentato. **Applica
l'approccio _top-down_ con moderazione.**
{% endcapture %}
{% include alert.html
  markdown="1"
  content=noteTooManyFunctions
  color="warning"
%}

## Vantaggi della suddivisione in sottoprogrammi

* **Il programma diventa più leggibile**  
  La suddivisione in sottoprogrammi spinge il codice ad essere più ordinato.
* **Il programma diventa più manutenibile**  
  In caso di errori, è più facile isolare la porzione di codice affetta
  dall'errore e agire su di esso.
* **Il programma consuma meno memoria**  
  Il codice sarà meno ripetuto, quindi sarà più breve e meno pesante.
* **Il programma aderisce all'*astrazione funzionale***  
  L'astrazione funzionale è il principio per cui al chiamante interessa _cosa_
  fare, non _come_ farlo.
* **Il sottoprogramma diventa riusabile**  
  Il sottoprogramma, _se opportunamente reso indipendente dal programma
  principale_, può essere riutilizzato sia nel programma stesso, che in altri.

## Procedure e funzioni in C/C++

In C/C++, la sintassi per dichiarare una procedura/funzione è la seguente:

{% figure caption:"_Figura 2._ Sintassi delle funzioni." %}
```cpp
<tipo> <nome>([<tipo> <nome>, <tipo> <nome>, ...]) // Intestazione della funzione 
{ // Corpo della funzione
  // ... istruzioni
}
```

Ad esempio:

```cpp
void stampa(int numero) {
  cout << numero;
}
```
{% endfigure %}

La prima riga della dichiarazione è detta **intestazione**:

{% figure caption:"_Figura 3._ Intestazione della funzione `stampa`." %}
```cpp
void stampa(int numero)
```
{% endfigure %}

e definisce la tipologia del valore di ritorno della funzione, il nome della
funzione e i [parametri](#parametri) che la funzione accetta.

{%
  include alert.html
  color='info'
  content="Una procedura è una funzione che ritorna `void`."
%}

Tra le parentesi graffe c'è il **corpo** della funzione, ovvero tutte le
istruzioni che verranno eseguite in fase di
[invocazione (o chiamata)](#chiamata) della funzione.

{% figure caption:"La figura 1 con la sintassi di C/C++." %}
```cpp
// Intestazioni (vedi paragrafo relativo)
// ...

// Preparare una torta farcita
int main() {
  preparazioneBase();
  preparazioneFarcitura();
  farcituraTorta();

  servizioTorta();
}

void preparazioneBase() {
  preparazioneImpasto();
  preparazioneTeglia();
  scaldaForno();
  inforna();
  sforna();
}

void preparazioneFarcitura() {
  // ...
}

void farcituraTorta() {
  // ...
}
```
{% endfigure %}

## Parametri

I parametri sono variabili di passaggio tra sottoprogrammi.
Vengono usati per fornire dati dal chiamante alla procedura che viene chiamata e
viceversa.

## Parametri formali e attuali

Vengono definiti **parametri formali** quelli presenti nell'intestazione della
funzione che viene chiamata.
Le variabili utilizzate e i loro valori sono definiti **parametri attuali** ed
esistono nella funzione chiamante.

## Chiamata

La chiamata è il passaggio dell'esecuzione da una funzione ad un'altra.
La funzione all'interno della quale avviene la chiamata è detta **procedura
chiamante**, quella che viene chiamata è detta **procedura chiamata** (da non
confondere con _la chiamata_ intesa come "invocazione").

## Passaggio dei parametri

La chiamata avviene all'interno di una qualsiasi funzione ponendo `()` dopo
il nome della variabile **senza riportare la tipologia**.
La chiamata può essere parametrica o non parametrica.
Nel primo caso, per valori semplici, i parametri possono essere:

* **Per valore**: il valore di ogni parametro attuale viene copiato e inserito
  nel parametro formale corrispondente. Di conseguenza, le modifiche effettuate
  al parametro formale non vengono riportate nel parametro attuale, ma solo
  nella copia, quindi non avviene passaggio di dati.
  <figure style="margin-top:15px" class=highlight markdown=1>
  ```cpp
  void stampa(int a);

  int main() {
      int a = 1;
      stampa(a);
  }

  void stampa(int a) {
      cout << a;
  }
  ```
  </figure>
* **Per indirizzo**: viene fornito al parametro formale l'esatto indirizzo
  in memoria relativo al parametro attuale corrispondente, quindi le modifiche
  effettuate sul parametro formale hanno effetto anche in quello attuale, perciò
  si ha passaggio di dati.
  
  In C++, per stabilire che un parametro debba essere trasmesso per indirizzo,
  nell'intestazione e nel [prototipo](#prototipo) del sottoprogramma a cui
  appartiene quel parametro bisogna mettere `&` prima del suo nome:
  <figure style="margin-top:15px" class=highlight markdown=1>
  ```cpp
  void aggiungi_uno(int &a);

  int main() {
      int a = 1;
      aggiungi_uno(a);

      cout << a; // 2
  }

  void aggiungi_uno(int &a) {
      a += 1;
  }
  ```
  </figure>

Per valori strutturati come gli array (vettori),
[regole diverse si applicano](#parametri-e-vettori).

Quando la chiamata è parametrica, i parametri attuali vengono posti dentro
le parentesi tonde `()`:

{% highlight cpp %}
stampa(42, variabile);
{% endhighlight %}

## Parametri e vettori

Per passare un array ad una funzione, all'interno dell'intestazione della
funzione chiamata il parametro vettore deve essere dichiarato in modo diverso
dagli altri parametri.
Per dichiarare un parametro come vettore, bisogna scrivere il tipo degli
elementi del vettore, seguito dal nome del parametro e da `[]`:

{% figure caption:"_Figura 9._ Procedura che accetta un vettore di interi." %}
```cpp
// Questa procedura accetta un vettore di interi
void procedura(int vettore[]) {
  // ...
}

int main() {
  int numeri[];

  procedura(numeri);
}
```
{% endfigure %}

I vettori passati come parametri vengono trattati come se fossero passati per
indirizzo: tutte le modifiche effettuate nella funzione chiamata hanno
effetto anche nel chiamante.

## Indipendenza del sottoprogramma

Un sottoprogramma, per essere utile, deve effettuare uno scambio di dati con
il resto del programma. Ciò può avvenire con le variabili globali o con i
parametri. Se avviene con le variabili globali, il sottoprogramma assume una
dipendenza verso la variabile globale, che deve esistere e avere lo stesso tipo:

{% capture functionDependence %}
#include <iostream>

int punteggio = 0;

void calcolo() {
  punteggio += 10;
}

int main() {
  calcolo();
  
  std::cout << punteggio;
}
{% endcapture %}
{% include codebox.html lang="cpp" code=functionDependence highlight_lines="3 6" %}

Se, in un altro programma analogo, portassimo lo stesso sottoprogramma, si
verificherebbe un errore:

{% highlight cpp highlight_lines="3 6 7 8 9" %}
#include <iostream>

int punti = 0;

// vvv La funzione di prima
void calcolo() {
  // Errore: la variabile punteggio non è stata dichiarata
  punteggio += 10;
}
// ^^^ La funzione di prima

int main() {
  calcolo();
  
  std::cout << punti;
}
{% endhighlight %}

Pertanto, questo sottoprogramma `calcolo` è **dipendente** dal programma
principale. Se usassimo i parametri, non avremmo questo problema:

{% capture functionDependence2 %}
#include <iostream>

int punti = 0;

// Aggiunta del parametro
void calcolo(int& punteggio) {
  punteggio += 10;
}

int main() {
  calcolo(punti);
  
  std::cout << punti;
}
{% endcapture %}
{% include codebox.html lang="cpp" code=functionDependence2 highlight_lines="6" %}

## Prototipo

Come le variabili, anche le funzioni devono essere dichiarate prima di essere
utilizzate. Questo si può fare definendo la funzione per intero prima del suo
utilizzo. Talvolta, però, può essere utile separare la dichiarazione dalla
definizione; questo è possibile grazie al **prototipo** della funzione:

{% figure caption:"_Figura 4._ Prototipo delle funzioni." %}
```cpp
void stampa(int numero);
```
{% endfigure %}

Nella pratica, il prototipo della funzione è l'intestazione seguita da un
punto e virgola `;`. I nomi dei parametri possono essere omessi:

{% figure caption:"_Figura 5._ Prototipo di funzione senza nomi dei parametri." %}
```cpp
void stampa(int);
```
{% endfigure %}

Il codice in figura 5 è equivalente al codice in figura 4, anche se meno chiaro.

{% capture notePrototypeNames %}
Scrivi i nomi dei parametri anche nei prototipi delle funzioni: diventa più
chiaro a cosa corrispondono gli argomenti anche solo guardando il prototipo.
{% endcapture %}
{%
  include alert.html
  content=notePrototypeNames
  color="success"
%}

## Valori di ritorno

In alternativa ai parametri passati per indirizzo, quando una funzione chiamata
deve passare solo un valore al chiamante, può passargliela attraverso un
**valore di ritorno**. Al posto di `void` (nelle procedure), viene
riportata la tipologia del valore che viene ritornato.
Il valore di ritorno viene posto dopo la parola chiave `return`.

{% figure caption:"_Figura 6._ Funzione con valore di ritorno." %}
```cpp
int funzione() {
  return 42;
}
```
{% endfigure %}

Dopo `return`, l'esecuzione del codice passa immediatamente al chiamante e
l'eventuale codice dopo `return` **viene ignorato**.

{% figure caption:"_Figura 7._ Funzione con codice dopo `return`." %}
```cpp
int funzione2() {
  return 42;
  // Questa riga non verrà eseguita, e niente verrà stampato:
  cout << 42;
}
```
{% endfigure %}

La chiamata _ad una funzione_ può essere posta in qualsiasi punto del programma
dove può stare un valore del tipo corrispondente al valore di ritorno. Ad
esempio, una chiamata alla funzione `funzione` sopra può essere posto dovunque
possa essere posto un numero:

{% figure caption:"_Figura 8._ Chiamata a funzione in un'espressione." %}
```cpp
int funzione() {
  return 42;
}

int main() {
  int quarantaquattro = funzione() + 2;
  // quarantaquattro ha valore 44
}
```
{% endfigure %}

Le funzioni **non possono ritornare vettori**.

{% capture noteFunctionCall %}
Nonostante alcuni sostengano che non utilizzare il valore di ritorno di una
funzione sia un errore (di sintassi, per giunta!), è perfettamente possibile:

```cpp
int funzione() {
  cout << "Un dato che mi interessa";
  return 42;
}

int main() {
  funzione(); // !
}
```

Ciò non è un errore: il valore di ritorno della funzione viene calcolato e
immediatamente scartato in fase di chiamata, ma il codice viene eseguito
comunque, in questo caso stampando il dato che ci interessa.

Una funzione ritornante un valore che raramente viene usato è `printf`:

{% capture noteFunctionCallCode1 %}
#include <cstdio> // o <stdio.h> in C

int main() {
  // Nonostante questa funzione ritorni int, non ce ne
  // facciamo nulla, pertanto non usiamo il valore ritornato.
  printf("%s", "ciao mondo");
}
{% endcapture %}
{% include codebox.html lang="cpp" code=noteFunctionCallCode1 %}
{% endcapture %}
{% include alert.html
  markdown="1"
  title="Ignorare un valore di ritorno"
  content=noteFunctionCall
%}
