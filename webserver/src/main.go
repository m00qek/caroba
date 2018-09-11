package main

import (
	"log"
    "net/http"
)

func main() {
    fs := http.FileServer(http.Dir("./assets"))
    log.Println("Serving " )
    http.Handle("/assets", fs)
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request){
    	http.ServeFile(w, r, "index.html");
    });
    http.ListenAndServe(":8080", nil)
}

