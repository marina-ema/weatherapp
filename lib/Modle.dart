class WeatherModle1 {
  final String cityName;
  final String lastDate;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String image;
  final String Weathercondition;

  WeatherModle1(
      {required this.cityName,
      required this.lastDate,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.image,
      required this.Weathercondition});
  factory WeatherModle1.fromJost(json) {
    return WeatherModle1(
        cityName: json["location"]["name"],
        lastDate: json["current"]["last_updated"],
        temp: json["current"]["temp_c"],
        maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        mintemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        image: json["current"]["condition"]["icon"],
        Weathercondition: json["current"]["condition"]["text"]);
  }
}
