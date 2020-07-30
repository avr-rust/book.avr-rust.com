# 5.1. Summary of Steps

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

