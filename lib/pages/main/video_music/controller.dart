import 'package:bili_video_tunes/common/api/search_info_api.dart';
import 'package:bili_video_tunes/common/api/video_music_api.dart';
import 'package:bili_video_tunes/common/model/network/home/search_default_info.dart';
import 'package:bili_video_tunes/common/model/network/video_music/new_video_dynamic_info.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:get/get.dart';

class HostTagItemInfo {
  final String? tagName;
  final num? highlight;
  final num? isAtten;
  final num? tagId;

  HostTagItemInfo(this.tagName, this.highlight, this.isAtten, this.tagId);
}

class TabItemInfo {
  final String name;
  final num rid;
  final num type;

  TabItemInfo(this.name, this.rid, this.type);
}

class VideoMusicPageInfo {
  final int count;

  final int num;
  final int size;

  VideoMusicPageInfo({this.count = 0, this.num = 0, this.size = 0});
}

class VideoMusicPageController extends GetxController {
  final hotsTags = <HostTagItemInfo>[].obs;
  final videoMusicList = [].obs;

  // 默认搜索信息
  final searchDefaultInfo = SearchDefaultInfo().obs;

  // 音乐视频
  final videoMusicPageInfo = VideoMusicPageInfo().obs;

  final List<TabItemInfo> tabItems = [
    TabItemInfo("原创", 28, 0),
    TabItemInfo("翻唱", 31, 0),
    TabItemInfo("演奏", 59, 0),
    TabItemInfo("VU", 30, 0),
    TabItemInfo("现场", 29, 0),
    TabItemInfo("MV", 193, 0),
  ];

  Future<void> loadHotsTage({required num rid, required num type}) async {
    final hostInfo = await VideoMusicApi.getHostInfo(rid: rid, type: type);

    hotsTags.clear();

    hotsTags.add(HostTagItemInfo("全部", null, null, null));

    hostInfo.data?.elementAt(0).tags?.forEach((item) {
      hotsTags.add(HostTagItemInfo(
          item.tagName, item.highlight, item.isAtten, item.tagId));
    });
  }

  Future<void> initHotsTag() async {
    await loadHotsTage(
        rid: tabItems.elementAt(0).rid, type: tabItems.elementAt(0).type);
  }

  Future<void> loadNewVideoDynamicInfo(
      {required num rid,
      num? tagId,
      required num pn,
      required num ps,
      bool isClear = false}) async {
    if (isClear) {
      videoMusicList.clear();
    }

    late NewVideoDynamicInfo newVideoDynamic;

    if (tagId != null) {
      newVideoDynamic = await VideoMusicApi.getNewVideoDynamicTagInfo(
          rid: rid, tagId: tagId, pn: pn, ps: ps);
    } else {
      newVideoDynamic =
          await VideoMusicApi.getNewVideoDynamicInfo(rid: rid, pn: pn, ps: ps);
    }

    newVideoDynamic.data?.also((it) {
      it.archives?.forEach((element) {
        videoMusicList.add(element);
      });

      videoMusicPageInfo.value = VideoMusicPageInfo(
          count: it.page?.count ?? 0,
          num: it.page?.num ?? 0,
          size: it.page?.size ?? 0);
    });
  }

  Future<void> loadVideoList(
      {required num cateId,
      required num page,
      required num pageSize,
      String? keyword,
      bool isClear = false}) async {
    if (isClear) {
      videoMusicList.clear();
    }

    DateTime currentDate = DateTime.now();
    String formattedDate =
        '${currentDate.year}${currentDate.month.toString().padLeft(2, '0')}${currentDate.day.toString().padLeft(2, '0')}';

    final timeTo = int.parse(formattedDate);
    final timeFrom = timeTo - 7;

    final newListRank = await VideoMusicApi.getNewRankInfo(
        cateId: cateId,
        page: page,
        pageSize: pageSize,
        timeFrom: timeFrom,
        timeTo: timeTo,
        keyword: keyword);

    newListRank.data?.result?.forEach((element) {
      videoMusicList.add(element);
    });
  }

  Future<void> initVideoList() async {
    await loadVideoList(cateId: 28, page: 1, pageSize: 30, isClear: true);
  }

  Future<void> initNewVideoList() async {
    await loadNewVideoDynamicInfo(
        rid: tabItems.elementAt(0).rid, pn: 1, ps: 14);
  }

  Future<void> loadSearchDefaultInfo() async {
    final result = await SearchInfoApi.getSearchDefaultInfo();
    searchDefaultInfo.value = result;
  }
}
