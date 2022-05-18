import 'package:flutter_dojo_2022/application/sign_in_notifier.dart';
import 'package:flutter_dojo_2022/data/dto/wall_post.dart';
import 'package:flutter_dojo_2022/domain/entities/user_auth_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../domain/entities/wall_post.dart';
import '../domain/entities/dojo_user.dart';

final firestoreProvider = Provider((ref) {
  return FirebaseFirestore.instance;
});

final wallStreamProvider = StreamProvider<List<WallPost>>((ref) async* {
  final stream = ref
      .watch(firestoreProvider)
      .collection('posts')
      .orderBy('createdOn', descending: true)
      .snapshots();

  await for (final snap in stream) {
    final list = snap.docs.map((doc) {
      final dto = WallPostDTO.fromJson(doc.data());
      return dto.toDomain();
    }).toList();
    yield list;
  }
});

final wallNotifierProvider = StateNotifierProvider<WallNotifier, bool>((ref) {
  return WallNotifier(ref.read);
});

class WallNotifier extends StateNotifier<bool> {
  final Reader read;

  WallNotifier(this.read) : super(true);

  Future<void> addPost(String text) async {
    final userState = await read(dojoUserStreamProvider.future);

    userState.when(authenticated: (dojoUser) async {
      final id = Uuid().v4();

      final post = WallPost(
        id: id,
        userId: dojoUser.userId,
        name: dojoUser.fullName,
        text: text,
        createdOn: DateTime.now(),
      );

      final postDto = WallPostDTO.fromDomain(post);
      final map = postDto.toJson();

      await read(firestoreProvider).collection('posts').doc(id).set(map);
    }, unauthenticated: () {
      //TODO gestire popup
    });
  }
}
