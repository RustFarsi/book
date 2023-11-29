## متغیرها و تغییرپذیری

همانطور که در فصل 2 گفتیم, متغیرها به صورت پیشفرض غیر قابل تغییر (Immutable) هستند. غیر قابل تغییر بودن متغیرها یکی از راهکارهای
خوب Rust است که برنامه نویس را مجبور می‌کند تا کد خود را تمیز بنویسد و درنتیجه از امکانات خاص Rust (مانند همزمانی) به بهترین شکل استفاده کند.
با این حال شما همچنان این قدرت را دارید که متغیرهای خود را تغییرپذیر کنید. بیایید بررسی کنیم که Rust چرا و چگونه شما را تشویق می‌کند که از غیرقابل
تغییر بودن متغیرها طرفداری کنید و اینکه چرا ممکن است شما بخواهید این حالت را دور بزنید.

وقتی یک متغیر تغییرپذیر نیست، هنگامی که یک مقدار به آن نسبت دهید، دیگر نمی‌توانید آن مقدار را تغییر دهید. برای آنکه این موضوع را بهتر متوجه بشوید،
اجازه بدهید یک پروژه جدید در پوشه *projects* ایجاد کنیم و آن را *variables* بنامیم. برای این کار این دستور را اجرا می‌کنیم: `cargo new variables`.

سپس در پوشه *variables*، فایل *src/main.rs* را باز کنید و کد آن را با کد زیر (که فعلا کامپایل نخواهد شد) عوض کنید:

<span class="filename">نام فایل: src/main.rs</span>

```rust,ignore,does_not_compile
{{#rustdoc_include ../listings/ch03-common-programming-concepts/no-listing-01-variables-are-immutable/src/main.rs}}
```

فایل را ذخیره کنید و برنامه را با استفاده از دستور `cargo run` اجرا کنید. در این حالت شما یک پیام خطا به این شکل دریافت خواهید کرد:

```text
{{#include ../listings/ch03-common-programming-concepts/no-listing-01-variables-are-immutable/output.txt}}
```

این مثال نشان می دهد که چگونه کامپایلر به شما کمک می‌کند تا خطاهای برنامه خود را پیدا کنید. ممکن است پیام‌های کامپایلر ناامید کننده و پیچیده باشند، ولی
بدین معنا هستند که برنامه شما هنوز کاری که میخواهید را با اطمینان انجام نمی‌دهد؛ این پیام‌ها به هیچ وجه به معنی این نیست که شما برنامه نویس بدی هستید!
برنامه نویسان حرفه‌ای Rust هم همچنان پیام‌های خطا را دریافت می‌کنند.

پیام خطا به ما می‌گوید که دلیل خطا این است: `cannot assign twice to immutable variable x`؛ نمی‌توان دوبار به متغیر تغییرناپذیر `x`
مقدار داد، زیرا شما سعی کرده‌اید که به متغیر تغییرناپذیر `x` یک بار دیگر مقدار بدهید.

از آنجایی که سعی کرده‌ایم به یک متغیر تغییرناپذیر دوباره مقدار دهیم، بهتر است که در این مورد خطای زمان کامپایل (compile-time error) دریافت کنیم
زیرا این کار ممکن است باعث به وجود آمدن باگ شود. اگر یک قسمت از کد ما با این تصور که فلان مقدار هیچوقت تغییر نخواهد کرد، عمل کند و قسمت دیگری
از کد آن مقدار را تغییر دهد، ممکن است که قسمت اول نتواند به درستی کاری که برایش طراحی شده را انجام دهد. ردیابی این گونه خطاها بسیار دشوار است،
خصوصا وقتی که قسمت دوم کد تنها *گاهی* آن مقدار را تغییر دهد.

در زبان Rust، کامپایلر تضمین می‌کند که اگر شما یک مقدار را تغییرناپذیر عنوان کنید، آن مقدار هرگز تغییر نخواهد کرد. این بدین معناست که وقتی شما کد را
می‌خوانید و می‌نویسید، لازم نیست که نگران این موضوع باشید که یک مقدار کی و کجا تغییر می‌کند. بنابراین کد شما منطقی‌تر خواهد بود.

با این حال تغییر پذیری می تواند بسیار مفید باشد. متغیرها فقط به صورت پیشفرض تغییرناپذیر هستند. همانطور که در فصل ۲ دیدیم، شما می‌توانید با اضافه
کردن `mut` قبل از نام متغیر آن را تغییرپذیر کنید. علاوه بر تغییرپذیر کردن مقدار، `mut` به خوانندگان کد می‌گوید که قسمت‌های دیگر کد می‌توانند
مقدار این متغیر را تغییر دهند.

به عنوان مثال اجاره دهید *src/main.rs* را به این صورت تغییر دهیم:

<span class="filename">نام فایل: src/main.rs</span>

```rust
{{#rustdoc_include ../listings/ch03-common-programming-concepts/no-listing-02-adding-mut/src/main.rs}}
```

اگر حالا برنامه را اجرا کنیم خواهیم داشت:

```text
{{#include ../listings/ch03-common-programming-concepts/no-listing-02-adding-mut/output.txt}}
```

