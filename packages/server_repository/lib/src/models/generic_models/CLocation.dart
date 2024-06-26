import 'package:idempiere_rest/idempiere_rest.dart';

class CLocation extends ModelBase{
  String? uid;
  String? gpcode;
  String? housecode;
  String? ownerName;
  String? modelName;

  CLocation(json):super(json){
  id = json['id'];
  uid = json['uid'];
  gpcode = json['Address4'];
  housecode = json['Address5'];
  ownerName = json['City'];
  modelName = json['model-name'];
}
  @override
  CLocation fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    gpcode = json['Address4'];
    housecode = json['Address5'];
    ownerName = json['City'];
    modelName = json['model-name'];
    return this;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['Address4'] = gpcode;
    data['Address5'] = housecode;
    data['City'] = ownerName;
    data['model-name'] = modelName;
    return data;
  }
  static const model = "c_location";
}
