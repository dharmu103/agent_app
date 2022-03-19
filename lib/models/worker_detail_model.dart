class WorkerModel {
  String? name;

  String? agentId;

  WorkerModel({
    this.name,
    this.agentId,
  });

  factory WorkerModel.fromJson(Map<String, dynamic> json) => WorkerModel(
        name: json["name"],
        agentId: json["agentId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "agentId": agentId,
      };
}
