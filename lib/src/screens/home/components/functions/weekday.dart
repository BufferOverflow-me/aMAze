/// Checks the current week day and returns the corresponding string.
int weekday() {
  var now = DateTime.now();
  var weekday = now.weekday;
  return weekday;
}
