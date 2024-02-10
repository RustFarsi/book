# برنامه یک بازی حدس‌زدنی

با یک پروژه واقعی کار با Rust را شروع کنیم! این فصل شما را با
مفاهیم مرسوم Rust از طریق استفاده آنها در برنامه واقعی آشنا می‌کند.
درباره `let` و `match`، متد‌ها، توابع مربوط، استفاده از crate ها و بیشتر
یاد می‌گیرید. فصل‌های بعدی این ایده‌ها را بیشتر مورد بررسی قرار می‌دهند.
اما در این فصل مفاهیم اولیه را برای آمادگی تمرین می‌کنید.

یک مسئله برنامه‌نویسی کلاسیک ساده را پیاده‌سازی خواهیم کرد: یک بازی
حدس زدن. به این شکل کار می‌کند: برنامه یک عدد تصادفی بین ۱ و ۱۰۰ می‌سازد.
سپس از کاربر می‌خواهد که عدد را حدس بزند. بعد از وارد شدن حدس کاربر، برنامه
باید مشخص کند که حدس وارد شده بیشتر یا کمتر از عدد تصادفی است. اگر حدس
درست باشد برنامه یک پیام تبریک نمایش داده و اجرای آن پایان میابد.

## راه‌اندازی پروژه جدید

برای راه‌اندازی یک پروژه جدید به پوشه *projects* که در فصل ۱ ساختیم مراجعه کنید
و یک پروژه جدید با کارگو بسازید:

```text
$ cargo new guessing_game
$ cd guessing_game
```

فرمان اول `cargo new` اسم پروژه (`guessing_game`) را به عنوان
آرگومان اولش می‌گیرد. دستور دوم دایرکتوری باز را به پروژه تازه ساخته شده
تغییر می‌دهد.

به فایل *Cargo.toml* ساخته شده توجه کنید:

<span class="filename">فایل: Cargo.toml</span>

```toml
{{#include ../listings/ch02-guessing-game-tutorial/no-listing-01-cargo-new/Cargo.toml}}
```

اگر اطلاعات نویسنده که کارگو از محیط شما گرفته است صحیح نیست
آن‌ها را اصلاح کنید و فایل را ذخیره کنید.

همانطور که در فصل ۱ دیدیم، `cargo new` یک برنامه «سلام دنیا» برای
شما می‌سازد. کد فایل *src/main.rs* را بررسی کنید:

<span class="filename">فایل: src/main.rs</span>

```rust
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/no-listing-01-cargo-new/src/main.rs}}
```

حال برنامه «سلام دنیا» را با استفاده از دستور `cargo run` کامپایل کرده و آنرا اجرا می‌کنیم.

```text
{{#include ../listings/ch02-guessing-game-tutorial/no-listing-01-cargo-new/output.txt}}
```

دستور `run` وقتی نیاز به اجرای مداوم پروژه داشته باشید، بسیار کارآمد است.
مثل این بازی که در آن تست کردن هر قسمت پروژه قبل از ورود به قسمت بعد
لازم است.

فایل *src/main.rs* را مجدداً باز می‌کنیم. تمام کد را باید در این فایل وارد کنیم.

## پردازش یک حدس

اولین قسمت برنامه این بازی، از کاربر ورودی می‌خواهد، آنرا پردازش می‌کند
و چک می‌کند که ورودی به فرم مد نظر است. برای شروع اجازه می‌دهیم که بازیکن
یک حدس وارد کند. کد ۲٫۱ را در *src/main.rs* وارد کنید.

<span class="filename">فایل: src/main.rs</span>

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-01/src/main.rs:all}}
```

<span class="caption">کد ۲٫۱: حدسی از کاربر گرفته و آن را نمایش می‌دهد.</span>

این کد اطلاعات زیادی در بر دارد، پس خط به خط آنرا بررسی می‌کنیم.
برای گرفتن ورودی کاربر و چاپ آن در خروجی، باید کتابخانه `io` یا input/output (ورودی/خروجی)
را به برنامه بیاوریم.
کتابخانه `io` در کتابخانه استاندارد (که به آن `std` گفته می‌شود) موجود است.

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-01/src/main.rs:io}}
```

به طور پیش‌فرض، Rust تنها چند نوع داده محدود به اسکوپ هر برنامه در [ *مقدمه*][prelude]<!-- ignore --> آن می‌آورد.
اگر نوع داده موردنیاز شما در مقدمه برنامه نیست، باید آن نوع داده را صریح با عبارت `use` به اسکوپ برنامه وارد کنید.
استفاده از کتابخانه `std::io` چند قابلیت جدید به برنامه شما اضافه می‌کند، که یکی از آن‌ها توانایی دریافت ورودی کاربر است.

[prelude]: ../std/prelude/index.html

