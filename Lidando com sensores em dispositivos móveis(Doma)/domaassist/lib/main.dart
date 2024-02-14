import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:audio_service/audio_service.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() {
  runApp(DomaConnectApp());
}

class DomaConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DomaConnect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DomaConnectHomePage(),
    );
  }
}

class DomaConnectHomePage extends StatefulWidget {
  @override
  _DomaConnectHomePageState createState() => _DomaConnectHomePageState();
}

class _DomaConnectHomePageState extends State<DomaConnectHomePage> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final FlutterSms flutterSms = FlutterSms();
  final stt.SpeechToText speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
    _listenToMessages();
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _showNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'doma_connect',
      'Doma Connect',
      'Canal de notificações do Doma Connect',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }

  Future<void> _listenToMessages() async {
    flutterSms.onSmsReceived.listen((SmsMessage message) {
      _showNotification('Nova mensagem', message.body);
    });
  }

  Future<void> _listenForCommands() async {
    if (!_isListening) {
      bool available = await speech.initialize(
        onStatus: (status) {
          if (status == stt.SpeechToTextStatus.error) {
            print("Erro ao inicializar reconhecimento de voz.");
          }
        },
        onError: (errorNotification) => print("Erro: $errorNotification"),
      );

      if (available) {
        setState(() => _isListening = true);
        speech.listen(
          onResult: (result) => setState(() {
            _text = result.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DomaConnect'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Espaço para leitura de mensagens de texto e notificações
            Card(
              child: ListTile(
                title: Text('Mensagens e Notificações'),
                subtitle: Text('Aqui serão exibidas as mensagens e notificações'),
                leading: Icon(Icons.message),
              ),
            ),
            // Espaço para lembretes e comandos de voz
            Card(
              child: ListTile(
                title: Text('Lembretes e Comandos de Voz'),
                subtitle: Text('Pressione para ativar o reconhecimento de voz'),
                leading: Icon(Icons.record_voice_over),
                onTap: _listenForCommands,
              ),
            ),
            // Espaço para treinamento e educação
            Card(
              child: ListTile(
                title: Text('Treinamento e Educação'),
                subtitle: Text('Aqui serão exibidos os materiais de treinamento e educação'),
                leading: Icon(Icons.school),
              ),
            ),
            // Espaço para alertas de segurança
            Card(
              child: ListTile(
                title: Text('Alertas de Segurança'),
                subtitle: Text('Aqui serão exibidos os alertas de segurança'),
                leading: Icon(Icons.warning),
              ),
            ),
            // Espaço para acessibilidade para deficientes visuais
            Card(
              child: ListTile(
                title: Text('Acessibilidade para Deficientes Visuais'),
                subtitle: Text('Aqui serão exibidas as opções de acessibilidade para deficientes visuais'),
                leading: Icon(Icons.accessibility),
              ),
            ),
            // Espaço para sincronização e conectividade
            Card(
              child: ListTile(
                title: Text('Sincronização e Conectividade'),
                subtitle: Text('Aqui serão exibidas as opções de sincronização e conectividade'),
                leading: Icon(Icons.sync),
              ),
            ),
            if (_isListening) ListTile(title: Text(_text)),
          ],
        ),
      ),
    );
  }
}
