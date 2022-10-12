## پیوست ب: عملگرها و نمادها

این پیوست دربردارنده‌ی واژه‌نامه‌ی Rust، یعنی عملگرها و
نمادهای دیگری که به خودی خود یا در زمینه مسیرها، ژنریک‌ها،
مرزهای صفت، ماکروها، ویژگی‌ها، دیدگاه‌ها، چندتایی‌ها و براکت‌ها است.

### عملگرها

جدول ب-۱ شامل عملگرهای Rust است، مثالی از نحوه انجام عملگر
در متن ظاهر می شود، توضیحی کوتاه، و اینکه آیا آن عملگر قابل بازتعریف‌کردن (overloadable) است یا خیر. اگر یک اپراتور قابلیت بازتعریف کردن را داشته باشد، ویژگی مربوطه برای استفاده بازتعریف آن عملگر فهرست شده است.

<span class="caption">جدول ب-۱: عملگرها</span>

| قابلیت بازتعریف؟ |                                       توضیح | نمونه                                                   | عملگر                     |
|------------------|--------------------------------------------:|---------------------------------------------------------|---------------------------|
|                  |                           بسط و تعریف ماکرو | `ident!(...)`, `ident!{...}`, `ident![...]`             | `!`                       |
| `Not`            |                          نقیض بیتی یا منطقی | `!expr`                                                 | `!`                       |
| `PartialEq`      |                           مقایسه عدم برابری | `var != expr`                                           | `!=`                      |
| `Rem`            |                             باقیمانده حسابی | `expr % expr`                                           | `%`                       |
| `RemAssign`      |                    باقیمانده حسابی و انتساب | `var %= expr`                                           | `%=`                      |
|                  |                                       تقریض | `&expr`, `&mut expr`                                    | `&`                       |
|                  |                          تقریض نوع اشاره گر | `&type`, `&mut type`, `&'a type`, `&'a mut type`        | `&`                       |
| `BitAnd`         |                                    عطب بیتی | `expr & expr`                                           | `&`                       |
| `BitAndAssign`   |                           عطف بیتی و انتساب | `var &= expr`                                           | `&=`                      |
|                  |                                   عطف حسابی | `expr && expr`                                          | `&&`                      |
| `Mul`            |                                   ضرب حسابی | `expr * expr`                                           | `*`                       |
| `MulAssign`      |                          ضرت و انتساب ریاضی | `var *= expr`                                           | `*=`                      |
|                  |                                   لغو ارجاع | `*expr`                                                 | `*`                       |
|                  |                                اشاره گر خام | `*const type`, `*mut type`                              | `*`                       |
|                  |                       محدودیت نوع داده مرکب | `trait + trait`, `'a + trait`                           | `+`                       |
| `Add`            |                                   جمع حسابی | `expr + expr`                                           | `+`                       |
| `AddAssign`      |                          جمع حسابی و انتساب | `var += expr`                                           | `+=`                      |
|                  |             جداکننده ی ورودی توابع و عنصرها | `expr, expr`                                            | `,`                       |
| `Neg`            |                                  نقیض حسابی | `- expr`                                                | `-`                       |
| `Sub`            |                                 تفریق حسابی | `expr - expr`                                           | `-`                       |
| `SubAssign`      |                        تفریق حسابی و انتساب | `var -= expr`                                           | `-=`                      |
|                  |                 نوع داده ی خروجی تابع و شرط | `fn(...) -> type`, <code>&vert;...&vert; -> type</code> | `->`                      |
|                  |                               دسترسی به عضو | `expr.ident`                                            | `.`                       |
|                  |           مجوز غیرانحصاری محدوده ی بیان شده | `..`, `expr..`, `..expr`, `expr..expr`                  | `..`                      |
|                  |           مجوز غیرانحصاری محدوده ی بیان شده | `..=expr`, `expr..=expr`                                | `..=`                     |
|                  |           نحو به روزرسانی محدوده ی بیان شده | `..expr`                                                | `..`                      |
|                  |                       اتصال الگوی «و ادامه» | `variant(x, ..)`, `struct_type { x, .. }`               | `..`                      |
|                  |      در یک الگو: الگوی غیرانحصاری در محدوده | `expr...expr`                                           | `...`                     |
| `Div`            |                                 تقسیم حسابی | `expr / expr`                                           | `/`                       |
| `DivAssign`      |                        تقسیم حسابی و انتساب | `var /= expr`                                           | `/=`                      |
|                  |                        مشخص کننده ی محدودیت | `pat: type`, `ident: type`                              | `:`                       |
|                  | مقداردهنده ی اولیه مشخصه در نوع داده ساختار | `ident: expr`                                           | `:`                       |
|                  |                                  برچسب حلقه | `'a: loop {...}`                                        | `:`                       |
|                  |             پایان دهنده عبارات و موارد دیگر | `expr;`                                                 | `;`                       |
|                  |          بخشی از نحو آرایه با اندازه ی ثابت | `[...; len]`                                            | `;`                       |
| `Shl`            |                                انتقال به چپ | `expr << expr`                                          | `<<`                      |
| `ShlAssign`      |                       انتقال به چپ و انتساب | `var <<= expr`                                          | `<<=`                     |
| `PartialOrd`     |                               مقایسه کوچکتر | `expr < expr`                                           | `<`                       |
| `PartialOrd`     |                   مقایسه ی کوچکتر یا برابری | `expr <= expr`                                          | `<=`                      |
|                  |                                انتساب/معادل | `var = expr`, `ident = type`                            | `=`                       |
| `PartialEq`      |                             مقایسه ی برابری | `expr == expr`                                          | `==`                      |
|                  |                     بخشی از نحو انطباق الگو | `pat => expr`                                           | `=>`                      |
| `PartialOrd`     |                               مقایسه بزرگتر | `expr > expr`                                           | `>`                       |
| `PartialOrd`     |                    مقایسه ی بزرگتر یا برابر | `expr >= expr`                                          | `>=`                      |
| `Shr`            |                              انتقال به راست | `expr >> expr`                                          | `>>`                      |
| `ShrAssign`      |                     انتقال به راست و انتساب | `var >>= expr`                                          | `>>=`                     |
|                  |                                  اتصال الگو | `ident @ pat`                                           | `@`                       |
| `BitXor`         |                                 یای انحصاری | `expr ^ expr`                                           | `^`                       |
| `BitXorAssign`   |                        یای انحصاری و انتساب | `var ^= expr`                                           | `^=`                      |
|                  |                                جایگزین الگو | <code>pat &vert; pat</code>                             | <code>&vert;</code>       |
| `BitOr`          |                                    یای بیتی | <code>expr &vert; expr</code>                           | <code>&vert;</code>       |
| `BitOrAssign`    |                           یای بیتی و انتساب | <code>var &vert;= expr</code>                           | <code>&vert;=</code>      |
|                  |                                   یای منطقی | <code>expr &vert;&vert; expr</code>                     | <code>&vert;&vert;</code> |
|                  |                                  انتشار خطا | `expr?`                                                 | `?`                       |

