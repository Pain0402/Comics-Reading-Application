import 'package:mycomicsapp/features/auth/presentation/providers/auth_providers.dart';
import 'package:mycomicsapp/features/home/data/repositories/story_repository_impl.dart';
import 'package:mycomicsapp/features/home/domain/entities/story.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provides the StoryRepository instance.
final storyRepositoryProvider = Provider<StoryRepository>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return StoryRepository(client);
});

// Provider to fetch the list of all stories.
final allStoriesProvider = FutureProvider<List<Story>>((ref) async {
  final repository = ref.watch(storyRepositoryProvider);
  return repository.getAllStories();
});

