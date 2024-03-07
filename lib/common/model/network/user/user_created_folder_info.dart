/// code : 0
/// message : "0"
/// ttl : 1
/// data : {"count":6,"list":[{"id":196026807,"fid":1960268,"mid":351201307,"attr":0,"title":"默认收藏夹","cover":"http://i2.hdslb.com/bfs/archive/09d67b00e4b0fb7a8028b5b419a5b0d77466b19b.jpg","upper":{"mid":351201307,"name":"萌新杰少","face":"https://i1.hdslb.com/bfs/face/6323fa4fdbd8cfa9d448cc9a3a0c32394bf34426.jpg"},"cover_type":2,"intro":"","ctime":1531536166,"mtime":1557476389,"state":0,"fav_state":0,"media_count":780,"view_count":0,"vt":0,"play_switch":0,"type":0,"link":"","bvid":""},{"id":2886141407,"fid":28861414,"mid":351201307,"attr":22,"title":"Demo","cover":"","upper":{"mid":351201307,"name":"萌新杰少","face":"https://i1.hdslb.com/bfs/face/6323fa4fdbd8cfa9d448cc9a3a0c32394bf34426.jpg"},"cover_type":0,"intro":"","ctime":1708266467,"mtime":1708266467,"state":0,"fav_state":0,"media_count":0,"view_count":0,"vt":0,"play_switch":0,"type":0,"link":"","bvid":""},{"id":1426414307,"fid":14264143,"mid":351201307,"attr":2,"title":"设计学习","cover":"http://i0.hdslb.com/bfs/archive/2f19699ad9b489e5272653c204dff1890214e923.jpg","upper":{"mid":351201307,"name":"萌新杰少","face":"https://i1.hdslb.com/bfs/face/6323fa4fdbd8cfa9d448cc9a3a0c32394bf34426.jpg"},"cover_type":2,"intro":"","ctime":1638507814,"mtime":1638508211,"state":0,"fav_state":0,"media_count":2,"view_count":0,"vt":0,"play_switch":0,"type":0,"link":"","bvid":""},{"id":1292535107,"fid":12925351,"mid":351201307,"attr":54,"title":"致我童年","cover":"http://i1.hdslb.com/bfs/archive/975673118279d66ff581ba004183cc1097b49bdb.jpg","upper":{"mid":351201307,"name":"萌新杰少","face":"https://i1.hdslb.com/bfs/face/6323fa4fdbd8cfa9d448cc9a3a0c32394bf34426.jpg"},"cover_type":2,"intro":"不管世界如何变化 唯愿自己永远单纯","ctime":1626447930,"mtime":1626448124,"state":0,"fav_state":0,"media_count":8,"view_count":0,"vt":0,"play_switch":0,"type":0,"link":"","bvid":""},{"id":1274129407,"fid":12741294,"mid":351201307,"attr":2,"title":"生物学习","cover":"http://i1.hdslb.com/bfs/archive/bbc223a5204904fba71e2cde2eca0d43c73e4c52.jpg","upper":{"mid":351201307,"name":"萌新杰少","face":"https://i1.hdslb.com/bfs/face/6323fa4fdbd8cfa9d448cc9a3a0c32394bf34426.jpg"},"cover_type":2,"intro":"","ctime":1624975457,"mtime":1624975463,"state":0,"fav_state":0,"media_count":3,"view_count":0,"vt":0,"play_switch":0,"type":0,"link":"","bvid":""},{"id":1224727107,"fid":12247271,"mid":351201307,"attr":3,"title":"思想政治","cover":"","upper":{"mid":351201307,"name":"萌新杰少","face":"https://i1.hdslb.com/bfs/face/6323fa4fdbd8cfa9d448cc9a3a0c32394bf34426.jpg"},"cover_type":0,"intro":"","ctime":1618842755,"mtime":1704976908,"state":0,"fav_state":0,"media_count":12,"view_count":0,"vt":0,"play_switch":0,"type":0,"link":"","bvid":""}],"has_more":false}

