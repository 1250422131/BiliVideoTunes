import 'package:bili_video_tunes/common/model/network/user/user_created_folder_info.dart';

/// code : 0
/// message : "0"
/// ttl : 1
/// data : {"trending":{"title":"bilibili热搜","trackid":"12899249118314226088","list":[{"keyword":"供10年女友读研小伙已去世","show_name":"供10年女友读研小伙已去世","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221213/eaf2dd702d7cc14d8d9511190245d057/lrx9rnKo24.png","uri":"","goto":""},{"keyword":"在5:20睡觉13:14准时起","show_name":"在5:20睡觉13:14准时起","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221117/eaf2dd702d7cc14d8d9511190245d057/EeuqbMwao9.png","uri":"","goto":""},{"keyword":"EDG上暗了","show_name":"EDG上暗了","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221213/eaf2dd702d7cc14d8d9511190245d057/lrx9rnKo24.png","uri":"","goto":""},{"keyword":"人一旦留学就沾了留子味","show_name":"人一旦留学就沾了留子味","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221213/eaf2dd702d7cc14d8d9511190245d057/lrx9rnKo24.png","uri":"","goto":""},{"keyword":"邯郸初中生被害案3人被刑事追诉","show_name":"邯郸初中生被害案3人被刑事追诉","icon":"","uri":"","goto":""},{"keyword":"仝卓工作室向仝卓讨债","show_name":"仝卓工作室向仝卓讨债","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221118/eaf2dd702d7cc14d8d9511190245d057/UF7B1wVKT2.png","uri":"","goto":""},{"keyword":"虎在5:20睡觉","show_name":"虎在5:20睡觉","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221117/eaf2dd702d7cc14d8d9511190245d057/EeuqbMwao9.png","uri":"","goto":""},{"keyword":"T1目前最后一届的MSI冠军","show_name":"T1目前最后一届的MSI冠军","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221118/eaf2dd702d7cc14d8d9511190245d057/UF7B1wVKT2.png","uri":"","goto":""},{"keyword":"午睡超1小时死亡风险增加","show_name":"午睡超1小时死亡风险增加","icon":"","uri":"","goto":""},{"keyword":"10万人帮UP娶厂长千金","show_name":"10万人帮UP娶厂长千金","icon":"","uri":"","goto":""}],"top_list":[]}}

