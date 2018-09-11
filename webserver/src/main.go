package main

import (
	"github.com/julienschmidt/httprouter"
	"net/http"
	"log"
)

func Index(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
    	http.ServeFile(w, r, "index.html");
}

func main() {
	router := httprouter.New()
	router.GET("/", Index)
	router.ServeFiles("/assets/*filepath", http.Dir("assets"))

	log.Fatal(http.ListenAndServe(":8080", router))
}
