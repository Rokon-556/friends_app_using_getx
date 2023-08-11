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
          height: Get.height * 0.52,
          width: Get.width * 0.8,
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  child: CachedNetworkImage(
                    height: 250,
                    width: Get.width * 0.8,
                    fit: BoxFit.fill,
                    imageUrl: friend?.picture?.large ?? '',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress,color: Colors.white,),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_city,size: 16,),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: BigText(
                            color: Colors.white,
                            textSize: 14,
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
                      onTap: () =>  controller.openGmailApp(friend?.email ?? ''),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.email_sharp,size: 16,),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: BigText(
                              text: friend?.email ?? '',
                              color: Colors.white,
                              textSize: 14,
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
                        const Icon(Icons.phone,size: 16,),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: BigText(text: friend?.phone ?? '',color: Colors.white,textSize: 14,),
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