هنگامی که از `mut` استفاده کنیم می‌توانیم مقداری که در متغیر `x` ذخیره شده را از `5` به `6` تغییر دهیم. گاهی نیز ممکن است بخواهید
یک متغیر را تغییرپذیر تعریف کنید زیرا نوشتن برنامه راحت تر می‌شود.

علاوه بر جلوگیری از باگ، چند نکته دیگر نیز وجود دارد که باید درنظر گرفت. برای مثال در مواردی که از ساختار داده‌های بزرگ استفاده می‌کنید،
تغییر دادن یک شئ سریعتر از آن است که یک کپی از آن بگیریم. درمورد ساختارهای داده‌ای کوچک‌تر، ایجاد نمونه‌های جدید و نوشتن به سبک برنامه‌نویسی
کاربردی‌ ممکن است آسان‌تر باشد، بنابراین عملکرد پایین‌تر ممکن است بهایی ارزشمند برای به دست آوردن این تمیزی کد باشد.

### Differences Between Variables and Constants

Being unable to change the value of a variable might have reminded you of
another programming concept that most other languages have: *constants*. Like
immutable variables, constants are values that are bound to a name and are not
allowed to change, but there are a few differences between constants and
variables.

First, you aren’t allowed to use `mut` with constants. Constants aren’t just
immutable by default—they’re always immutable.

You declare constants using the `const` keyword instead of the `let` keyword,
and the type of the value *must* be annotated. We’re about to cover types and
type annotations in the next section, [“Data Types,”][data-types]<!-- ignore
--> so don’t worry about the details right now. Just know that you must always
annotate the type.

Constants can be declared in any scope, including the global scope, which makes
them useful for values that many parts of code need to know about.

The last difference is that constants may be set only to a constant expression,
not the result of a function call or any other value that could only be
computed at runtime.

Here’s an example of a constant declaration where the constant’s name is
`MAX_POINTS` and its value is set to 100,000. (Rust’s naming convention for
constants is to use all uppercase with underscores between words, and
underscores can be inserted in numeric literals to improve readability):

```rust
const MAX_POINTS: u32 = 100_000;
```

Constants are valid for the entire time a program runs, within the scope they
were declared in, making them a useful choice for values in your application
domain that multiple parts of the program might need to know about, such as the
maximum number of points any player of a game is allowed to earn or the speed
of light.

Naming hardcoded values used throughout your program as constants is useful in
conveying the meaning of that value to future maintainers of the code. It also
helps to have only one place in your code you would need to change if the
hardcoded value needed to be updated in the future.

### Shadowing

As you saw in the guessing game tutorial in the [“Comparing the Guess to the
Secret Number”][comparing-the-guess-to-the-secret-number]<!-- ignore -->
section in Chapter 2, you can declare a new variable with the same name as a
previous variable, and the new variable shadows the previous variable.
Rustaceans say that the first variable is *shadowed* by the second, which means
that the second variable’s value is what appears when the variable is used. We
can shadow a variable by using the same variable’s name and repeating the use
of the `let` keyword as follows:

<span class="filename">Filename: src/main.rs</span>

```rust
{{#rustdoc_include ../listings/ch03-common-programming-concepts/no-listing-03-shadowing/src/main.rs}}
```

This program first binds `x` to a value of `5`. Then it shadows `x` by
repeating `let x =`, taking the original value and adding `1` so the value of
`x` is then `6`. The third `let` statement also shadows `x`, multiplying the
previous value by `2` to give `x` a final value of `12`. When we run this
program, it will output the following:

```text
{{#include ../listings/ch03-common-programming-concepts/no-listing-03-shadowing/output.txt}}
```

Shadowing is different from marking a variable as `mut`, because we’ll get a
compile-time error if we accidentally try to reassign to this variable without
using the `let` keyword. By using `let`, we can perform a few transformations
on a value but have the variable be immutable after those transformations have
been completed.

The other difference between `mut` and shadowing is that because we’re
effectively creating a new variable when we use the `let` keyword again, we can
change the type of the value but reuse the same name. For example, say our
program asks a user to show how many spaces they want between some text by
inputting space characters, but we really want to store that input as a number:

```rust
{{#rustdoc_include ../listings/ch03-common-programming-concepts/no-listing-04-shadowing-can-change-types/src/main.rs:here}}
```

This construct is allowed because the first `spaces` variable is a string type
and the second `spaces` variable, which is a brand-new variable that happens to
have the same name as the first one, is a number type. Shadowing thus spares us
from having to come up with different names, such as `spaces_str` and
`spaces_num`; instead, we can reuse the simpler `spaces` name. However, if we
try to use `mut` for this, as shown here, we’ll get a compile-time error:

```rust,ignore,does_not_compile
{{#rustdoc_include ../listings/ch03-common-programming-concepts/no-listing-05-mut-cant-change-types/src/main.rs:here}}
```

The error says we’re not allowed to mutate a variable’s type:

```text
{{#include ../listings/ch03-common-programming-concepts/no-listing-05-mut-cant-change-types/output.txt}}
```

Now that we’ve explored how variables work, let’s look at more data types they
can have.

[comparing-the-guess-to-the-secret-number]:
ch02-00-guessing-game-tutorial.html#comparing-the-guess-to-the-secret-number
[data-types]: ch03-02-data-types.html#data-types
