package client

import (
	"testing"
)

func TestPlaceHolder(t *testing.T) {
	msg := Placeholder()
	want := "chaTer client code."
	if msg != want {
		t.Errorf("got %v, want %s", msg, want)
	}
}
