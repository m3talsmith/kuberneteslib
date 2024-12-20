/// Kuberneteslib
///
/// A library that implements and works directly with the Kubernetes API.
/// This library provides a set of Dart classes and utilities for interacting
/// with Kubernetes clusters, managing resources, and handling configurations.
///
/// ## Overview
/// This library encapsulates the core functionality needed to interact with
/// Kubernetes clusters through their API, organized into several key modules.
///
/// ## Package Structure
///
/// ### Authentication and Cluster Configuration
/// - `auth/cluster.dart`: Handles cluster authentication mechanisms
/// - `cluster/cluster.dart`: Core cluster interaction functionality
/// - `cluster/config.dart`: Configuration management for clusters
/// - `cluster/context.dart`: Context-aware cluster operations
/// - `cluster/exec.dart`: Execution utilities for cluster commands
/// - `cluster/user.dart`: User management and authentication
///
/// ### Metadata Management
/// - `meta/fields_v1.dart`: Field definitions for API version 1
/// - `meta/managed_field_entry.dart`: Managed fields handling
/// - `meta/object_meta.dart`: Object metadata utilities
/// - `meta/owner_reference.dart`: Resource ownership references
///
/// ### Resource Management
/// - `resource/resource.dart`: Base resource handling
/// - `resource/resource_kind.dart`: Resource type definitions
///
/// ### Specifications
/// - `spec/pod_spec.dart`: Pod specification utilities
/// - `spec/spec.dart`: General specification handling
/// - `spec/windows_security_context_options.dart`: Windows-specific security options
///
/// ### Status Management
/// - `status/status.dart`: Status information handling
///
/// ## Examples
///
/// ### Basic Cluster Connection and Pod Listing
/// ```dart
/// Future<void> main() async {
///   // Initialize cluster configuration from default kubectl config
///   final config = await KubernetesConfig.fromKubeConfig();
///
///   // Create cluster client
///   final cluster = KubernetesCluster(config);
///
///   // List all pods in the 'default' namespace
///   final pods = await cluster.listPods(namespace: 'default');
///
///   // Print pod information
///   for (final pod in pods) {
///     print('Pod: ${pod.metadata.name}');
///     print('Status: ${pod.status.phase}');
///     print('Node: ${pod.spec.nodeName}');
///     print('---');
///   }
///
///   // Create a new pod
///   final newPod = PodSpec(
///     containers: [
///       Container(
///         name: 'nginx',
///         image: 'nginx:latest',
///         ports: [
///           ContainerPort(containerPort: 80),
///         ],
///       ),
///     ],
///   );
///
///   await cluster.createPod(
///     metadata: ObjectMeta(
///       name: 'example-nginx',
///       namespace: 'default',
///     ),
///     spec: newPod,
///   );
///
///   // Watch pod status changes
///   final podWatch = cluster.watchPod('example-nginx', namespace: 'default');
///   podWatch.listen((event) {
///     print('Pod status changed: ${event.status.phase}');
///   });
/// }
/// ```
///
/// ### Working with Deployments
/// ```dart
/// Future<void> createDeployment() async {
///   final cluster = await KubernetesCluster.fromKubeConfig();
///
///   final deployment = Deployment(
///     metadata: ObjectMeta(
///       name: 'example-deployment',
///       namespace: 'default',
///     ),
///     spec: DeploymentSpec(
///       replicas: 3,
///       selector: LabelSelector(
///         matchLabels: {'app': 'example'},
///       ),
///       template: PodTemplateSpec(
///         metadata: ObjectMeta(
///           labels: {'app': 'example'},
///         ),
///         spec: PodSpec(
///           containers: [
///             Container(
///               name: 'web',
///               image: 'nginx:latest',
///               resources: ResourceRequirements(
///                 limits: {
///                   'cpu': '500m',
///                   'memory': '256Mi',
///                 },
///                 requests: {
///                   'cpu': '200m',
///                   'memory': '128Mi',
///                 },
///               ),
///             ),
///           ],
///         ),
///       ),
///     ),
///   );
///
///   await cluster.createDeployment(deployment);
/// }
/// ```
///
/// These examples demonstrate common use cases including:
/// - Connecting to a Kubernetes cluster
/// - Listing and watching pods
/// - Creating new resources
/// - Working with deployments
/// - Managing resource specifications
/// - Handling metadata
///
/// ## Usage
/// Import this library to access all Kubernetes-related functionality:
/// ```dart
/// import 'package:kuberneteslib/kuberneteslib.dart';
/// ```

library;

// Authentication and cluster configuration
export 'src/auth/cluster_io.dart';
export 'src/cluster/cluster.dart';
export 'src/cluster/config.dart';
export 'src/cluster/context.dart';
export 'src/cluster/exec.dart';
export 'src/cluster/user.dart';

// Metadata handling
export 'src/meta/fields_v1.dart';
export 'src/meta/managed_field_entry.dart';
export 'src/meta/object_meta.dart';
export 'src/meta/owner_reference.dart';

// Resource management
export 'src/resource/resource.dart';
export 'src/resource/resource_kind.dart';

// Specifications
export 'src/spec/pod_spec.dart';
export 'src/spec/spec.dart';
export 'src/spec/windows_security_context_options.dart';

// Status
export 'src/status/status.dart';
