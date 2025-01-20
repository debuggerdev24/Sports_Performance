class PlanningModel {
  String? id;
  String? coachId;
  String? uid;
  String? planName;
  String? description;
  String? startDate;
  String? endDate;
  String? isVisible;
  String? monday;
  String? video;
  String? tuesday;
  String? wednesday;
  String? thursday;
  String? friday;
  String? saturday;
  String? sunday;

  PlanningModel({
    this.id,
    this.coachId,
    this.uid,
    this.planName,
    this.description,
    this.startDate,
    this.endDate,
    this.isVisible,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.video,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  PlanningModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coachId = json['coach_id'];
    video = json['video_link'];
    uid = json['uid'];
    planName = json['plan_name'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    isVisible = json['is_visible'];
    monday = json['monday'];
    tuesday = json['tuesday'];
    wednesday = json['wednesday'];
    thursday = json['thursday'];
    friday = json['friday'];
    saturday = json['saturday'];
    sunday = json['sunday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['coach_id'] = coachId;
    data['uid'] = uid;
    data['video_link'] = video;
    data['plan_name'] = planName;
    data['description'] = description;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['is_visible'] = isVisible;
    data['monday'] = monday;
    data['tuesday'] = tuesday;
    data['wednesday'] = wednesday;
    data['thursday'] = thursday;
    data['friday'] = friday;
    data['saturday'] = saturday;
    data['sunday'] = sunday;
    return data;
  }
}
