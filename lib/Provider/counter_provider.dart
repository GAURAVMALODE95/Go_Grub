class CounterManager {
  static int _counter = 1;

  static int get counter => _counter;

  static void increaseCounter() {
    _counter++;
  }

  static void decreaseCounter() {
    if (_counter > 1) {
      _counter--;
    }
  }
  
}
