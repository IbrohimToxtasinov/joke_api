import 'package:joke_app/models/flags_model.dart';

class Joke{
  String? category;
  String? type;
  Flags? flags;
  String? joke;
  int? id;
  bool? safe;
  String? lang;

  Joke({
    required this.category,
    required this.type,
    required this.flags,
    required this.joke,
    required this.id,
    required this.safe,
    required this.lang,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      category: json['category'] ?? "",
      type: json['type'] ?? "",
      joke: json['joke'] ?? "",
      flags: Flags.fromJson(json['flags']),
      id: json['id'] ?? 0,
      safe: json['safe'] ?? false,
      lang: json['lang'] ?? "",
    );
  }
}