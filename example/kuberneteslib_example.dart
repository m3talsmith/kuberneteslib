import 'package:kuberneteslib/kuberneteslib.dart';

Future<void> main() async {
  //Initialize cluster configuration from default kubectl config
  final config = await KubernetesConfig.fromKubeConfig();
  
  //Create cluster client
  final cluster = KubernetesCluster(config);
  
  //List all pods in the 'default' namespace
  final pods = await cluster.listPods(namespace: 'default');
  
  //Print pod information
  for (final pod in pods) {
    print('Pod: ${pod.metadata.name}');
    print('Status: ${pod.status.phase}');
    print('Node: ${pod.spec.nodeName}');
    print('---');
  }
  
  //Create a new pod
  final newPod = PodSpec(
    containers: [
      Container(
        name: 'nginx',
        image: 'nginx:latest',
        ports: [
          ContainerPort(containerPort: 80),
        ],
      ),
    ],
  );
  
  await cluster.createPod(
    metadata: ObjectMeta(
      name: 'example-nginx',
      namespace: 'default',
    ),
    spec: newPod,
  );
  
  //Watch pod status changes
  final podWatch = cluster.watchPod('example-nginx', namespace: 'default');
  podWatch.listen((event) {
    print('Pod status changed: ${event.status.phase}');
  });
}