// To parse this JSON data, do
//
//     final schoolModel = schoolModelFromJson(jsonString);

import 'dart:convert';

List<SchoolModel> schoolModelFromJson(String str) => List<SchoolModel>.from(json.decode(str).map((x) => SchoolModel.fromJson(x)));

String schoolModelToJson(List<SchoolModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SchoolModel {
    String? stateProvince;
    Country country;
    List<String> domains;
    List<String> webPages;
    AlphaTwoCode alphaTwoCode;
    String name;

    SchoolModel({
        required this.stateProvince,
        required this.country,
        required this.domains,
        required this.webPages,
        required this.alphaTwoCode,
        required this.name,
    });

    factory SchoolModel.fromJson(Map<String, dynamic> json) => SchoolModel(
        stateProvince: json["state-province"],
        country: countryValues.map[json["country"]]!,
        domains: List<String>.from(json["domains"].map((x) => x)),
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        alphaTwoCode: alphaTwoCodeValues.map[json["alpha_two_code"]]!,
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "state-province": stateProvince,
        "country": countryValues.reverse[country],
        "domains": List<dynamic>.from(domains.map((x) => x)),
        "web_pages": List<dynamic>.from(webPages.map((x) => x)),
        "alpha_two_code": alphaTwoCodeValues.reverse[alphaTwoCode],
        "name": name,
    };
}

enum AlphaTwoCode {
    US
}

final alphaTwoCodeValues = EnumValues({
    "US": AlphaTwoCode.US
});

enum Country {
    UNITED_STATES
}

final countryValues = EnumValues({
    "United States": Country.UNITED_STATES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
