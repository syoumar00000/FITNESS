class ExerciseHub {
  List<Exercises>? exercises;

  ExerciseHub({this.exercises});
  ExerciseHub.fromJson(Map<String, dynamic> json) {
    if (json['exercises'] != null) {
      exercises = <Exercises>[];
      json['exercises'].forEach((v) {
        exercises!.add(Exercises.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (exercises != null) {
      data['exercises'] = exercises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exercises {
  String? id;
  String? title;
  String? thumbnail;
  String? gif;
  String? seconds;

  Exercises({this.id, this.title, this.thumbnail, this.gif, this.seconds});

  Exercises.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    gif = json['gif'];
    seconds = json['seconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['gif'] = gif;
    data['seconds'] = seconds;
    return data;
  }
}
