# زبان برنامه‌نویسی Rust (برگردان فارسی)

این مخزن منبع برگردان فارسی کتاب «زبان برنامه نویسی Rust» است.

پرونده‌های برگردان‌شده‌ی فارسی در پوشه‌ی FARSI قرار دارند. همه‌ی  پرونده‌های دیگر پروژه (به جز این README.md) دست نخورده باقی مانده‌اند و با نسخه اصلی انگلیسی سازگار هستند.
[اینجا را بخوانید](https://pouriamokhtari.ir/rust-book-fa/)(توجه داشته‌باشید که ممکن است برگردان ناقص باشد)

[the original book](https://github.com/rust-lang/book/)

## نیازمندی‌ها

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
