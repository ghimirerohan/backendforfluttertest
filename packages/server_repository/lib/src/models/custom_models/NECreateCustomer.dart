import 'package:idempiere_rest/idempiere_rest.dart';
import 'package:server_repository/src/models/common_models/CBPGroupID.dart';

import '../common_models/DocStatus.dart';

class NECreateCustomer extends ModelBase{
  String? uid;
  String? value;
  String? name;
  bool? hasCard;
  CBPGroupID? cLocationID;
  String? phone;
  String? eMail;
  double? houseStoreyNumber;
  CBPGroupID? cBPGroupID;
  CBPGroupID? approvedBy;
  DocStatus? docStatus;
  String? taxId;
  String? modelName;

  NECreateCustomer(json) : super(json){
    id = json['id'];
    uid = json['uid'];
    value = json['Value'];
    name = json['Name'];
    hasCard = json['HasCard'];
    cLocationID = json['C_Location_ID'] != null
        ? new CBPGroupID.fromJson(json['C_Location_ID'])
        : null;
    phone = json['Phone'];
    eMail = json['EMail'];
    taxId = json['TaxID'];
    houseStoreyNumber = json['house_storey_number'];
    cBPGroupID = json['C_BP_Group_ID'] != null
        ? new CBPGroupID.fromJson(json['C_BP_Group_ID'])
        : null;
    approvedBy = json['ApprovedBy'] != null
        ? new CBPGroupID.fromJson(json['ApprovedBy'])
        : null;
    docStatus = json['DocStatus'] != null
        ? new DocStatus.fromJson(json['DocStatus'])
        : null;
    modelName = json['model-name'];
  }

  NECreateCustomer fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    value = json['Value'];
    name = json['Name'];
    hasCard = json['HasCard'];
    cLocationID = json['C_Location_ID'] != null
        ? new CBPGroupID.fromJson(json['C_Location_ID'])
        : null;
    phone = json['Phone'];
    eMail = json['EMail'];
    taxId = json['TaxID'];
    houseStoreyNumber = json['house_storey_number'];
    cBPGroupID = json['C_BP_Group_ID'] != null
        ? new CBPGroupID.fromJson(json['C_BP_Group_ID'])
        : null;
    approvedBy = json['ApprovedBy'] != null
        ? new CBPGroupID.fromJson(json['ApprovedBy'])
        : null;
    docStatus = json['DocStatus'] != null
        ? new DocStatus.fromJson(json['DocStatus'])
        : null;
    modelName = json['model-name'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['uid'] = uid;
    data['Value'] = value;
    data['Name'] = name;
    data['HasCard'] = hasCard;
    if (cLocationID != null) {
      data['C_Location_ID'] = cLocationID!.toJson();
    }
    data['Phone'] = phone;
    data['EMail'] = eMail;
    data['house_storey_number'] = houseStoreyNumber;
    data['TaxID'] = taxId;
    if (cBPGroupID != null) {
      data['C_BP_Group_ID'] = cBPGroupID!.toJson();
    }
    if (approvedBy != null) {
      data['ApprovedBy'] = approvedBy!.toJson();
    }
    if (docStatus != null) {
      data['DocStatus'] = docStatus!.toJson();
    }
    data['model-name'] = modelName;
    return data;
  }
  static const String model = "ne_createcustomer";


}


