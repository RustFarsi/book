# The Rust Programming Language (Farsi Translation)

This repository contains the source of the Farsi(Persian) translation of "The Rust Programming Language" book.

The translated markdown files are in the FARSI directory. All other files of the project(except for this README.md) have remained intact and compatible with the original english version.

[Read here](https://pouriamokhtari.ir/rust-book-fa/)(Note that translations might be incomplete)

[the original book](https://github.com/rust-lang/book/)

## Requirements

Building the book requires [mdBook], ideally the same version that
rust-lang/rust uses in [this file][rust-mdbook]. To get it:

[mdBook]: https://github.com/rust-lang-nursery/mdBook
[rust-mdbook]: https://github.com/rust-lang/rust/blob/master/src/tools/rustbook/Cargo.toml

```bash
$ cargo install mdbook --vers [version-num]
```

## Building

To build the farsi version of the book, type:

```bash
$ cd FARSI
$ mdbook build
```

The output will be in the `FARSI/book` subdirectory. To check it out, open it in
your web browser.

_Firefox:_
```bash
$ firefox FARSI/book/index.html                       # Linux
$ open -a "Firefox" FARSI/book/index.html             # OS X
$ Start-Process "firefox.exe" .\FARSI\book\index.html # Windows (PowerShell)
$ start firefox.exe .\FARSI\book\index.html           # Windows (Cmd)
```

_Chrome:_
```bash
$ google-chrome FARSI/book/index.html                 # Linux
$ open -a "Google Chrome" FARSI/book/index.html       # OS X
$ Start-Process "chrome.exe" .\FARSI\book\index.html  # Windows (PowerShell)
$ start chrome.exe .\FARSI\book\index.html            # Windows (Cmd)
```

To run the tests:

```bash
$ mdbook test
```

## Contribution

Send a pull request with your modifications to the **FARSI/** directory.
The translations must be intelligible.

Please do not modify anything outside of the FARSI directory.
