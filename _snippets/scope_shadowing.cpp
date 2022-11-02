---
name: scope_shadowing
lang: cpp
description: "<em>Esempio 3:</em> Shadowing."
full_code: |
    #include <iostream>
    using namespace std;

    int punteggio = 5;

    void stampaPunteggio() {
        int punteggio = 20;
        cout << punteggio;
    }

    int main() {
        stampaPunteggio();
        
        return 0;
    }
---

int punteggio = 5;

void stampaPunteggio() {
    int punteggio = 20;
    cout << punteggio;
}