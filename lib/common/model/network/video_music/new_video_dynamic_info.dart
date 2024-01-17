class NewVideoDynamicInfo {
  int? code;
  String? message;
  int? ttl;
  Data? data;

  NewVideoDynamicInfo({this.code, this.message, this.ttl, this.data});

  NewVideoDynamicInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    ttl = json['ttl'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['ttl'] = this.ttl;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Page? page;
  List<Archives>? archives;

  Data({this.page, this.archives});

  Data.fromJson(Map<String, dynamic> json) {
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    if (json['archives'] != null) {
      archives = <Archives>[];
      json['archives'].forEach((v) {
        archives!.add(new Archives.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    if (this.archives != null) {
      data['archives'] = this.archives!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Page {
  int? num;
  int? size;
  int? count;

  Page({this.num, this.size, this.count});

  Page.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    size = json['size'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.num;
    data['size'] = this.size;
    data['count'] = this.count;
    return data;
  }
}

class Archives {
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
  int? state;
  int? duration;
  Rights? rights;
  Owner? owner;
  Stat? stat;
  int? cid;
  Dimension? dimension;
  String? shortLinkV2;
  int? upFromV2;
  String? firstFrame;
  String? pubLocation;
  String? bvid;
  int? seasonType;
  bool? isOgv;
  Null? ogvInfo;
  String? rcmdReason;
  int? enableVt;
  Null? aiRcmd;
  int? missionId;

  Archives(
      {this.aid,
      this.videos,
      this.tid,
      this.tname,
      this.copyright,
      this.pic,
      this.title,
      this.pubdate,
      this.ctime,
      this.desc,
      this.state,
      this.duration,
      this.rights,
      this.owner,
      this.stat,
      this.cid,
      this.dimension,
      this.shortLinkV2,
      this.upFromV2,
      this.firstFrame,
      this.pubLocation,
      this.bvid,
      this.seasonType,
      this.isOgv,
      this.ogvInfo,
      this.rcmdReason,
      this.enableVt,
      this.aiRcmd,
      this.missionId});

  Archives.fromJson(Map<String, dynamic> json) {
    aid = json['aid'];
    videos = json['videos'];
    tid = json['tid'];
    tname = json['tname'];
    copyright = json['copyright'];
    pic = json['pic'];
    title = json['title'];
    pubdate = json['pubdate'];
    ctime = json['ctime'];
    desc = json['desc'];
    state = json['state'];
    duration = json['duration'];
    rights =
        json['rights'] != null ? new Rights.fromJson(json['rights']) : null;
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    stat = json['stat'] != null ? new Stat.fromJson(json['stat']) : null;
    cid = json['cid'];
    dimension = json['dimension'] != null
        ? new Dimension.fromJson(json['dimension'])
        : null;
    shortLinkV2 = json['short_link_v2'];
    upFromV2 = json['up_from_v2'];
    firstFrame = json['first_frame'];
    pubLocation = json['pub_location'];
    bvid = json['bvid'];
    seasonType = json['season_type'];
    isOgv = json['is_ogv'];
    ogvInfo = json['ogv_info'];
    rcmdReason = json['rcmd_reason'];
    enableVt = json['enable_vt'];
    aiRcmd = json['ai_rcmd'];
    missionId = json['mission_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aid'] = this.aid;
    data['videos'] = this.videos;
    data['tid'] = this.tid;
    data['tname'] = this.tname;
    data['copyright'] = this.copyright;
    data['pic'] = this.pic;
    data['title'] = this.title;
    data['pubdate'] = this.pubdate;
    data['ctime'] = this.ctime;
    data['desc'] = this.desc;
    data['state'] = this.state;
    data['duration'] = this.duration;
    if (this.rights != null) {
      data['rights'] = this.rights!.toJson();
    }
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    if (this.stat != null) {
      data['stat'] = this.stat!.toJson();
    }
    data['cid'] = this.cid;
    if (this.dimension != null) {
      data['dimension'] = this.dimension!.toJson();
    }
    data['short_link_v2'] = this.shortLinkV2;
    data['up_from_v2'] = this.upFromV2;
    data['first_frame'] = this.firstFrame;
    data['pub_location'] = this.pubLocation;
    data['bvid'] = this.bvid;
    data['season_type'] = this.seasonType;
    data['is_ogv'] = this.isOgv;
    data['ogv_info'] = this.ogvInfo;
    data['rcmd_reason'] = this.rcmdReason;
    data['enable_vt'] = this.enableVt;
    data['ai_rcmd'] = this.aiRcmd;
    data['mission_id'] = this.missionId;
    return data;
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
  int? arcPay;
  int? payFreeWatch;

  Rights(
      {this.bp,
      this.elec,
      this.download,
      this.movie,
      this.pay,
      this.hd5,
      this.noReprint,
      this.autoplay,
      this.ugcPay,
      this.isCooperation,
      this.ugcPayPreview,
      this.noBackground,
      this.arcPay,
      this.payFreeWatch});

  Rights.fromJson(Map<String, dynamic> json) {
    bp = json['bp'];
    elec = json['elec'];
    download = json['download'];
    movie = json['movie'];
    pay = json['pay'];
    hd5 = json['hd5'];
    noReprint = json['no_reprint'];
    autoplay = json['autoplay'];
    ugcPay = json['ugc_pay'];
    isCooperation = json['is_cooperation'];
    ugcPayPreview = json['ugc_pay_preview'];
    noBackground = json['no_background'];
    arcPay = json['arc_pay'];
    payFreeWatch = json['pay_free_watch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bp'] = this.bp;
    data['elec'] = this.elec;
    data['download'] = this.download;
    data['movie'] = this.movie;
    data['pay'] = this.pay;
    data['hd5'] = this.hd5;
    data['no_reprint'] = this.noReprint;
    data['autoplay'] = this.autoplay;
    data['ugc_pay'] = this.ugcPay;
    data['is_cooperation'] = this.isCooperation;
    data['ugc_pay_preview'] = this.ugcPayPreview;
    data['no_background'] = this.noBackground;
    data['arc_pay'] = this.arcPay;
    data['pay_free_watch'] = this.payFreeWatch;
    return data;
  }
}

class Owner {
  int? mid;
  String? name;
  String? face;

  Owner({this.mid, this.name, this.face});

  Owner.fromJson(Map<String, dynamic> json) {
    mid = json['mid'];
    name = json['name'];
    face = json['face'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mid'] = this.mid;
    data['name'] = this.name;
    data['face'] = this.face;
    return data;
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
  int? vt;
  int? vv;

  Stat(
      {this.aid,
      this.view,
      this.danmaku,
      this.reply,
      this.favorite,
      this.coin,
      this.share,
      this.nowRank,
      this.hisRank,
      this.like,
      this.dislike,
      this.vt,
      this.vv});

  Stat.fromJson(Map<String, dynamic> json) {
    aid = json['aid'];
    view = json['view'];
    danmaku = json['danmaku'];
    reply = json['reply'];
    favorite = json['favorite'];
    coin = json['coin'];
    share = json['share'];
    nowRank = json['now_rank'];
    hisRank = json['his_rank'];
    like = json['like'];
    dislike = json['dislike'];
    vt = json['vt'];
    vv = json['vv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aid'] = this.aid;
    data['view'] = this.view;
    data['danmaku'] = this.danmaku;
    data['reply'] = this.reply;
    data['favorite'] = this.favorite;
    data['coin'] = this.coin;
    data['share'] = this.share;
    data['now_rank'] = this.nowRank;
    data['his_rank'] = this.hisRank;
    data['like'] = this.like;
    data['dislike'] = this.dislike;
    data['vt'] = this.vt;
    data['vv'] = this.vv;
    return data;
  }
}

class Dimension {
  int? width;
  int? height;
  int? rotate;

  Dimension({this.width, this.height, this.rotate});

  Dimension.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    rotate = json['rotate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['rotate'] = this.rotate;
    return data;
  }
}
