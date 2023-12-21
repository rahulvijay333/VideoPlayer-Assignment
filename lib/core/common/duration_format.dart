class CustomDurationParse {
  static Duration parseVideoDuration(String durationString) {
    // Assuming the input is in the format "0:00:10.924000"
    List<String> parts = durationString.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    double seconds = double.parse(parts[2]);

    return Duration(
      hours: hours,
      minutes: minutes,
      seconds: seconds.toInt(),
    );
  }

  static String formatVideoDuration(Duration duration) {
    int totalSeconds = duration.inSeconds;
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;

    return '$minutes.${seconds.toString().padLeft(2, '0')}';
  }
}