### نمادهای غیر عملگر

فهرست زیر شامل تمام غیرحروفی است که به عنوان عملگر عمل نمی‌کنند.
یعنی آنها مانند فراخوانی روند یا تابع رفتار نمی کنند.

جدول ب-۲ نمادهایی را نشان می‌دهد که به تنهایی ظاهر می‌شوند و در انواع مختلف مکان‌ها معتبر هستند.


<span class="caption">جدول ب-۲: نحو مستقل</span>

|                                                                         توضیح | نماد                                          |
|------------------------------------------------------------------------------:|-----------------------------------------------|
|                                            مدت عمر نام گذاری شده یا زمان حلقه | `'ident`                                      |
|                                                      اندازه ی عددی یک نوع خاص | `...u8`, `...i32`, `...f64`, `...usize`, etc. |
|                                                                    نمایش رشته | `"..."`                                       |
|                               نمایش رشته ی خام، نویسه های خاص پردازش نشده اند | `r"..."`, `r#"..."#`, `r##"..."##`, etc.      |
|                            نمایش رشته بیتی، به جای یک رشته، یک `[u8]` می سازد | `b"..."`                                      |
|                           نمایش رشته خام و بایتی، ترکیبی از رشته ی خام و بیتی | `br"..."`, `br#"..."#`, `br##"..."##`, etc.   |
|                                                                   نمایش نویسه | `'...'`                                       |
|                                                              نمایش بیتی ASCII | `b'...'`                                      |
|                                                                   پایان عبارت | <code>&vert;...&vert; expr</code>             |
|                              همیشه نوع پایین را برای توابع واگرا خالی می کنید | `!`                                           |
| اتصال الگوی "نادیده گرفته شده". همچنین برای خوانایی اعداد صحیح استفاده می شود | `_`                                           |

جدول ب-۳ نمادهایی را نشان می دهد که در زمینه‌ی یک مسیر از طریق سلسله مراتب ماژول به یک آیتم ظاهر می شوند.

<span class="caption">جدول ب-۳: نحو مرتبط با مسیر</span>

| شرح                                                                                              | نماد                                    |
|--------------------------------------------------------------------------------------------------|-----------------------------------------|
| مسیر فضای نام (namespace)                                                                        | `ident::ident`                          |
| مسیر نسبت به کتابخانه ی ریشه (یعنی یک مسیر مطلق)                                                 | `::path`                                |
| Path relative to the current module (i.e., an explicitly relative path).                         | `self::path`                            |
| Path relative to the parent of the current module                                                | `super::path`                           |
| Associated constants, functions, and types                                                       | `type::ident`, `<type as trait>::ident` |
| Associated item for a type that cannot be directly named (e.g., `<&T>::...`, `<[T]>::...`, etc.) | `<type>::...`                           |
| Disambiguating a method call by naming the trait that defines it                                 | `trait::method(...)`                    |
| Disambiguating a method call by naming the type for which it’s defined                           | `type::method(...)`                     |
| Disambiguating a method call by naming the trait and type                                        | `<type as trait>::method(...)`          |

