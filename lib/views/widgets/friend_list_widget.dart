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
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                imageUrl: friend.picture?.thumbnail ?? '',
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                    text:
                        '${friend.name?.first ?? ''} ${friend.name?.last ?? ''}'),
                SizedBox(
                  height: 10,
                ),
                SmallText(text: friend.location?.country ?? ''),
              ],
            ),
            Spacer(),
            Icon(
              Icons.double_arrow,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
