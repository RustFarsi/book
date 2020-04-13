## سلام کارگو!

کارگو ابزار ساخت و مدیر بسته Rust است. اکثر برنامه‌نویسان Rust از این ابزار برای 
مدیریت پروژه‌های Rust استفاده می‌کنند چرا که کارگو بسیاری از کار‌ها مثل ساخت (build) کد‌ها، دانلود 
کردن کتابخانه‌هایی که کد شما به آن نیاز دارد و ساخت آنها را انجام می‌دهد. (ما به کتابخانه‌هایی که کد شما به آن 
نیاز دارد *پیشنیاز* می‌گوییم.)

ساده‌ترین برنامه‌های Rust، مثل برنامه‌ای که نوشتیم پیشنیازی ندارند. پس اگر برنامه «Hello world» را با 
کارگو بسازیم، تنها از بخشی از کارگو که کد شما را می‌سازد (build) استفاده می‌شود. هرچه برنامه‌های پیچیده‌تر Rust 
بنویسید به آنها پیشنیاز اضافه خواهید کرد، و اگر پروژه‌ای را با کارگو شروع کنید، اضافه کردن پیشنیاز بسیار ساده‌تر است.

چون اکثر پروژه‌های Rust از کارگو استفاده می‌کنند، در ادامه این کتاب در نظر می‌گیریم که شما نیز از کارگو 
استفاده می‌کنید. با نصب Rust کارگو نیز نصب می‌شود؛ البته اگر از روش‌های نصب رسمی در بخش [«نصب»][installation]<!-- ignore --> استفاده کنید.
اگر Rust را با روش دیگری نصب کرده‌اید، با وارد کردن دستور زیر در ترمینال کنترل کنید که آیا کارگو نصب شده است:

```text
$ cargo --version
```

اگر یک شماره نسخه می‌بینید، شما آن را دارید! اگر یک خطا مثل `command not found` می‌بینید، به مستندات روش 
نصب خود مراجعه کرده و نحوه نصب کارگو بصورت جداگانه را مطالعه کنید.

### ساخت یک پروژه با کارگو

بیایید یک پروژه جدید با کارگو بسازیم و تفاوت آنرا با برنامه «Hello world» سابق ببینیم. به دایرکتوری *projects* (یا هرجایی 
که کد‌های خود را نگه می‌دارید) برگردید. سپس در همه سیستم‌عامل‌ها دستورات زیر را وارد کنید:

```text
$ cargo new hello_cargo
$ cd hello_cargo
```

دستور اول یک دایرکتوری جدید با عنوان *hello_cargo* می‌سازد. نام پروژه خود را *hello_cargo* گذاشته‌ایم،
کارگو فایل‌های مربوط به آن را در یک دایرکتوری با همین اسم نگه می‌دارد. 

داخل دایرکتوری *hello_cargo* بروید و محتویات آنرا نمایش دهید. می‌بینید که کارگو برای ما دو فایل و یک دایرکتوری 
ساخته است: یک فایل *Cargo.toml* و یک دایرکتوری *src* با یک فایل *main.rs* درون آن.

همچنین کارگو یک مخزن گیت با یک فایل *.gitignore* ساخته است. اگر از قبل در پوشه مربوطه یک مخزن گیت 
وجود داشته باشد فایل های گیت با اجرای `cargo new` ساخته نخواهند شد. می‌توانید با استفاده از دستور
`cargo new --vcs=git` این رفتار را غیرفعال کنید.

> نکته: گیت یک سیستم کنترل نسخه پراستفاده است. شما می‌توانید `cargo new` را تغییر دهید تا از 
> سیستم کنترل نسخه متفاوت استفاده کنید یا با دستور `--vcs` بدون کنترل نسخه ادامه دهید.
> با اجرای `cargo new --help همه تنظیمات موجود را ببینید.

فایل *Cargo.toml* را در ویرایشگر متن خود باز کنید. باید شبیه کد ۱٫۲ باشد.

<span class="filename">فایل: Cargo.toml</span>

```toml
[package]
name = "hello_cargo"
version = "0.1.0"
authors = ["Your Name <you@example.com>"]
edition = "2018"

