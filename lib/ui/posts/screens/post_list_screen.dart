import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/ui/posts/screens/widgets/post_item.dart';
import 'package:iams_fe/ui/posts/view_model/post_view_model.dart';

class PostListScreen extends ConsumerStatefulWidget {
  const PostListScreen({super.key});

  @override
  ConsumerState<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends ConsumerState<PostListScreen> {
  @override
  Widget build(BuildContext context) {
    final postState = ref.watch(postViewModelProvider);

    return Scaffold(
      body: postState.when(
        data: (state) {
          if (state.isLoading) {
            return Text('Loading...');
          }

          if (state.errorMessage != null) {
            return Text('${state.errorMessage}');
          }

          if (state.posts.isEmpty) {
            return Text('Empty');
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.8,
            ),
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              final post = state.posts[index];
              return PostItem(post: post);
            },
          );
        },
        loading: () => const Text('Loading...'),
        error: (error, stack) => Center(child: Text(error.toString())),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(postViewModelProvider.notifier)
              .addPost(userId: 1, title: 'Test Add', body: 'Test Add Body');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
