class RequirementsModel {
  String? id;
  String? name;
  String? status;
  String? appliedBy;
  bool? applied;
  String? appliedWorkerId;

  RequirementsModel({
    this.id,
    this.name,
    this.status,
    this.appliedBy,
    this.applied,
    this.appliedWorkerId,
  });

  factory RequirementsModel.fromJson(Map<String, dynamic> json) =>
      RequirementsModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        appliedBy: json["appliedBy"],
        applied: json["applied"],
        appliedWorkerId: json["appliedWorkerId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "appliedBy": appliedBy,
        "applied": applied,
        "appliedWorkerId": appliedWorkerId,
      };
}
