import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:friends_app/controllers/friend_controller.dart';
import 'package:friends_app/models/friend_list_model.dart';
import 'package:friends_app/views/widgets/big_text.dart';
import 'package:get/get.dart';

class FriendScreen extends StatelessWidget {
  final Result? friend;
  final FriendController controller = Get.put(FriendController());
   FriendScreen({super.key, this.friend});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${friend?.name?.first ?? ''} ${friend?.name?.last ?? ''}'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: Get.height * 0.58,
          width: Get.width * 0.8,
          child: Card(
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15) ),
            // ),
            child: Column(
              children: [
                CachedNetworkImage(
                  height: 250,
                  width: Get.width * 0.8,
                  // width: double.infinity,
                  fit: BoxFit.fill,
                  imageUrl: friend?.picture?.large ?? '',
                  progressIndicatorBuilder:
                      (context, url, downloadProgress) => Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_city),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: BigText(
                            color: Colors.white,
                            textSize: 16,
                            text:
                            '${friend?.location?.street?.number ?? ''}, ${friend?.location?.street?.name ?? ''},${friend?.location?.city ?? ''} , ${friend?.location?.state ?? ''} , ${friend?.location?.country ?? ''} ',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () =>  controller.openGmailApp(Uri.parse('mailto:${friend?.email ?? ''}')),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.email_sharp),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: BigText(
                              text: friend?.email ?? '',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.phone),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: BigText(text: friend?.phone ?? '',color: Colors.white,),
                        )
                      ],
                    )
                  ],
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
