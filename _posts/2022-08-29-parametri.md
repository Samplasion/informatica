---
layout: post
title:  "Parametri"
date:   2022-08-29 15:26:44 +0200
categories: sottoprogrammi
---

I parametri sono variabili di passaggio tra sottoprogrammi.
Vengono usati per fornire dati dal chiamante (generalmente `main`)
alla procedura che viene chiamata e viceversa.

### Passaggio di dati

I parametri possono venire scambiati in due modi:

<ul>
  <li>
    <strong>Pass by value:</strong><br/>
    Quando il chiamante fornisce dati alla procedura chiamata (e non
    viceversa), il passaggio avviene "per valore" e le variabili
    corrispondenti vengono dette di <strong>input alla procedura</strong>.
{% highlight cpp %}
void stampa(int a);

int main() {
    int a = 1;
    stampa(a);
}

void stampa(int a) {
    cout << a;
}
{% endhighlight %}
  </li>
  <li>
    <strong>Pass by reference:</strong><br/>
    Quando la procedura deve restituire dati al chiamante, quest'ultimo
    passa le variabili "per indirizzo", e queste vengono dette di
    <strong>output alla procedura</strong>.
{% highlight cpp %}
void aggiungi_uno(int &a);

int main() {
    int a = 1;
    aggiungi_uno(a);

    cout << a; // 2
}

void aggiungi_uno(int &a) {
    a += 1;
}
{% endhighlight %}

    Per passare variabili per indirizzo bisogna aggiungere <code>&amp;</code>
    prima del nome della variabile nell'intestazione della procedura. In caso
    contrario, il valore verrà passato <em>per valore</em> e verrà conservato
    in una variabile con indirizzo differente. In tal caso, ogni modifica
    effettuata all'interno della procedura chiamata verrà persa nel momento in
    cui la stessa ritorna al chiamante.
  </li>
</ul>

### Parametri formali e attuali

Vengono definiti **parametri formali** quelli presenti nell'intestazione della
procedura che viene chiamata.
Le variabili utilizzate e i loro valori sono definiti **parametri attuali** ed
esistono nella procedura chiamante.

## Chiamata

La chiamata è il passaggio dell'esecuzione da una procedura ad un'altra.
La procedura all'interno della quale avviene la chiamata è detta **procedura
chiamante**, quella che viene chiamata è detta **procedura chiamata**.

### Chiamata e parametri

La chiamata avviene all'interno di una qualsiasi procedura ponendo `()` dopo
il nome della variabile **senza riportare la tipologia**.
La chiamata può essere parametrica o non parametrica.
Nel primo caso, per valori semplici, i parametri possono essere:

* **Per valore**: il valore di ogni parametri viene copiato e inserito
  in una variabile che esiste solo nella procedura chiamata. Di conseguenza,
  le modifiche effettuate al parametro nella procedura chiamata non
  vengono riportate nel chiamante, quindi non avviene passaggio di dati.
* **Per indirizzo**: viene fornito alla procedura chiamata l'esatto indirizzo
  in memoria relativo alla variabile nel chiamante, quindi le modifiche
  effettuate nella procedura chiamata hanno effetto anche nel chiamante, perciò
  si ha passaggio di dati.

Per valori strutturati come gli array (vettori),
[regole diverse si applicano](#parametri-e-vettori).

Quando la chiamata è parametrica, i parametri attuali vengono posti dentro
le parentesi tonde `()`:

{% highlight cpp %}
stampa(42, variabile);
{% endhighlight %}

### Valori di ritorno

In alternativa ai parametri passati per indirizzo, quando una procedura chiamata
deve passare solo un valore al chiamante, può passargliela attraverso un
**valore di ritorno** (in tal caso la procedura è definita **funzione**).
Le funzioni **non possono essere `void` per definizione**. Al suo posto, viene
riportata la tipologia del valore che viene ritornato.
Il valore di ritorno viene posto dopo la parola chiave `return`.

{% highlight cpp %}
int funzione() {
  return 42;
}
{% endhighlight %}

Dopo `return`, l'esecuzione del codice passa immediatamente al chiamante e
l'eventuale codice dopo `return` **viene ignorato**.

{% highlight cpp %}
int funzione2() {
  return 42;
  // Questa riga non verrà eseguita, e niente verrà stampato:
  cout << 42;
}
{% endhighlight %}

La chiamata _ad una funzione_ può essere posta in qualsiasi punto del programma
dove può stare un valore del tipo corrispondente al valore di ritorno. Ad
esempio, una chiamata alla funzione `funzione` sopra può essere posto dovunque
possa essere posto un numero:

{% highlight cpp %}
int funzione() {
  return 42;
}

int main() {
  int quarantaquattro = funzione() + 2;
  // quarantaquattro ha valore 44
}
{% endhighlight %}

Le funzioni **non possono ritornare valori non semplici**, pertanto non è
possibile ritornare vettori da una funzione tramite `return`.

## Parametri e vettori

Per passare un array ad una procedura, all'interno dell'intestazione della
procedura chiamata il parametro vettore deve essere dichiarato in modo diverso
dagli altri parametri.
Per dichiarare un parametro come vettore, bisogna scrivere il tipo degli
elementi del vettore, seguito dal nome del parametro e da `[]`:

{% highlight cpp %}
// Questa procedura accetta un vettore di interi
void procedura(int vettore[]) {
  // ...
}

int main() {
  int numeri[];

  procedura(numeri);
}
{% endhighlight %}

I vettori passati come parametri vengono trattati come se fossero passati per
indirizzo: tutte le modifiche effettuate nella procedura chiamata hanno
effetto anche nel chiamante.