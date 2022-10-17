import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:joke_app/models/joke_model.dart';
import 'package:joke_app/models/jokes_model.dart';

class JokesPage extends StatefulWidget {
  const JokesPage({Key? key}) : super(key: key);

  @override
  State<JokesPage> createState() => _JokesPageState();
}

class _JokesPageState extends State<JokesPage> {
  Future<Joke1>? news;

  Future<Joke1?> getNews() async {
    String url = "https://v2.jokeapi.dev/joke/Any?type=single&amount=100&safe-mode";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as Map<String, dynamic>;
      return Joke1.fromJson(json);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Joke1?>(
        future: getNews(),
        builder: (BuildContext context, AsyncSnapshot<Joke1?> birnima) {
          if (birnima.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (birnima.connectionState == ConnectionState.done) {
            if (birnima.hasData) {
              Joke1? jokes = birnima.data;
              return newsListWidget(jokes?.jokes);
            }
            if (birnima.hasError) {
              return Center(child: Text(birnima.error.toString()));
            }
          }
          return Container(
            child: Center(
              child: Text(
                "Nimdir xatolik bor",
                style: TextStyle(fontSize: 24),
              ),
            ),
          );
        },
      ),
    );
  }
  
  PageController pageController = PageController();
  
  Widget newsListWidget(List<Joke>? jokes) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: PageView.builder(
          scrollDirection: Axis.vertical,
        controller: pageController,
        onPageChanged: (val) {
        },
        itemCount: jokes?.length,
        itemBuilder: (BuildContext context, int index) {
        return Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Image.network(
                    "https://picsum.photos/400/600?blur/${Random().nextInt(50) + 1}",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.4),
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child:Text(
                        jokes?[index].category ?? "",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ), 
                      ),
                      const SizedBox(height: 24),
                      Text(
                          jokes?[index].joke ?? "No",
                          style: const TextStyle(
                            fontSize: 20,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}


