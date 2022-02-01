# 5. Summary of Steps

## Initial target-independent steps for creating a new crate

This first step is not AVR specific.

```bash
# Create a new binary project. You may also create a new library project with '--lib'.
cargo new --bin my-new-project
cd my-new-project

# AVR requires the nightly compiler
rustup override set nightly
```

## [Step 1. Adding a target specification JSON file for AVR](./005.1-the-target-specification-json-file.md)

Compared to most Rust targets like X86 or ARM, the AVR family of microcontrollers
cannot be cleanly modelled under different "families" of chips that are
ELF-compatible. This is due to the fact that there are special variants of chips
with nonstandard ISA support, as well as the ELF `e_flags` field which has a value
that also has special cases for certain microcontrollers.

The upstream Rust compiler does not provide built-in targets for specific AVR
microcontrollers. Instead, a target specification JSON file targeting a specific
AVR device must be passed to Rust and Cargo.

[Here](./005.1-the-target-specification-json-file.md) are the steps for creating and using a target specification
JSON file for AVR.

## [Step 2. Adding the `#[no_std]` attribute to your crate root](./005.2-adding-no-std-attribute.md)

Like many embedded targets, the standard library is not supported and so it must be opted out of.

## [Step 3. Creating an executable entry point with `#[no_main]`](./005.3-creating-an-executable-entry-point.md)

As we are using the device-specific startup runtime libraries for C/C++ under AVR-GCC, we must bypass Rust's
usual handling of the main function so that the main function is correctly picked up by the GCC startup libraries.

## [Step 4. Choosing an input/output library](./005.4-choosing-an-io-library.md )

Use an existing library or write your own - your choice.

Recommended is [embedded-hal](https://github.com/rust-embedded/embedded-hal), which provides
a architecture-independent way to expose GPIO pins and peripherals that works
across devices such as AVR and ARM.

## Step N. - More documentation is on its way. In the meantime, [avr-rust/blink](https://github.com/avr-rust/blink/) serves as a reference implementation