همانطور که در فصل ۱ دیدیم، تابع `main` نقطه ورود به برنامه است:

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-01/src/main.rs:main}}
```

گرامر `fn` برای تعریف توابع استفاده می‌شود، پرانتز‌ها `()` مشخص می‌کنند که هیچ
پارامتری وجود ندارد و براکت‌ها `}` بدنه تابع را مشخص می‌کنند.

همانطور که در فصل ۱ هم یادگرفتید، `println!` یک ماکرو است که
رشته‌ای را در صفحه چاپ می‌کند:

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-01/src/main.rs:print}}
```

این کد پیامی را چاپ می‌کند که نشان می‌دهد بازی چگونه انجام می‌شود و
سپس از کاربر ورودی می‌خواهد.


### ذخیره مقدار‌ها با متغیر

سپس، برای ذخیره‌سازی ورودی کاربر محلی می‌سازیم:

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-01/src/main.rs:string}}
```

حالا برنامه جالب می‌شود! اتفاقات زیادی در این خط کوتاه می‌افتند. به عبارت `let`
توجه کنید، این عبارت برای ساخت یک *متغیر* استفاده می‌شود. یک مثال دیگر:

```rust,ignore
let foo = bar;
```

این خط یک متغیر به اسم `foo` می‌سازد و آنرا به مقدار متغیر `bar` متصل می‌کند.
در Rust متغیر‌ها بصورت پیش‌فرض غیر قابل تغییر (immutable) هستند.
این مفهوم را با جزئیات بیشتر در بخش [«متغیر‌ها و تغییر پذیری»][variables-and-mutability]<!-- ignore -->
از فصل ۳ بررسی می‌کنیم. این مثال نشان می‌دهند که چطور از `mut` قبل از اسم
متغیر استفاده می‌کنیم تا آنرا تغییر پذیر کنیم:

```rust,ignore
let foo = 5; // immutable
let mut bar = 5; // mutable
```

> نکته: نوشتن `//` درواقع شروع یک کامنت است که تا انتهای آن خط ادامه پیدا می‌کند.
> زبان Rust هرچه در کامنت‌ها نوشته شده باشد را نادیده می‌گیرد. در مورد این مفهوم 
> در فصل ۳ بیشتر صحبت خواهیم کرد.

به برنامه بازی خودمان برگردیم. حال میدانیم که `let mut guess` یک متغیر قابل تغییر
به اسم `guess` می‌سازد. در طرف دیگر علامت مساوی ('=') مقداری است که به متغیر
`guess` اختصاص داده ایم.
که در واقع همان نتیجه صدا زدن تابع `String::new` است. تابعی که یک مورد (instance) جدید از
 یک `String` باز می‌گرداند. [`String`][string]<!-- ignore --> در واقع یک نوع داده رشته
است که در کتابخانه استاندارد وجود دارد و بصورت متن UTF-8 قابل رشد(بزرگ شدن) تعریف می‌شود.

[string]: ../std/string/struct.String.html

نوشتن `::` در خط `::new` نشان می‌دهد که `new` در واقع یک *تابع مرتبط*
به `String` می‌باشد. یک تابع مرتبط روی یک نوع داده پیاده‌سازی می‌شود. در این مورد
نوع داده `String`. و نه یک مورد (instance) خاص ساخته شده از آن. بعضی از زبان‌ها به چنین مفهومی
یک *متد استاتیک* می‌گویند.

تابع `new` یک رشته جدید خالی می‌سازد. تابع `new` را روی انواع داده
متفاوتی پیدا می‌کنید، چون اسم معمولی برای تابعی است که یک مقدار جدید
از یک نوع را می‌سازد.

به عنوان خلاصه می‌توان گفت که `let mut guess = String::new();` یک متغیر 
قابل تغییر که مقدار اختصاص یافته به آن یک مورد خالی از `String` است می‌سازد.