Table B-4 shows symbols that appear in the context of using generic type
parameters.

<span class="caption">Table B-4: Generics</span>

| Symbol                         | Explanation                                                                                                                              |
|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| `path<...>`                    | Specifies parameters to generic type in a type (e.g., `Vec<u8>`)                                                                         |
| `path::<...>`, `method::<...>` | Specifies parameters to generic type, function, or method in an expression; often referred to as turbofish (e.g., `"42".parse::<i32>()`) |
| `fn ident<...> ...`            | Define generic function                                                                                                                  |
| `struct ident<...> ...`        | Define generic structure                                                                                                                 |
| `enum ident<...> ...`          | Define generic enumeration                                                                                                               |
| `impl<...> ...`                | Define generic implementation                                                                                                            |
| `for<...> type`                | Higher-ranked lifetime bounds                                                                                                            |
| `type<ident=type>`             | A generic type where one or more associated types have specific assignments (e.g., `Iterator<Item=T>`)                                   |

Table B-5 shows symbols that appear in the context of constraining generic type
parameters with trait bounds.

<span class="caption">Table B-5: Trait Bound Constraints</span>

| Symbol                        | Explanation                                                                                                                                |
|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| `T: U`                        | Generic parameter `T` constrained to types that implement `U`                                                                              |
| `T: 'a`                       | Generic type `T` must outlive lifetime `'a` (meaning the type cannot transitively contain any references with lifetimes shorter than `'a`) |
| `T : 'static`                 | Generic type `T` contains no borrowed references other than `'static` ones                                                                 |
| `'b: 'a`                      | Generic lifetime `'b` must outlive lifetime `'a`                                                                                           |
| `T: ?Sized`                   | Allow generic type parameter to be a dynamically sized type                                                                                |
| `'a + trait`, `trait + trait` | Compound type constraint                                                                                                                   |

Table B-6 shows symbols that appear in the context of calling or defining
macros and specifying attributes on an item.

<span class="caption">Table B-6: Macros and Attributes</span>

| Symbol                                      | Explanation        |
|---------------------------------------------|--------------------|
| `#[meta]`                                   | Outer attribute    |
| `#![meta]`                                  | Inner attribute    |
| `$ident`                                    | Macro substitution |
| `$ident:kind`                               | Macro capture      |
| `$(…)…`                                     | Macro repetition   |
| `ident!(...)`, `ident!{...}`, `ident![...]` | Macro invocation   |

Table B-7 shows symbols that create comments.

<span class="caption">Table B-7: Comments</span>

| Symbol     | Explanation             |
|------------|-------------------------|
| `//`       | Line comment            |
| `//!`      | Inner line doc comment  |
| `///`      | Outer line doc comment  |
| `/*...*/`  | Block comment           |
| `/*!...*/` | Inner block doc comment |
| `/**...*/` | Outer block doc comment |

Table B-8 shows symbols that appear in the context of using tuples.

<span class="caption">Table B-8: Tuples</span>

| Symbol                   | Explanation                                                                                 |
|--------------------------|---------------------------------------------------------------------------------------------|
| `()`                     | Empty tuple (aka unit), both literal and type                                               |
| `(expr)`                 | Parenthesized expression                                                                    |
| `(expr,)`                | Single-element tuple expression                                                             |
| `(type,)`                | Single-element tuple type                                                                   |
| `(expr, ...)`            | Tuple expression                                                                            |
| `(type, ...)`            | Tuple type                                                                                  |
| `expr(expr, ...)`        | Function call expression; also used to initialize tuple `struct`s and tuple `enum` variants |
| `expr.0`, `expr.1`, etc. | Tuple indexing                                                                              |

Table B-9 shows the contexts in which curly braces are used.

<span class="caption">Table B-9: Curly Brackets</span>

| Context      | Explanation      |
|--------------|------------------|
| `{...}`      | Block expression |
| `Type {...}` | `struct` literal |

Table B-10 shows the contexts in which square brackets are used.

<span class="caption">Table B-10: Square Brackets</span>

| Context                                            | Explanation                                                                                                                   |
|----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| `[...]`                                            | Array literal                                                                                                                 |
| `[expr; len]`                                      | Array literal containing `len` copies of `expr`                                                                               |
| `[type; len]`                                      | Array type containing `len` instances of `type`                                                                               |
| `expr[expr]`                                       | Collection indexing. Overloadable (`Index`, `IndexMut`)                                                                       |
| `expr[..]`, `expr[a..]`, `expr[..b]`, `expr[a..b]` | Collection indexing pretending to be collection slicing, using `Range`, `RangeFrom`, `RangeTo`, or `RangeFull` as the “index” |
