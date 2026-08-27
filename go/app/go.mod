module github.com/you/term-app

go 1.24

// A require on a sibling module goes to the proxy however close its sources
// are. The generated go.work is what makes the copy in this tree win.
require github.com/acme/pty-core v1.0.0
