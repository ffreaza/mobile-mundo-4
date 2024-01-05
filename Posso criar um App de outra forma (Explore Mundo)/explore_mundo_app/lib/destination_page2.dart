import 'package:flutter/material.dart';

class DestinationPage2 extends StatelessWidget {
  const DestinationPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Santorini'),
      ),
      body: ListView(
        children: [
          // Imagem principal do destino
          Image.asset(
            'images/santorini.jpeg',
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
                          'Santorini',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Descrição breve do destino
                      Text(
                        'Santorini: uma ilha no sul do mar Egeu, ao sudeste da Grécia continental.',
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
                const Text('42'),
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
              'Santorini, conhecida por sua paisagem única, caracterizada por falésias íngremes, casas '
              'brancas com telhados azuis e vistas deslumbrantes do mar. Além de suas'
              'características geográficas distintas, Santorini é famosa por suas praias encantadoras,'
              'sítios arqueológicos, e pores do sol espetaculares que atraem visitantes de todo o mundo.',
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
