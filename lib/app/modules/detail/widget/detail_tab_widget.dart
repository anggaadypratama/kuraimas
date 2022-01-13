import 'package:kuraimas/app/modules/detail/widget/list_character_card_widget.dart';
import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';

class DetailTabWidget extends StatelessWidget {
  DetailTabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: const Color(0xFFC6C6C6),
            indicator: ContainerTabIndicator(
                height: 35,
                radius: BorderRadius.circular(100.0),
                color: const Color(0xFFFF7A00)),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            tabs: const [
              Tab(
                text: 'Character',
                iconMargin: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              ),
              Tab(
                text: 'Genre',
                iconMargin: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              ),
              Tab(
                text: 'Watch',
                iconMargin: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: ListCharacterCardWidget(),
                ),
                Text(
                  'masih kosong 2',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                Text(
                  'masih kosong 3',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
