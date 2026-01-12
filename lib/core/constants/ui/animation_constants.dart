/// Defines standard animation durations for consistent motion design
class AnimationDurations {
  /// Quick animations for subtle effects (200ms)
  static const short = Duration(milliseconds: 200);

  /// Standard animations for most transitions (350ms)
  static const medium = Duration(milliseconds: 350);

  /// Longer animations for elaborate transitions (500ms)
  static const long = Duration(milliseconds: 500);

  /// Custom duration getter for specific animation needs
  static Duration custom(int milliseconds) =>
      Duration(milliseconds: milliseconds);
}
