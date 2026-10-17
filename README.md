# images-jpeg

JPEGImages for [polpo](https://github.com/polpo-system/polpo): the reader of JPEG pictures (.jpg) for the Images package of ETH Oberon (the
package images). With it, Images.Load reads .jpg files (`jpg = JPEGImages.Install` in the section
ImageFormats of Oberon.Text), so every program on Images shows them.

```
portia.Install images-jpeg
```

## What is here

    src/OLR.JPEGImages.Mod
    test/JPEGImagesTest.Mod, zq_test.jpg (3 by 2 pixels)

The source comes from ETH Linux Oberon (OLR, 2017-06-18), converted from an Oberon text to plain
text; the first commit has it unchanged. It compiles unchanged with all five of polpo's compilers
(x86, ARM, ARMv7, RISC-V, MIPS). It reads baseline JPEG; it does not write JPEG.

## Tests

    JPEGImagesTest.Run      2 checks: a 3 by 2 JPEG loaded; it needs the desktop's display

The license is GPL-3 (`LICENSE`); the code comes from ETH Oberon, whose license (`LICENSE.ETH`)
asks to keep its copyright notice and conditions, which `LICENSE.ETH` does.
