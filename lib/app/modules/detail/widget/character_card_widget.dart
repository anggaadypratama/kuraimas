import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget(
      {Key? key,
      required this.characterName,
      required this.characterImage,
      required this.characterVA})
      : super(key: key);

  final String characterName;
  final String characterImage;
  final String characterVA;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: characterImage,
              width: 61,
              height: 89,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                  child: Text(
                    characterName.length >= 20
                        ? characterName.substring(0, 20) + '...'
                        : characterName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                  child: Text(
                    characterVA.length >= 25
                        ? characterVA.substring(0, 25) + '...'
                        : characterVA,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xFF9E9EA7),
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
