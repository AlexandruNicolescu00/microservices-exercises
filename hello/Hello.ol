include "console.iol"

main {
    println@Console("Hello, world!")() // il () indica l'attesa dell'ack per notificare la ricezione del messaggio, serve ad evitare problemi di asincronia
}