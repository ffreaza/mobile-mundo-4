import 'package:flutter/material.dart';
import 'destination_page1.dart';
import 'destination_page2.dart';
import 'destination_page3.dart';

class PackagesPage extends StatelessWidget {
  const PackagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacotes de Viagem'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pacotes Especiais',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              // Constrói o cartão para o pacote de Bora Bora
              _buildPackageCard(
                'Pacote Bora Bora Relax',
                'Relaxe nas águas cristalinas de Bora Bora com nosso pacote de luxo.',
                'images/bora_bora.jpeg',
                () {
                  // Navega para a página de destino correspondente
                  _navigateToDestinationPage(context, DestinationPage3());
                },
              ),
              SizedBox(height: 16.0),
              // Constrói o cartão para o pacote de Lago Moraine
              _buildPackageCard(
                'Pacote Lago Moraine Aventura',
                'Viva aventuras emocionantes explorando as belezas naturais do Lago Moraine.',
                'images/lago_moraine.jpeg',
                () {
                  // Navega para a página de destino correspondente
                  _navigateToDestinationPage(context, DestinationPage1());
                },
              ),
              SizedBox(height: 16.0),
              // Constrói o cartão para o pacote de Santorini
              _buildPackageCard(
                'Pacote Santorini Romântico',
                'Desfrute de momentos românticos em Santorini com nosso pacote exclusivo.',
                'images/santorini.jpeg',
                () {
                  // Navega para a página de destino correspondente
                  _navigateToDestinationPage(context, DestinationPage2());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Constrói um cartão para exibir informações de um pacote
  Widget _buildPackageCard(
      String title, String description, String imagePath, VoidCallback onTap) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem do pacote
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            // Textos e descrição do pacote
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Navega para a página de destino correspondente
  void _navigateToDestinationPage(
      BuildContext context, Widget destinationPage) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destinationPage),
    );
  }
}
