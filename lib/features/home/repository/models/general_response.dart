import 'package:nearbyrestaurants/features/home/repository/models/restaurant.dart';

class GeneralResponse {
  Meta? _meta;
  Response? _response;

  Meta? get meta => _meta;
  Response? get response => _response;

  GeneralResponse({
      Meta? meta, 
      Response? response}){
    _meta = meta;
    _response = response;
}

  GeneralResponse.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    return map;
  }

}

class Response {
  List<Restaurant>? _restaurants;
  bool? _confident;

  List<Restaurant>? get restaurants => _restaurants;
  bool? get confident => _confident;

  Response({
      List<Restaurant>? restaurants,
      bool? confident}){
    _restaurants = restaurants;
    _confident = confident;
}

  Response.fromJson(dynamic json) {
    if (json['venues'] != null) {
      _restaurants = [];
      json['venues'].forEach((v) {
        _restaurants?.add(Restaurant.fromJson(v));
      });
    }
    _confident = json['confident'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_restaurants != null) {
      map['venues'] = _restaurants?.map((v) => v.toJson()).toList();
    }
    map['confident'] = _confident;
    return map;
  }

}

class Venues {
  String? _id;
  String? _name;
  Location? _location;
  List<Categories>? _categories;
  String? _referralId;
  bool? _hasPerk;

  String? get id => _id;
  String? get name => _name;
  Location? get location => _location;
  List<Categories>? get categories => _categories;
  String? get referralId => _referralId;
  bool? get hasPerk => _hasPerk;

  Venues({
      String? id, 
      String? name, 
      Location? location, 
      List<Categories>? categories, 
      String? referralId, 
      bool? hasPerk}){
    _id = id;
    _name = name;
    _location = location;
    _categories = categories;
    _referralId = referralId;
    _hasPerk = hasPerk;
}

  Venues.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
    _referralId = json['referralId'];
    _hasPerk = json['hasPerk'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    map['referralId'] = _referralId;
    map['hasPerk'] = _hasPerk;
    return map;
  }

}

class Categories {
  String? _id;
  String? _name;
  String? _pluralName;
  String? _shortName;
  Icon? _icon;
  bool? _primary;

  String? get id => _id;
  String? get name => _name;
  String? get pluralName => _pluralName;
  String? get shortName => _shortName;
  Icon? get icon => _icon;
  bool? get primary => _primary;

  Categories({
      String? id, 
      String? name, 
      String? pluralName, 
      String? shortName, 
      Icon? icon, 
      bool? primary}){
    _id = id;
    _name = name;
    _pluralName = pluralName;
    _shortName = shortName;
    _icon = icon;
    _primary = primary;
}

  Categories.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _pluralName = json['pluralName'];
    _shortName = json['shortName'];
    _icon = json['icon'] != null ? Icon.fromJson(json['icon']) : null;
    _primary = json['primary'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['pluralName'] = _pluralName;
    map['shortName'] = _shortName;
    if (_icon != null) {
      map['icon'] = _icon?.toJson();
    }
    map['primary'] = _primary;
    return map;
  }

}

class Icon {
  String? _prefix;
  String? _suffix;

  String? get prefix => _prefix;
  String? get suffix => _suffix;

  Icon({
      String? prefix, 
      String? suffix}){
    _prefix = prefix;
    _suffix = suffix;
}

  Icon.fromJson(dynamic json) {
    _prefix = json['prefix'];
    _suffix = json['suffix'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['prefix'] = _prefix;
    map['suffix'] = _suffix;
    return map;
  }

}

class Location {
  String? _address;
  String? _crossStreet;
  double? _lat;
  double? _lng;
  List<LabeledLatLngs>? _labeledLatLngs;
  int? _distance;
  String? _cc;
  String? _neighborhood;
  String? _city;
  String? _state;
  String? _country;
  List<String>? _formattedAddress;

  String? get address => _address;
  String? get crossStreet => _crossStreet;
  double? get lat => _lat;
  double? get lng => _lng;
  List<LabeledLatLngs>? get labeledLatLngs => _labeledLatLngs;
  int? get distance => _distance;
  String? get cc => _cc;
  String? get neighborhood => _neighborhood;
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
  List<String>? get formattedAddress => _formattedAddress;

  Location({
      String? address, 
      String? crossStreet, 
      double? lat, 
      double? lng, 
      List<LabeledLatLngs>? labeledLatLngs, 
      int? distance, 
      String? cc, 
      String? neighborhood, 
      String? city, 
      String? state, 
      String? country, 
      List<String>? formattedAddress}){
    _address = address;
    _crossStreet = crossStreet;
    _lat = lat;
    _lng = lng;
    _labeledLatLngs = labeledLatLngs;
    _distance = distance;
    _cc = cc;
    _neighborhood = neighborhood;
    _city = city;
    _state = state;
    _country = country;
    _formattedAddress = formattedAddress;
}

  Location.fromJson(dynamic json) {
    _address = json['address'];
    _crossStreet = json['crossStreet'];
    _lat = json['lat'];
    _lng = json['lng'];
    if (json['labeledLatLngs'] != null) {
      _labeledLatLngs = [];
      json['labeledLatLngs'].forEach((v) {
        _labeledLatLngs?.add(LabeledLatLngs.fromJson(v));
      });
    }
    _distance = json['distance'];
    _cc = json['cc'];
    _neighborhood = json['neighborhood'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _formattedAddress = json['formattedAddress'] != null ? json['formattedAddress'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['address'] = _address;
    map['crossStreet'] = _crossStreet;
    map['lat'] = _lat;
    map['lng'] = _lng;
    if (_labeledLatLngs != null) {
      map['labeledLatLngs'] = _labeledLatLngs?.map((v) => v.toJson()).toList();
    }
    map['distance'] = _distance;
    map['cc'] = _cc;
    map['neighborhood'] = _neighborhood;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['formattedAddress'] = _formattedAddress;
    return map;
  }

}

class LabeledLatLngs {
  String? _label;
  double? _lat;
  double? _lng;

  String? get label => _label;
  double? get lat => _lat;
  double? get lng => _lng;

  LabeledLatLngs({
      String? label, 
      double? lat, 
      double? lng}){
    _label = label;
    _lat = lat;
    _lng = lng;
}

  LabeledLatLngs.fromJson(dynamic json) {
    _label = json['label'];
    _lat = json['lat'];
    _lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['label'] = _label;
    map['lat'] = _lat;
    map['lng'] = _lng;
    return map;
  }

}

class Meta {
  int? _code;
  String? _requestId;

  int? get code => _code;
  String? get requestId => _requestId;

  Meta({
      int? code, 
      String? requestId}){
    _code = code;
    _requestId = requestId;
}

  Meta.fromJson(dynamic json) {
    _code = json['code'];
    _requestId = json['requestId'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['code'] = _code;
    map['requestId'] = _requestId;
    return map;
  }

}