# Summary

- [1. Introduction](./001-introduction.md)
  - [Reporting bugs](./001.1-reporting-bugs.md)
- [2. Installing the compiler](./002-installing-the-compiler.md)
  - [Installing required third party tools](./002.1-installing-required-third-party-tools.md)
- [3. Building a crate for AVR](./003-building-a-crate-for-avr.md)
  - [A note about the required Rust `-Z build-std=<CRATE,>` flag](./003.1-note-about-rust-build-std-flag.md)
  - [Example - Building the `blink` program for AVR](./003.2-example-building-blink.md)
- [4. Flashing a crate to a real AVR chip](./004-flashing-a-crate-to-chip.md)
- [5. Adding AVR support to a crate](./005-add-avr-support-to-crate.md)
  - [The target specification JSON file](./005.1-the-target-specification-json-file.md)
  - [Adding the `#[no_std]` attribute](./005.2-adding-no-std-attribute.md)
- [5. Quick start using `avr-rust/template-bin`](./006-new-crate-template-quickstart.md)
