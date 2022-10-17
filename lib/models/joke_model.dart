import 'package:joke_app/models/jokes_model.dart';

class Joke1 {
  bool? error;
  num? amount;
  List<Joke>? jokes;

  Joke1({
    required this.error,
    required this.amount,
    required this.jokes,
  });

  factory Joke1.fromJson(Map<String, dynamic> json) {
    return Joke1(
      error: json['error'] ?? "",
      amount: json['amount'] ?? 0,
      jokes: (json['jokes'] as List)
          .map((jokes) => Joke.fromJson(jokes))
          .toList(),
    );
  }
}