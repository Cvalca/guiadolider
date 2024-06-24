import 'package:flutter/material.dart';
import 'home.dart';

class Conteudo extends StatefulWidget {
  const Conteudo({Key? key}) : super(key: key);

  @override
  State<Conteudo> createState() => _ConteudoState();
}

class _ConteudoState extends State<Conteudo> {
  List<ContentCard> cards = [
    ContentCard(
      title: 'Como ser um bom líder na Indústria 4.0?',
      seen: 2,
      total: 5,
      isFavorite: true,
      subContents: [
        SubContent(title: 'Introdução', content: 'Texto de introdução para liderança na Indústria 4.0', seen: true),
        SubContent(title: 'Vídeo', content: 'Link para vídeo sobre liderança na Indústria 4.0', seen: false),
        SubContent(title: 'Questionário', content: 'Questionário sobre liderança na Indústria 4.0', seen: true),
        SubContent(title: 'Leitura', content: 'Material de leitura sobre liderança na Indústria 4.0', seen: false),
        SubContent(title: 'Referências', content: 'Referências sobre liderança na Indústria 4.0', seen: false),
      ],
    ),
    ContentCard(
      title: 'O que é a Indústria 4.0?',
      seen: 5,
      total: 5,
      isFavorite: true,
      subContents: [
        SubContent(title: 'Introdução', content: 'Texto de introdução sobre Indústria 4.0', seen: true),
        SubContent(title: 'Vídeo', content: 'Link para vídeo sobre Indústria 4.0', seen: true),
        SubContent(title: 'Questionário', content: 'Questionário sobre Indústria 4.0', seen: true),
        SubContent(title: 'Leitura', content: 'Material de leitura sobre Indústria 4.0', seen: true),
        SubContent(title: 'Referências', content: 'Referências sobre Indústria 4.0', seen: true),
      ],
    ),
    ContentCard(
      title: 'Liderança 4.0',
      seen: 0,
      total: 5,
      isFavorite: false,
      subContents: [
        SubContent(title: 'Introdução', content: 'Texto de introdução sobre Liderança 4.0', seen: false),
        SubContent(title: 'Vídeo', content: 'Link para vídeo sobre Liderança 4.0', seen: false),
        SubContent(title: 'Questionário', content: 'Questionário sobre Liderança 4.0', seen: false),
        SubContent(title: 'Leitura', content: 'Material de leitura sobre Liderança 4.0', seen: false),
        SubContent(title: 'Referências', content: 'Referências sobre Liderança 4.0', seen: false),
      ],
    ),
  ];

  void toggleFavorite(int index) {
    setState(() {
      cards[index].isFavorite = !cards[index].isFavorite;
    });
  }

  void updateCardSeenCount(int index, int seen) {
    setState(() {
      cards[index].seen = seen;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ContentCard> favoriteCards = cards.where((card) => card.isFavorite).toList();
    List<ContentCard> otherCards = cards.where((card) => !card.isFavorite).toList();

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/home');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Conteúdos', style: TextStyle(color: Color(0XFFFFE45C))),
          backgroundColor: Color(0xFF5281B3),
          centerTitle: true,
        ),
        backgroundColor: Color(0xFF4C5E72),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (favoriteCards.isNotEmpty) ...[
                  Text(
                    'Favoritos',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0XFFFFE45C)),
                  ),
                  ...favoriteCards.map((card) => buildCard(card, toggleFavorite, context)).toList(),
                ],
                SizedBox(height: 20),
                if (otherCards.isNotEmpty) ...[
                  Text(
                    'Outros',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0XFFFFE45C)),
                  ),
                  ...otherCards.map((card) => buildCard(card, toggleFavorite, context)).toList(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(ContentCard card, Function toggleFavorite, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(card: card),
          ),
        ).then((_) => setState(() {}));
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    SizedBox(height: 5),
                    Text('Visto ${card.seen}/${card.total}', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  card.isFavorite ? Icons.star : Icons.star_border,
                  color: card.isFavorite ? Colors.yellow : Colors.grey,
                ),
                onPressed: () => toggleFavorite(cards.indexOf(card)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContentCard {
  String title;
  int seen;
  int total;
  bool isFavorite;
  List<SubContent> subContents;

  ContentCard({required this.title, required this.seen, required this.total, required this.isFavorite, required this.subContents});
}

class DetailPage extends StatefulWidget {
  final ContentCard card;

  DetailPage({required this.card});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late int seen;
  late int total;
  late List<SubContent> subContents;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    seen = widget.card.seen;
    total = widget.card.total;
    subContents = widget.card.subContents;
  }

  void toggleCurrentPageSeen() {
    setState(() {
      subContents[currentIndex].seen = !subContents[currentIndex].seen;
      seen = subContents.where((subContent) => subContent.seen).length;
    });
  }

  void navigateToNextPage() {
    setState(() {
      if (currentIndex < subContents.length - 1) {
        currentIndex++;
      }
    });
  }

  void navigateToPreviousPage() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = seen / total;
    SubContent currentContent = subContents[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Conteúdo', style: TextStyle(color: Color(0XFFFFE45C))),
        backgroundColor: Color(0xFF5281B3),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0XFFFFE45C)),
      ),
      backgroundColor: Color(0xFF4C5E72),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, seen);
          return true;
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  widget.card.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0XFFFFE45C)),
                ),
              ),
              SizedBox(height: 20),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                color: Colors.green,
              ),
              SizedBox(height: 10),
              Text('Visto $seen/$total', style: TextStyle(color: Color(0XFFFFE45C))),
              SizedBox(height: 20),
              Text(
                'Página ${currentIndex + 1}: ${currentContent.seen ? 'Visto' : 'Não visto'}',
                style: TextStyle(color: currentContent.seen ? Colors.green : Colors.red, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentContent.title,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      SizedBox(height: 5),
                      Text(currentContent.content),
                      if (currentContent.title == 'Vídeo') ...[
                        SizedBox(height: 15),
                        Icon(Icons.play_circle_outline, size: 50),
                      ]
                    ],
                  ),
                ),
              ),
              
              Spacer(),
              ElevatedButton(
                onPressed: toggleCurrentPageSeen,
                child: Text(currentContent.seen ? 'Desmarcar página' : 'Marcar página'),
                style: ElevatedButton.styleFrom(backgroundColor: currentContent.seen ? Colors.red : Colors.green, foregroundColor: Colors.white),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (currentIndex > 0)
                    ElevatedButton.icon(
                      onPressed: navigateToPreviousPage,
                      icon: Icon(Icons.arrow_back),
                      label: Text('Anterior'),
                      style: ElevatedButton.styleFrom(foregroundColor: Colors.blue),
                    ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context, seen);
                    },
                    icon: Icon(Icons.close),
                    label: Text('Fechar'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                  ),
                  if (currentIndex < subContents.length - 1)
                    ElevatedButton.icon(
                      onPressed: navigateToNextPage,
                      icon: Icon(Icons.arrow_forward),
                      label: Text('Próximo'),
                      style: ElevatedButton.styleFrom(foregroundColor: Colors.blue),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubContent {
  String title;
  String content;
  bool seen;

  SubContent({required this.title, required this.content, required this.seen});
}
