import 'dart:async';

/// Class which exposes a `tick` method to emit values periodically
class Ticker {
  /// Emits a new `int` up to 10 every seconds
  Stream<int> tick() {
    return Stream.periodic(const Duration(milliseconds: 50), (x) => x + 1)
        .take(50);
  }
}