اگر به یاد داشته باشید ما قابلیت ورودی و خروجی را از کتابخانه استاندارد با `use std:io` 
در خط اول برنامه اضافه کردیم. حال تابع `stdin` را از ماژول `io` صدا می‌زنیم:

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-01/src/main.rs:read}}
```

اگر `use std::io` را اول برنامه اضافه نکرده بودیم، باید تابع را به شکل `std::io:stdin`
می‌نوشتیم. تابع `stdin` یک مورد (instance) از [`std::io::Stdin`][iostdin]<!-- ignore --> برمی‌گرداند
که یک نوع داده برای ارتباط شما با ورودی استاندارد در ترمینال است.

[iostdin]: ../std/io/struct.Stdin.html

بخش بعدی کد، `.read_line(&mut guess)`، متد [`read_line`][read_line]<!-- ignore --> را روی
ورودی استاندارد صدا می‌زند تا ورودی را از کاربر بگیرد. همچنین یک آرگومان  دیگر به`read_line` می‌فرستیم:
`&mutguess`.

[read_line]: ../std/io/struct.Stdin.html#method.read_line


وظیفه `read_line` گرفتن هرچه کاربر در ورودی استاندارد وارد کند و قرار دادن
آن در یک رشته است، به همین دلیل رشته را به عنوان آرگومان می‌گیرد.
آرگومان رشته باید قابل تغییر باشد تا متد بتواند محتوای رشته را با قرار دادن
ورودی کاربر تغییر دهد.

کاراکتر `&` نشان می‌دهد که این آرگومان یک *مرجع* (Reference) می‌باشد و 
راهی فراهم می‌کند که بتوان از قسمت‌های مختلفی از کد به یک داده دسترسی پیدا 
کرد بدون اینکه لازم باشد داده را چند بار در حافظه کپی کرد. مرجع‌ها یک قابلیت پیچیده
هستند و یکی از برتری‌های بزرگ Rust امنیت و سادگی استفاده از آنها می‌باشد.
برای نوشتن این برنامه به جزئیات زیادی نیاز ندارید. فعلا تمام چیزی که لازم دارید بدانید 
این است که مثل متغیر‌ها، مرجع بطور پیشفرض غیرقابل تغییر است. پس باید آن‌ها
را به صورت `&mut guess` بجای `&guess` نوشت تا قابل تغییر باشند.
(فصل ۴ مرجع‌ها را کامل‌تر توضیح خواهد داد.)

### برخورد با خطای احتمالی به وسیله نوع داده `Result`

هنوز روی این خط کد کار می‌کنیم. اما بیایید در مورد بخش سوم این خط صحبت کنیم.
با اینکه این عبارت روی خط جدید قرار گرفته، هنوز از نظر منطقی به خط قبلی وابسته است.
بخش بعدی این متود است:

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-01/src/main.rs:expect}}
```
وقتی یک متد را با گرامر `.foo()` فراخوانی کنید، معمولاً عاقلانه است که خط جدید و فضای سفید اضافه کنید
تا شکستن خطوط بلند راحت‌تر شود. می‌توانستیم این کد را به صورت زیر هم بنویسیم:

```rust,ignore
io::stdin().read_line(&mut guess).expect("Failed to read line");
```

اما خواندن یک خط بلند می‌تواند سخت باشد. پس آنرا تقسیم می‌کنیم. حال ببینیم این خط 
چه کاری انجام می‌دهد.

همانطور که قبلا گفته شد، `read_line` هرچه کاربر تایپ کند در رشته‌ای که به آن می‌دهیم
قرار می‌دهد. اما در این مورد خاص یک مقدار هم بر‌می‌گرداند. یک مقدار [`io::Result`][ioresult]<!-- ignore -->.
زبان Rust چند نوع داده به اسم `Result` در کتابخانه استاندارد خود دارد: یک [`Result`][result]<!-- ignore --> عمومی
و چند نسخه خاص آن برای ساب‌ماژول‌ها مثل: `io::Result`.

[ioresult]: ../std/io/type.Result.html
[result]: ../std/result/enum.Result.html

نوع داده‌های `Result` در واقع [*شمارش*][enums]<!-- ignore --> یا *enumeration* هستند 
که *enum* هم عنوان می‌شوند. شمارش نوع دادهای است که می‌تواند مجموعه مقادیر مشخصی بپذیرد و 
این مجموعه مقدارها *حالت* نامیده می‌شوند. فصل ۶ به جزئیات بیشتری در مورد شمارش‌ها می‌پردازد.

[enums]: ch06-00-enums.html

برای `Result`، حالت‌های مختلف `Ok` یا `Err` هستند.
حالت `Ok` نشان می‌دهد که عملیات موفق بوده و داخل `Ok` 
مقدار خروجی موفقیت آمیز ذخیره می‌شود. حالت `Err` اما نشان‌دهنده
شکست عملیات است. این حالت نیز اطلاعاتی در مورد چگونگی و چرایی اتفاق افتادن
خطا در بردارد.

هدف نوع داده `Result` در واقع کدگذاری اطلاعات خطایابی است.
مقادیر نوع داده `Result`، مثل مقادیر هر نوع داده دیگری، دارای متد هستند.
یک نمونه از `io::Result` متد [`expect`][expect]<!-- ignore--> را
دارد که می‌توانید صدا بزنید. اگر این نمونه از `io::Result` حالت `Err` داشته باشد،
صدازدن `expect` باعث کرش برنامه و نمایش پیامی که به عنوان آرگومان به `expect` بدهید
می‌شود. اگر متد `read_line` یک `Err` برگرداند، احتمالاً مشکل خطایی در سیستم‌عامل
خواهد بود. در این نمونه از `io::Result` حالت `Ok` است، پس `expect` مقداری که `Ok`
نگه داشته برای شما بر‌می‌گرداند تا بتوانید آنرا استفاده کنید. در این حالت آن مقدار در واقع
تعداد بایت‌هایی است که کاربر در ورودی استاندارد وارد کرده.

[expect]: ../std/result/enum.Result.html#method.expect

