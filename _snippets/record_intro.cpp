---
name: record_intro
lang: cpp
full_code: |
    #include <iostream>

    using namespace std;

    int main() {
        struct Tavolo {
            string modello;
            int lunghezza;
            int larghezza;
            int profondita;
        };
        
        Tavolo tavolo;
        tavolo.modello = "T4V-0L1n0";
        tavolo.lunghezza = 100;
        tavolo.larghezza = 150;
        tavolo.profondita = 30;
        
        cout << "Il tavolo (mod. " << tavolo.modello << ") ha dimensioni ";
        cout << tavolo.lunghezza << "cm x " << tavolo.larghezza << "cm x " << tavolo.profondita << "cm.";

        return 0;
    }
---

struct <nome> {
    <tipologia> <nomeCampo>;
    <tipologia> <nomeCampo>;
    // ...
} [nome, nome, ...];
// dove [nome, nome, ...] sono i nomi
// delle variabili da dichiarare (vedi sotto)

// ad esempio...
struct Rettangolo {
    double posizioneX;
    double posizioneY;
    double larghezza;
    double altezza;
};

// o per riprendere l'esempio precedente
struct Tavolo {
    char modello[100];
    int lunghezza;
    int larghezza;
    int profondita;
};