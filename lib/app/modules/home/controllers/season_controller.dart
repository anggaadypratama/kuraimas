import 'package:kuraimas/app/modules/home/models/button_model.dart';
import 'package:kuraimas/app/modules/home/models/season_model.dart';
import 'package:kuraimas/app/provider/api_provider.dart';
import 'package:kuraimas/app/utils/season.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SeasonController extends GetxController with StateMixin<List<Anime>> {
  ApiProvider services = ApiProvider();
  final seasonName = "".obs;
  DateTime now = DateTime.now();

  var buttonListData = [
    ButtonModel(
            isActive: false,
            icon: FontAwesomeIcons.canadianMapleLeaf,
            title: 'Fall')
        .toMap(),
    ButtonModel(
            isActive: false, icon: FontAwesomeIcons.snowflake, title: 'Winter')
        .toMap(),
    ButtonModel(isActive: false, icon: FontAwesomeIcons.leaf, title: 'Spring')
        .toMap(),
    ButtonModel(isActive: false, icon: FontAwesomeIcons.sun, title: 'Summer')
        .toMap(),
  ].obs;

  SeasonController() {
    var buttonListIndex = buttonListData.indexWhere(
        (i) => i['title'].toString().toLowerCase() == Season.getSeason());

    buttonListData[buttonListIndex].update('isActive', (value) => true);

    var selectedList = buttonListData.where((val) => val['isActive']).toList();
    seasonName.value = selectedList[0]['title'].toString().toLowerCase();
  }

  void reset() {
    buttonListData
        .forEach((element) => element.update("isActive", (value) => false));
  }

  void selectSeason(int i) {
    if (buttonListData[i]['isActive'] == false) {
      reset();
      buttonListData[i].update('isActive', (value) => true);
      var selectedList =
          buttonListData.where((val) => val['isActive']).toList();
      seasonName.value = selectedList[0]['title'].toString().toLowerCase();
      buttonListData.refresh();
    }
  }

  dynamic getSeason(val) => services.fetchSeason(now.year, val).then(
        (response) => {change(response.anime, status: RxStatus.success())},
        onError: (err) {
          change(null, status: RxStatus.error(err.toString()));
        },
      );

  @override
  void onInit() {
    super.onInit();
    getSeason(seasonName.toString());
  }

  @override
  void onReady() {
    super.onReady();

    ever(
      seasonName,
      (value) => {getSeason(value.toString())},
      onDone: () => print('done'),
    );
    update();
  }

  @override
  void onClose() {}
}