اگر `expect` را صدا نزنید اما، با اینکه برنامه کامپایل می‌شود، حین آن خطایی نمایش داده می‌شود:

```text
{{#include ../listings/ch02-guessing-game-tutorial/no-listing-02-without-expect/output.txt}}
```

کامپایلر Rust هشدار می‌دهد که از مقدار `Result` برگردانده شده از `read_line` هیچ استفاده‌ای نکرده‌اید 
و این نشان دهنده رفتار نامشخص برنامه با یک خطای احتمالی است.

روش درست برای عدم نمایش این خطا، نوشتن رفتار مورد نظر در صورت بروز این خطا است.
اما چون شما فقط می‌خواهید در صورت اتفاق افتادن مشکل برنامه را متوقف سازید می‌توانید از `expect` 
استفاده کنید. اما نوشتن نحوه رفتار و بازیابی برنامه در صورت خطا را در فصل ۹ خواهید آموخت.

### چاپ کردن مقادیر و جانشانی با `println!`

به‌جز براکت‌ها، باید در مورد یک خط دیگر هم صحبت کنیم:


```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-01/src/main.rs:print_guess}}
```

این خط رشته‌ای که ورودی کاربر در آن ذخیره شد را چاپ می‌کند. به کاری که مجموع کارکترهای ‌`{}` انجام می‌دهند جانشانی می‌گوییم: 
این کارکترها را می‌توان به عنوان نمایشگر یک متغیر در نظر گرفت که قرار است مقداری را به جای خودش قرار دهد. می‌توانید بیشتر از یک مقدار را هم با این
روش چاپ کنید: اولین کارکترهای `{}` اولین مقدار وارد شده بعد از رشته را نگهداری می‌کنند، دومین آن‌ها مقدار دوم و به همین ترتیب ادامه
می‌یابد. در نهایت کدی به شکل زیر خواهیم داشت:

```rust
let x = 5;
let y = 10;

println!("x = {} and y = {}", x, y);
```

نتیجه این کد چاپ عبارت `x = 5 and y = 10` خواهد بود.

### بررسی کردن قسمت‌اول

اولین بخش برنامه حدس‌زدن را بررسی کنیم. با دستور `cargo run` آنرا اجرا می‌کنیم:

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial/listing-02-01/
cargo clean
cargo run
input 6 -->

```text
$ cargo run
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished dev [unoptimized + debuginfo] target(s) in 6.44s
     Running `target/debug/guessing_game`
Guess the number!
Please input your guess.
6
You guessed: 6
```

تا اینجا قسمت اول کار می‌کند: ما می‌توانیم از کیبورد ورودی بگیریم و آنرا چاپ کنیم.

## ساخت یک عدد مخفی

باید یک عدد مخفی از کاربر بسازیم تا بتواند آنرا حدس بزند. این عدد باید هربار متفاوت باشد 
تا بتوانیم آن‌را بیشتر از یک دفعه بازی کنیم. پس یک عدد تصادفی بین ۱ تا ۱۰۰ باید انتخاب کنیم
تا بازی خیلی سخت هم نباشد. Rust هم اکنون قابلیت ساخت عدد تصادفی در کتابخانه استاندارد خود
 را ندارد. اما تیم Rust یک crate برای این کار ارائه می‌دهند به اسم [`rand`][randcrate].

[randcrate]: https://crates.io/crates/rand

### استفاده از Crate برای افزودن قابلیت به برنامه‌های Rust

حتماً به یاد دارید که یک Crate یک مجموعه از فایل‌های کد منبع به زبان Rust است.
پروژه‌ای که مشغول ساخت آن هستیم یک *Binary Crate* نامید می‌شود که یعنی برنامه قابل اجرا است.
اما `rand` از نوع *Library Crate* می‌باشد که یک کتابخانه است و حاوی کدهایی است که می‌توان
در برنامه‌های دیگر از آن‌ها استفاده کرد.

استفاده راحت از Crate های خارجی یکی از نقات قوت Cargo است. قبل از اینکه کدی بنویسیم که از `rand`
استفاده کند باید فایل *Cargo.toml* را تغییر دهیم که `rand` را به عنوان پیشنیاز برای این پروژه بشناسد.
فایل را باز کنید و این خط را به آخر قسمت `[dependencies]` که قبلا Cargo برای شما ساخته اضافه کنید:

<!-- When updating the version of `rand` used, also update the version of
`rand` used in these files so they all match:
* ch07-04-bringing-paths-into-scope-with-the-use-keyword.md
* ch14-03-cargo-workspaces.md
-->

<span class="filename">Filename: Cargo.toml</span>

```toml
{{#include ../listings/ch02-guessing-game-tutorial/listing-02-02/Cargo.toml:9:}}
```

