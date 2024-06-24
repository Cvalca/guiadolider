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
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tutorial', style: TextStyle(color: Color(0XFFFFE45C))),
          backgroundColor: Color(0xFF5281B3),
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0XFFFFE45C)),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
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
                      _buildPage1(constraints),
                      _buildPage2(constraints),
                      _buildPage3(constraints),
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
                              color: _currentPage == index ? Colors.blue : Colors.grey,
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
            );
          },
        ),
      ),
    );
  }

  Widget _buildPage1(BoxConstraints constraints) {
    double imageSize = constraints.maxWidth * 0.6;
    double fontSizeTitle = constraints.maxWidth * 0.05;
    double fontSizeBody = constraints.maxWidth * 0.04;
    double padding = constraints.maxWidth * 0.04;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/images/logo-interno.png',
              width: imageSize,
              height: imageSize,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'O app para aprender\nsobre liderança',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSizeTitle,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Aprenda conteúdos sobre liderança 4.0 através de vídeos, leituras, questionários e referências recomendadas.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSizeBody,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage2(BoxConstraints constraints) {
    double imageSize = constraints.maxWidth * 0.7;
    double iconSize = constraints.maxWidth * 0.2;
    double fontSizeTitle = constraints.maxWidth * 0.05;
    double fontSizeBody = constraints.maxWidth * 0.04;
    double padding = constraints.maxWidth * 0.04;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/images/logo-horizontal.png',
              width: imageSize,
              height: imageSize * 0.5,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Icon(
            Icons.book,
            size: iconSize,
            color: Colors.blue,
          ),
          SizedBox(height: 16),
          Text(
            'Recomendação de conteúdos',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSizeTitle,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Conteúdos curados sobre liderança e gerência de equipes na Indústria 4.0.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSizeBody,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage3(BoxConstraints constraints) {
    double imageSize = constraints.maxWidth * 0.7;
    double iconSize = constraints.maxWidth * 0.2;
    double fontSizeTitle = constraints.maxWidth * 0.05;
    double fontSizeBody = constraints.maxWidth * 0.04;
    double padding = constraints.maxWidth * 0.04;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/images/logo-horizontal.png',
              width: imageSize,
              height: imageSize * 0.5,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Icon(
            Icons.quiz,
            size: iconSize,
            color: Colors.blue,
          ),
          SizedBox(height: 16),
          Text(
            'Verifique seu conhecimento',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSizeTitle,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Responda questionários para verificar o quanto você está sabendo do assunto.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSizeBody,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
