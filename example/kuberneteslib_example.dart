import 'package:kuberneteslib/kuberneteslib.dart';

main() async {
  final config = Config.fromYaml('<kubernetes cluster yaml>');
  final auth = ClusterAuth.fromConfig(config!);
  await auth.ensureInitialization();
  final resources = Resource.list(
    auth: auth,
    resourceKind: 'pod',
  );
}