In the *Cargo.toml* file, everything that follows a header is part of a section
that continues until another section starts. The `[dependencies]` section is
where you tell Cargo which external crates your project depends on and which
versions of those crates you require. In this case, we’ll specify the `rand`
crate with the semantic version specifier `0.5.5`. Cargo understands [Semantic
Versioning][semver]<!-- ignore --> (sometimes called *SemVer*), which is a
standard for writing version numbers. The number `0.5.5` is actually shorthand
for `^0.5.5`, which means “any version that has a public API compatible with
version 0.5.5.”

[semver]: http://semver.org

Now, without changing any of the code, let’s build the project, as shown in
Listing 2-2.

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial/listing-02-02/
cargo clean
cargo build -->

```text
$ cargo build
    Updating crates.io index
  Downloaded rand v0.5.5
  Downloaded libc v0.2.62
  Downloaded rand_core v0.2.2
  Downloaded rand_core v0.3.1
  Downloaded rand_core v0.4.2
   Compiling rand_core v0.4.2
   Compiling libc v0.2.62
   Compiling rand_core v0.3.1
   Compiling rand_core v0.2.2
   Compiling rand v0.5.5
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished dev [unoptimized + debuginfo] target(s) in 2.53s
```

<span class="caption">Listing 2-2: The output from running `cargo build` after
adding the rand crate as a dependency</span>

You may see different version numbers (but they will all be compatible with
the code, thanks to SemVer!), and the lines may be in a different order.

Now that we have an external dependency, Cargo fetches the latest versions of
everything from the *registry*, which is a copy of data from
[Crates.io][cratesio]. Crates.io is where people in the Rust ecosystem post
their open source Rust projects for others to use.

[cratesio]: https://crates.io/

After updating the registry, Cargo checks the `[dependencies]` section and
downloads any crates you don’t have yet. In this case, although we only listed
`rand` as a dependency, Cargo also grabbed `libc` and `rand_core`, because
`rand` depends on those to work. After downloading the crates, Rust compiles
them and then compiles the project with the dependencies available.

If you immediately run `cargo build` again without making any changes, you
won’t get any output aside from the `Finished` line. Cargo knows it has already
downloaded and compiled the dependencies, and you haven’t changed anything
about them in your *Cargo.toml* file. Cargo also knows that you haven’t changed
anything about your code, so it doesn’t recompile that either. With nothing to
do, it simply exits.

If you open up the *src/main.rs* file, make a trivial change, and then save it
and build again, you’ll only see two lines of output:

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial/listing-02-02/
touch src/main.rs
cargo build -->

```text
$ cargo build
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished dev [unoptimized + debuginfo] target(s) in 2.53 secs
```

These lines show Cargo only updates the build with your tiny change to the
*src/main.rs* file. Your dependencies haven’t changed, so Cargo knows it can
reuse what it has already downloaded and compiled for those. It just rebuilds
your part of the code.

#### Ensuring Reproducible Builds with the *Cargo.lock* File

Cargo has a mechanism that ensures you can rebuild the same artifact every time
you or anyone else builds your code: Cargo will use only the versions of the
dependencies you specified until you indicate otherwise. For example, what
happens if next week version 0.5.6 of the `rand` crate comes out and
contains an important bug fix but also contains a regression that will break
your code?

The answer to this problem is the *Cargo.lock* file, which was created the
first time you ran `cargo build` and is now in your *guessing_game* directory.
When you build a project for the first time, Cargo figures out all the
versions of the dependencies that fit the criteria and then writes them to
the *Cargo.lock* file. When you build your project in the future, Cargo will
see that the *Cargo.lock* file exists and use the versions specified there
rather than doing all the work of figuring out versions again. This lets you
have a reproducible build automatically. In other words, your project will
remain at `0.5.5` until you explicitly upgrade, thanks to the *Cargo.lock*
file.

#### Updating a Crate to Get a New Version

When you *do* want to update a crate, Cargo provides another command, `update`,
which will ignore the *Cargo.lock* file and figure out all the latest versions
that fit your specifications in *Cargo.toml*. If that works, Cargo will write
those versions to the *Cargo.lock* file.

But by default, Cargo will only look for versions greater than `0.5.5` and less
than `0.6.0`. If the `rand` crate has released two new versions, `0.5.6` and
`0.6.0`, you would see the following if you ran `cargo update`:

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial/listing-02-02/
cargo update
assuming there is a new 0.5.x version of rand; otherwise use another update
as a guide to creating the hypothetical output shown here -->

```text
$ cargo update
    Updating crates.io index
    Updating rand v0.5.5 -> v0.5.6
```

At this point, you would also notice a change in your *Cargo.lock* file noting
that the version of the `rand` crate you are now using is `0.5.6`.

If you wanted to use `rand` version `0.6.0` or any version in the `0.6.x`
series, you’d have to update the *Cargo.toml* file to look like this instead:

```toml
[dependencies]
rand = "0.6.0"
```

The next time you run `cargo build`, Cargo will update the registry of crates
available and reevaluate your `rand` requirements according to the new version
you have specified.

