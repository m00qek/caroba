package main

import (
	"io/ioutil"
	"crypto/rand"
	"encoding/binary"
	"strings"
)

func delete_empty (s []string) []string {
    var r []string
    for _, str := range s {
        if str != "" {
            r = append(r, str)
        }
    }
    return r
}

func randint() (int, error) {
    var b [4]byte
    if _, err := rand.Read(b[:]); err != nil {
        return 0, err
    }
    return int(binary.LittleEndian.Uint32(b[:])), nil
}

func DicewareWordlist() (map[int]string, error) {
	text, err := ioutil.ReadFile("diceware/pt-BR")
	if err != nil {
		return nil, err
	}

	wordlist := delete_empty(strings.Split(string(text),"\n"))

	words := make(map[int]string)
	for index, word := range wordlist {
		words[index] = word
	}

	return words, nil
}

func NewPassword(wordlist map[int]string, words int, separator string) string {
	var pwd = make([]string, words)
	var size = len(wordlist)

	for index := range pwd {
		wordIndex, _ :=	randint()
		pwd[index] = wordlist[wordIndex % size]
	}

	return strings.Join(pwd, separator)
}
