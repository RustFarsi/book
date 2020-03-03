# مقدمه

به *زبان برنامه‌نویسی Rust*، کتابی برای معرفی زبان Rust خوش‌آمدید.
این زبان به شما کمک می‌کند که برنامه‌های سریع‌تر و قابل اتکا بنویسید.
انعطاف پذیری برنامه‌نویسی سطح بالا و قدرت کنترل سطح پایین معمولاً در طراحی
 زبان‌های برنامه‌نویسی با هم در تضاد هستند. Rust این تضاد را به چالش می‌کشد.
 با ایجاد تعادل در ظرفیت تکنیکی و تجربه راحت توسعه دهنده، Rust اجازه می‌دهد
 بدون دردسر های شایع در این سطح به کنترل جزئیات سطح 
 پایین(مثل مدیریت حافظه) بپردازید.

##  Rust به درد چه کسانی می‌خورد؟

Rust برای دلایل متنوعی برای بسیاری از افراد ایدآل است. به چند دلیل اصلی می‌پردازیم.

### گروه‌های توسعه دهندگان

زبان Rust نشان داده که ابزاری پربار برای همکاری بین گروه‌های بزرگ توسعه دهندگان
با سطوح مختلف دانش و تسط بر برنامه‌نویسی سیستم است. کد سطح پایین
در برابر خطا‌های نامحسوس بسیاری آسیب پذیر است که در اکثر زبان‌های دیگر فقط با
 تست‌های زیاد و فراگیر، بررسی دقیق و بازبینی توسعه دهندگان با تجربه قابل برطرف
 کردن است. در Rust کامپایلر نقش دروازه‌بانی را ایفا می‌کند که از کامپایل شدن
 کد‌های شامل چنین خطاهایی مثل خطا‌های همزمانی (Concurrency) جلوگیری می‌کند.
 گروهی که از چنین قابلیتی استفاده کند می‌تواند به جای درگیری با این خطاها وقت خود را
 صرف ساختن منطق برنامه کند.

Rust همچنین ابزار‌های مرسوم توسعه نرم‌افزار امروزی را به دنیای برنامه‌نویسی سیستم می‌آورد:

* کارگو(Cargo)، مدیربسته و ابزار ساخت فایل اجرایی، اضافه کردن، کامپایل کردن و مدیریت
پیشنیاز‌ها را ساده و بی‌دردسر می‌کند و به آنها در اکوسیستم Rust یکپارچگی می‌بخشد.
* Rustfmt ثبات نحوه کد نویسی بین توسعه‌دهندگان را تضمین می‌کند.
* سرور زبان Rust ادغام زبان را با محیط‌های توسعه (IDE) برای کامل کردن خودکار کد و نشان دادن
خطا‌ها را ممکن می‌سازد.

با استفاده از این ابزار‌ها و سایر ابزار‌های اکوسیستم Rust، توسعه‌دهندگان در نوشتن کد‌های سطح سیستم
پربار خواهند بود.


### دانشجویان

Rust برای دانشجویان و کسانی که یادگیری مفاهیم سیستم برایشان جالب است نیز ساخته شده است.
با استفاده از Rust، افراد بسیاری مباحثی مانند توسعه سیستم‌های عامل را فراگرفته‌اند. جامعه نیز استقبال
بسیاری برای پاسخگویی به سوالات دانشجویان دارد. با تلاش‌هایی مثل تألیف این کتاب، تیم‌های Rust
درنظر دارند مباحث سیستم را برای افراد بیشتری، به ویژه برنامه‌نویسان تازه کار، قابل دسترسی کنند.

### شرکت‌ها

صد‌ها شرکت بزرگ و کوچک از Rust برای تولید ابزارهای مختلف استفاده می‌کنند.
ابزار‌هایی مثل ابزار خط فرمان، وب سرویس‌ها، ابزار DevOps، دستگاه‌های سیار، آنالیز
صدا و تصویر، کدگذاری، رمزارز‌ها، بیوانفورماتیک، موتور‌های جستجو، برنامه‌های مربوط به اینترنت چیز‌ها
، یادگیری ماشین و حتی قسمت‌های مهمی از مرورگر فایرفاکس.


### توسعه‌دهندگان نرم‌افزار‌های متن‌باز

Rust متعلق به کسانی است که علاقه‌مند به مشارکت در ساخت زبان، جامعه، ابزار توسعه و کتابخانه ها باشند.
اگر در ساخت زبان Rust کمک کنید بسیار خوشحال خواهیم شد.

### افرادی که به سرعت و پایداری اهمیت می‌دهند

Rust برای کسانی مناسب است که در یک زبان برنامه‌نویسی سرعت و پایداری را مدنظر دارند.
منظور از سرعت فقط سرعت اجرای برنامه‌هایی که با Rust می‌سازید نیست؛ بلکه سرعتی که Rust به شما اجازه می‌دهد برنامه بنویسید نیز مدنظر است.
بررسی‌های کامپایلر Rust، پایداری را حین افزودن امکانات و ویژگی‌های جدید و بهینه‌سازی یک برنامه تضمین می‌کند. این دقیقا برعکس کد های ناپایدار
قدیمی در زبان‌هایی که این بررسی‌هارا انجام نمی‌دهند و معمولاً باعث ایجاد وحشت هنگام تغییر قسمتی از برنامه می‌شوند. با تاکید روی انتزاعی‌سازی بدون
هزینه (zero-cost)، امکانات سطح بالاتر که به کد سطح پایین با سرعت قبلی کامپایل می‌شوند، Rust علاوه بر پایداری سرعت را نیز تضمین می‌کند.