There’s a lot more to say about [Cargo][doccargo]<!-- ignore --> and [its
ecosystem][doccratesio]<!-- ignore --> which we’ll discuss in Chapter 14, but
for now, that’s all you need to know. Cargo makes it very easy to reuse
libraries, so Rustaceans are able to write smaller projects that are assembled
from a number of packages.

[doccargo]: http://doc.crates.io
[doccratesio]: http://doc.crates.io/crates-io.html

### Generating a Random Number

Now that you’ve added the `rand` crate to *Cargo.toml*, let’s start using
`rand`. The next step is to update *src/main.rs*, as shown in Listing 2-3.

<span class="filename">Filename: src/main.rs</span>

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-03/src/main.rs:all}}
```

<span class="caption">Listing 2-3: Adding code to generate a random
number</span>

First, we add a `use` line: `use rand::Rng`. The `Rng` trait defines
methods that random number generators implement, and this trait must be in
scope for us to use those methods. Chapter 10 will cover traits in detail.

Next, we’re adding two lines in the middle. The `rand::thread_rng` function
will give us the particular random number generator that we’re going to use:
one that is local to the current thread of execution and seeded by the
operating system. Then we call the `gen_range` method on the random number
generator. This method is defined by the `Rng` trait that we brought into
scope with the `use rand::Rng` statement. The `gen_range` method takes two
numbers as arguments and generates a random number between them. It’s inclusive
on the lower bound but exclusive on the upper bound, so we need to specify `1`
and `101` to request a number between 1 and 100.

> Note: You won’t just know which traits to use and which methods and functions
> to call from a crate. Instructions for using a crate are in each crate’s
> documentation. Another neat feature of Cargo is that you can run the `cargo
> doc --open` command, which will build documentation provided by all of your
> dependencies locally and open it in your browser. If you’re interested in
> other functionality in the `rand` crate, for example, run `cargo doc --open`
> and click `rand` in the sidebar on the left.

The second line that we added to the middle of the code prints the secret
number. This is useful while we’re developing the program to be able to test
it, but we’ll delete it from the final version. It’s not much of a game if the
program prints the answer as soon as it starts!

Try running the program a few times:

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial/listing-02-03/
cargo run
4
cargo run
5
-->

```text
$ cargo run
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished dev [unoptimized + debuginfo] target(s) in 2.53s
     Running `target/debug/guessing_game`
Guess the number!
The secret number is: 7
Please input your guess.
4
You guessed: 4

$ cargo run
    Finished dev [unoptimized + debuginfo] target(s) in 0.02s
     Running `target/debug/guessing_game`
