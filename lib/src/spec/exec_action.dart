/// Represents an executable action with a command to be run.
class ExecAction {
  /// The command to execute as a list of strings.
  ///
  /// Each element in the list represents a part of the command.
  /// For example: `['ls', '-l']` would represent the command "ls -l"
  List<String>? command;

  /// Creates an [ExecAction] instance from a map representation.
  ///
  /// [data] should contain a 'command' key with a list of strings.
  /// If 'command' is not present in the map, [command] will remain null.
  ExecAction.fromMap(Map<String, dynamic> data) {
    if (data['command'] != null) {
      command = [];
      for (var e in data['command']) {
        command!.add(e);
      }
    }
  }

  Map<String, dynamic> toMap() => {'command': command}..removeWhere(
      (key, value) => value == null,
    );
}
