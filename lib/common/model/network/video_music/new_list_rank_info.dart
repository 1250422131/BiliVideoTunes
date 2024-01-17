import 'dart:convert';
NewListRankInfo newListRankInfoFromJson(String str) => NewListRankInfo.fromJson(json.decode(str));
String newListRankInfoToJson(NewListRankInfo data) => json.encode(data.toJson());
class NewListRankInfo {
  NewListRankInfo({
      num? code, 
      String? message, 
      num? ttl, 
      Data? data,}){
    _code = code;
    _message = message;
    _ttl = ttl;
    _data = data;
}

  NewListRankInfo.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _ttl = json['ttl'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _code;
  String? _message;
  num? _ttl;
  Data? _data;
NewListRankInfo copyWith({  num? code,
  String? message,
  num? ttl,
  Data? data,
}) => NewListRankInfo(  code: code ?? _code,
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
      dynamic expList, 
      List<String>? showModuleList, 
      List<Result>? result, 
      num? showColumn, 
      String? rqtType, 
      num? numPages, 
      num? numResults, 
      String? crrQuery, 
      num? pagesize, 
      String? suggestKeyword, 
      dynamic eggInfo, 
      num? cache, 
      num? expBits, 
      String? expStr, 
      String? seid, 
      String? msg, 
      num? eggHit, 
      num? page,}){
    _expList = expList;
    _showModuleList = showModuleList;
    _result = result;
    _showColumn = showColumn;
    _rqtType = rqtType;
    _numPages = numPages;
    _numResults = numResults;
    _crrQuery = crrQuery;
    _pagesize = pagesize;
    _suggestKeyword = suggestKeyword;
    _eggInfo = eggInfo;
    _cache = cache;
    _expBits = expBits;
    _expStr = expStr;
    _seid = seid;
    _msg = msg;
    _eggHit = eggHit;
    _page = page;
}

  Data.fromJson(dynamic json) {
    _expList = json['exp_list'];
    _showModuleList = json['show_module_list'] != null ? json['show_module_list'].cast<String>() : [];
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(Result.fromJson(v));
      });
    }
    _showColumn = json['show_column'];
    _rqtType = json['rqt_type'];
    _numPages = json['numPages'];
    _numResults = json['numResults'];
    _crrQuery = json['crr_query'];
    _pagesize = json['pagesize'];
    _suggestKeyword = json['suggest_keyword'];
    _eggInfo = json['egg_info'];
    _cache = json['cache'];
    _expBits = json['exp_bits'];
    _expStr = json['exp_str'];
    _seid = json['seid'];
    _msg = json['msg'];
    _eggHit = json['egg_hit'];
    _page = json['page'];
  }
  dynamic _expList;
  List<String>? _showModuleList;
  List<Result>? _result;
  num? _showColumn;
  String? _rqtType;
  num? _numPages;
  num? _numResults;
  String? _crrQuery;
  num? _pagesize;
  String? _suggestKeyword;
  dynamic _eggInfo;
  num? _cache;
  num? _expBits;
  String? _expStr;
  String? _seid;
  String? _msg;
  num? _eggHit;
  num? _page;
