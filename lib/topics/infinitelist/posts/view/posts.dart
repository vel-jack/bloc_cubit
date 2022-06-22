import 'package:bloc_cubit/topics/infinitelist/posts/bloc/post_bloc.dart';
import 'package:bloc_cubit/topics/infinitelist/posts/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String title = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider<PostBloc>(
      create: (context) =>
          PostBloc(httpClient: http.Client())..add(PostFetched()),
      child: _MyPostPageApp(title: title),
    );
  }
}

class _MyPostPageApp extends StatefulWidget {
  const _MyPostPageApp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<_MyPostPageApp> createState() => _MyPostPageAppState();
}

class _MyPostPageAppState extends State<_MyPostPageApp> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.failure:
              return const Center(child: Text('Failed to fetch Post'));
            case PostStatus.success:
              if (state.posts.isEmpty) {
                return const Center(child: Text('No post found'));
              } else {
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.hasReachedMax
                      ? state.posts.length
                      : state.posts.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return index >= state.posts.length
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : PostTile(post: state.posts[index]);
                  },
                  controller: _scrollController,
                );
              }
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void _onScroll() {
    if (isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
