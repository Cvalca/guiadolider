import 'package:flutter/material.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial', style: TextStyle(color: Color(0XFFFFE45C))),
        backgroundColor: Color(0xFF5281B3),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0XFFFFE45C)),        
      ),

      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                _buildPage1(),
                _buildPage2(),
                _buildPage3(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage != 0)
                  TextButton.icon(
                    icon: Icon(Icons.arrow_back, color: Colors.blue),
                    label: Text('Anterior', style: TextStyle(color: Colors.blue)),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                if (_currentPage == 0) SizedBox(width: 100), // Para balancear o espaço
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return Container(
                      margin: EdgeInsets.all(4.0),
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
                if (_currentPage != 2)
                  TextButton.icon(
                    icon: Icon(Icons.arrow_forward, color: Colors.blue),
                    label: Text('Próximo', style: TextStyle(color: Colors.blue)),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                if (_currentPage == 2)
                  TextButton.icon(
                    icon: Icon(Icons.close, color: Colors.blue),
                    label: Text('Fechar', style: TextStyle(color: Colors.blue)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage1() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/images/logo-interno.png',
              width: 250,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'O app para aprender\nsobre liderança',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Aprenda conteúdos sobre liderança 4.0 através de vídeos, leituras, questionários e referências recomendadas.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage2() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/images/logo-horizontal.png',
              width: 350,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Icon(
            Icons.book,
            size: 100,
            color: Colors.black,
          ),
          SizedBox(height: 16),
          Text(
            'Recomendação de conteúdos',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Conteúdos curados sobre liderança e gerência de equipes na Indústria 4.0.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage3() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/images/logo-horizontal.png',
              width: 350,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Icon(
            Icons.quiz,
            size: 100,
            color: Colors.black,
          ),
          SizedBox(height: 16),
          Text(
            'Verifique seu conhecimento',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Responda questionários para verificar o quanto você está sabendo do assunto.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}