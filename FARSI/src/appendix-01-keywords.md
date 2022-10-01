## پیوست آ: کلیدواژه‌ها

فهرست زیر حاوی کلمات کلیدی است که برای استفاده کنونی یا آینده توسط زبان Rust اختصاص‌داده شده‌اند. به این ترتیب، این واژگان نمی‌توانند به عنوان شناسه استفاده شوند (به جز به عنوان شناسه‌های خام که در بخش «[Raw Identifiers][raw-identifier]<!-- ignore -->» بحث خواهیم کرد)، از جمله نام تابع‌ها، متغیرها، مقدارهای ورودی، مشخصه‌های ساختاری، مؤلفه‌ها، جعبه‌ها، ثابت‌ها، ماکروها، مقدارهای ثابت، ویژگی‌ها، نوع‌ها، صفت‌ها یا طول عمر.

[raw-identifiers]: #raw-identifiers

### کلیدواژه‌های که در حال حاضر استفاده می‌شوند

واژگان کلیدی زیر در حال حاضر دارای عملکرد توصیف‌‌شده‌ی زیر هستند.

* `as` - تغییر نوع اولیه (primitive casting) را انجام می‌دهد، صفت مشخصی از دارنده‌ی آن شامل یک مورد (Item) را ابهام‌زدایی می‌کند،
  یا نام موارد را در دستورات `use` و `extern crate` تغییر می‌دهد.
* `async` - به جای این‌که نخ کنونی را متوقف کند، نوع `Future` را باز می‌گرداند.
* `await` - روند اجرای کد را تا زمانی‌که نتیجه‌ی یک `Future` آماده باشد، متوقف می‌کند.
* `break` - مستقیماً از حلقه خارج می‌شود.
* `const` - موارد ثابت یا اشاره‌گرهای خام ثابت را تعریف می‌کند.
* `continue` - به تکرار حلقه‌ی بعد ادامه می‌دهد.
* `crate` - یک کتابخانه‌ی خارجی یا یک متغیر ماکرو را که نشان دهنده کتابخانه‌ای که ماکرو در آن تعریف شده است، پیوند می‌دهد.
* `dyn` - ارسال پویا به یک شئ اشاره‌گر
* `else` - بازتعریفی برای ساختارهای کنترل جریان کد `if` و `if let` ارائه می‌دهد.
* `enum` - یک نوع داده‌ی شمارش‌پذیر را تعریف می‌کند.
* `extern` - link an external crate, function, or variable
* `false` - Boolean false literal
* `fn` - define a function or the function pointer type
* `for` - loop over items from an iterator, implement a trait, or specify a
  higher-ranked lifetime
* `if` - branch based on the result of a conditional expression
* `impl` - implement inherent or trait functionality
* `in` - part of `for` loop syntax
* `let` - bind a variable
* `loop` - loop unconditionally
* `match` - match a value to patterns
* `mod` - define a module
* `move` - make a closure take ownership of all its captures
* `mut` - denote mutability in references, raw pointers, or pattern bindings
* `pub` - denote public visibility in struct fields, `impl` blocks, or modules
* `ref` - bind by reference
* `return` - return from function
* `Self` - a type alias for the type we are defining or implementing
* `self` - method subject or current module
* `static` - global variable or lifetime lasting the entire program execution
* `struct` - define a structure
* `super` - parent module of the current module
* `trait` - define a trait
* `true` - Boolean true literal
* `type` - define a type alias or associated type
* `unsafe` - denote unsafe code, functions, traits, or implementations
* `use` - bring symbols into scope
* `where` - denote clauses that constrain a type
* `while` - loop conditionally based on the result of an expression

### کلیدواژه‌هایی که برای آینده اختصاص یافته‌اند

کلیدواژه‌های زیر هیچ گونه عملکردی ندارند، اما توسط Rust برای استفاده‌ی احتمالی در آینده محفوظ هستند.

* `abstract`
* `become`
* `box`
* `do`
* `final`
* `macro`
* `override`
* `priv`
* `try`
* `typeof`
* `unsized`
* `virtual`
* `yield`

### شناسه‌های خام

*Raw identifiers* are the syntax that lets you use keywords where they wouldn’t
normally be allowed. You use a raw identifier by prefixing a keyword with `r#`.

For example, `match` is a keyword. If you try to compile the following function
that uses `match` as its name:

<span class="filename">Filename: src/main.rs</span>

```rust,ignore,does_not_compile
fn match(needle: &str, haystack: &str) -> bool {
    haystack.contains(needle)
}
```

you’ll get this error:

```text
error: expected identifier, found keyword `match`
 --> src/main.rs:4:4
  |
4 | fn match(needle: &str, haystack: &str) -> bool {
  |    ^^^^^ expected identifier, found keyword
```

The error shows that you can’t use the keyword `match` as the function
identifier. To use `match` as a function name, you need to use the raw
identifier syntax, like this:

<span class="filename">Filename: src/main.rs</span>

```rust
fn r#match(needle: &str, haystack: &str) -> bool {
  haystack.contains(needle)
}

fn main() {
  assert!(r#match("foo", "foobar"));
}
```

This code will compile without any errors. Note the `r#` prefix on the function
name in its definition as well as where the function is called in `main`.

Raw identifiers allow you to use any word you choose as an identifier, even if
that word happens to be a reserved keyword. In addition, raw identifiers allow
you to use libraries written in a different Rust edition than your crate uses.
For example, `try` isn’t a keyword in the 2015 edition but is in the 2018
edition. If you depend on a library that’s written using the 2015 edition and
has a `try` function, you’ll need to use the raw identifier syntax, `r#try` in
this case, to call that function from your 2018 edition code. See [Appendix
E][appendix-e]<!-- ignore --> for more information on editions.

[appendix-e]: appendix-05-editions.html
