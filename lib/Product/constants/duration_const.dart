class ConstDuration extends Duration {
  ConstDuration.durationQuick() : super(milliseconds: 500);
  ConstDuration.durationNormal() : super(seconds: 1);
  ConstDuration.durationSlow() : super(seconds: 2);
}
