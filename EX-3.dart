class MyDuration {
  int _milliseconds = 0; // store as miliseconds

  int get milliseconds => _milliseconds;
  MyDuration.milliseconds(this._milliseconds);
  MyDuration.fromHours(int hours) : _milliseconds = hours * 60 * 60 * 1000;

  MyDuration.fromMinutes(int minutes) : _milliseconds = minutes * 60 * 1000;

  MyDuration.fromSecond(int seconds) : _milliseconds = seconds * 1000;

  //Overloaded Operators
  MyDuration operator +(MyDuration other) {
    int result = _milliseconds + other._milliseconds;
    return MyDuration.milliseconds(result);
  }

  MyDuration operator -(MyDuration other) {
    int result = _milliseconds - other._milliseconds;
    if (result < 0) {
      throw Exception("This operation have an error!");
    }
    return MyDuration.milliseconds(result);
  }

  bool operator >(MyDuration other) {
    if (_milliseconds > other._milliseconds) {
      return true;
    }
    return false;
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e);
  }
}
