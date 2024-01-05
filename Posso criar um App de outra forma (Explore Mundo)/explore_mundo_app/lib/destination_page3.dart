import 'package:flutter/material.dart';

class DestinationPage3 extends StatelessWidget {
  const DestinationPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bora Bora'),
      ),
      body: ListView(
        children: [
          // Imagem principal do destino
          Image.asset(
            'images/bora_bora.jpeg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          // Informações básicas sobre o destino
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título do destino
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: const Text(
                          'Bora Bora',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Descrição breve do destino
                      Text(
                        'Bora Bora: uma ilha do grupo das Ilhas de Sotavento do arquipélago de Sociedade, na Polinésia Francesa.',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                // Ícone de estrela e contagem de avaliações
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                const Text('50'),
              ],
            ),
          ),
          // Botões de ação (Ligar, Rota, Compartilhar)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButtonColumn(Colors.blue, Icons.phone, 'Ligar', context),
              _buildButtonColumn(Colors.green, Icons.map, 'Rota', context),
              _buildButtonColumn(
                  Colors.red, Icons.share, 'Compartilhar', context),
            ],
          ),
          // Descrição detalhada do destino
          Container(
            padding: const EdgeInsets.all(32),
            child: const Text(
              'Bora Bora, conhecida por suas águas cristalinas, praias de areia '
              'branca e pelos icônicos bangalôs sobre a água, '
              'Bora Bora é um destino paradisíaco frequentemente escolhido por aqueles '
              'em busca de uma experiência única em meio a uma paisagem tropical deslumbrante.',
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  // Método para construir um botão com ícone e rótulo
  Column _buildButtonColumn(
      Color color, IconData icon, String label, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Botão de ícone
        IconButton(
          icon: Icon(icon, color: color),
          onPressed: () {
            // Exibe uma mensagem indicando que a função não foi implementada
            _showNotImplementedMessage(context, label);
          },
        ),
        // Rótulo do botão
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  // Método para exibir uma mensagem informando que a função não foi implementada
  void _showNotImplementedMessage(BuildContext context, String buttonLabel) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('A função "$buttonLabel" ainda não foi implementada.'),
      ),
    );
  }
}
