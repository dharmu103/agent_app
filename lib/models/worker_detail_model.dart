class WorkerModel {
  String? name;
  String? workerId;
  String? agentId;

  WorkerModel({
    this.name,
    this.workerId,
    this.agentId,
  });

  factory WorkerModel.fromJson(Map<String, dynamic> json) => WorkerModel(
        name: json["name"],
        workerId: json["workerId"],
        agentId: json["agentId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "workerId": workerId,
        "agentId": agentId,
      };
}
