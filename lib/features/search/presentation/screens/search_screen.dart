import 'package:mycomicsapp/features/home/presentation/widgets/story_card.dart';
import 'package:mycomicsapp/features/search/presentation/providers/search_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mycomicsapp/features/search/presentation/widgets/filter_bottom_sheet.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResults = ref.watch(searchResultsProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final theme = Theme.of(context); // Lấy theme để dùng màu sắc chuẩn

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // Loại bỏ padding mặc định của title để chúng ta tự căn chỉnh
        titleSpacing: 16,
        // Thay vì chỉ dùng TextField, ta dùng Row để chứa cả Thanh tìm kiếm và Nút lọc
        title: Row(
          children: [
            // --- 1. THANH TÌM KIẾM ---
            Expanded(
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  // Màu nền xám tối (hoặc sáng tùy theme)
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(
                    24,
                  ), // Bo tròn hình viên thuốc
                ),
                child: TextField(
                  autofocus:
                      false, // Tắt autofocus để tránh bàn phím nhảy lên ngay lập tức
                  textAlignVertical: TextAlignVertical.center,
                  style: theme.textTheme.bodyLarge,
                  decoration: InputDecoration(
                    hintText: 'Search for comics...',
                    hintStyle: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    suffixIcon: searchQuery.isNotEmpty
                        ? IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            onPressed: () =>
                                ref.read(searchQueryProvider.notifier).state =
                                    '',
                          )
                        : null,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onChanged: (query) {
                    ref.read(searchQueryProvider.notifier).state = query;
                  },
                ),
              ),
            ),

            const SizedBox(
              width: 12,
            ), // Khoảng cách giữa thanh tìm kiếm và nút lọc
            // --- 2. NÚT LỌC (FILTER) RIÊNG BIỆT ---
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color:
                    theme.colorScheme.surfaceContainerHighest, // Cùng màu nền
                borderRadius: BorderRadius.circular(24), // Hình tròn
              ),
              child: IconButton(
                icon: Icon(
                  Icons.tune, // Icon điều chỉnh/lọc
                  color: theme.colorScheme.onSurface,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    // Thêm các thuộc tính này để BottomSheet đẹp hơn
                    backgroundColor: theme.colorScheme.surface,
                    showDragHandle: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (_) => const FilterBottomSheet(),
                  );
                },
              ),
            ),
          ],
        ),
        // Đã chuyển nút lọc vào title nên không cần actions nữa
        actions: [],
      ),
      body: searchResults.when(
        data: (stories) {
          // Cập nhật thông báo
          if (searchQuery.isEmpty &&
              ref.watch(filterOptionsProvider).genreIds.isEmpty) {
            return const Center(
              child: Text('Start searching for your favorite comics.'),
            );
          }
          if (stories.isEmpty) {
            return const Center(child: Text('No results found.'));
          }
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.65,
            ),
            itemCount: stories.length,
            itemBuilder: (context, index) {
              final story = stories[index];
              return StoryCard(story: story);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('An error occurred: $error')),
      ),
    );
  }
}