Data copyWith({  dynamic expList,
  List<String>? showModuleList,
  List<Result>? result,
  num? showColumn,
  String? rqtType,
  num? numPages,
  num? numResults,
  String? crrQuery,
  num? pagesize,
  String? suggestKeyword,
  dynamic eggInfo,
  num? cache,
  num? expBits,
  String? expStr,
  String? seid,
  String? msg,
  num? eggHit,
  num? page,
}) => Data(  expList: expList ?? _expList,
  showModuleList: showModuleList ?? _showModuleList,
  result: result ?? _result,
  showColumn: showColumn ?? _showColumn,
  rqtType: rqtType ?? _rqtType,
  numPages: numPages ?? _numPages,
  numResults: numResults ?? _numResults,
  crrQuery: crrQuery ?? _crrQuery,
  pagesize: pagesize ?? _pagesize,
  suggestKeyword: suggestKeyword ?? _suggestKeyword,
  eggInfo: eggInfo ?? _eggInfo,
  cache: cache ?? _cache,
  expBits: expBits ?? _expBits,
  expStr: expStr ?? _expStr,
  seid: seid ?? _seid,
  msg: msg ?? _msg,
  eggHit: eggHit ?? _eggHit,
  page: page ?? _page,
);
  dynamic get expList => _expList;
  List<String>? get showModuleList => _showModuleList;
  List<Result>? get result => _result;
  num? get showColumn => _showColumn;
  String? get rqtType => _rqtType;
  num? get numPages => _numPages;
  num? get numResults => _numResults;
  String? get crrQuery => _crrQuery;
  num? get pagesize => _pagesize;
  String? get suggestKeyword => _suggestKeyword;
  dynamic get eggInfo => _eggInfo;
  num? get cache => _cache;
  num? get expBits => _expBits;
  String? get expStr => _expStr;
  String? get seid => _seid;
  String? get msg => _msg;
  num? get eggHit => _eggHit;
  num? get page => _page;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['exp_list'] = _expList;
    map['show_module_list'] = _showModuleList;
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    map['show_column'] = _showColumn;
    map['rqt_type'] = _rqtType;
    map['numPages'] = _numPages;
    map['numResults'] = _numResults;
    map['crr_query'] = _crrQuery;
    map['pagesize'] = _pagesize;
    map['suggest_keyword'] = _suggestKeyword;
    map['egg_info'] = _eggInfo;
    map['cache'] = _cache;
    map['exp_bits'] = _expBits;
    map['exp_str'] = _expStr;
    map['seid'] = _seid;
    map['msg'] = _msg;
    map['egg_hit'] = _eggHit;
    map['page'] = _page;
    return map;
  }

}

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data.toJson());
class Result {
  Result({
      String? pubdate, 
      String? pic, 
      String? tag, 
      num? duration, 
      num? id, 
      num? rankScore, 
      bool? badgepay, 
      num? senddate, 
      String? author, 
      num? review, 
      num? mid, 
      num? isUnionVideo, 
      num? rankIndex, 
      String? type, 
      String? arcrank, 
      String? play, 
      num? rankOffset, 
      String? description, 
      num? videoReview, 
      num? isPay, 
      num? favorites, 
      String? arcurl, 
      String? bvid, 
      String? title, 
      num? vt, 
      num? enableVt, 
      String? vtDisplay,}){
    _pubdate = pubdate;
    _pic = pic;
    _tag = tag;
    _duration = duration;
    _id = id;
    _rankScore = rankScore;
    _badgepay = badgepay;
    _senddate = senddate;
    _author = author;
    _review = review;
    _mid = mid;
    _isUnionVideo = isUnionVideo;
    _rankIndex = rankIndex;
    _type = type;
    _arcrank = arcrank;
    _play = play;
    _rankOffset = rankOffset;
    _description = description;
    _videoReview = videoReview;
    _isPay = isPay;
    _favorites = favorites;
    _arcurl = arcurl;
    _bvid = bvid;
    _title = title;
    _vt = vt;
    _enableVt = enableVt;
    _vtDisplay = vtDisplay;
}

