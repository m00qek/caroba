package main

import (
	"github.com/julienschmidt/httprouter"
	"net/http"
	"log"
	"fmt"
)


const (
		ETHERNET = "ethernet"
		WIRELESS = "wireless"
		USB = "usb"
)

type NetworkInterface struct {
		name string
		type_ string
}

type AppContext struct {
	wordlist map[int]string
}

func index(context AppContext) httprouter.Handle {
	return func (w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
		fmt.Println("Secure phrase:")
		fmt.Println(NewPassword(context.wordlist, 5, " "))
		http.ServeFile(w, r, "index.html");
	}
}



func main() {
	router := httprouter.New()
	wordlist, _ := DicewareWordlist()

	context := AppContext{wordlist}
	router.GET("/", index(context))
	router.ServeFiles("/assets/*filepath", http.Dir("assets"))

	log.Fatal(http.ListenAndServe(":8080", router))
}
