class Flags {
  bool? nsfw;
  bool? religious;
  bool? political;
  bool? racist;
  bool? sexist;
  bool? explicit;

  Flags({
    required this.nsfw,
    required this.religious,
    required this.political,
    required this.racist,
    required this.sexist,
    required this.explicit,
  });

  factory Flags.fromJson(Map<String, dynamic> json) {
    return Flags(
      nsfw: json['nsfw'] ?? false,
      religious: json['religious'] ?? false,
      political: json['political'] ?? false,
      racist: json['racist'] ?? false,
      sexist: json['sexist'] ?? false,
      explicit: json['explicit'] ?? false,
    );
  }
}