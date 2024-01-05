import 'package:flutter/material.dart';
import 'destination_page1.dart';
import 'destination_page2.dart';
import 'destination_page3.dart';
import 'packages_page.dart';
import 'contact_page.dart';
import 'about_us_page.dart';

void main() => runApp(const ExploreMundoApp());

class ExploreMundoApp extends StatelessWidget {
  const ExploreMundoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Mundo',
      home: const ExploreMundoHomePage(),
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Roboto',
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.orange),
      ),
    );
  }
}

class ExploreMundoHomePage extends StatelessWidget {
  const ExploreMundoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Explore Mundo'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Destinos'),
              Tab(text: 'Pacotes'),
              Tab(text: 'Contato'),
              Tab(text: 'Sobre Nós'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ExploreMundoBody(),
            PackagesPage(),
            ContactPage(),
            AboutUsPage(),
          ],
        ),
      ),
    );
  }
}

class ExploreMundoBody extends StatefulWidget {
  const ExploreMundoBody({Key? key}) : super(key: key);

  @override
  _ExploreMundoBodyState createState() => _ExploreMundoBodyState();
}

class _ExploreMundoBodyState extends State<ExploreMundoBody> {
  final List<String> destinations = [
    'images/lago_moraine.jpeg', // Lago Moraine
    'images/santorini.jpeg', // Santorini
    'images/bora_bora.jpeg', // Bora Bora
  ];

  final List<String> destinationTitles = [
    'Lago Moraine',
    'Santorini',
    'Bora Bora',
  ];

  int currentPage = 0;
  TextEditingController searchController = TextEditingController();
  List<String> filteredDestinations = [];

  @override
  Widget build(BuildContext context) {
    // Filtra destinos com base no texto de pesquisa
    filteredDestinations = destinations
        .where((destination) => destination
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4.0,
            child: ListTile(
              leading: Icon(Icons.search),
              title: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Pesquisar',
                  border: InputBorder.none,
                  suffixIcon: searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            searchController.clear();
                            setState(() {});
                          },
                        )
                      : null,
                ),
                onChanged: (query) {
                  setState(() {});
                },
              ),
            ),
          ),
        ),
        Container(
          height: 240,
          child: Stack(
            children: [
              PageView.builder(
                itemCount: filteredDestinations.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      navigateToDestinationPage(index);
                    },
                    child: Card(
                      elevation: 4.0,
                      margin: const EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.asset(
                              filteredDestinations[index],
                              width: double.infinity,
                              height: 240,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Text(
                              destinationTitles[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: filteredDestinations.asMap().entries.map((entry) {
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (entry.key == currentPage)
                            ? Colors.white
                            : Colors.grey,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: const Text(
                            'Explore Mundo',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                        Text(
                          'Destinos incríveis ao seu alcance',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              const Text(
                'Explore Mundo oferece destinos incríveis para sua próxima aventura. '
                'Descubra lugares surpreendentes, reserve hotéis confortáveis e aproveite '
                'o melhor transporte. Sua jornada começa aqui!',
                style: TextStyle(fontSize: 16.0),
                softWrap: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Constrói uma coluna de botões para a seção de destinos
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 36.0),
        SizedBox(height: 8.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ],
    );
  }

  // Navega para a página de destino correspondente ao índice
  void navigateToDestinationPage(int index) {
    final originalIndex = destinations.indexOf(filteredDestinations[index]);

    if (originalIndex != -1) {
      switch (originalIndex) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DestinationPage1()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DestinationPage2()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DestinationPage3()),
          );
          break;
        default:
      }
    }
  }
}