زبان Rust پشتیبانی از کاربران بیشتری را هم در نظر دارد؛ موارد ذکر شده بالا تنها بخش کوچکی از ذینفعان هستند.
درکل می‌توان گفت که بزرگ‌ترین بلند پروازی Rust از بین بردن معامله ایست که برنامه‌نویس‌ها سالهاست که پذیرفته‌اند.
مبادله *سرعت* و *سازندگی* و *امنیت* و *انعطاف پذیری* که Rust همراه با هم ارائه می‌دهد.
Rust را امتحان کنید و ببینید که آیا این ویژگی‌ها برای شما مناسب است یا خیر.


## Who This Book Is For

This book assumes that you’ve written code in another programming language but
doesn’t make any assumptions about which one. We’ve tried to make the material
broadly accessible to those from a wide variety of programming backgrounds. We
don’t spend a lot of time talking about what programming *is* or how to think
about it. If you’re entirely new to programming, you would be better served by
reading a book that specifically provides an introduction to programming.

## How to Use This Book

In general, this book assumes that you’re reading it in sequence from front to
back. Later chapters build on concepts in earlier chapters, and earlier
chapters might not delve into details on a topic; we typically revisit the
topic in a later chapter.

You’ll find two kinds of chapters in this book: concept chapters and project
chapters. In concept chapters, you’ll learn about an aspect of Rust. In project
chapters, we’ll build small programs together, applying what you’ve learned so
far. Chapters 2, 12, and 20 are project chapters; the rest are concept chapters.

Chapter 1 explains how to install Rust, how to write a “Hello, world!” program,
and how to use Cargo, Rust’s package manager and build tool. Chapter 2 is a
hands-on introduction to the Rust language. Here we cover concepts at a high
level, and later chapters will provide additional detail. If you want to get
your hands dirty right away, Chapter 2 is the place for that. At first, you
might even want to skip Chapter 3, which covers Rust features similar to those
of other programming languages, and head straight to Chapter 4 to learn about
Rust’s ownership system. However, if you’re a particularly meticulous learner
who prefers to learn every detail before moving on to the next, you might want
to skip Chapter 2 and go straight to Chapter 3, returning to Chapter 2 when
you’d like to work on a project applying the details you’ve learned.

Chapter 5 discusses structs and methods, and Chapter 6 covers enums, `match`
expressions, and the `if let` control flow construct. You’ll use structs and
enums to make custom types in Rust.

In Chapter 7, you’ll learn about Rust’s module system and about privacy rules
for organizing your code and its public Application Programming Interface
(API). Chapter 8 discusses some common collection data structures that the
standard library provides, such as vectors, strings, and hash maps. Chapter 9
explores Rust’s error-handling philosophy and techniques.

Chapter 10 digs into generics, traits, and lifetimes, which give you the power
to define code that applies to multiple types. Chapter 11 is all about testing,
which even with Rust’s safety guarantees is necessary to ensure your program’s
logic is correct. In Chapter 12, we’ll build our own implementation of a subset
of functionality from the `grep` command line tool that searches for text
within files. For this, we’ll use many of the concepts we discussed in the
previous chapters.

Chapter 13 explores closures and iterators: features of Rust that come from
functional programming languages. In Chapter 14, we’ll examine Cargo in more
depth and talk about best practices for sharing your libraries with others.
Chapter 15 discusses smart pointers that the standard library provides and the
traits that enable their functionality.

In Chapter 16, we’ll walk through different models of concurrent programming
and talk about how Rust helps you to program in multiple threads fearlessly.
Chapter 17 looks at how Rust idioms compare to object-oriented programming
principles you might be familiar with.

Chapter 18 is a reference on patterns and pattern matching, which are powerful
ways of expressing ideas throughout Rust programs. Chapter 19 contains a
smorgasbord of advanced topics of interest, including unsafe Rust, macros, and
more about lifetimes, traits, types, functions, and closures.

In Chapter 20, we’ll complete a project in which we’ll implement a low-level
multithreaded web server!

Finally, some appendixes contain useful information about the language in a
more reference-like format. Appendix A covers Rust’s keywords, Appendix B
covers Rust’s operators and symbols, Appendix C covers derivable traits
provided by the standard library, Appendix D covers some useful development
tools, and Appendix E explains Rust editions.

There is no wrong way to read this book: if you want to skip ahead, go for it!
You might have to jump back to earlier chapters if you experience any
confusion. But do whatever works for you.

<span id="ferris"></span>

An important part of the process of learning Rust is learning how to read the
error messages the compiler displays: these will guide you toward working code.
As such, we’ll provide many examples that don’t compile along with the error
message the compiler will show you in each situation. Know that if you enter
and run a random example, it may not compile! Make sure you read the
surrounding text to see whether the example you’re trying to run is meant to
error. Ferris will also help you distinguish code that isn’t meant to work:

| Ferris                                                                 | Meaning                                          |
|------------------------------------------------------------------------|--------------------------------------------------|
| <img src="img/ferris/does_not_compile.svg" class="ferris-explain"/>    | This code does not compile!                      |
| <img src="img/ferris/panics.svg" class="ferris-explain"/>              | This code panics!                                |
| <img src="img/ferris/unsafe.svg" class="ferris-explain"/>              | This code block contains unsafe code.            |
| <img src="img/ferris/not_desired_behavior.svg" class="ferris-explain"/>| This code does not produce the desired behavior. |

In most situations, we’ll lead you to the correct version of any code that
doesn’t compile.

## Source Code

The source files from which this book is generated can be found on
[GitHub][book].

[book]: https://github.com/rust-lang/book/tree/master/src
