import 'package:flutter_tts/flutter_tts.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static FlutterTts _flutterTts = FlutterTts();
  static AudioPlayer _audioPlayer = AudioPlayer();

  static Future<void> playAudio(String audioPath) async {
    // Pausa qualquer áudio em reprodução
    await _audioPlayer.stop();

    // Tenta reproduzir o áudio
    int result = await _audioPlayer.play(audioPath, isLocal: true);
    if (result != 1) {
      throw Exception('Falha ao reproduzir o áudio.');
    }
  }

  static Future<void> pauseAudio() async {
    int result = await _audioPlayer.pause();
    if (result != 1) {
      throw Exception('Falha ao pausar o áudio.');
    }
  }

  static Future<void> stopAudio() async {
    int result = await _audioPlayer.stop();
    if (result != 1) {
      throw Exception('Falha ao parar o áudio.');
    }
  }

  static Future<void> speakText(String text) async {
    // Pausa qualquer áudio em reprodução
    await _audioPlayer.stop();

    // Define as configurações de voz
    await _flutterTts.setSpeechRate(1.0);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setLanguage('pt-BR');

    // Converte o texto em áudio e reproduz
    await _flutterTts.speak(text);
  }

  static Future<void> stopTextToSpeech() async {
    // Para a fala do texto
    await _flutterTts.stop();
  }
}

class NotificacaoHandler {
  final AudioManager audioManager = AudioManager();
  bool _falarNotificacoes = false;

  // Método para extrair, ler e converter todas as notificações em áudio
  Future<void> extrairLerConverterNotificacoes(
      Map<String, dynamic> notificacao) async {
    lerNotificacao(notificacao);
    if (_falarNotificacoes) {
      await converterTextoEmAudio(notificacao.toString());
    }
  }

  // Método para ativar ou desativar a função de falar notificações
  void alternarFalarNotificacoes() {
    _falarNotificacoes = !_falarNotificacoes;
  }

  // Método para ler uma notificação
  void lerNotificacao(Map<String, dynamic> notificacao) {
    // Lógica para processar e exibir uma notificação
    print('Nova notificação lida: ${notificacao.toString()}');
  }

  // Método para converter texto em áudio
  Future<void> converterTextoEmAudio(String texto) async {
    await AudioManager.speakText(texto);
  }
}
