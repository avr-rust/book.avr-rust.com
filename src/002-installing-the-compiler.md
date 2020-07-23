# 2. Installing the compiler

Two pieces of software must be installed to use Rust with AVR support

  * A Rust compiler with AVR support enabled
  * The source code of the compiler
    * This is required as `libcore` must be compiled lazily as AVRs are
    not generally ABI compatible with each other so the core library must be
    explicitly compiled for the AVR device that is being targeted at compile time.

## Installing via Rustup

AVR support is included in the official Rust nightly compiler as of July 2020. To use AVR support, it
is sufficient to install the official Rust nightly compiler.
