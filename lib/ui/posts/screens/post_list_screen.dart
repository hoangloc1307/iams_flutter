import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/ui/posts/view_model/post_view_model.dart';

class PostListScreen extends ConsumerStatefulWidget {
  const PostListScreen({super.key});

  @override
  ConsumerState<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends ConsumerState<PostListScreen> {
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    // load lần đầu
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(postViewModelProvider.notifier).loadInitial();
    });

    _scroll.addListener(() {
      final vm = ref.read(postViewModelProvider);
      if (!vm.hasMore) return;
      if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 200) {
        ref.read(postViewModelProvider.notifier).fetchMore();
      }
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postViewModelProvider);
    final vm = ref.read(postViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: RefreshIndicator(
        onRefresh: vm.refresh,
        child: Builder(
          builder: (_) {
            if (state.error != null && state.items.isEmpty) {
              return ListView(
                children: [
                  const SizedBox(height: 120),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          state.error!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.red),
                        ),
                        const SizedBox(height: 8),
                        FilledButton(
                          onPressed: vm.refresh,
                          child: const Text('Thử lại'),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            if (state.loading && state.items.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.separated(
              controller: _scroll,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.items.length + (state.hasMore ? 1 : 0),
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                if (index >= state.items.length) {
                  // footer loading khi còn dữ liệu
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final p = state.items[index];
                return ListTile(
                  leading: CircleAvatar(child: Text('${p.id}')),
                  title: Text(
                    p.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    p.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    // TODO: điều hướng sang chi tiết nếu bạn muốn
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
