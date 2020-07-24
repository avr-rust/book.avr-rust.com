# 3. Building a crate for AVR

After setting up the compiler, you may use it to generate assembly or machine code targeting a specific AVR microcontroller model.

## Make sure you use the nightly version of Rust, not the default stable channel

The best way to ensure a crate is using the Nightly compiler is to run `rustup override set nightly` inside a terminal
within the root directory of the crate. After this is done, `cargo` will by-default use the AVR-enabled Nightly compiler
any time `cargo` is used within the directory tree of the crate.

## Compiling a crate

To compile and link an executable crate for AVR, run the following:

```rust
$ cargo build -Z build-std=core --target avr-atmega328p.json --release
```

This will generate an AVR ELF file that can be subsequently flashed to a real device or ran inside a simulator.
The ELF file will be available at `target/<TARGET JSON NAME>/release/<CRATE NAME>.elf`.

Notes:

  * **`-Z build-std=core` is required whenever AVR is being targeted**. See [3.1. A note about the required Rust `-Z build-std=<CRATE,>` flag](./003.1-note-about-rust-build-std-flag.md) for more details.
  * **A target specification JSON file should almost always be specified**. There is a default target of `avr-unknown-unknown`, but this
    target should be avoided in virtually all real-life usecases[CITATION NEEDED]. The `avr-unknown-unknown` target is equivalent to the AVR-GCC default, partially-microcontroller-independent mode where the lowest common denominator - the `avr2` family - is targeted.
  * `--release`  is not strictly required - debug mode should be as correct as release mode - however, **debug mode generates SLOW CODE, especially on AVR**. Release mode is much better.

**Example**: An in-context example of compiling a crate is given for the LED blinking example in [3.2. Example - Building the `blink` program for AVR](./003.2-example-building-blink.md).

### Targeting a different microcontroller model

Other models of AVR can be targeted by simply modifying the `cpu` field inside the target specification JSON. Each desired target microcontroller
variant requires its own target specification JSON file differing only by the `cpu` field. You will find many of the existing AVR projects
provide an-tree target specification JSON file only for the popular `atmega328p`, so you will in general need to duplicate the file and edit the `cpu`
to get a crate compiling on a non-atmega328p microcontroler.
