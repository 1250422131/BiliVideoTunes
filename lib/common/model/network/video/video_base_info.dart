
class VideoBaseInfo {
  int? code;
  String? message;
  int? ttl;
  Data? data;

  VideoBaseInfo({this.code, this.message, this.ttl, this.data});

  VideoBaseInfo.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    message = json["message"];
    ttl = json["ttl"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    _data["ttl"] = ttl;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? bvid;
  int? aid;
  int? videos;
  int? tid;
  String? tname;
  int? copyright;
  String? pic;
  String? title;
  int? pubdate;
  int? ctime;
  String? desc;
  List<DescV2>? descV2;
  int? state;
  int? duration;
  Rights? rights;
  Owner? owner;
  Stat? stat;
  ArgueInfo? argueInfo;
  int? cid;
  Dimension? dimension;
  int? seasonId;
  dynamic premiere;
  int? teenageMode;
  bool? isChargeableSeason;
  bool? isStory;
  bool? isUpowerExclusive;
  bool? isUpowerPlay;
  bool? isUpowerPreview;
  int? enableVt;
  String? vtDisplay;
  bool? noCache;
  List<Pages>? pages;
  Subtitle? subtitle;
  UgcSeason? ugcSeason;
  bool? isSeasonDisplay;
  UserGarb? userGarb;
  HonorReply? honorReply;
  String? likeIcon;
  bool? needJumpBv;
  bool? disableShowUpInfo;
  int? isStoryPlay;

  Data({this.bvid, this.aid, this.videos, this.tid, this.tname, this.copyright, this.pic, this.title, this.pubdate, this.ctime, this.desc, this.descV2, this.state, this.duration, this.rights, this.owner, this.stat, this.argueInfo, this.cid, this.dimension, this.seasonId, this.premiere, this.teenageMode, this.isChargeableSeason, this.isStory, this.isUpowerExclusive, this.isUpowerPlay, this.isUpowerPreview, this.enableVt, this.vtDisplay, this.noCache, this.pages, this.subtitle, this.ugcSeason, this.isSeasonDisplay, this.userGarb, this.honorReply, this.likeIcon, this.needJumpBv, this.disableShowUpInfo, this.isStoryPlay});

  Data.fromJson(Map<String, dynamic> json) {
    bvid = json["bvid"];
    aid = json["aid"];
    videos = json["videos"];
    tid = json["tid"];
    tname = json["tname"];
    copyright = json["copyright"];
    pic = json["pic"];
    title = json["title"];
    pubdate = json["pubdate"];
    ctime = json["ctime"];
    desc = json["desc"];
    descV2 = json["desc_v2"] == null ? null : (json["desc_v2"] as List).map((e) => DescV2.fromJson(e)).toList();
    state = json["state"];
    duration = json["duration"];
    rights = json["rights"] == null ? null : Rights.fromJson(json["rights"]);
    owner = json["owner"] == null ? null : Owner.fromJson(json["owner"]);
    stat = json["stat"] == null ? null : Stat.fromJson(json["stat"]);
    argueInfo = json["argue_info"] == null ? null : ArgueInfo.fromJson(json["argue_info"]);
    cid = json["cid"];
    dimension = json["dimension"] == null ? null : Dimension.fromJson(json["dimension"]);
    seasonId = json["season_id"];
    premiere = json["premiere"];
    teenageMode = json["teenage_mode"];
    isChargeableSeason = json["is_chargeable_season"];
    isStory = json["is_story"];
    isUpowerExclusive = json["is_upower_exclusive"];
    isUpowerPlay = json["is_upower_play"];
    isUpowerPreview = json["is_upower_preview"];
    enableVt = json["enable_vt"];
    vtDisplay = json["vt_display"];
    noCache = json["no_cache"];
    pages = json["pages"] == null ? null : (json["pages"] as List).map((e) => Pages.fromJson(e)).toList();
    subtitle = json["subtitle"] == null ? null : Subtitle.fromJson(json["subtitle"]);
    ugcSeason = json["ugc_season"] == null ? null : UgcSeason.fromJson(json["ugc_season"]);
    isSeasonDisplay = json["is_season_display"];
    userGarb = json["user_garb"] == null ? null : UserGarb.fromJson(json["user_garb"]);
    honorReply = json["honor_reply"] == null ? null : HonorReply.fromJson(json["honor_reply"]);
    likeIcon = json["like_icon"];
    needJumpBv = json["need_jump_bv"];
    disableShowUpInfo = json["disable_show_up_info"];
    isStoryPlay = json["is_story_play"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["bvid"] = bvid;
    _data["aid"] = aid;
    _data["videos"] = videos;
    _data["tid"] = tid;
    _data["tname"] = tname;
    _data["copyright"] = copyright;
    _data["pic"] = pic;
    _data["title"] = title;
    _data["pubdate"] = pubdate;
    _data["ctime"] = ctime;
    _data["desc"] = desc;
    if(descV2 != null) {
      _data["desc_v2"] = descV2?.map((e) => e.toJson()).toList();
    }
    _data["state"] = state;
    _data["duration"] = duration;
    if(rights != null) {
      _data["rights"] = rights?.toJson();
    }
    if(owner != null) {
      _data["owner"] = owner?.toJson();
    }
    if(stat != null) {
      _data["stat"] = stat?.toJson();
    }
    if(argueInfo != null) {
      _data["argue_info"] = argueInfo?.toJson();
    }
    _data["cid"] = cid;
    if(dimension != null) {
      _data["dimension"] = dimension?.toJson();
    }
    _data["season_id"] = seasonId;
    _data["premiere"] = premiere;
    _data["teenage_mode"] = teenageMode;
    _data["is_chargeable_season"] = isChargeableSeason;
    _data["is_story"] = isStory;
    _data["is_upower_exclusive"] = isUpowerExclusive;
    _data["is_upower_play"] = isUpowerPlay;
    _data["is_upower_preview"] = isUpowerPreview;
    _data["enable_vt"] = enableVt;
    _data["vt_display"] = vtDisplay;
    _data["no_cache"] = noCache;
    if(pages != null) {
      _data["pages"] = pages?.map((e) => e.toJson()).toList();
    }
    if(subtitle != null) {
      _data["subtitle"] = subtitle?.toJson();
    }
    if(ugcSeason != null) {
      _data["ugc_season"] = ugcSeason?.toJson();
    }
    _data["is_season_display"] = isSeasonDisplay;
    if(userGarb != null) {
      _data["user_garb"] = userGarb?.toJson();
    }
    if(honorReply != null) {
      _data["honor_reply"] = honorReply?.toJson();
    }
    _data["like_icon"] = likeIcon;
    _data["need_jump_bv"] = needJumpBv;
    _data["disable_show_up_info"] = disableShowUpInfo;
    _data["is_story_play"] = isStoryPlay;
    return _data;
  }
}

class HonorReply {
  List<Honor>? honor;

  HonorReply({this.honor});

  HonorReply.fromJson(Map<String, dynamic> json) {
    honor = json["honor"] == null ? null : (json["honor"] as List).map((e) => Honor.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(honor != null) {
      _data["honor"] = honor?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Honor {
  int? aid;
  int? type;
  String? desc;
  int? weeklyRecommendNum;

  Honor({this.aid, this.type, this.desc, this.weeklyRecommendNum});

  Honor.fromJson(Map<String, dynamic> json) {
    aid = json["aid"];
    type = json["type"];
    desc = json["desc"];
    weeklyRecommendNum = json["weekly_recommend_num"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["aid"] = aid;
    _data["type"] = type;
    _data["desc"] = desc;
    _data["weekly_recommend_num"] = weeklyRecommendNum;
    return _data;
  }
}

class UserGarb {
  String? urlImageAniCut;

  UserGarb({this.urlImageAniCut});

  UserGarb.fromJson(Map<String, dynamic> json) {
    urlImageAniCut = json["url_image_ani_cut"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url_image_ani_cut"] = urlImageAniCut;
    return _data;
  }
}

class UgcSeason {
  int? id;
  String? title;
  String? cover;
  int? mid;
  String? intro;
  int? signState;
  int? attribute;
  List<Sections>? sections;
  Stat2? stat;
  int? epCount;
  int? seasonType;
  bool? isPaySeason;
  int? enableVt;

  UgcSeason({this.id, this.title, this.cover, this.mid, this.intro, this.signState, this.attribute, this.sections, this.stat, this.epCount, this.seasonType, this.isPaySeason, this.enableVt});

  UgcSeason.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    cover = json["cover"];
    mid = json["mid"];
    intro = json["intro"];
    signState = json["sign_state"];
    attribute = json["attribute"];
    sections = json["sections"] == null ? null : (json["sections"] as List).map((e) => Sections.fromJson(e)).toList();
    stat = json["stat"] == null ? null : Stat2.fromJson(json["stat"]);
    epCount = json["ep_count"];
    seasonType = json["season_type"];
    isPaySeason = json["is_pay_season"];
    enableVt = json["enable_vt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["cover"] = cover;
    _data["mid"] = mid;
    _data["intro"] = intro;
    _data["sign_state"] = signState;
    _data["attribute"] = attribute;
    if(sections != null) {
      _data["sections"] = sections?.map((e) => e.toJson()).toList();
    }
    if(stat != null) {
      _data["stat"] = stat?.toJson();
    }
    _data["ep_count"] = epCount;
    _data["season_type"] = seasonType;
    _data["is_pay_season"] = isPaySeason;
    _data["enable_vt"] = enableVt;
    return _data;
  }
}

class Stat2 {
  int? seasonId;
  int? view;
  int? danmaku;
  int? reply;
  int? fav;
  int? coin;
  int? share;
  int? nowRank;
  int? hisRank;
  int? like;
  int? vt;
  int? vv;

  Stat2({this.seasonId, this.view, this.danmaku, this.reply, this.fav, this.coin, this.share, this.nowRank, this.hisRank, this.like, this.vt, this.vv});

  Stat2.fromJson(Map<String, dynamic> json) {
    seasonId = json["season_id"];
    view = json["view"];
    danmaku = json["danmaku"];
    reply = json["reply"];
    fav = json["fav"];
    coin = json["coin"];
    share = json["share"];
    nowRank = json["now_rank"];
    hisRank = json["his_rank"];
    like = json["like"];
    vt = json["vt"];
    vv = json["vv"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["season_id"] = seasonId;
    _data["view"] = view;
    _data["danmaku"] = danmaku;
    _data["reply"] = reply;
    _data["fav"] = fav;
    _data["coin"] = coin;
    _data["share"] = share;
    _data["now_rank"] = nowRank;
    _data["his_rank"] = hisRank;
    _data["like"] = like;
    _data["vt"] = vt;
    _data["vv"] = vv;
    return _data;
  }
}

class Sections {
  int? seasonId;
  int? id;
  String? title;
  int? type;
  List<Episodes>? episodes;

  Sections({this.seasonId, this.id, this.title, this.type, this.episodes});

  Sections.fromJson(Map<String, dynamic> json) {
    seasonId = json["season_id"];
    id = json["id"];
    title = json["title"];
    type = json["type"];
    episodes = json["episodes"] == null ? null : (json["episodes"] as List).map((e) => Episodes.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["season_id"] = seasonId;
    _data["id"] = id;
    _data["title"] = title;
    _data["type"] = type;
    if(episodes != null) {
      _data["episodes"] = episodes?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Episodes {
  int? seasonId;
  int? sectionId;
  int? id;
  int? aid;
  int? cid;
  String? title;
  int? attribute;
  Arc? arc;
  Page? page;
  String? bvid;

  Episodes({this.seasonId, this.sectionId, this.id, this.aid, this.cid, this.title, this.attribute, this.arc, this.page, this.bvid});

  Episodes.fromJson(Map<String, dynamic> json) {
    seasonId = json["season_id"];
    sectionId = json["section_id"];
    id = json["id"];
    aid = json["aid"];
    cid = json["cid"];
    title = json["title"];
    attribute = json["attribute"];
    arc = json["arc"] == null ? null : Arc.fromJson(json["arc"]);
    page = json["page"] == null ? null : Page.fromJson(json["page"]);
    bvid = json["bvid"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["season_id"] = seasonId;
    _data["section_id"] = sectionId;
    _data["id"] = id;
    _data["aid"] = aid;
    _data["cid"] = cid;
    _data["title"] = title;
    _data["attribute"] = attribute;
    if(arc != null) {
      _data["arc"] = arc?.toJson();
    }
    if(page != null) {
      _data["page"] = page?.toJson();
    }
    _data["bvid"] = bvid;
    return _data;
  }
}

class Page {
  int? cid;
  int? page;
  String? from;
  String? part;
  int? duration;
  String? vid;
  String? weblink;
  Dimension3? dimension;

  Page({this.cid, this.page, this.from, this.part, this.duration, this.vid, this.weblink, this.dimension});

  Page.fromJson(Map<String, dynamic> json) {
    cid = json["cid"];
    page = json["page"];
    from = json["from"];
    part = json["part"];
    duration = json["duration"];
    vid = json["vid"];
    weblink = json["weblink"];
    dimension = json["dimension"] == null ? null : Dimension3.fromJson(json["dimension"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["cid"] = cid;
    _data["page"] = page;
    _data["from"] = from;
    _data["part"] = part;
    _data["duration"] = duration;
    _data["vid"] = vid;
    _data["weblink"] = weblink;
    if(dimension != null) {
      _data["dimension"] = dimension?.toJson();
    }
    return _data;
  }
}

class Dimension3 {
  int? width;
  int? height;
  int? rotate;

  Dimension3({this.width, this.height, this.rotate});

  Dimension3.fromJson(Map<String, dynamic> json) {
    width = json["width"];
    height = json["height"];
    rotate = json["rotate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["width"] = width;
    _data["height"] = height;
    _data["rotate"] = rotate;
    return _data;
  }
}

class Arc {
  int? aid;
  int? videos;
  int? typeId;
  String? typeName;
  int? copyright;
  String? pic;
  String? title;
  int? pubdate;
  int? ctime;
  String? desc;
  int? state;
  int? duration;
  Rights1? rights;
  Author1? author;
  Stat1? stat;
  Dimension2? dimension;
  dynamic descV2;
  bool? isChargeableSeason;
  bool? isBlooper;
  int? enableVt;
  String? vtDisplay;

  Arc({this.aid, this.videos, this.typeId, this.typeName, this.copyright, this.pic, this.title, this.pubdate, this.ctime, this.desc, this.state, this.duration, this.rights, this.author, this.stat, this.dimension, this.descV2, this.isChargeableSeason, this.isBlooper, this.enableVt, this.vtDisplay});

  Arc.fromJson(Map<String, dynamic> json) {
    aid = json["aid"];
    videos = json["videos"];
    typeId = json["type_id"];
    typeName = json["type_name"];
    copyright = json["copyright"];
    pic = json["pic"];
    title = json["title"];
    pubdate = json["pubdate"];
    ctime = json["ctime"];
    desc = json["desc"];
    state = json["state"];
    duration = json["duration"];
    rights = json["rights"] == null ? null : Rights1.fromJson(json["rights"]);
    author = json["author"] == null ? null : Author1.fromJson(json["author"]);
    stat = json["stat"] == null ? null : Stat1.fromJson(json["stat"]);
    dimension = json["dimension"] == null ? null : Dimension2.fromJson(json["dimension"]);
    descV2 = json["desc_v2"];
    isChargeableSeason = json["is_chargeable_season"];
    isBlooper = json["is_blooper"];
    enableVt = json["enable_vt"];
    vtDisplay = json["vt_display"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["aid"] = aid;
    _data["videos"] = videos;
    _data["type_id"] = typeId;
    _data["type_name"] = typeName;
    _data["copyright"] = copyright;
    _data["pic"] = pic;
    _data["title"] = title;
    _data["pubdate"] = pubdate;
    _data["ctime"] = ctime;
    _data["desc"] = desc;
    _data["state"] = state;
    _data["duration"] = duration;
    if(rights != null) {
      _data["rights"] = rights?.toJson();
    }
    if(author != null) {
      _data["author"] = author?.toJson();
    }
    if(stat != null) {
      _data["stat"] = stat?.toJson();
    }
    _data["dynamic"] = dynamic;
    if(dimension != null) {
      _data["dimension"] = dimension?.toJson();
    }
    _data["desc_v2"] = descV2;
    _data["is_chargeable_season"] = isChargeableSeason;
    _data["is_blooper"] = isBlooper;
    _data["enable_vt"] = enableVt;
    _data["vt_display"] = vtDisplay;
    return _data;
  }
}

class Dimension2 {
  int? width;
  int? height;
  int? rotate;

  Dimension2({this.width, this.height, this.rotate});

  Dimension2.fromJson(Map<String, dynamic> json) {
    width = json["width"];
    height = json["height"];
    rotate = json["rotate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["width"] = width;
    _data["height"] = height;
    _data["rotate"] = rotate;
    return _data;
  }
}

class Stat1 {
  int? aid;
  int? view;
  int? danmaku;
  int? reply;
  int? fav;
  int? coin;
  int? share;
  int? nowRank;
  int? hisRank;
  int? like;
  int? dislike;
  String? evaluation;
  String? argueMsg;
  int? vt;
  int? vv;

  Stat1({this.aid, this.view, this.danmaku, this.reply, this.fav, this.coin, this.share, this.nowRank, this.hisRank, this.like, this.dislike, this.evaluation, this.argueMsg, this.vt, this.vv});

  Stat1.fromJson(Map<String, dynamic> json) {
    aid = json["aid"];
    view = json["view"];
    danmaku = json["danmaku"];
    reply = json["reply"];
    fav = json["fav"];
    coin = json["coin"];
    share = json["share"];
    nowRank = json["now_rank"];
    hisRank = json["his_rank"];
    like = json["like"];
    dislike = json["dislike"];
    evaluation = json["evaluation"];
    argueMsg = json["argue_msg"];
    vt = json["vt"];
    vv = json["vv"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["aid"] = aid;
    _data["view"] = view;
    _data["danmaku"] = danmaku;
    _data["reply"] = reply;
    _data["fav"] = fav;
    _data["coin"] = coin;
    _data["share"] = share;
    _data["now_rank"] = nowRank;
    _data["his_rank"] = hisRank;
    _data["like"] = like;
    _data["dislike"] = dislike;
    _data["evaluation"] = evaluation;
    _data["argue_msg"] = argueMsg;
    _data["vt"] = vt;
    _data["vv"] = vv;
    return _data;
  }
}

class Author1 {
  int? mid;
  String? name;
  String? face;

  Author1({this.mid, this.name, this.face});

  Author1.fromJson(Map<String, dynamic> json) {
    mid = json["mid"];
    name = json["name"];
    face = json["face"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["mid"] = mid;
    _data["name"] = name;
    _data["face"] = face;
    return _data;
  }
}

class Rights1 {
  int? bp;
  int? elec;
  int? download;
  int? movie;
  int? pay;
  int? hd5;
  int? noReprint;
  int? autoplay;
  int? ugcPay;
  int? isCooperation;
  int? ugcPayPreview;
  int? arcPay;
  int? freeWatch;

  Rights1({this.bp, this.elec, this.download, this.movie, this.pay, this.hd5, this.noReprint, this.autoplay, this.ugcPay, this.isCooperation, this.ugcPayPreview, this.arcPay, this.freeWatch});

  Rights1.fromJson(Map<String, dynamic> json) {
    bp = json["bp"];
    elec = json["elec"];
    download = json["download"];
    movie = json["movie"];
    pay = json["pay"];
    hd5 = json["hd5"];
    noReprint = json["no_reprint"];
    autoplay = json["autoplay"];
    ugcPay = json["ugc_pay"];
    isCooperation = json["is_cooperation"];
    ugcPayPreview = json["ugc_pay_preview"];
    arcPay = json["arc_pay"];
    freeWatch = json["free_watch"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["bp"] = bp;
    _data["elec"] = elec;
    _data["download"] = download;
    _data["movie"] = movie;
    _data["pay"] = pay;
    _data["hd5"] = hd5;
    _data["no_reprint"] = noReprint;
    _data["autoplay"] = autoplay;
    _data["ugc_pay"] = ugcPay;
    _data["is_cooperation"] = isCooperation;
    _data["ugc_pay_preview"] = ugcPayPreview;
    _data["arc_pay"] = arcPay;
    _data["free_watch"] = freeWatch;
    return _data;
  }
}

class Subtitle {
  bool? allowSubmit;
  List<MList>? list;

  Subtitle({this.allowSubmit, this.list});

  Subtitle.fromJson(Map<String, dynamic> json) {
    allowSubmit = json["allow_submit"];
    list = json["list"] == null ? null : (json["list"] as List).map((e) => MList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["allow_submit"] = allowSubmit;
    if(list != null) {
      _data["list"] = list?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class MList {
  int? id;
  String? lan;
  String? lanDoc;
  bool? isLock;
  String? subtitleUrl;
  int? type;
  String? idStr;
  int? aiType;
  int? aiStatus;
  Author? author;

  MList({this.id, this.lan, this.lanDoc, this.isLock, this.subtitleUrl, this.type, this.idStr, this.aiType, this.aiStatus, this.author});

  MList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    lan = json["lan"];
    lanDoc = json["lan_doc"];
    isLock = json["is_lock"];
    subtitleUrl = json["subtitle_url"];
    type = json["type"];
    idStr = json["id_str"];
    aiType = json["ai_type"];
    aiStatus = json["ai_status"];
    author = json["author"] == null ? null : Author.fromJson(json["author"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["lan"] = lan;
    _data["lan_doc"] = lanDoc;
    _data["is_lock"] = isLock;
    _data["subtitle_url"] = subtitleUrl;
    _data["type"] = type;
    _data["id_str"] = idStr;
    _data["ai_type"] = aiType;
    _data["ai_status"] = aiStatus;
    if(author != null) {
      _data["author"] = author?.toJson();
    }
    return _data;
  }
}

class Author {
  int? mid;
  String? name;
  String? sex;
  String? face;
  String? sign;
  int? rank;
  int? birthday;
  int? isFakeAccount;
  int? isDeleted;
  int? inRegAudit;
  int? isSeniorMember;

  Author({this.mid, this.name, this.sex, this.face, this.sign, this.rank, this.birthday, this.isFakeAccount, this.isDeleted, this.inRegAudit, this.isSeniorMember});

  Author.fromJson(Map<String, dynamic> json) {
    mid = json["mid"];
    name = json["name"];
    sex = json["sex"];
    face = json["face"];
    sign = json["sign"];
    rank = json["rank"];
    birthday = json["birthday"];
    isFakeAccount = json["is_fake_account"];
    isDeleted = json["is_deleted"];
    inRegAudit = json["in_reg_audit"];
    isSeniorMember = json["is_senior_member"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["mid"] = mid;
    _data["name"] = name;
    _data["sex"] = sex;
    _data["face"] = face;
    _data["sign"] = sign;
    _data["rank"] = rank;
    _data["birthday"] = birthday;
    _data["is_fake_account"] = isFakeAccount;
    _data["is_deleted"] = isDeleted;
    _data["in_reg_audit"] = inRegAudit;
    _data["is_senior_member"] = isSeniorMember;
    return _data;
  }
}

class Pages {
  int? cid;
  int? page;
  String? from;
  String? part;
  int? duration;
  String? vid;
  String? weblink;
  Dimension1? dimension;
  String? firstFrame;

  Pages({this.cid, this.page, this.from, this.part, this.duration, this.vid, this.weblink, this.dimension, this.firstFrame});

  Pages.fromJson(Map<String, dynamic> json) {
    cid = json["cid"];
    page = json["page"];
    from = json["from"];
    part = json["part"];
    duration = json["duration"];
    vid = json["vid"];
    weblink = json["weblink"];
    dimension = json["dimension"] == null ? null : Dimension1.fromJson(json["dimension"]);
    firstFrame = json["first_frame"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["cid"] = cid;
    _data["page"] = page;
    _data["from"] = from;
    _data["part"] = part;
    _data["duration"] = duration;
    _data["vid"] = vid;
    _data["weblink"] = weblink;
    if(dimension != null) {
      _data["dimension"] = dimension?.toJson();
    }
    _data["first_frame"] = firstFrame;
    return _data;
  }
}

class Dimension1 {
  int? width;
  int? height;
  int? rotate;

  Dimension1({this.width, this.height, this.rotate});

  Dimension1.fromJson(Map<String, dynamic> json) {
    width = json["width"];
    height = json["height"];
    rotate = json["rotate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["width"] = width;
    _data["height"] = height;
    _data["rotate"] = rotate;
    return _data;
  }
}

class Dimension {
  int? width;
  int? height;
  int? rotate;

  Dimension({this.width, this.height, this.rotate});

  Dimension.fromJson(Map<String, dynamic> json) {
    width = json["width"];
    height = json["height"];
    rotate = json["rotate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["width"] = width;
    _data["height"] = height;
    _data["rotate"] = rotate;
    return _data;
  }
}

class ArgueInfo {
  String? argueMsg;
  int? argueType;
  String? argueLink;

  ArgueInfo({this.argueMsg, this.argueType, this.argueLink});

  ArgueInfo.fromJson(Map<String, dynamic> json) {
    argueMsg = json["argue_msg"];
    argueType = json["argue_type"];
    argueLink = json["argue_link"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["argue_msg"] = argueMsg;
    _data["argue_type"] = argueType;
    _data["argue_link"] = argueLink;
    return _data;
  }
}

class Stat {
  int? aid;
  int? view;
  int? danmaku;
  int? reply;
  int? favorite;
  int? coin;
  int? share;
  int? nowRank;
  int? hisRank;
  int? like;
  int? dislike;
  String? evaluation;
  int? vt;

  Stat({this.aid, this.view, this.danmaku, this.reply, this.favorite, this.coin, this.share, this.nowRank, this.hisRank, this.like, this.dislike, this.evaluation, this.vt});

  Stat.fromJson(Map<String, dynamic> json) {
    aid = json["aid"];
    view = json["view"];
    danmaku = json["danmaku"];
    reply = json["reply"];
    favorite = json["favorite"];
    coin = json["coin"];
    share = json["share"];
    nowRank = json["now_rank"];
    hisRank = json["his_rank"];
    like = json["like"];
    dislike = json["dislike"];
    evaluation = json["evaluation"];
    vt = json["vt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["aid"] = aid;
    _data["view"] = view;
    _data["danmaku"] = danmaku;
    _data["reply"] = reply;
    _data["favorite"] = favorite;
    _data["coin"] = coin;
    _data["share"] = share;
    _data["now_rank"] = nowRank;
    _data["his_rank"] = hisRank;
    _data["like"] = like;
    _data["dislike"] = dislike;
    _data["evaluation"] = evaluation;
    _data["vt"] = vt;
    return _data;
  }
}

class Owner {
  int? mid;
  String? name;
  String? face;

  Owner({this.mid, this.name, this.face});

  Owner.fromJson(Map<String, dynamic> json) {
    mid = json["mid"];
    name = json["name"];
    face = json["face"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["mid"] = mid;
    _data["name"] = name;
    _data["face"] = face;
    return _data;
  }
}

class Rights {
  int? bp;
  int? elec;
  int? download;
  int? movie;
  int? pay;
  int? hd5;
  int? noReprint;
  int? autoplay;
  int? ugcPay;
  int? isCooperation;
  int? ugcPayPreview;
  int? noBackground;
  int? cleanMode;
  int? isSteinGate;
  int? is360;
  int? noShare;
  int? arcPay;
  int? freeWatch;

  Rights({this.bp, this.elec, this.download, this.movie, this.pay, this.hd5, this.noReprint, this.autoplay, this.ugcPay, this.isCooperation, this.ugcPayPreview, this.noBackground, this.cleanMode, this.isSteinGate, this.is360, this.noShare, this.arcPay, this.freeWatch});

  Rights.fromJson(Map<String, dynamic> json) {
    bp = json["bp"];
    elec = json["elec"];
    download = json["download"];
    movie = json["movie"];
    pay = json["pay"];
    hd5 = json["hd5"];
    noReprint = json["no_reprint"];
    autoplay = json["autoplay"];
    ugcPay = json["ugc_pay"];
    isCooperation = json["is_cooperation"];
    ugcPayPreview = json["ugc_pay_preview"];
    noBackground = json["no_background"];
    cleanMode = json["clean_mode"];
    isSteinGate = json["is_stein_gate"];
    is360 = json["is_360"];
    noShare = json["no_share"];
    arcPay = json["arc_pay"];
    freeWatch = json["free_watch"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["bp"] = bp;
    _data["elec"] = elec;
    _data["download"] = download;
    _data["movie"] = movie;
    _data["pay"] = pay;
    _data["hd5"] = hd5;
    _data["no_reprint"] = noReprint;
    _data["autoplay"] = autoplay;
    _data["ugc_pay"] = ugcPay;
    _data["is_cooperation"] = isCooperation;
    _data["ugc_pay_preview"] = ugcPayPreview;
    _data["no_background"] = noBackground;
    _data["clean_mode"] = cleanMode;
    _data["is_stein_gate"] = isSteinGate;
    _data["is_360"] = is360;
    _data["no_share"] = noShare;
    _data["arc_pay"] = arcPay;
    _data["free_watch"] = freeWatch;
    return _data;
  }
}

class DescV2 {
  String? rawText;
  int? type;
  int? bizId;

  DescV2({this.rawText, this.type, this.bizId});

  DescV2.fromJson(Map<String, dynamic> json) {
    rawText = json["raw_text"];
    type = json["type"];
    bizId = json["biz_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["raw_text"] = rawText;
    _data["type"] = type;
    _data["biz_id"] = bizId;
    return _data;
  }
}