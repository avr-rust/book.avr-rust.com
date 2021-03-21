# 6. Quick start from template

## Quick start

The quickest way to get going is to clone

```bash
# Download and extract the template repository to the current directory.
curl "https://codeload.github.com/avr-rust/template-bin/tar.gz/master" | tar xvzf -

# Then update the package name in Cargo.toml
sed -i 's/template-bin/$YOUR_CRATE_NAME/g' template-bin-master/Cargo.toml
# And rename the folder
mv template-bin-master $YOUR_CRATE_NAME

# Prepare a new Git repository
cd $YOUR_CRATE_NAME
git init
```

Then, to build an ELF file at `target/avr-atmega328p/release/$YOUR_CRATE_NAME.elf`, run:

```bash
cargo build --target avr-atmega328p.json -Z build-std=core --all --release
```

