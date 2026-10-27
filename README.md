# images-jpeg

JPEGImages for [polpo](https://github.com/polpo-system/polpo): the reader of JPEG pictures (.jpg) for the Images package of ETH Oberon (the
package images). With it, Images.Load reads .jpg files (`jpg = JPEGImages.Install` in the section
ImageFormats of Oberon.Text), so every program on Images shows them.

```
portia.Install images-jpeg
```

## What is here

    src/OLR.JPEGImages.Mod
    test/JPEGImagesTest.Mod, zq_test.jpg (3 by 2 pixels), zq_big.jpg (2600 by 1400),
      zq_wide.jpg (12000 by 16)

The source comes from ETH Linux Oberon (OLR, 2017-06-18), converted from an Oberon text to plain
text; the first commit has it unchanged. It reads baseline JPEG; it does not write JPEG.

The original took pictures of up to 1024 by 1024 pixels: its sample rows were arrays of a fixed
length. Here the rows are as long as the picture is wide, and pictures of up to 32767 by 32767
are read (Pictures take their sizes as INTEGER); the offsets in a row are LONGINT, since a row
of 32767 pixels has 98301 bytes. A picture of 4000 by 3000 takes about 4 seconds on x86. It
compiles with all of polpo's compilers.

## Tests

    JPEGImagesTest.Run      8 checks: a 3 by 2 JPEG loaded, and two bigger ones with their size and
                            the colours of their halves; it needs the desktop's display

The license is GPL-3 (`LICENSE`); the code comes from ETH Oberon, whose license (`LICENSE.ETH`)
asks to keep its copyright notice and conditions, which `LICENSE.ETH` does.
