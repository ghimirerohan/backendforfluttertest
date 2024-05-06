class CBPGroupID {
  String? propertyLabel;
  int? id;
  String? identifier;
  String? modelName;

  CBPGroupID({this.propertyLabel, this.id, this.identifier, this.modelName});

  CBPGroupID.copyWith({
    String? propertyLabel,
    int? id,
    String? identifier,
    String? modelName,
  }){
    this.id = id ?? this.id;
    this.identifier = identifier ?? this.identifier ;
    this.propertyLabel = propertyLabel ?? this.propertyLabel ;
    this.modelName = modelName ?? this.modelName;
  }
  CBPGroupID.fromJson(Map<String, dynamic> json) {
    propertyLabel = json['propertyLabel'];
    id = json['id'];
    identifier = json['identifier'];
    modelName = json['model-name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['propertyLabel'] = this.propertyLabel;
    data['id'] = this.id;
    data['identifier'] = this.identifier;
    data['model-name'] = this.modelName;
    return data;
  }
}