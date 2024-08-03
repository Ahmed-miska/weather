class WeatherResponseModel {
  final String city;
  final List<ForCastModel> forCast;

  WeatherResponseModel({required this.city, required this.forCast});

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) {
    return WeatherResponseModel(
      city: json['location']['name'],
      forCast: (json['forecast']['forecastday'] as List).map((data) => ForCastModel.fromJson(data)).toList(),
    );
  }
}

class ForCastModel {
  final String date;
  final double tempC;
  final double tempF;
  final int humidity;
  final int rane;
  final double windSpeed;
  final double maxTempF;
  final double minTempF;
  final double maxTempC;
  final double minTempC;
  final String? weatherIcon;
  final String weatherDescription;

  ForCastModel(
   {
    required this.rane, 
    required this.date,
    required this.tempC,
    required this.tempF,
    required this.humidity,
    required this.windSpeed,
    required this.maxTempF,
    required this.minTempF,
    required this.maxTempC,
    required this.minTempC,
    this.weatherIcon,
    required this.weatherDescription,
  });

  factory ForCastModel.fromJson(Map<String, dynamic> json) {
    String iconUrl = json['day']['condition']['icon'];
    if (!iconUrl.startsWith('http')) {
      iconUrl = 'https:$iconUrl'; // Add the scheme if it's missing
    }
    return ForCastModel(
     
      date: json['date'],
      tempC: json['day']['avgtemp_c'],
      tempF: json['day']['avgtemp_f'],
      humidity: json['day']['avghumidity'],
      rane: json['day']['daily_chance_of_rain'],
      windSpeed: json['day']['maxwind_kph'],
      maxTempF: json['day']['maxtemp_f'],
      minTempF: json['day']['mintemp_f'],
      maxTempC: json['day']['maxtemp_c'],
      minTempC: json['day']['mintemp_c'],
      weatherDescription: json['day']['condition']['text'],
      weatherIcon: iconUrl,
    );
  }
}
