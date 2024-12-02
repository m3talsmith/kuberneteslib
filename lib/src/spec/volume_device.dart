/// Represents a volume device with its path and name.
///
/// This class is typically used to model storage devices or volumes
/// in the system, containing essential information about the device.
class VolumeDevice {
  /// The system path to the volume device.
  late String devicePath;

  /// The human-readable name of the volume device.
  late String name;

  /// Creates a [VolumeDevice] instance from a map of data.
  ///
  /// The map must contain the following keys:
  /// * 'devicePath': String representing the system path to the device
  /// * 'name': String representing the device name
  VolumeDevice.fromMap(Map<String, dynamic> data) {
    devicePath = data['devicePath'];
    name = data['name'];
  }

  Map<String, dynamic> toMap() => {
        'devicePath': devicePath,
        'name': name,
      };
}
