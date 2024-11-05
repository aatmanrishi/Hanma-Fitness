class ContentModel {
  String? bodyPart;
  String? equipment;
  String? gifUrl;
  String? id;
  String? name;
  String? target;
  List<String>? secondaryMuscles;
  List<String>? instructions;

  ContentModel({
    this.bodyPart,
    this.equipment,
    this.gifUrl,
    this.id,
    this.name,
    this.target,
    this.secondaryMuscles,
    this.instructions,
  });

  ContentModel.fromJson(Map<String, dynamic> json) {
    bodyPart = json['bodyPart'] as String?;
    equipment = json['equipment'] as String?;
    gifUrl = json['gifUrl'] as String?;
    id = json['id'] as String?;
    name = json['name'] as String?;
    target = json['target'] as String?;
    secondaryMuscles = (json['secondaryMuscles'] as List<dynamic>?)?.cast<String>();
    instructions = (json['instructions'] as List<dynamic>?)?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bodyPart'] = bodyPart;
    data['equipment'] = equipment;
    data['gifUrl'] = gifUrl;
    data['id'] = id;
    data['name'] = name;
    data['target'] = target;
    data['secondaryMuscles'] = secondaryMuscles;
    data['instructions'] = instructions;
    return data;
  }
}
