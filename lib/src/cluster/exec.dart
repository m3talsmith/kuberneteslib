class Exec {
  Exec({
    this.command = 'doctl',
    this.arguments,
    this.apiVersion = 'client.authentication.k8s.io/v1beta1',
    this.env,
    this.interactiveMode = 'IfAvailable',
    this.provideClusterInfo = false,
  });

  String? command;
  List<String>? arguments;
  String? apiVersion;
  String? env;
  String? interactiveMode;
  bool? provideClusterInfo;

  Exec.fromMap(Map<String, dynamic> data) {
    command = data['command'] ?? 'doctl';

    arguments = [];
    for (var arg in data['args']) {
      arguments!.add(arg);
    }

    apiVersion = data['apiVersion'] ?? 'client.authentication.k8s.io/v1beta1';
    env = data['env'];
    interactiveMode = data['interactiveMode'] ?? 'IfAvailable';
    provideClusterInfo = data['provideClusterInfo'] ?? false;
  }

  Map<String, dynamic> asMap() => {
        "apiVersion": apiVersion,
        "args": arguments,
        "command": command,
        "env": env,
        "interactiveMode": interactiveMode,
        "provideClusterInfo": provideClusterInfo,
      };
}

class ExecResult {
  ExecResult({
    required this.kind,
    required this.apiVersion,
    required this.spec,
    required this.status,
  });

  late final String kind;
  late final String apiVersion;
  late final ExecSpec spec;
  late final ExecStatus status;

  ExecResult.fromMap(Map<String, dynamic> data) {
    kind = data['kind'];
    apiVersion = data['apiVersion'];
    spec = ExecSpec.fromMap(data['spec']);
    status = ExecStatus.fromMap(data['status']);
  }
}

class ExecSpec {
  ExecSpec({
    this.interactive = false,
  });

  late final bool interactive;

  ExecSpec.fromMap(Map<String, dynamic> data) {
    interactive = data['interactive'];
  }
}

class ExecStatus {
  ExecStatus({
    this.expirationTimestamp,
    this.token,
  });

  late final DateTime? expirationTimestamp;
  late final String? token;

  ExecStatus.fromMap(Map<String, dynamic> data) {
    expirationTimestamp = DateTime.tryParse(data['expirationTimestamp']);
    token = data['token'];
  }
}
