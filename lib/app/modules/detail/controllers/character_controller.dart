import 'package:kuraimas/app/modules/detail/models/characters_model.dart';
import 'package:kuraimas/app/provider/api_provider.dart';
import 'package:get/get.dart';

class CharacterController extends GetxController
    with StateMixin<CharactersModel> {
  ApiProvider services = ApiProvider();

  final idCharacters = 0.obs;

  void setIdCharacters(int id) {
    idCharacters.value = id;
  }

  dynamic getCharacters(id) => services
          .fetchCharacter(id)
          .then((response) => {change(response, status: RxStatus.success())},
              onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });

  // final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (idCharacters != 0) {
      getCharacters(idCharacters.toString());
    }
  }

  @override
  void onClose() {}
  // void increment() => count.value++;
}