class UserCreatedFolderInfo {
  UserCreatedFolderInfo({
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

  UserCreatedFolderInfo.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _ttl = json['ttl'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  num? _code;
  String? _message;
  num? _ttl;
  Data? _data;

  UserCreatedFolderInfo copyWith({
    num? code,
    String? message,
    num? ttl,
    Data? data,
  }) =>
      UserCreatedFolderInfo(
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

/// count : 6
/// list : [{"id":196026807,"fid":1960268,"mid":351201307,"attr":0,"title":"默认收藏夹","cover":"http://i2.hdslb.com/bfs/archive/09d67b00e4b0fb7a8028b5b419a5b0d77466b19b.jpg","upper":{"mid":351201307,"name":"萌新杰少","face":"https://i1.hdslb.com/bfs/face/6323fa4fdbd8cfa9d448cc9a3a0c32394bf34426.jpg"},"cover_type":2,"intro":"","ctime":1531536166,"mtime":1557476389,"state":0,"fav_state":0,"media_count":780,"view_count":0,"vt":0,"play_switch":0,"type":0,"link":"","bvid":""},{"id":2886141407,"fid":28861414,"mid":351201307,"attr":22,"title":"Demo","cover":"","upper":{"mid":351201307,"name":"萌新杰少","face":"https://i1.hdslb.com/bfs/face/6323fa4fdbd8cfa9d448cc9a3a0c32394bf34426.jpg"},"cover_type":0,"intro":"","ctime":1708266467,"mtime":1708266467,"state":0,"fav_state":0,"media_count":0,"view_count":0,"vt":0,"play_switch":0,"type":0,"link":"","bvid":""},{"id":1426414307,"fid":14264143,"mid":351201307,"attr":2,"title":"设计学习","cover":"http://i0.hdslb.com/bfs/archive/2f19699ad9b489e5272653c204dff1890214e923.jpg","upper":{"mid":351201307,"name":"萌新杰少","face":"https://i1.hdslb.com/bfs/face/6323fa4fdbd8cfa9d448cc9a3a0c32394bf34426.jpg"},"cover_type":2,"intro":"","ctime":1638507814,"mtime":1638508211,"state":0,"fav_state":0,"media_count":2,"view_count":0,"vt":0,"play_switch":0,"type":0,"link":"","bvid":""},{"id":1292535107,"fid":12925351,"mid":351201307,"attr":54,"title":"致我童年","cover":"http://i1.hdslb.com/bfs/archive/975673118279d66ff581ba004183cc1097b49bdb.jpg","upper":{"mid":351201307,"name":"萌新杰少","face":"https://i1.hdslb.com/bfs/face/6323fa4fdbd8cfa9d448cc9a3a0c32394bf34426.jpg"},"cover_type":2,"intro":"不管世界如何变化 唯愿自己永远单纯","ctime":1626447930,"mtime":1626448124,"state":0,"fav_state":0,"media_count":8,"view_count":0,"vt":0,"play_switch":0,"type":0,"link":"","bvid":""},{"id":1274129407,"fid":12741294,"mid":351201307,"attr":2,"title":"生物学习","cover":"http://i1.hdslb.com/bfs/archive/bbc223a5204904fba71e2cde2eca0d43c73e4c52.jpg","upper":{"mid":351201307,"name":"萌新杰少","face":"https://i1.hdslb.com/bfs/face/6323fa4fdbd8cfa9d448cc9a3a0c32394bf34426.jpg"},"cover_type":2,"intro":"","ctime":1624975457,"mtime":1624975463,"state":0,"fav_state":0,"media_count":3,"view_count":0,"vt":0,"play_switch":0,"type":0,"link":"","bvid":""},{"id":1224727107,"fid":12247271,"mid":351201307,"attr":3,"title":"思想政治","cover":"","upper":{"mid":351201307,"name":"萌新杰少","face":"https://i1.hdslb.com/bfs/face/6323fa4fdbd8cfa9d448cc9a3a0c32394bf34426.jpg"},"cover_type":0,"intro":"","ctime":1618842755,"mtime":1704976908,"state":0,"fav_state":0,"media_count":12,"view_count":0,"vt":0,"play_switch":0,"type":0,"link":"","bvid":""}]
/// has_more : false

class Data {
  Data({
    num? count,
    List<DataList>? list,
    bool? hasMore,
  }) {
    _count = count;
    _list = list;
    _hasMore = hasMore;
  }

  Data.fromJson(dynamic json) {
    _count = json['count'];
    if (json['list'] != null) {
      _list = [];
      json['list'].forEach((v) {
        _list?.add(DataList.fromJson(v));
      });
    }
    _hasMore = json['has_more'];
  }

  num? _count;
  List<DataList>? _list;
  bool? _hasMore;

  Data copyWith({
    num? count,
    List<DataList>? list,
    bool? hasMore,
  }) =>
      Data(
        count: count ?? _count,
        list: list ?? _list,
        hasMore: hasMore ?? _hasMore,
      );

  num? get count => _count;

  List<DataList>? get list => _list;

  bool? get hasMore => _hasMore;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    if (_list != null) {
      map['list'] = _list?.map((v) => v.toJson()).toList();
    }
    map['has_more'] = _hasMore;
    return map;
  }
}

/// id : 196026807
/// fid : 1960268
/// mid : 351201307
/// attr : 0
/// title : "默认收藏夹"
/// cover : "http://i2.hdslb.com/bfs/archive/09d67b00e4b0fb7a8028b5b419a5b0d77466b19b.jpg"
/// upper : {"mid":351201307,"name":"萌新杰少","face":"https://i1.hdslb.com/bfs/face/6323fa4fdbd8cfa9d448cc9a3a0c32394bf34426.jpg"}
/// cover_type : 2
/// intro : ""
/// ctime : 1531536166
/// mtime : 1557476389
/// state : 0
/// fav_state : 0
/// media_count : 780
/// view_count : 0
/// vt : 0
/// play_switch : 0
/// type : 0
/// link : ""
/// bvid : ""

class DataList {
  List({
    num? id,
    num? fid,
    num? mid,
    num? attr,
    String? title,
    String? cover,
    Upper? upper,
    num? coverType,
    String? intro,
    num? ctime,
    num? mtime,
    num? state,
    num? favState,
    num? mediaCount,
    num? viewCount,
    num? vt,
    num? playSwitch,
    num? type,
    String? link,
    String? bvid,
  }) {
    _id = id;
    _fid = fid;
    _mid = mid;
    _attr = attr;
    _title = title;
    _cover = cover;
    _upper = upper;
    _coverType = coverType;
    _intro = intro;
    _ctime = ctime;
    _mtime = mtime;
    _state = state;
    _favState = favState;
    _mediaCount = mediaCount;
    _viewCount = viewCount;
    _vt = vt;
    _playSwitch = playSwitch;
    _type = type;
    _link = link;
    _bvid = bvid;
  }

  DataList.fromJson(dynamic json) {
    _id = json['id'];
    _fid = json['fid'];
    _mid = json['mid'];
    _attr = json['attr'];
    _title = json['title'];
    _cover = json['cover'];
    _upper = json['upper'] != null ? Upper.fromJson(json['upper']) : null;
    _coverType = json['cover_type'];
    _intro = json['intro'];
    _ctime = json['ctime'];
    _mtime = json['mtime'];
    _state = json['state'];
    _favState = json['fav_state'];
    _mediaCount = json['media_count'];
    _viewCount = json['view_count'];
    _vt = json['vt'];
    _playSwitch = json['play_switch'];
    _type = json['type'];
    _link = json['link'];
    _bvid = json['bvid'];
  }

  num? _id;
  num? _fid;
  num? _mid;
  num? _attr;
  String? _title;
  String? _cover;
  Upper? _upper;
  num? _coverType;
  String? _intro;
  num? _ctime;
  num? _mtime;
  num? _state;
  num? _favState;
  num? _mediaCount;
  num? _viewCount;
  num? _vt;
  num? _playSwitch;
  num? _type;
  String? _link;
  String? _bvid;

  DataList copyWith({
    num? id,
    num? fid,
    num? mid,
    num? attr,
    String? title,
    String? cover,
    Upper? upper,
    num? coverType,
    String? intro,
    num? ctime,
    num? mtime,
    num? state,
    num? favState,
    num? mediaCount,
    num? viewCount,
    num? vt,
    num? playSwitch,
    num? type,
    String? link,
    String? bvid,
  }) =>
      List(
        id: id ?? _id,
        fid: fid ?? _fid,
        mid: mid ?? _mid,
        attr: attr ?? _attr,
        title: title ?? _title,
        cover: cover ?? _cover,
        upper: upper ?? _upper,
        coverType: coverType ?? _coverType,
        intro: intro ?? _intro,
        ctime: ctime ?? _ctime,
        mtime: mtime ?? _mtime,
        state: state ?? _state,
        favState: favState ?? _favState,
        mediaCount: mediaCount ?? _mediaCount,
        viewCount: viewCount ?? _viewCount,
        vt: vt ?? _vt,
        playSwitch: playSwitch ?? _playSwitch,
        type: type ?? _type,
        link: link ?? _link,
        bvid: bvid ?? _bvid,
      );

  num? get id => _id;

  num? get fid => _fid;

  num? get mid => _mid;

  num? get attr => _attr;

  String? get title => _title;

  String? get cover => _cover;

  Upper? get upper => _upper;

  num? get coverType => _coverType;

  String? get intro => _intro;

  num? get ctime => _ctime;

  num? get mtime => _mtime;

  num? get state => _state;

  num? get favState => _favState;

  num? get mediaCount => _mediaCount;

  num? get viewCount => _viewCount;

  num? get vt => _vt;

  num? get playSwitch => _playSwitch;

  num? get type => _type;

  String? get link => _link;

  String? get bvid => _bvid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fid'] = _fid;
    map['mid'] = _mid;
    map['attr'] = _attr;
    map['title'] = _title;
    map['cover'] = _cover;
    if (_upper != null) {
      map['upper'] = _upper?.toJson();
    }
    map['cover_type'] = _coverType;
    map['intro'] = _intro;
    map['ctime'] = _ctime;
    map['mtime'] = _mtime;
    map['state'] = _state;
    map['fav_state'] = _favState;
    map['media_count'] = _mediaCount;
    map['view_count'] = _viewCount;
    map['vt'] = _vt;
    map['play_switch'] = _playSwitch;
    map['type'] = _type;
    map['link'] = _link;
    map['bvid'] = _bvid;
    return map;
  }
}

/// mid : 351201307
/// name : "萌新杰少"
/// face : "https://i1.hdslb.com/bfs/face/6323fa4fdbd8cfa9d448cc9a3a0c32394bf34426.jpg"

class Upper {
  Upper({
    num? mid,
    String? name,
    String? face,
  }) {
    _mid = mid;
    _name = name;
    _face = face;
  }

  Upper.fromJson(dynamic json) {
    _mid = json['mid'];
    _name = json['name'];
    _face = json['face'];
  }

  num? _mid;
  String? _name;
  String? _face;

  Upper copyWith({
    num? mid,
    String? name,
    String? face,
  }) =>
      Upper(
        mid: mid ?? _mid,
        name: name ?? _name,
        face: face ?? _face,
      );

  num? get mid => _mid;

  String? get name => _name;

  String? get face => _face;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mid'] = _mid;
    map['name'] = _name;
    map['face'] = _face;
    return map;
  }
}
