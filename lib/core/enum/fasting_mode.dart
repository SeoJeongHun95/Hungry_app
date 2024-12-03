// ignore_for_file: constant_identifier_names

enum FastingMode {
  TWELVETWELVE("TWELVETWELVE", "12:12"),
  SIXTEENEIGHT("SIXTEENEIGHT", "16:8"),
  TWENTYFOUR("TWENTYFOUR", "20:4"),
  FIVETWO("FIVETWO", "5:2"),
  ;

  final String mode;
  final String str;
  const FastingMode(this.mode, this.str);
}
