import 'package:kuraimas/app/modules/detail/models/detail_model.dart';
import 'package:kuraimas/app/provider/api_provider.dart';
import 'package:get/get.dart';

class DetailController extends GetxController with StateMixin<DetailModel> {
  ApiProvider services = ApiProvider();

  final idPost = 0.obs;

  void setIdPost(int id) {
    idPost.value = id;
  }

  dynamic getDetail(id) => services
          .fetchDetail(id)
          .then((response) => {change(response, status: RxStatus.success())},
              onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (idPost != 0) {
      getDetail(idPost.toString());
    }
  }

  @override
  void onClose() {}
  // void increment() => count.value++;
}
