import 'package:kuraimas/app/theme/colors.dart';
import 'package:kuraimas/app/utils/get_time.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeNav extends StatelessWidget {
  const HomeNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good ${Time.greetings()}",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        height: 1.3,
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'What would like you to watch ?',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontFamily: 'Poppins'),
                  ),
                ],
              ),
              // Image.asset('assets/images/logo.png')
              CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    'https://www.ledgerinsights.com/wp-content/uploads/2021/12/adidas-nft-bored-ape.jpg',
                imageBuilder: (context, imageProvider) => Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                ),
              )
            ],
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
                  child: Row(
                    children: [
                      IconButton(
                          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                          icon: FaIcon(
                            FontAwesomeIcons.search,
                            color: colors[2].color,
                            size: 18,
                          ),
                          onPressed: () {}),
                      Text(
                        'Search anime...',
                        style: TextStyle(color: colors[2].color),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
