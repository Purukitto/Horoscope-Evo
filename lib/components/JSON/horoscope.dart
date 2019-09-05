class Horoscope {
  DateTime date;
  String horoscope;
  String sunsign;

  Horoscope({
    this.date,
    this.horoscope,
    this.sunsign,
  });

  factory Horoscope.fromJson(Map<String, dynamic> json) => new Horoscope(
        date: DateTime.parse(json["date"]),
        horoscope: json["horoscope"],
        sunsign: json["sunsign"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "horoscope": horoscope,
        "sunsign": sunsign,
      };
}
