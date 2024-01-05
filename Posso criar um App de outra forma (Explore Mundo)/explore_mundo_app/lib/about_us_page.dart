import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre Nós'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título principal
              Text(
                'Explore Mundo - Descubra o Mundo Conosco',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              // Descrição da agência de viagens
              Text(
                'Bem-vindo à Explore Mundo, a renomada Agência de Viagens que está empenhada em proporcionar experiências únicas e inesquecíveis para todos os amantes de viagens. Nossa história é marcada por uma busca constante pela excelência e inovação, visando sempre atender às expectativas e necessidades dos nossos clientes.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              // Compromisso da agência
              Text(
                'Nosso Compromisso:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Na Explore Mundo, o nosso compromisso é oferecer um serviço de alta qualidade, desde a escolha do destino até o retorno para casa. Trabalhamos arduamente para criar pacotes de viagens personalizados, cuidadosamente elaborados para proporcionar experiências autênticas e enriquecedoras.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              // O que a agência oferece
              Text(
                'O que Oferecemos:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              // Lista de serviços oferecidos
              _buildListItem('1. Destinos Excepcionais',
                  'Explore uma seleção de destinos incríveis, cuidadosamente escolhidos para satisfazer todos os tipos de viajantes.'),
              _buildListItem('2. Pacotes Personalizados',
                  'Oferecemos pacotes de viagens flexíveis e personalizáveis para atender às suas preferências e orçamento.'),
              _buildListItem('3. Reservas Simples',
                  'Facilitamos o processo de reserva, proporcionando uma experiência rápida e eficiente.'),
              _buildListItem('4. Suporte Personalizado',
                  'Nossa experiente equipe está sempre pronta para ajudar, oferecendo suporte personalizado durante toda a sua jornada.'),
              SizedBox(height: 16.0),
              // Convite para se juntar à agência
              Text(
                'Junte-se a Nós:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Explore Mundo é mais que uma agência de viagens, é o seu parceiro na busca por aventuras extraordinárias. Junte-se a nós e descubra o mundo de uma maneira única e inesquecível.',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Função auxiliar para construir itens de lista com ícones
  Widget _buildListItem(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.0),
        // Ícone de marcador para cada item de lista
        Icon(Icons.arrow_right),
        SizedBox(height: 4.0),
        // Título do item de lista
        Text(
          title,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 4.0),
        // Descrição do item de lista
        Text(
          description,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
