# 4. Flashing a crate to a real AVR chip


The [AVRDUDE](https://www.nongnu.org/avrdude/) utility is recommended for flashing the final ELF file to a physical AVR microcontroller.

Flashing a Rust ELF file is no different to flashing a regular AVR-GCC C/C++ generated ELF file.

* [AVRDUDE Project Homepage](https://www.nongnu.org/avrdude/)
* [LadyADA AVRDUDE Tutorial](http://ladyada.net/learn/avr/avrdude.html)

## Arduino Uno

Connect your Arduino Uno to your computer, and use `avrdude` to flash your crate. The example below uses the output from [the `blink` example](./003.2-example-building-blink.md).

```bash
avrdude -patmega328p -carduino -P[PORT] -b115200 -D -Uflash:w:target/avr-atmega328p/release/blink.elf:e
```

where
* `-patmega328p` is the AVR part number
* `-carduino` is the programmer
* `-P[PORT]` is the serial port of your connected Arduino
    * On Linux & macOS, replace `[PORT]` with your Arduino's serial port (like `/dev/ttyUSB0`)
* `-b115200` is the baud rate
* `-D` disables flash auto-erase
* `-Uflash:w:target/avr-atmega328p/release/blink.elf:e` writes the `blink.elf` program to the Arduino's flash memory

For more debugging information, run `avrdude` with one or more `-v` flags.

Note: on older Arduino versions, you may get a series of `avrdude: stk500_getsync(): not in sync: resp=0x00` errors indicating you need to use a slower baud rate:

```bash
avrdude -patmega328p -carduino -P/dev/[PORT] -b57600 -D -Uflash:w:target/avr-atmega328p/release/blink.elf:e
```
