package main

import (
	"chater"
	"chater/server"
	"fmt"
)

func main() {
	fmt.Println("Running chater version: ", chater.Version())
	server.Serve()
}
