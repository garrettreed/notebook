# Go Modules

-   `go mod init` creates a new module, initializing the go.mod file that describes it.
-   `go build`, `go test`, and other package-building commands add new dependencies to go.mod as needed.
-   `go list -m all` prints the current module’s dependencies.
-   `go get` changes the required version of a dependency (or adds a new dependency).
-   `go mod tidy` removes unused dependencies.
-   Only in effect if project is outside of `$GOPATH` because `GO111MODULE` defaults to `auto`. You can set that env variable to `on` if you want to use modules in a `$GOPATH` project.
-   `go.mod` lists the direct dependencies and their versions, either a tagged semver version, a [module query](https://golang.org/cmd/go/#hdr-Module_queries), or a [pseudo version](https://golang.org/cmd/go/#hdr-Pseudo_versions)
-   `go.sum` is not a lockfile. `go.mod` locks dependencies. It ensures that all of the installed packages match their crypto hash.
-   `go get rsc.io/sampler@v1.3.1`: example use of upgrading or requiring a specific version.

## Use multiple (major) versions of direct dependency

```go
package hello

import (
    "rsc.io/quote"
    quoteV3 "rsc.io/quote/v3"
)

func Hello() string {
    return quote.Hello()
}

func Proverb() string {
    return quoteV3.Concurrency()
}
```

```txt
$ go test
go: finding rsc.io/quote/v3 v3.1.0
go: downloading rsc.io/quote/v3 v3.1.0
go: extracting rsc.io/quote/v3 v3.1.0
PASS
ok      example.com/hello    0.024s
$
$ go list -m rsc.io/q...
rsc.io/quote v1.5.2
rsc.io/quote/v3 v3.1.0
$
```

## Modules and Vendoring

-   Modules are normally cached at `$GOPATH/pkg/mod`.
-   `go mod vendor` creates a directory named `vendor` in the root directory of the main module.
-   Allows interop with older versions of go and is just cleaner.
-   To use `vendor/` for build, add the flag `-mod=vendor` to the build command.
