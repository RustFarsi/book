# زبان برنامه‌نویسی Rust (ترجمه فارسی)

این مخزن منبع ترجمه فارسی کتاب «زبان برنامه نویسی Rust» است.

فایل‌های ترجمه شده‌ی فارسی در پوشه‌ی FARSI قرار دارند. همه‌ی  فایل‌های دیگر پروژه (به جز این README.md) دست نخورده باقی مانده‌اند و با نسخه اصلی انگلیسی سازگار هستند.
(توجه داشته‌باشید که ممکن است ترجمه ناقص باشد)

[the original book](https://github.com/rust-lang/book/)

## نیازمندی‌ها

ساخت کتاب نیاز به [mdBook] دارد که حالت ایدآل آن استفاده از همان نگارشی 
که rust-lang/rust در [this file][rust-mdbook] استفاده شود. برای دریافت آن:

[mdBook]: https://github.com/rust-lang-nursery/mdBook
[rust-mdbook]: https://github.com/rust-lang/rust/blob/master/src/tools/rustbook/Cargo.toml

```bash
$ cargo install mdbook --vers [version-num]
```

## ساخت

برای ساخت نگارش فارسی کتاب بنویسید:

```bash
$ cd FARSI
$ mdbook build
```

خروجی در زیرپوشه‌ی `FARSI/book` قرار خواهد گرفت. برای بررسی، آن را در مرورگر باز کنید.

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

برای اجرای آزمون‌ها:

```bash
$ mdbook test
```

## مشارکت

یک درخواست pull request با تغییرات خود در پوشه‌ی **FARSI/** بفرستید.
ترجمه‌ها باید قابل فهم باشند.

لطفاً چیزی خارج از پوشه‌ی **FARSI/** را تغییر ندهید.