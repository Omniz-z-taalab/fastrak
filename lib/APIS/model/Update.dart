
class Update {
  Data ?_data;

  Update({Data ?data}) {
    this._data = data;
  }

  Data get data => data;
  set data(Data data) => _data = data;

  Update.fromJson(Map<String, dynamic> json) {
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data?.toJson();
    }
    return data;
  }
}

class Data {
  String ?_currentVersion;
  bool ?_hasUpdate;

  Data({String ?currentVersion, bool ?hasUpdate}) {
    this._currentVersion = currentVersion;
    this._hasUpdate = hasUpdate;
  }

  String get currentVersion => _currentVersion!;
  set currentVersion(String currentVersion) => _currentVersion = currentVersion;
  bool get hasUpdate => _hasUpdate!;
  set hasUpdate(bool hasUpdate) => _hasUpdate = hasUpdate;

  Data.fromJson(Map<String, dynamic> json) {
    _currentVersion = json['current_version'];
    _hasUpdate = json['has_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_version'] = this._currentVersion;
    data['has_update'] = this._hasUpdate;
    return data;
  }
}