[dependencies]
```

<span class="caption">کد ۱٫۲: محتوای *Cargo.toml* که توسط `cargo
new` وارد شده است.</span>

این فایل به فرمت [*TOML*][toml]<!-- ignore --> (*Tom’s Obvious, Minimal Language*) نوشته 
شده است که فرمت تنظیمات کارگو است.

[toml]: https://github.com/toml-lang/toml

خط اول `[package]`، تیتر یک بخش است که نشان می‌دهد عبارات بعد از آن برای تنظیم یک بسته (package) آمده‌اند.
هرچه اطلاعات بیشتر به این فایل اضافه کنیم. بخش‌های جدید هم اضافه خواهند شد.

چهار خط بعدی تنظیمات اطلاعاتی که کارگو برای کامپایل برنامه شما نیاز دارد را مشخص می‌کنند: نام، نسخه، نویسنده 
و ویرایشی از Rust که باید استفاده شود. کارگو اطلاعاتی مثل اسم و ایمیل شما را از محیط اجرا می‌گیرد، پس اگر
اطلاعات درست نیست آن‌ها را تصحیح کرده و فایل را ذخیره کنید. در مورد کلید `edition` در ضمیمه ث صحبت خواهیم کرد.

خط آخر `[dependencies]`، شروع بخشی است که می‌توانید در آن هر یک از پیشنیاز‌های پروژه‌تان را وارد کنید.
در Rust به بسته‌های کد معمولاً *crate* گفته می‌شود. برای این پروژه به crate دیگری احتیاج نداریم، اما در اولین پروژه فصل ۲ 
نیاز خواهیم داشت. پس آن زمان از این قسمت استفاده خواهیم کرد.

حال فایل *src/main.rs* را باز کنید و نگاهی بیاندازید:

<span class="filename">فایل: src/main.rs</span>

```rust
fn main() {
    println!("Hello, world!");
}
```

کارگو یک برنامه سلام دنیا برای شما نوشته مثل برنامه‌ای که در کد ۱٫۱ نوشتیم! تا اینجا تفاوت بین پروژه قبلی و پروژه 
خروجی کارگو این است که کارگو کد‌ را در دایرکتوری *src* قرار داد. و یک فایل تنظیمات *Cargo.toml* در دایرکتوری بیرونی داریم.

کارگو از فایل‌های کد منبع شما انتظار دارد که در دایرکتوری *src* قرار گیرند. دایرکتوری بیرونی تنها برای 
فایل‌های README، اطلاعات مجوز‌ها و گواهی‌ها، فایل‌های تنظیمات و هرچیزی که به کد ربطی نداشته باشد 
است. استفاده از کارگو به شما کمک می‌کند پروژه‌های خود را سامان بخشید. ‌جایی مشخصی برای همه چیز وجود دارد 
و همه چیز سر جای خود است.

اگر پروژه‌ای شروع کردید که از کارگو استفاده نمی‌کند، مثل پروژه «سلام دنیا» قبلی، می‌توانید آنرا به پروژه‌ای که از کارگو استفاده کند تبدیل کنید.
کافیست کد پروژه را داخل دایرکتوری *src* ببرید و یک فایل *Cargo.toml* مناسب تنظیم کنید.

### Building and Running a Cargo Project

Now let’s look at what’s different when we build and run the “Hello, world!”
program with Cargo! From your *hello_cargo* directory, build your project by
entering the following command:

```text
$ cargo build
   Compiling hello_cargo v0.1.0 (file:///projects/hello_cargo)
    Finished dev [unoptimized + debuginfo] target(s) in 2.85 secs
```

This command creates an executable file in *target/debug/hello_cargo* (or
*target\debug\hello_cargo.exe* on Windows) rather than in your current
directory. You can run the executable with this command:

```text
$ ./target/debug/hello_cargo # or .\target\debug\hello_cargo.exe on Windows
Hello, world!
```

If all goes well, `Hello, world!` should print to the terminal. Running `cargo
build` for the first time also causes Cargo to create a new file at the top
level: *Cargo.lock*. This file keeps track of the exact versions of
dependencies in your project. This project doesn’t have dependencies, so the
file is a bit sparse. You won’t ever need to change this file manually; Cargo
manages its contents for you.

We just built a project with `cargo build` and ran it with
`./target/debug/hello_cargo`, but we can also use `cargo run` to compile the
code and then run the resulting executable all in one command:

```text
$ cargo run
    Finished dev [unoptimized + debuginfo] target(s) in 0.0 secs
     Running `target/debug/hello_cargo`
Hello, world!
```

Notice that this time we didn’t see output indicating that Cargo was compiling
`hello_cargo`. Cargo figured out that the files hadn’t changed, so it just ran
the binary. If you had modified your source code, Cargo would have rebuilt the
project before running it, and you would have seen this output:

```text
$ cargo run
   Compiling hello_cargo v0.1.0 (file:///projects/hello_cargo)
    Finished dev [unoptimized + debuginfo] target(s) in 0.33 secs
     Running `target/debug/hello_cargo`
Hello, world!
```

Cargo also provides a command called `cargo check`. This command quickly checks
your code to make sure it compiles but doesn’t produce an executable:

```text
$ cargo check
   Checking hello_cargo v0.1.0 (file:///projects/hello_cargo)
    Finished dev [unoptimized + debuginfo] target(s) in 0.32 secs
```

Why would you not want an executable? Often, `cargo check` is much faster than
`cargo build`, because it skips the step of producing an executable. If you’re
continually checking your work while writing the code, using `cargo check` will
speed up the process! As such, many Rustaceans run `cargo check` periodically
as they write their program to make sure it compiles. Then they run `cargo
build` when they’re ready to use the executable.

Let’s recap what we’ve learned so far about Cargo:

* We can build a project using `cargo build` or `cargo check`.
* We can build and run a project in one step using `cargo run`.
* Instead of saving the result of the build in the same directory as our code,
  Cargo stores it in the *target/debug* directory.

An additional advantage of using Cargo is that the commands are the same no
matter which operating system you’re working on. So, at this point, we’ll no
longer provide specific instructions for Linux and macOS versus Windows.

### Building for Release

When your project is finally ready for release, you can use `cargo build
--release` to compile it with optimizations. This command will create an
executable in *target/release* instead of *target/debug*. The optimizations
make your Rust code run faster, but turning them on lengthens the time it takes
for your program to compile. This is why there are two different profiles: one
for development, when you want to rebuild quickly and often, and another for
building the final program you’ll give to a user that won’t be rebuilt
repeatedly and that will run as fast as possible. If you’re benchmarking your
code’s running time, be sure to run `cargo build --release` and benchmark with
the executable in *target/release*.

### Cargo as Convention

With simple projects, Cargo doesn’t provide a lot of value over just using
`rustc`, but it will prove its worth as your programs become more intricate.
With complex projects composed of multiple crates, it’s much easier to let
Cargo coordinate the build.

Even though the `hello_cargo` project is simple, it now uses much of the real
tooling you’ll use in the rest of your Rust career. In fact, to work on any
existing projects, you can use the following commands to check out the code
using Git, change to that project’s directory, and build:

```text
$ git clone someurl.com/someproject
$ cd someproject
$ cargo build
```

For more information about Cargo, check out [its documentation].

[its documentation]: https://doc.rust-lang.org/cargo/

## Summary

You’re already off to a great start on your Rust journey! In this chapter,
you’ve learned how to:

* Install the latest stable version of Rust using `rustup`
* Update to a newer Rust version
* Open locally installed documentation
* Write and run a “Hello, world!” program using `rustc` directly
* Create and run a new project using the conventions of Cargo

This is a great time to build a more substantial program to get used to reading
and writing Rust code. So, in Chapter 2, we’ll build a guessing game program.
If you would rather start by learning how common programming concepts work in
Rust, see Chapter 3 and then return to Chapter 2.

[installation]: ch01-01-installation.html#installation
