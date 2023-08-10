import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:friends_app/models/friend_list_model.dart';
import 'package:friends_app/views/widgets/big_text.dart';

class FriendScreen extends StatelessWidget {
  final Result? friend;
  const FriendScreen({super.key, this.friend});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${friend?.name?.first ?? ''} ${friend?.name?.last ?? ''}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CachedNetworkImage(
            height: 200,
            width: double.infinity,
            fit: BoxFit.contain,
            imageUrl: friend?.picture?.large ?? '',
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          SizedBox(height: 20,),
          BigText(text: '${friend?.location?.street?.number ?? ''}, ${friend?.location?.street?.name ?? ''}')
        ],
      ),
    );
  }
}
