class CountryModel{
  final String name;
  final String flag;
  final String countryCode;
  final String callingCode;

  const CountryModel(this.name, this.flag, this.countryCode, this.callingCode);

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      json['name'],
      json['flag'],
      json['country_code'],
      json['calling_code'],
    );
  }
}