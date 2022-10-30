---
name: record_nest
lang: cpp
description: "Composizione di vettori e strutture."
full_code: |
    #include <iostream>

    using namespace std;

    int main() {
        struct Passeggero {
            char nome[50];
            char biglietto[5];
        };
        
        struct Volo {
            char nome[30];
            char modello[30];
            struct Passeggero passeggeri[100];
        };
        
        struct Volo volo = {
            "FCO-JFK",
            "Airbus A737",
        };
        
        int i = 0;
        while (i < 100) {
            cout << "Inserisci il nome del passeggero al posto " << i << ": ";
            fgets(volo.passeggeri[i].nome, 50, stdin);
            i++;
        }

        return 0;
    }
---

struct Passeggero {
    char nome[50];
    char biglietto[5];
};

struct Volo {
    char nome[30];
    char modello[30];
    struct Passeggero passeggeri[100];
};

// in un (sotto)programma:
struct Volo volo;
// acquisizione degli attributi di `volo`:
int i = 0;
while (i < 100) {
    cout << "Inserisci il nome del passeggero al posto " << i << ": ";
    // Vedi "Vettori e stringhe" per fgets()
    fgets(volo.passeggeri[i].nome, 50, stdin);
    i++;
}