import 'package:test/test.dart';
import 'package:kuberneteslib/src/meta/managed_field_entry.dart';
import 'package:kuberneteslib/src/meta/fields_v1.dart';

void main() {
  group('FieldsV1 handling', () {
    test('initializes with empty FieldsV1', () {
      final entry = ManagedFieldEntry();
      expect(entry.fieldsV1.fields, isEmpty);
    });

    test('preserves FieldsV1 data in JSON conversion', () {
      final fieldsV1 = FieldsV1()..fields = {
        'metadata': {
          'f:labels': {
            '.': {},
            'f:app': {},
            'f:environment': {},
          }
        }
      };

      final entry = ManagedFieldEntry()
        ..apiVersion = 'v1'
        ..fieldsType = 'FieldsV1'
        ..fieldsV1 = fieldsV1
        ..manager = 'kubectl'
        ..operation = 'Update'
        ..time = DateTime.parse('2024-01-01T00:00:00Z');

      final json = entry.toJson();
      final decoded = ManagedFieldEntry.fromJson(json);

      expect(decoded.fieldsV1.fields, equals(fieldsV1.fields));
    });
  });

  group('validation scenarios', () {
    test('empty strings are valid for required fields', () {
      final entry = ManagedFieldEntry();
      expect(entry.apiVersion, isEmpty);
      expect(entry.fieldsType, isEmpty);
      expect(entry.manager, isEmpty);
      expect(entry.operation, isEmpty);
    });

    test('handles whitespace in field values', () {
      final entry = ManagedFieldEntry()
        ..apiVersion = '  v1  '
        ..manager = '  kubectl  '
        ..operation = '  Update  ';

      final json = entry.toJson();
      expect(json['apiVersion'], '  v1  ');
      expect(json['manager'], '  kubectl  ');
      expect(json['operation'], '  Update  ');
    });
  });

  group('time handling', () {
    test('handles UTC times', () {
      final utcTime = DateTime.utc(2024, 1, 1, 12, 0);
      final entry = ManagedFieldEntry()..time = utcTime;
      
      final json = entry.toJson();
      expect(json['time'], '2024-01-01T12:00:00.000Z');
    });

    test('handles local times', () {
      final localTime = DateTime(2024, 1, 1, 12, 0);
      final entry = ManagedFieldEntry()..time = localTime;
      
      final json = entry.toJson();
      final decoded = ManagedFieldEntry.fromJson(json);
      
      expect(decoded.time.isUtc, isTrue);
      expect(decoded.time.toLocal(), localTime.toLocal());
    });

    test('preserves microseconds in time', () {
      final preciseTime = DateTime.parse('2024-01-01T12:00:00.123456Z');
      final entry = ManagedFieldEntry()..time = preciseTime;
      
      final json = entry.toJson();
      final decoded = ManagedFieldEntry.fromJson(json);
      
      expect(decoded.time.microsecond, preciseTime.microsecond);
    });
  });

  group('common use cases', () {
    test('represents kubectl apply operation', () {
      final entry = ManagedFieldEntry()
        ..apiVersion = 'v1'
        ..fieldsType = 'FieldsV1'
        ..manager = 'kubectl'
        ..operation = 'Apply'
        ..fieldsV1 = (FieldsV1()..fields = {
          'spec': {
            'f:replicas': {},
            'f:template': {
              'f:metadata': {
                'f:labels': {
                  'f:app': {}
                }
              }
            }
          }
        });

      expect(entry.manager, 'kubectl');
      expect(entry.operation, 'Apply');
      expect(entry.fieldsV1.fields, contains('spec'));
    });

    test('represents controller manager update', () {
      final entry = ManagedFieldEntry()
        ..apiVersion = 'v1'
        ..fieldsType = 'FieldsV1'
        ..manager = 'kube-controller-manager'
        ..operation = 'Update'
        ..subresource = 'status'
        ..fieldsV1 = (FieldsV1()..fields = {
          'status': {
            'f:availableReplicas': {},
            'f:readyReplicas': {},
            'f:replicas': {}
          }
        });

      expect(entry.manager, 'kube-controller-manager');
      expect(entry.operation, 'Update');
      expect(entry.subresource, 'status');
      expect(entry.fieldsV1.fields, contains('status'));
    });
  }); 

  group('error handling', () {
    test('handles missing fields in JSON', () {
      final incompleteJson = {
        'apiVersion': 'v1',
        // fieldsType missing
        'fieldsV1': {},
        'manager': 'kubectl',
        // operation missing
        'time': DateTime.now().toIso8601String(),
      };

      expect(
        () => ManagedFieldEntry.fromJson(incompleteJson),
        throwsA(isA<TypeError>()), // or whatever exception your generated code throws
      );
    });

    test('handles null values in JSON', () {
      final jsonWithNulls = {
        'apiVersion': null,
        'fieldsType': null,
        'fieldsV1': null,
        'manager': null,
        'operation': null,
        'time': DateTime.now().toIso8601String(),
      };

      expect(
        () => ManagedFieldEntry.fromJson(jsonWithNulls),
        throwsA(isA<TypeError>()), // or whatever exception your generated code throws
      );
    });
  });

  group('complex field patterns', () {
    test('handles deeply nested FieldsV1 structures', () {
      final entry = ManagedFieldEntry()
        ..apiVersion = 'v1'
        ..fieldsType = 'FieldsV1'
        ..fieldsV1 = (FieldsV1()..fields = {
          'spec': {
            'f:template': {
              'f:spec': {
                'f:containers': {
                  'k:{"name":"main"}': {
                    'f:image': {},
                    'f:resources': {
                      'f:limits': {
                        'f:cpu': {},
                        'f:memory': {}
                      },
                      'f:requests': {
                        'f:cpu': {},
                        'f:memory': {}
                      }
                    }
                  }
                }
              }
            }
          }
        })
        ..manager = 'kubectl'
        ..operation = 'Apply'
        ..time = DateTime.now();

      final json = entry.toJson();
      final decoded = ManagedFieldEntry.fromJson(json);

      expect(decoded.fieldsV1.fields['spec'], isNotNull);
      expect(
        decoded.fieldsV1.fields['spec']['f:template']['f:spec']['f:containers']
            ['k:{"name":"main"}']['f:resources']['f:limits'],
        isNotNull,
      );
    });

    test('handles empty FieldsV1 structures', () {
      final entry = ManagedFieldEntry()
        ..apiVersion = 'v1'
        ..fieldsType = 'FieldsV1'
        ..fieldsV1 = (FieldsV1()..fields = {})
        ..manager = 'kubectl'
        ..operation = 'Apply'
        ..time = DateTime.now();

      final json = entry.toJson();
      final decoded = ManagedFieldEntry.fromJson(json);

      expect(decoded.fieldsV1.fields, isEmpty);
    });
  });

  group('real-world scenarios', () {
    test('represents CRD controller update', () {
      final entry = ManagedFieldEntry()
        ..apiVersion = 'custom.k8s.io/v1'
        ..fieldsType = 'FieldsV1'
        ..fieldsV1 = (FieldsV1()..fields = {
          'status': {
            'f:conditions': {
              'k:{"type":"Ready"}': {
                'f:lastTransitionTime': {},
                'f:message': {},
                'f:reason': {},
                'f:status': {},
                'f:type': {}
              }
            }
          }
        })
        ..manager = 'custom-controller'
        ..operation = 'Update'
        ..subresource = 'status'
        ..time = DateTime.now();

      expect(entry.apiVersion, 'custom.k8s.io/v1');
      expect(entry.fieldsV1.fields['status']['f:conditions'], isNotNull);
    });

    test('represents admission webhook modification', () {
      final entry = ManagedFieldEntry()
        ..apiVersion = 'v1'
        ..fieldsType = 'FieldsV1'
        ..fieldsV1 = (FieldsV1()..fields = {
          'metadata': {
            'f:annotations': {
              'f:webhook.validation.example.com/validated': {}
            }
          }
        })
        ..manager = 'validation-webhook'
        ..operation = 'Update'
        ..time = DateTime.now();

      expect(entry.manager, 'validation-webhook');
      expect(
        entry.fieldsV1.fields['metadata']['f:annotations'],
        contains('f:webhook.validation.example.com/validated'),
      );
    });

    test('represents server-side apply with conflict resolution', () {
      final entry = ManagedFieldEntry()
        ..apiVersion = 'v1'
        ..fieldsType = 'FieldsV1'
        ..fieldsV1 = (FieldsV1()..fields = {
          'metadata': {
            'f:labels': {
              'f:environment': {}
            }
          },
          'spec': {
            'f:replicas': {}
          }
        })
        ..manager = 'kubectl-client-side-apply'
        ..operation = 'Apply'
        ..time = DateTime.now();

      final json = entry.toJson();
      expect(json['operation'], 'Apply');
      expect(entry.fieldsV1.fields['metadata']['f:labels'], isNotNull);
      expect(entry.fieldsV1.fields['spec']['f:replicas'], isNotNull);
    });
  }); 

  group('comparison and equality', () {
    test('same entries with same time are equal', () {
      final time = DateTime.parse('2024-01-01T00:00:00Z');
      final entry1 = ManagedFieldEntry()
        ..apiVersion = 'v1'
        ..fieldsType = 'FieldsV1'
        ..fieldsV1 = (FieldsV1()..fields = {'spec': {'f:replicas': {}}})
        ..manager = 'kubectl'
        ..operation = 'Apply'
        ..time = time;

      final entry2 = ManagedFieldEntry()
        ..apiVersion = 'v1'
        ..fieldsType = 'FieldsV1'
        ..fieldsV1 = (FieldsV1()..fields = {'spec': {'f:replicas': {}}})
        ..manager = 'kubectl'
        ..operation = 'Apply'
        ..time = time;

      expect(entry1.toJson(), equals(entry2.toJson()));
    });

    test('entries with different fields are not equal', () {
      final time = DateTime.parse('2024-01-01T00:00:00Z');
      final entry1 = ManagedFieldEntry()
        ..apiVersion = 'v1'
        ..fieldsType = 'FieldsV1'
        ..fieldsV1 = (FieldsV1()..fields = {'spec': {'f:replicas': {}}})
        ..manager = 'kubectl'
        ..operation = 'Apply'
        ..time = time;

      final entry2 = ManagedFieldEntry()
        ..apiVersion = 'v1'
        ..fieldsType = 'FieldsV1'
        ..fieldsV1 = (FieldsV1()..fields = {'spec': {'f:image': {}}})
        ..manager = 'kubectl'
        ..operation = 'Apply'
        ..time = time;

      expect(entry1.toJson(), isNot(equals(entry2.toJson())));
    });
  });

  group('special characters handling', () {
    test('handles special characters in field names', () {
      final entry = ManagedFieldEntry()
        ..apiVersion = 'v1'
        ..fieldsType = 'FieldsV1'
        ..fieldsV1 = (FieldsV1()..fields = {
          'metadata': {
            'f:annotations': {
              'f:example.com/special@chars': {},
              'f:example.com/with spaces': {},
              'f:example.com/with.dots': {},
              'f:example.com/with-dashes': {},
            }
          }
        })
        ..manager = 'kubectl'
        ..operation = 'Apply'
        ..time = DateTime.now();

      final json = entry.toJson();
      final decoded = ManagedFieldEntry.fromJson(json);

      expect(
        decoded.fieldsV1.fields['metadata']['f:annotations']
            ['f:example.com/special@chars'],
        isNotNull,
      );
      expect(
        decoded.fieldsV1.fields['metadata']['f:annotations']
            ['f:example.com/with spaces'],
        isNotNull,
      );
    });

    test('handles unicode characters', () {
      final entry = ManagedFieldEntry()
        ..apiVersion = 'v1'
        ..fieldsType = 'FieldsV1'
        ..fieldsV1 = (FieldsV1()..fields = {
          'metadata': {
            'f:labels': {
              'f:environment-🌍': {},
              'f:status-✅': {},
            }
          }
        })
        ..manager = 'kubectl-unicode'
        ..operation = 'Apply'
        ..time = DateTime.now();

      final json = entry.toJson();
      final decoded = ManagedFieldEntry.fromJson(json);

      expect(
        decoded.fieldsV1.fields['metadata']['f:labels']['f:environment-🌍'],
        isNotNull,
      );
      expect(
        decoded.fieldsV1.fields['metadata']['f:labels']['f:status-✅'],
        isNotNull,
      );
    });
  }); 
} 