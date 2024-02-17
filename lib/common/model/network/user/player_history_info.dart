import 'dart:convert';

PlayerHistoryInfo playerHistoryInfoFromJson(String str) =>
    PlayerHistoryInfo.fromJson(json.decode(str));

String playerHistoryInfoToJson(PlayerHistoryInfo data) =>
    json.encode(data.toJson());

class PlayerHistoryInfo {
  PlayerHistoryInfo({
    num? code,
    String? message,
    num? ttl,
    Data? data,
  }) {
    _code = code;
    _message = message;
    _ttl = ttl;
    _data = data;
  }

  PlayerHistoryInfo.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _ttl = json['ttl'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  num? _code;
  String? _message;
  num? _ttl;
  Data? _data;

  PlayerHistoryInfo copyWith({
    num? code,
    String? message,
    num? ttl,
    Data? data,
  }) =>
      PlayerHistoryInfo(
        code: code ?? _code,
        message: message ?? _message,
        ttl: ttl ?? _ttl,
        data: data ?? _data,
      );

  num? get code => _code;

  String? get message => _message;

  num? get ttl => _ttl;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    map['ttl'] = _ttl;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    Cursor? cursor,
    List<Tab>? tab,
    List<MList>? list,
  }) {
    _cursor = cursor;
    _tab = tab;
    _list = list;
  }

  Data.fromJson(dynamic json) {
    _cursor = json['cursor'] != null ? Cursor.fromJson(json['cursor']) : null;
    if (json['tab'] != null) {
      _tab = [];
      json['tab'].forEach((v) {
        _tab?.add(Tab.fromJson(v));
      });
    }
    if (json['list'] != null) {
      _list = [];
      json['list'].forEach((v) {
        _list?.add(MList.fromJson(v));
      });
    }
  }

  Cursor? _cursor;
  List<Tab>? _tab;
  List<MList>? _list;

  Data copyWith({
    Cursor? cursor,
    List<Tab>? tab,
    List<MList>? list,
  }) =>
      Data(
        cursor: cursor ?? _cursor,
        tab: tab ?? _tab,
        list: list ?? _list,
      );

  Cursor? get cursor => _cursor;

  List<Tab>? get tab => _tab;

  List<MList>? get list => _list;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cursor != null) {
      map['cursor'] = _cursor?.toJson();
    }
    if (_tab != null) {
      map['tab'] = _tab?.map((v) => v.toJson()).toList();
    }
    if (_list != null) {
      map['list'] = _list?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

MList listFromJson(String str) => MList.fromJson(json.decode(str));

String listToJson(MList data) => json.encode(data.toJson());

class MList {
  MList({
    String? title,
    String? longTitle,
    String? cover,
    dynamic covers,
    String? uri,
    History? history,
    num? videos,
    String? authorName,
    String? authorFace,
    num? authorMid,
    num? viewAt,
    num? progress,
    String? badge,
    String? showTitle,
    num? duration,
    String? current,
    num? total,
    String? newDesc,
    num? isFinish,
    num? isFav,
    num? kid,
    String? tagName,
    num? liveStatus,
  }) {
    _title = title;
    _longTitle = longTitle;
    _cover = cover;
    _covers = covers;
    _uri = uri;
    _history = history;
    _videos = videos;
    _authorName = authorName;
    _authorFace = authorFace;
    _authorMid = authorMid;
    _viewAt = viewAt;
    _progress = progress;
    _badge = badge;
    _showTitle = showTitle;
    _duration = duration;
    _current = current;
    _total = total;
    _newDesc = newDesc;
    _isFinish = isFinish;
    _isFav = isFav;
    _kid = kid;
    _tagName = tagName;
    _liveStatus = liveStatus;
  }

  MList.fromJson(dynamic json) {
    _title = json['title'];
    _longTitle = json['long_title'];
    _cover = json['cover'];
    _covers = json['covers'];
    _uri = json['uri'];
    _history =
        json['history'] != null ? History.fromJson(json['history']) : null;
    _videos = json['videos'];
    _authorName = json['author_name'];
    _authorFace = json['author_face'];
    _authorMid = json['author_mid'];
    _viewAt = json['view_at'];
    _progress = json['progress'];
    _badge = json['badge'];
    _showTitle = json['show_title'];
    _duration = json['duration'];
    _current = json['current'];
    _total = json['total'];
    _newDesc = json['new_desc'];
    _isFinish = json['is_finish'];
    _isFav = json['is_fav'];
    _kid = json['kid'];
    _tagName = json['tag_name'];
    _liveStatus = json['live_status'];
  }

  String? _title;
  String? _longTitle;
  String? _cover;
  dynamic _covers;
  String? _uri;
  History? _history;
  num? _videos;
  String? _authorName;
  String? _authorFace;
  num? _authorMid;
  num? _viewAt;
  num? _progress;
  String? _badge;
  String? _showTitle;
  num? _duration;
  String? _current;
  num? _total;
  String? _newDesc;
  num? _isFinish;
  num? _isFav;
  num? _kid;
  String? _tagName;
  num? _liveStatus;

  MList copyWith({
    String? title,
    String? longTitle,
    String? cover,
    dynamic covers,
    String? uri,
    History? history,
    num? videos,
    String? authorName,
    String? authorFace,
    num? authorMid,
    num? viewAt,
    num? progress,
    String? badge,
    String? showTitle,
    num? duration,
    String? current,
    num? total,
    String? newDesc,
    num? isFinish,
    num? isFav,
    num? kid,
    String? tagName,
    num? liveStatus,
  }) =>
      MList(
        title: title ?? _title,
        longTitle: longTitle ?? _longTitle,
        cover: cover ?? _cover,
        covers: covers ?? _covers,
        uri: uri ?? _uri,
        history: history ?? _history,
        videos: videos ?? _videos,
        authorName: authorName ?? _authorName,
        authorFace: authorFace ?? _authorFace,
        authorMid: authorMid ?? _authorMid,
        viewAt: viewAt ?? _viewAt,
        progress: progress ?? _progress,
        badge: badge ?? _badge,
        showTitle: showTitle ?? _showTitle,
        duration: duration ?? _duration,
        current: current ?? _current,
        total: total ?? _total,
        newDesc: newDesc ?? _newDesc,
        isFinish: isFinish ?? _isFinish,
        isFav: isFav ?? _isFav,
        kid: kid ?? _kid,
        tagName: tagName ?? _tagName,
        liveStatus: liveStatus ?? _liveStatus,
      );

  String? get title => _title;

  String? get longTitle => _longTitle;

  String? get cover => _cover;

  dynamic get covers => _covers;

  String? get uri => _uri;

  History? get history => _history;

  num? get videos => _videos;

  String? get authorName => _authorName;

  String? get authorFace => _authorFace;

  num? get authorMid => _authorMid;

  num? get viewAt => _viewAt;

  num? get progress => _progress;

  String? get badge => _badge;

  String? get showTitle => _showTitle;

  num? get duration => _duration;

  String? get current => _current;

  num? get total => _total;

  String? get newDesc => _newDesc;

  num? get isFinish => _isFinish;

  num? get isFav => _isFav;

  num? get kid => _kid;

  String? get tagName => _tagName;

  num? get liveStatus => _liveStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['long_title'] = _longTitle;
    map['cover'] = _cover;
    map['covers'] = _covers;
    map['uri'] = _uri;
    if (_history != null) {
      map['history'] = _history?.toJson();
    }
    map['videos'] = _videos;
    map['author_name'] = _authorName;
    map['author_face'] = _authorFace;
    map['author_mid'] = _authorMid;
    map['view_at'] = _viewAt;
    map['progress'] = _progress;
    map['badge'] = _badge;
    map['show_title'] = _showTitle;
    map['duration'] = _duration;
    map['current'] = _current;
    map['total'] = _total;
    map['new_desc'] = _newDesc;
    map['is_finish'] = _isFinish;
    map['is_fav'] = _isFav;
    map['kid'] = _kid;
    map['tag_name'] = _tagName;
    map['live_status'] = _liveStatus;
    return map;
  }
}

