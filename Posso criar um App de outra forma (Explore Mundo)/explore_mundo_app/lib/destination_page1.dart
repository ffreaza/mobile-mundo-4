import 'package:flutter/material.dart';

class DestinationPage1 extends StatelessWidget {
  const DestinationPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lago Moraine'),
      ),
      body: ListView(
        children: [
          // Imagem principal do destino
          Image.asset(
            'images/lago_moraine.jpeg',
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
                          'Lago Moraine',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Descrição breve do destino
                      Text(
                        'Lago Moraine: Situado no Parque Nacional de Banff, no Canadá.',
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
                const Text('45'),
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
              'Lago Moraine, nas Montanhas Rochosas, Alberta, Canadá, com 0,5 km²,'
              'atrai 4,5 milhões de visitantes anualmente devido à sua beleza cênica,'
              'águas multicoloridas e acesso a uma área demarcada para apreciação da paisagem.'
              'Iluminado até às 23 horas no verão, é alimentado por um glaciar.',
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
