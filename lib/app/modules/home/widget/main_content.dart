import 'package:kuraimas/app/modules/home/controllers/season_controller.dart';
import 'package:kuraimas/app/modules/home/widget/button_season_group.dart';
import 'package:kuraimas/app/modules/home/widget/recommend_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class MainContent extends StatelessWidget {
  MainContent({Key? key}) : super(key: key);

  final seasonController = Get.put(SeasonController());

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.7,
        maxChildSize: 0.84,
        builder: (context, controller) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Container(
                  width: 48,
                  height: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffDADBDF),
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomScrollView(
                    controller: controller,
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, idx) => ButtonSeasonGroup(),
                          childCount: 1,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 30,
                          ),
                          child: const Text(
                            'Recommend',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: seasonController.obx(
                            (state) => GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 230,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 0,
                                    childAspectRatio: 0.5,
                                  ),
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return RecommendCard(
                                        data: state![index].toMap());
                                  },
                                  itemCount: state?.length,
                                ),
                            onLoading:
                                Center(child: CircularProgressIndicator()),
                            onError: (error) => Center(
                                    child: Text(
                                  'Sorry But We got an error: $error',
                                  textAlign: TextAlign.center,
                                )),
                            onEmpty: Center(
                                child:
                                    Text('Sorry we can' 'show data to you'))),
                      )
                    ],
                  ),
                )),
              ],
            ),
          );
        });
  }
}