History historyFromJson(String str) => History.fromJson(json.decode(str));

String historyToJson(History data) => json.encode(data.toJson());

class History {
  History({
    num? oid,
    num? epid,
    String? bvid,
    num? page,
    num? cid,
    String? part,
    String? business,
    num? dt,
  }) {
    _oid = oid;
    _epid = epid;
    _bvid = bvid;
    _page = page;
    _cid = cid;
    _part = part;
    _business = business;
    _dt = dt;
  }

  History.fromJson(dynamic json) {
    _oid = json['oid'];
    _epid = json['epid'];
    _bvid = json['bvid'];
    _page = json['page'];
    _cid = json['cid'];
    _part = json['part'];
    _business = json['business'];
    _dt = json['dt'];
  }

  num? _oid;
  num? _epid;
  String? _bvid;
  num? _page;
  num? _cid;
  String? _part;
  String? _business;
  num? _dt;

  History copyWith({
    num? oid,
    num? epid,
    String? bvid,
    num? page,
    num? cid,
    String? part,
    String? business,
    num? dt,
  }) =>
      History(
        oid: oid ?? _oid,
        epid: epid ?? _epid,
        bvid: bvid ?? _bvid,
        page: page ?? _page,
        cid: cid ?? _cid,
        part: part ?? _part,
        business: business ?? _business,
        dt: dt ?? _dt,
      );

