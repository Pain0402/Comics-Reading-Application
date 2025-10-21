import 'package:flutter/foundation.dart';
import 'package:mycomicsapp/features/auth/domain/entities/profile.dart';
import 'package:mycomicsapp/features/home/domain/entities/story.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Repository for handling story-related data operations.
class StoryRepository {
  final SupabaseClient _client;
  StoryRepository(this._client);

  /// Fetches all stories, ordered by the most recently updated.
  Future<List<Story>> getAllStories() async {
    try {
      final data = await _client
          .from('Story')
          .select('*, profiles:author_id(*)') // Join with profiles table
          .order('updated_at', ascending: false);
      return data.map((item) => Story.fromMap(item)).toList();
    } catch (e) {
      // In a real app, use a proper logging system.
      debugPrint('Error fetching stories: $e');
      rethrow;
    }
  }

  /// Fetches the profile of the current user.
  Future<Profile?> getUserProfile() async {
    try {
      final user = _client.auth.currentUser;
      if (user == null) return null;

      final data =
          await _client.from('profiles').select().eq('id', user.id).single();
      return Profile.fromMap(data);
    } catch (e) {
      debugPrint('Error fetching profile: $e');
      // Return null if not found or on error.
      return null;
    }
  }
}