Guess the number!
The secret number is: 83
Please input your guess.
5
You guessed: 5
```

You should get different random numbers, and they should all be numbers between
1 and 100. Great job!

## Comparing the Guess to the Secret Number

Now that we have user input and a random number, we can compare them. That step
is shown in Listing 2-4. Note that this code won’t compile quite yet, as we
will explain.

<span class="filename">Filename: src/main.rs</span>

```rust,ignore,does_not_compile
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-04/src/main.rs:here}}
```

<span class="caption">Listing 2-4: Handling the possible return values of
comparing two numbers</span>

The first new bit here is another `use` statement, bringing a type called
`std::cmp::Ordering` into scope from the standard library. Like `Result`,
`Ordering` is another enum, but the variants for `Ordering` are `Less`,
`Greater`, and `Equal`. These are the three outcomes that are possible when you
compare two values.

Then we add five new lines at the bottom that use the `Ordering` type. The
`cmp` method compares two values and can be called on anything that can be
compared. It takes a reference to whatever you want to compare with: here it’s
comparing the `guess` to the `secret_number`. Then it returns a variant of the
`Ordering` enum we brought into scope with the `use` statement. We use a
[`match`][match]<!-- ignore --> expression to decide what to do next based on
which variant of `Ordering` was returned from the call to `cmp` with the values
in `guess` and `secret_number`.

[match]: ch06-02-match.html

A `match` expression is made up of *arms*. An arm consists of a *pattern* and
the code that should be run if the value given to the beginning of the `match`
expression fits that arm’s pattern. Rust takes the value given to `match` and
looks through each arm’s pattern in turn. The `match` construct and patterns
are powerful features in Rust that let you express a variety of situations your
code might encounter and make sure that you handle them all. These features
will be covered in detail in Chapter 6 and Chapter 18, respectively.

Let’s walk through an example of what would happen with the `match` expression
used here. Say that the user has guessed 50 and the randomly generated secret
number this time is 38. When the code compares 50 to 38, the `cmp` method will
return `Ordering::Greater`, because 50 is greater than 38. The `match`
expression gets the `Ordering::Greater` value and starts checking each arm’s
pattern. It looks at the first arm’s pattern, `Ordering::Less`, and sees that
the value `Ordering::Greater` does not match `Ordering::Less`, so it ignores
the code in that arm and moves to the next arm. The next arm’s pattern,
`Ordering::Greater`, *does* match `Ordering::Greater`! The associated code in
that arm will execute and print `Too big!` to the screen. The `match`
expression ends because it has no need to look at the last arm in this scenario.

However, the code in Listing 2-4 won’t compile yet. Let’s try it:

```text
{{#include ../listings/ch02-guessing-game-tutorial/listing-02-04/output.txt}}
```

The core of the error states that there are *mismatched types*. Rust has a
strong, static type system. However, it also has type inference. When we wrote
`let mut guess = String::new()`, Rust was able to infer that `guess` should be
a `String` and didn’t make us write the type. The `secret_number`, on the other
hand, is a number type. A few number types can have a value between 1 and 100:
`i32`, a 32-bit number; `u32`, an unsigned 32-bit number; `i64`, a 64-bit
number; as well as others. Rust defaults to an `i32`, which is the type of
`secret_number` unless you add type information elsewhere that would cause Rust
to infer a different numerical type. The reason for the error is that Rust
cannot compare a string and a number type.

Ultimately, we want to convert the `String` the program reads as input into a
real number type so we can compare it numerically to the secret number. We can
do that by adding the following two lines to the `main` function body:

<span class="filename">Filename: src/main.rs</span>

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/no-listing-03-convert-string-to-number/src/main.rs:here}}
```

The two new lines are:

```rust,ignore
let guess: u32 = guess.trim().parse()
    .expect("Please type a number!");
```

We create a variable named `guess`. But wait, doesn’t the program already have
a variable named `guess`? It does, but Rust allows us to *shadow* the previous
value of `guess` with a new one. This feature is often used in situations in
which you want to convert a value from one type to another type. Shadowing lets
us reuse the `guess` variable name rather than forcing us to create two unique
variables, such as `guess_str` and `guess` for example. (Chapter 3 covers
shadowing in more detail.)

We bind `guess` to the expression `guess.trim().parse()`. The `guess` in the
expression refers to the original `guess` that was a `String` with the input in
it. The `trim` method on a `String` instance will eliminate any whitespace at
the beginning and end. Although `u32` can contain only numerical characters,
the user must press <span class="keystroke">enter</span> to satisfy
`read_line`. When the user presses <span class="keystroke">enter</span>, a
newline character is added to the string. For example, if the user types <span
class="keystroke">5</span> and presses <span class="keystroke">enter</span>,
`guess` looks like this: `5\n`. The `\n` represents “newline,” the result of
pressing <span class="keystroke">enter</span>. The `trim` method eliminates
`\n`, resulting in just `5`.

The [`parse` method on strings][parse]<!-- ignore --> parses a string into some
kind of number. Because this method can parse a variety of number types, we
need to tell Rust the exact number type we want by using `let guess: u32`. The
colon (`:`) after `guess` tells Rust we’ll annotate the variable’s type. Rust
has a few built-in number types; the `u32` seen here is an unsigned, 32-bit
integer. It’s a good default choice for a small positive number. You’ll learn
about other number types in Chapter 3. Additionally, the `u32` annotation in
this example program and the comparison with `secret_number` means that Rust
will infer that `secret_number` should be a `u32` as well. So now the
comparison will be between two values of the same type!

[parse]: ../std/primitive.str.html#method.parse

The call to `parse` could easily cause an error. If, for example, the string
contained `A👍%`, there would be no way to convert that to a number. Because it
might fail, the `parse` method returns a `Result` type, much as the `read_line`
method does (discussed earlier in [“Handling Potential Failure with the
`Result` Type”](#handling-potential-failure-with-the-result-type)<!-- ignore
-->). We’ll treat this `Result` the same way by using the `expect` method
again. If `parse` returns an `Err` `Result` variant because it couldn’t create
a number from the string, the `expect` call will crash the game and print the
message we give it. If `parse` can successfully convert the string to a number,
it will return the `Ok` variant of `Result`, and `expect` will return the
number that we want from the `Ok` value.

Let’s run the program now!

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial/no-listing-03-convert-string-to-number/
cargo run
  76
-->

```text
$ cargo run
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished dev [unoptimized + debuginfo] target(s) in 0.43s
     Running `target/debug/guessing_game`
Guess the number!
The secret number is: 58
Please input your guess.
  76
You guessed: 76
Too big!
```

Nice! Even though spaces were added before the guess, the program still figured
out that the user guessed 76. Run the program a few times to verify the
different behavior with different kinds of input: guess the number correctly,
guess a number that is too high, and guess a number that is too low.

We have most of the game working now, but the user can make only one guess.
Let’s change that by adding a loop!

## Allowing Multiple Guesses with Looping

The `loop` keyword creates an infinite loop. We’ll add that now to give users
more chances at guessing the number:

<span class="filename">Filename: src/main.rs</span>

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/no-listing-04-looping/src/main.rs:here}}
```

As you can see, we’ve moved everything into a loop from the guess input prompt
onward. Be sure to indent the lines inside the loop another four spaces each
and run the program again. Notice that there is a new problem because the
program is doing exactly what we told it to do: ask for another guess forever!
It doesn’t seem like the user can quit!

The user could always interrupt the program by using the keyboard shortcut <span
class="keystroke">ctrl-c</span>. But there’s another way to escape this
insatiable monster, as mentioned in the `parse` discussion in [“Comparing the
Guess to the Secret Number”](#comparing-the-guess-to-the-secret-number)<!--
ignore -->: if the user enters a non-number answer, the program will crash. The
user can take advantage of that in order to quit, as shown here:

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial/no-listing-04-looping/
cargo run
(too small guess)
(too big guess)
(correct guess)
quit
-->

```text
$ cargo run
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished dev [unoptimized + debuginfo] target(s) in 1.50s
     Running `target/debug/guessing_game`
Guess the number!
The secret number is: 59
Please input your guess.
45
You guessed: 45
Too small!
Please input your guess.
60
You guessed: 60
Too big!
Please input your guess.
59
You guessed: 59
You win!
Please input your guess.
quit
thread 'main' panicked at 'Please type a number!: ParseIntError { kind: InvalidDigit }', src/libcore/result.rs:999:5
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace.
```

Typing `quit` actually quits the game, but so will any other non-number input.
However, this is suboptimal to say the least. We want the game to automatically
stop when the correct number is guessed.

### Quitting After a Correct Guess

Let’s program the game to quit when the user wins by adding a `break` statement:

<span class="filename">Filename: src/main.rs</span>

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/no-listing-05-quitting/src/main.rs:here}}
```

Adding the `break` line after `You win!` makes the program exit the loop when
the user guesses the secret number correctly. Exiting the loop also means
exiting the program, because the loop is the last part of `main`.

### Handling Invalid Input

To further refine the game’s behavior, rather than crashing the program when
the user inputs a non-number, let’s make the game ignore a non-number so the
user can continue guessing. We can do that by altering the line where `guess`
is converted from a `String` to a `u32`, as shown in Listing 2-5.

<span class="filename">Filename: src/main.rs</span>

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-05/src/main.rs:here}}
```

<span class="caption">Listing 2-5: Ignoring a non-number guess and asking for
another guess instead of crashing the program</span>

Switching from an `expect` call to a `match` expression is how you generally
move from crashing on an error to handling the error. Remember that `parse`
returns a `Result` type and `Result` is an enum that has the variants `Ok` or
`Err`. We’re using a `match` expression here, as we did with the `Ordering`
result of the `cmp` method.

If `parse` is able to successfully turn the string into a number, it will
return an `Ok` value that contains the resulting number. That `Ok` value will
match the first arm’s pattern, and the `match` expression will just return the
`num` value that `parse` produced and put inside the `Ok` value. That number
will end up right where we want it in the new `guess` variable we’re creating.

If `parse` is *not* able to turn the string into a number, it will return an
`Err` value that contains more information about the error. The `Err` value
does not match the `Ok(num)` pattern in the first `match` arm, but it does
match the `Err(_)` pattern in the second arm. The underscore, `_`, is a
catchall value; in this example, we’re saying we want to match all `Err`
values, no matter what information they have inside them. So the program will
execute the second arm’s code, `continue`, which tells the program to go to the
next iteration of the `loop` and ask for another guess. So, effectively, the
program ignores all errors that `parse` might encounter!

Now everything in the program should work as expected. Let’s try it:

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial/listing-02-05/
cargo run
(too small guess)
(too big guess)
foo
(correct guess)
-->

```text
$ cargo run
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
     Running `target/debug/guessing_game`
Guess the number!
The secret number is: 61
Please input your guess.
10
You guessed: 10
Too small!
Please input your guess.
99
You guessed: 99
Too big!
Please input your guess.
foo
Please input your guess.
61
You guessed: 61
You win!
```

Awesome! With one tiny final tweak, we will finish the guessing game. Recall
that the program is still printing the secret number. That worked well for
testing, but it ruins the game. Let’s delete the `println!` that outputs the
secret number. Listing 2-6 shows the final code.

<span class="filename">Filename: src/main.rs</span>

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-06/src/main.rs}}
```

<span class="caption">Listing 2-6: Complete guessing game code</span>

## Summary

At this point, you’ve successfully built the guessing game. Congratulations!

This project was a hands-on way to introduce you to many new Rust concepts:
`let`, `match`, methods, associated functions, the use of external crates, and
more. In the next few chapters, you’ll learn about these concepts in more
detail. Chapter 3 covers concepts that most programming languages have, such as
variables, data types, and functions, and shows how to use them in Rust.
Chapter 4 explores ownership, a feature that makes Rust different from other
languages. Chapter 5 discusses structs and method syntax, and Chapter 6
explains how enums work.

[variables-and-mutability]:
ch03-01-variables-and-mutability.html#variables-and-mutability
