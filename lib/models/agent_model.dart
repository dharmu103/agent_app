class AgentModel {
  String? agentId;
  String? name;
  String? email;
  String? phone;
  String? city;
  bool? isVerified;
  String? aadharno;

  AgentModel({
    this.agentId,
    this.name,
    this.email,
    this.phone,
    this.city,
    this.isVerified,
    this.aadharno,
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
        agentId: json["agentId"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        city: json["city"],
        isVerified: json["isVerified"],
        aadharno: json["aadharno"],
      );

  Map<String, dynamic> toJson() => {
        "agentId": agentId,
        "name": name,
        "email": email,
        "phone": phone,
        "city": city,
        "isVerified": isVerified,
        "aadharno": aadharno,
      };
}
