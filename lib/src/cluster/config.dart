import 'package:json2yaml/json2yaml.dart';
import 'package:yaml/yaml.dart';

import 'cluster.dart';
import 'context.dart';
import 'exec.dart';
import 'user.dart';

class Configs {
  Configs({List<Config> configs = const []}) : _configs = configs;

  final List<Config> _configs;

  static Configs fromJson(List<dynamic> data) {
    final List<Config> configs = [];
    for (var c in data) {
      final config = Config.fromMap(c);
      if (config != null) configs.add(config);
    }
    return Configs(configs: configs);
  }

  Map<String, dynamic> toJson() {
    final dataMaps = [];
    for (var config in _configs) {
      dataMaps.add(config.asMap());
    }
    return {'configs': dataMaps};
  }

  List<Config> toList() {
    return _configs;
  }
}

class Config {
  String? apiVersion;
  List<Cluster> clusters = [];
  List<Context> contexts = [];
  String? currentContext;
  String? kind;
  Map<String, dynamic> preferences = {};
  List<User> users = [];
  String? displayName;

  static Config? fromMap(Map<String, dynamic> buff) {
    if (buff.isEmpty) return null;

    final config = Config();
    config.apiVersion = buff['apiVersion'] ?? '';
    for (var c in buff['clusters']) {
      Cluster cluster = Cluster(
        certificateAuthorityData: c['cluster']['certificate-authority-data'],
        server: c['cluster']['server'],
        name: c['name'],
      );
      config.clusters.add(cluster);
    }
    for (var c in buff['contexts']) {
      Context context = Context(
        cluster: c['context']['cluster'],
        user: c['context']['user'],
        name: c['name'],
      );
      config.contexts.add(context);
    }
    config.currentContext = buff['current-context'];
    config.kind = buff['kind'];
    for (var u in buff['users']) {
      final exec = (u['user'].containsKey('exec') && u['user']['exec'] != null)
          ? Exec.fromMap(u['user']['exec'])
          : null;
      User user = User(
        clientCertificateData: u['user']['client-certificate-data'],
        clientKeyData: u['user']['client-key-data'],
        exec: exec,
        name: u['name'],
      );
      config.users.add(user);
    }
    config.displayName = buff['display-name'];
    return config;
  }

  static Config? fromYaml(String data) {
    if (data.isEmpty) return null;
    final configMapping = _fromYamlMap(loadYaml(data));
    return Config.fromMap(configMapping);
  }

  Map<String, dynamic> asMap() => {
        "apiVersion": apiVersion,
        "clusters": clusters
            .map(
              (e) => e.asMap(),
            )
            .toList(),
        "contexts": contexts
            .map(
              (e) => e.asMap(),
            )
            .toList(),
        "current-context":
            (currentContext != null && currentContext!.isNotEmpty)
                ? currentContext
                : contexts.first.name,
        "kind": kind,
        "preferences": preferences,
        "users": users
            .map(
              (e) => e.asMap(),
            )
            .toList(),
        "display-name": displayName,
      };

  String toYaml() {
    return json2yaml(asMap());
  }
}

dynamic _convertNode(dynamic v) {
  if (v is YamlMap) {
    return _fromYamlMap(v);
  } else if (v is YamlList) {
    var list = <dynamic>[];
    for (var e in v) {
      list.add(_convertNode(e));
    }
    return list;
  } else {
    return v;
  }
}

Map<String, dynamic> _fromYamlMap(YamlMap nodes) {
  var map = <String, dynamic>{};
  nodes.forEach((k, v) {
    map[k] = _convertNode(v);
  });
  return map;
}