class SearchSquareInfo {
  SearchSquareInfo({
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

  SearchSquareInfo.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _ttl = json['ttl'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  num? _code;
  String? _message;
  num? _ttl;
  Data? _data;

  SearchSquareInfo copyWith({
    num? code,
    String? message,
    num? ttl,
    Data? data,
  }) =>
      SearchSquareInfo(
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

/// trending : {"title":"bilibili热搜","trackid":"12899249118314226088","list":[{"keyword":"供10年女友读研小伙已去世","show_name":"供10年女友读研小伙已去世","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221213/eaf2dd702d7cc14d8d9511190245d057/lrx9rnKo24.png","uri":"","goto":""},{"keyword":"在5:20睡觉13:14准时起","show_name":"在5:20睡觉13:14准时起","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221117/eaf2dd702d7cc14d8d9511190245d057/EeuqbMwao9.png","uri":"","goto":""},{"keyword":"EDG上暗了","show_name":"EDG上暗了","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221213/eaf2dd702d7cc14d8d9511190245d057/lrx9rnKo24.png","uri":"","goto":""},{"keyword":"人一旦留学就沾了留子味","show_name":"人一旦留学就沾了留子味","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221213/eaf2dd702d7cc14d8d9511190245d057/lrx9rnKo24.png","uri":"","goto":""},{"keyword":"邯郸初中生被害案3人被刑事追诉","show_name":"邯郸初中生被害案3人被刑事追诉","icon":"","uri":"","goto":""},{"keyword":"仝卓工作室向仝卓讨债","show_name":"仝卓工作室向仝卓讨债","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221118/eaf2dd702d7cc14d8d9511190245d057/UF7B1wVKT2.png","uri":"","goto":""},{"keyword":"虎在5:20睡觉","show_name":"虎在5:20睡觉","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221117/eaf2dd702d7cc14d8d9511190245d057/EeuqbMwao9.png","uri":"","goto":""},{"keyword":"T1目前最后一届的MSI冠军","show_name":"T1目前最后一届的MSI冠军","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221118/eaf2dd702d7cc14d8d9511190245d057/UF7B1wVKT2.png","uri":"","goto":""},{"keyword":"午睡超1小时死亡风险增加","show_name":"午睡超1小时死亡风险增加","icon":"","uri":"","goto":""},{"keyword":"10万人帮UP娶厂长千金","show_name":"10万人帮UP娶厂长千金","icon":"","uri":"","goto":""}],"top_list":[]}

class Data {
  Data({
    Trending? trending,
  }) {
    _trending = trending;
  }

  Data.fromJson(dynamic json) {
    _trending =
        json['trending'] != null ? Trending.fromJson(json['trending']) : null;
  }

  Trending? _trending;

  Data copyWith({
    Trending? trending,
  }) =>
      Data(
        trending: trending ?? _trending,
      );

  Trending? get trending => _trending;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_trending != null) {
      map['trending'] = _trending?.toJson();
    }
    return map;
  }
}

/// title : "bilibili热搜"
/// trackid : "12899249118314226088"
/// list : [{"keyword":"供10年女友读研小伙已去世","show_name":"供10年女友读研小伙已去世","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221213/eaf2dd702d7cc14d8d9511190245d057/lrx9rnKo24.png","uri":"","goto":""},{"keyword":"在5:20睡觉13:14准时起","show_name":"在5:20睡觉13:14准时起","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221117/eaf2dd702d7cc14d8d9511190245d057/EeuqbMwao9.png","uri":"","goto":""},{"keyword":"EDG上暗了","show_name":"EDG上暗了","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221213/eaf2dd702d7cc14d8d9511190245d057/lrx9rnKo24.png","uri":"","goto":""},{"keyword":"人一旦留学就沾了留子味","show_name":"人一旦留学就沾了留子味","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221213/eaf2dd702d7cc14d8d9511190245d057/lrx9rnKo24.png","uri":"","goto":""},{"keyword":"邯郸初中生被害案3人被刑事追诉","show_name":"邯郸初中生被害案3人被刑事追诉","icon":"","uri":"","goto":""},{"keyword":"仝卓工作室向仝卓讨债","show_name":"仝卓工作室向仝卓讨债","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221118/eaf2dd702d7cc14d8d9511190245d057/UF7B1wVKT2.png","uri":"","goto":""},{"keyword":"虎在5:20睡觉","show_name":"虎在5:20睡觉","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221117/eaf2dd702d7cc14d8d9511190245d057/EeuqbMwao9.png","uri":"","goto":""},{"keyword":"T1目前最后一届的MSI冠军","show_name":"T1目前最后一届的MSI冠军","icon":"http://i0.hdslb.com/bfs/activity-plat/static/20221118/eaf2dd702d7cc14d8d9511190245d057/UF7B1wVKT2.png","uri":"","goto":""},{"keyword":"午睡超1小时死亡风险增加","show_name":"午睡超1小时死亡风险增加","icon":"","uri":"","goto":""},{"keyword":"10万人帮UP娶厂长千金","show_name":"10万人帮UP娶厂长千金","icon":"","uri":"","goto":""}]
/// top_list : []

class Trending {
  Trending({
    String? title,
    String? trackid,
    List<DataList>? list,
    List<dynamic>? topList,
  }) {
    _title = title;
    _trackid = trackid;
    _list = list;
  }

  Trending.fromJson(dynamic json) {
    _title = json['title'];
    _trackid = json['trackid'];
    if (json['list'] != null) {
      _list = [];
      json['list'].forEach((v) {
        _list?.add(DataList.fromJson(v));
      });
    }
  }

  String? _title;
  String? _trackid;
  List<DataList>? _list;
  List<DataList>? _topList;

  Trending copyWith({
    String? title,
    String? trackid,
    List<DataList>? list,
    List<dynamic>? topList,
  }) =>
      Trending(
        title: title ?? _title,
        trackid: trackid ?? _trackid,
        list: list ?? _list,
        topList: topList ?? _topList,
      );

  String? get title => _title;

  String? get trackid => _trackid;

  List<DataList>? get list => _list;

  List<dynamic>? get topList => _topList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['trackid'] = _trackid;
    if (_list != null) {
      map['list'] = _list?.map((v) => v.toJson()).toList();
    }
    if (_topList != null) {
      map['top_list'] = _topList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// keyword : "供10年女友读研小伙已去世"
/// show_name : "供10年女友读研小伙已去世"
/// icon : "http://i0.hdslb.com/bfs/activity-plat/static/20221213/eaf2dd702d7cc14d8d9511190245d057/lrx9rnKo24.png"
/// uri : ""
/// goto : ""

class DataList {
  DataList({
    String? keyword,
    String? showName,
    String? icon,
    String? uri,
    String? goto,
  }) {
    _keyword = keyword;
    _showName = showName;
    _icon = icon;
    _uri = uri;
    _goto = goto;
  }

  DataList.fromJson(dynamic json) {
    _keyword = json['keyword'];
    _showName = json['show_name'];
    _icon = json['icon'];
    _uri = json['uri'];
    _goto = json['goto'];
  }

  String? _keyword;
  String? _showName;
  String? _icon;
  String? _uri;
  String? _goto;

  DataList copyWith({
    String? keyword,
    String? showName,
    String? icon,
    String? uri,
    String? goto,
  }) =>
      DataList(
        keyword: keyword ?? _keyword,
        showName: showName ?? _showName,
        icon: icon ?? _icon,
        uri: uri ?? _uri,
        goto: goto ?? _goto,
      );

  String? get keyword => _keyword;

  String? get showName => _showName;

  String? get icon => _icon;

  String? get uri => _uri;

  String? get goto => _goto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['keyword'] = _keyword;
    map['show_name'] = _showName;
    map['icon'] = _icon;
    map['uri'] = _uri;
    map['goto'] = _goto;
    return map;
  }
}
