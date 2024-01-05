import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // Controladores para os campos de texto
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  // Função para validar se todos os campos estão preenchidos
  bool validateForm() {
    return nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        messageController.text.isNotEmpty;
  }

  // Função para enviar o e-mail (simulado com um print)
  void sendEmail() {
    print('Enviando e-mail para ${emailController.text}...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título da página
              Text(
                'Entre em Contato Conosco',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              // Campo de texto para o nome
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Seu Nome',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              // Campo de texto para o e-mail
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Seu E-mail',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              // Campo de texto para a mensagem (com várias linhas)
              TextFormField(
                controller: messageController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Mensagem',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              // Botão para enviar a mensagem
              ElevatedButton(
                onPressed: () {
                  if (validateForm()) {
                    // Se o formulário estiver válido, envia o e-mail
                    sendEmail();
                    // Exibe um snackbar indicando que a mensagem foi enviada com sucesso
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Mensagem enviada com sucesso!'),
                      ),
                    );
                    // Limpa os campos após o envio bem-sucedido
                    nameController.clear();
                    emailController.clear();
                    messageController.clear();
                  } else {
                    // Se o formulário não estiver válido, exibe um snackbar indicando que é necessário preencher todos os campos
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Por favor, preencha todos os campos.'),
                      ),
                    );
                  }
                },
                child: Text('Enviar Mensagem'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
