import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:friends_app/models/friend_list_model.dart';
import 'package:friends_app/views/widgets/big_text.dart';
import 'package:friends_app/views/widgets/small_text.dart';

class FriendListWidget extends StatelessWidget {
  final Result friend;
  const FriendListWidget({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                height: 80,
                width: 80,
                fit: BoxFit.cover,
                imageUrl: friend.picture?.thumbnail ?? '',
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator(value: downloadProgress.progress,color: Colors.white,)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: BigText(
                align: TextAlign.center,
                color: Colors.white,
                  text:
                      '${friend.name?.first ?? ''} ${friend.name?.last ?? ''}\n'),
            ),
            const SizedBox(
              height: 10,
            ),
            SmallText(text: friend.location?.country ?? ''),
          ],
        ),
      ),
    );
  }
}
