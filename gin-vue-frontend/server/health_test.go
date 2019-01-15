package main

import (
	"log"
	"net/http"
	"testing"
)

var url = "http://localhost:8080/ping"

func TestPing(t *testing.T) {
	response, err := http.Get(url)
	if err != nil {
		log.Fatal(err)
	}
	if response.StatusCode != 200 {
		t.Error("Statuscode is not 200. Is:", response.StatusCode)
	}
}
