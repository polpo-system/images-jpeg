MODULE JPEGImagesTest;  (** JPEGImagesTest.Run: JPEG files loaded with Images (zq_test.jpg, 3 by 2; zq_big.jpg, 2600 by 1400
  and zq_wide.jpg, 12000 by 16, red on the left, blue on the right); needs the desktop's display *)

IMPORT Images, Modules, Out := out;

VAR fails, checks: LONGINT;

PROCEDURE Check(what: ARRAY OF CHAR; ok: BOOLEAN);
BEGIN
  INC(checks);
  IF ~ok THEN INC(fails); Out.String("FAIL "); Out.String(what); Out.Ln END
END Check;

(* is the pixel x, y of img (BGR888) near the colour r, g, b *)
PROCEDURE Near(img: Images.Image; x, y, r, g, b: LONGINT): BOOLEAN;
VAR p: LONGINT;
BEGIN
  IF (img.mem = NIL) OR (img.fmt.code # Images.BGR888.code) THEN RETURN FALSE END;
  p := y * img.bpr + x * 3;
  RETURN (ABS(ORD(img.mem[p]) - b) < 24) & (ABS(ORD(img.mem[p + 1]) - g) < 24) & (ABS(ORD(img.mem[p + 2]) - r) < 24)
END Near;

PROCEDURE Big(name: ARRAY OF CHAR; w, h: LONGINT);
VAR img: Images.Image; done: BOOLEAN;
BEGIN
  NEW(img); Images.Load(img, name, done);
  Check(name, done & (img.width = w) & (img.height = h));
  IF done & (img.width = w) & (img.height = h) THEN
    Check("red on the left", Near(img, 5, 5, 255, 0, 0) & Near(img, w DIV 2 - 8, h - 1, 255, 0, 0));
    Check("blue on the right", Near(img, w DIV 2 + 8, 0, 0, 0, 255) & Near(img, w - 1, h - 1, 0, 0, 255))
  END
END Big;

PROCEDURE Run*;
VAR img: Images.Image; done: BOOLEAN;
BEGIN
  fails := 0; checks := 0;
  Check("JPEGImages", Modules.ThisMod("JPEGImages") # NIL);
  NEW(img); Images.Load(img, "zq_test.jpg", done);
  Check("zq_test.jpg loaded, 3 by 2", done & (img.width = 3) & (img.height = 2));
  Big("zq_big.jpg", 2600, 1400);  (* more than 1024 by 1024 *)
  Big("zq_wide.jpg", 12000, 16);  (* rows of more than 32767 bytes *)
  Out.String("JPEGImagesTest: "); Out.Int(checks, 0); Out.String(" checks, "); Out.Int(fails, 0); Out.String(" failed"); Out.Ln
END Run;

END JPEGImagesTest.
