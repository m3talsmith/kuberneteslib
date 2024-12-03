import 'package:kuberneteslib/kuberneteslib.dart';

Future<void> main() async {
  //Initialize cluster configuration from default kubectl config
  final config = Config.fromYaml('<kubernetes config yaml>');

  // Initialize an auth
  final auth = ClusterAuth.fromConfig(config!);
  await auth.ensureInitialization();

  //List all pods in the 'default' namespace
  final pods = await Resource.list(resourceKind: 'pod', namespace: 'default');

  //Print pod information
  for (final pod in pods) {
    print('Pod: ${pod.metadata!.name}');
    print('Metadata: ${pod.metadata}');
    print('Spec: ${pod.spec}');
    print('Status: ${pod.status}');
    print('---');
  }
}