  num? get oid => _oid;

  num? get epid => _epid;

  String? get bvid => _bvid;

  num? get page => _page;

  num? get cid => _cid;

  String? get part => _part;

  String? get business => _business;

  num? get dt => _dt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['oid'] = _oid;
    map['epid'] = _epid;
    map['bvid'] = _bvid;
    map['page'] = _page;
    map['cid'] = _cid;
    map['part'] = _part;
    map['business'] = _business;
    map['dt'] = _dt;
    return map;
  }
}

Tab tabFromJson(String str) => Tab.fromJson(json.decode(str));

String tabToJson(Tab data) => json.encode(data.toJson());

class Tab {
  Tab({
    String? type,
    String? name,
  }) {
    _type = type;
    _name = name;
  }

  Tab.fromJson(dynamic json) {
    _type = json['type'];
    _name = json['name'];
  }

  String? _type;
  String? _name;

  Tab copyWith({
    String? type,
    String? name,
  }) =>
      Tab(
        type: type ?? _type,
        name: name ?? _name,
      );

  String? get type => _type;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['name'] = _name;
    return map;
  }
}

Cursor cursorFromJson(String str) => Cursor.fromJson(json.decode(str));

String cursorToJson(Cursor data) => json.encode(data.toJson());

class Cursor {
  Cursor({
    num? max,
    num? viewAt,
    String? business,
    num? ps,
  }) {
    _max = max;
    _viewAt = viewAt;
    _business = business;
    _ps = ps;
  }

  Cursor.fromJson(dynamic json) {
    _max = json['max'];
    _viewAt = json['view_at'];
    _business = json['business'];
    _ps = json['ps'];
  }

  num? _max;
  num? _viewAt;
  String? _business;
  num? _ps;

  Cursor copyWith({
    num? max,
    num? viewAt,
    String? business,
    num? ps,
  }) =>
      Cursor(
        max: max ?? _max,
        viewAt: viewAt ?? _viewAt,
        business: business ?? _business,
        ps: ps ?? _ps,
      );

  num? get max => _max;

  num? get viewAt => _viewAt;

  String? get business => _business;

  num? get ps => _ps;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['max'] = _max;
    map['view_at'] = _viewAt;
    map['business'] = _business;
    map['ps'] = _ps;
    return map;
  }
}