  Result.fromJson(dynamic json) {
    _pubdate = json['pubdate'];
    _pic = json['pic'];
    _tag = json['tag'];
    _duration = json['duration'];
    _id = json['id'];
    _rankScore = json['rank_score'];
    _badgepay = json['badgepay'];
    _senddate = json['senddate'];
    _author = json['author'];
    _review = json['review'];
    _mid = json['mid'];
    _isUnionVideo = json['is_union_video'];
    _rankIndex = json['rank_index'];
    _type = json['type'];
    _arcrank = json['arcrank'];
    _play = json['play'];
    _rankOffset = json['rank_offset'];
    _description = json['description'];
    _videoReview = json['video_review'];
    _isPay = json['is_pay'];
    _favorites = json['favorites'];
    _arcurl = json['arcurl'];
    _bvid = json['bvid'];
    _title = json['title'];
    _vt = json['vt'];
    _enableVt = json['enable_vt'];
    _vtDisplay = json['vt_display'];
  }
  String? _pubdate;
  String? _pic;
  String? _tag;
  num? _duration;
  num? _id;
  num? _rankScore;
  bool? _badgepay;
  num? _senddate;
  String? _author;
  num? _review;
  num? _mid;
  num? _isUnionVideo;
  num? _rankIndex;
  String? _type;
  String? _arcrank;
  String? _play;
  num? _rankOffset;
  String? _description;
  num? _videoReview;
  num? _isPay;
  num? _favorites;
  String? _arcurl;
  String? _bvid;
  String? _title;
  num? _vt;
  num? _enableVt;
  String? _vtDisplay;
Result copyWith({  String? pubdate,
  String? pic,
  String? tag,
  num? duration,
  num? id,
  num? rankScore,
  bool? badgepay,
  num? senddate,
  String? author,
  num? review,
  num? mid,
  num? isUnionVideo,
  num? rankIndex,
  String? type,
  String? arcrank,
  String? play,
  num? rankOffset,
  String? description,
  num? videoReview,
  num? isPay,
  num? favorites,
  String? arcurl,
  String? bvid,
  String? title,
  num? vt,
  num? enableVt,
  String? vtDisplay,
}) => Result(  pubdate: pubdate ?? _pubdate,
  pic: pic ?? _pic,
  tag: tag ?? _tag,
  duration: duration ?? _duration,
  id: id ?? _id,
  rankScore: rankScore ?? _rankScore,
  badgepay: badgepay ?? _badgepay,
  senddate: senddate ?? _senddate,
  author: author ?? _author,
  review: review ?? _review,
  mid: mid ?? _mid,
  isUnionVideo: isUnionVideo ?? _isUnionVideo,
  rankIndex: rankIndex ?? _rankIndex,
  type: type ?? _type,
  arcrank: arcrank ?? _arcrank,
  play: play ?? _play,
  rankOffset: rankOffset ?? _rankOffset,
  description: description ?? _description,
  videoReview: videoReview ?? _videoReview,
  isPay: isPay ?? _isPay,
  favorites: favorites ?? _favorites,
  arcurl: arcurl ?? _arcurl,
  bvid: bvid ?? _bvid,
  title: title ?? _title,
  vt: vt ?? _vt,
  enableVt: enableVt ?? _enableVt,
  vtDisplay: vtDisplay ?? _vtDisplay,
);
  String? get pubdate => _pubdate;
  String? get pic => _pic;
  String? get tag => _tag;
  num? get duration => _duration;
  num? get id => _id;
  num? get rankScore => _rankScore;
  bool? get badgepay => _badgepay;
  num? get senddate => _senddate;
  String? get author => _author;
  num? get review => _review;
  num? get mid => _mid;
  num? get isUnionVideo => _isUnionVideo;
  num? get rankIndex => _rankIndex;
  String? get type => _type;
  String? get arcrank => _arcrank;
  String? get play => _play;
  num? get rankOffset => _rankOffset;
  String? get description => _description;
  num? get videoReview => _videoReview;
  num? get isPay => _isPay;
  num? get favorites => _favorites;
  String? get arcurl => _arcurl;
  String? get bvid => _bvid;
  String? get title => _title;
  num? get vt => _vt;
  num? get enableVt => _enableVt;
  String? get vtDisplay => _vtDisplay;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pubdate'] = _pubdate;
    map['pic'] = _pic;
    map['tag'] = _tag;
    map['duration'] = _duration;
    map['id'] = _id;
    map['rank_score'] = _rankScore;
    map['badgepay'] = _badgepay;
    map['senddate'] = _senddate;
    map['author'] = _author;
    map['review'] = _review;
    map['mid'] = _mid;
    map['is_union_video'] = _isUnionVideo;
    map['rank_index'] = _rankIndex;
    map['type'] = _type;
    map['arcrank'] = _arcrank;
    map['play'] = _play;
    map['rank_offset'] = _rankOffset;
    map['description'] = _description;
    map['video_review'] = _videoReview;
    map['is_pay'] = _isPay;
    map['favorites'] = _favorites;
    map['arcurl'] = _arcurl;
    map['bvid'] = _bvid;
    map['title'] = _title;
    map['vt'] = _vt;
    map['enable_vt'] = _enableVt;
    map['vt_display'] = _vtDisplay;
    return map;
  }

}