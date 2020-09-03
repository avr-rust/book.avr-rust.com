# 3. Building a crate for AVR

After setting up the compiler, you may use it to generate assembly or machine code targeting a specific AVR microcontroller model.

## Choosing a `--target`

The Rust nightly compiler includes a built-in target for ATmega328 named `avr-unknown-gnu-atmega328`

If you wish to target a microcontroller other than ATmega328, or you want to change any of the
default builtin options like the linking parameters, then you will need to export the builtin
`avr-unknown-gnu-atmega328` target to a custom target specification JSON file and modify
it to suit your needs.

This target can be adapted to other microcontrollers as per the instructions in [3.1. The built-in `avr-unknown-gnu-atmega328` target](./003.1-the-avr-unknown-gnu-atmega328-target.md).

In summary, there are two options:

  * Use `rustc --target=avr-unknown-gnu-atmega328` to use the default, builtin GCC based target for ATmega328
  * Or use `rustc --target=my-custom-avr-target.json` with either a JSON file adapted from the builtin
      `avr-unknown-gnu-atmega328` target above, or otherwise build the file manually you wish to avoiding the
      default path entirely.

## Make sure you use the nightly version of Rust, not the default stable channel

The best way to ensure a crate is using the Nightly compiler is to run `rustup override set nightly` inside a terminal
within the root directory of the crate. After this is done, `cargo` will by-default use the AVR-enabled Nightly compiler
any time `cargo` is used within the directory tree of the crate.

## Compiling a crate

To compile and link an executable crate for AVR, run the following:

Using the builtin `avr-unknown-gnu-atmega328` target:

```rust
cargo build -Z build-std=core --target avr-unknown-gnu-atmega328 --release
```

Using a custom target specification JSON:


```rust
cargo build -Z build-std=core --target /path/to/my-custom-avr-target.json --release
```

Either or these generate an AVR ELF file that can be subsequently flashed to a real device or ran inside a simulator.
The ELF file will be available at `target/<TARGET NAME>/release/<CRATE NAME>.elf`.

Notes:

  * **`-Z build-std=core` is required whenever AVR is being targeted**. See [3.1. A note about the required Rust `-Z build-std=<CRATE,>` flag](./003.1-note-about-rust-build-std-flag.md) for more details.
  * `--release`  is not strictly required - debug mode should be as correct as release mode - however, **debug mode generates SLOW CODE, especially on AVR**. Release mode is much better.

**Example**: An in-context example of compiling a crate is given for the LED blinking example in [3.2. Example - Building the `blink` program for AVR](./003.2-example-building-blink.md).

### Targeting a different microcontroller model

The recommended way to do this is with a custom target specification JSON file per the instructions in [3.1. The built-in `avr-unknown-gnu-atmega328` target](./003.1-the-avr-unknown-gnu-atmega328-target.md).
