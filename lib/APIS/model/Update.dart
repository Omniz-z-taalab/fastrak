class Update {

  String ?currentVersion;
  bool ?hasUpdate;


  Update();

  Update.fromJson(Map<String, dynamic> json) {
    currentVersion = json['current_version'];
    hasUpdate = json['has_update'];
  }
}