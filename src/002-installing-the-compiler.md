# 2. Installing the compiler

A few pieces of software must be installed to use Rust with AVR support

  * A Rust compiler with AVR support enabled
  * The source code of the compiler
    * This is required as `libcore` must be compiled lazily as AVRs are
    not generally ABI compatible with each other so the core library must be
    explicitly compiled for the AVR device that is being targeted at compile time.

**NOTE**: Make sure to also install the [required third party tools](./002.1-installing-required-third-party-tools.md). This, importantly, **includes the linker**.

## Installing via Rustup (recommended)

AVR support is included in the official Rust nightly compiler as of July 2020. To use AVR support, it
is sufficient to install the official Rust `nightly` compiler, as well as the `rust-src` component.

**First, make sure that `rustup` is installed.** If it is not, install it from [rustup.rs](https://rustup.rs/).

Then install the `nightly` and `rust-src` components by running this in a terminal:

```
$ rustup component add nightly rust-src
```

Installation complete. You can proceed to the next part [3. Building a crate for AVR](./003-building-a-crate-for-avr.md).

## Installing or building from source

AVR support is included in any standard Rust nightly build. The standard [Rust development instructions](https://rustc-dev-guide.rust-lang.org/getting-started.html) apply here.

**NOTE**: Compiling Rust/LLVM can be very memory intensive. You may find compilation abruptly stopping on machines with less
than ~10GB of RAM due to the operating system out-of-memory killer stopping it. If compilation keeps terminating, check
if there is a hard-to-spot "process interrupted by operating system" message near the bottom of the logs. If so, consider
lowering parallelism flags (`-j N`, etc) to reduce memory pressure.
