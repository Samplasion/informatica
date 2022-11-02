---
name: record_nest
lang: cpp
description: "Composizione di vettori e strutture."
full_code: |
    #include <iostream>

    using namespace std;

    int main() {
        struct Passeggero {
            string nome;
            string biglietto;
        };
        
        struct Volo {
            string nome;
            string modello;
            Passeggero passeggeri[100];
        };
        
        Volo volo = {
            "FCO-JFK",
            "Airbus A737",
        };
        
        int i = 0;
        while (i < 100) {
            cout << "Inserisci il nome del passeggero al posto " << i << ": ";
            cin >> volo.passeggeri[i].nome;
            i++;
        }

        return 0;
    }
---

struct Passeggero {
    string nome;
    string biglietto;
};

struct Volo {
    string nome;
    string modello;
    Passeggero passeggeri[100];
};

// in un (sotto)programma:
Volo volo;
// acquisizione degli attributi di `volo`:
int i = 0;
while (i < 100) {
    cout << "Inserisci il nome del passeggero al posto " << i << ": ";
    // Vedi "Vettori e stringhe" per fgets()
    cin >> volo.passeggeri[i].nome;
    i++;
}