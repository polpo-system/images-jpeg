MODULE JPEGImagesTest;  (** JPEGImagesTest.Run: a small JPEG file (zq_test.jpg, 3 by 2) loaded with Images; needs the desktop's display *)

IMPORT Images, Modules, Out := out;

VAR fails, checks: LONGINT;

PROCEDURE Check(what: ARRAY OF CHAR; ok: BOOLEAN);
BEGIN
  INC(checks);
  IF ~ok THEN INC(fails); Out.String("FAIL "); Out.String(what); Out.Ln END
END Check;

PROCEDURE Run*;
VAR img: Images.Image; done: BOOLEAN;
BEGIN
  fails := 0; checks := 0;
  Check("JPEGImages", Modules.ThisMod("JPEGImages") # NIL);
  NEW(img); Images.Load(img, "zq_test.jpg", done);
  Check("zq_test.jpg loaded, 3 by 2", done & (img.width = 3) & (img.height = 2));
  Out.String("JPEGImagesTest: "); Out.Int(checks, 0); Out.String(" checks, "); Out.Int(fails, 0); Out.String(" failed"); Out.Ln
END Run;

END JPEGImagesTest.
