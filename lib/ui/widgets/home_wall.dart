import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/wall_notifier.dart';
import '../../domain/entities/wall_post.dart';

class HomeWall extends ConsumerWidget {
  const HomeWall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(wallStreamProvider);

    return postsAsync.when(data: (list) {
      if (list.isEmpty) {
        return const Center(
          child: Text('Non ci sono post!'),
        );
      }
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return WallPostWidget(post: list[index]);
        },
      );
    }, error: (err, stack) {
      return Center(
        child: Text(err.toString()),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

class WallPostWidget extends StatelessWidget {
  final WallPost post;

  const WallPostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(post.id),
            Text(post.name),
            Text(post.text),
            Text(post.createdOn.toString()),
          ],
        ),
      ),
    );
  }
}
