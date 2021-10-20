class Restaurant {
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

  Restaurant({
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

  Restaurant.fromJson(dynamic json) {
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