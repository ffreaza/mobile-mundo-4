import 'package:flutter/services.dart';

class DeviceCommandManager {
  static const platform = MethodChannel('device_command_channel');

  Future<void> adjustVolume({bool increase = true}) async {
    try {
      await platform.invokeMethod('adjustVolume', {'increase': increase});
    } on PlatformException catch (e) {
      print("Erro ao ajustar o volume: '${e.message}'.");
    }
  }

  Future<void> goToSettings() async {
    try {
      await platform.invokeMethod('goToSettings');
    } on PlatformException catch (e) {
      print("Erro ao abrir as configurações: '${e.message}'.");
    }
  }

  ouvirComandoDeVoz() {}
}
