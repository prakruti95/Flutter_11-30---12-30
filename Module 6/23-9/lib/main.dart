import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: const MyApp(),
    ),
  );
}

/// Provider class to manage Instagram Post state (Like state & count)
class PostProvider extends ChangeNotifier {
  bool _isLiked = false;
  int _likeCount = 124;
  bool _showHeartAnimation = false;

  bool get isLiked => _isLiked;
  int get likeCount => _likeCount;
  bool get showHeartAnimation => _showHeartAnimation;

  /// Toggles like state on heart button tap
  void toggleLike() {
    _isLiked = !_isLiked;
    if (_isLiked) {
      _likeCount++;
    } else {
      _likeCount--;
    }
    notifyListeners();
  }

  /// Triggered on image double tap (Instagram rule: double tap always likes)
  void doubleTapLike() {
    if (!_isLiked) {
      _isLiked = true;
      _likeCount++;
    }

    // Trigger big heart overlay animation
    _showHeartAnimation = true;
    notifyListeners();

    // Reset animation state after short delay
    Future.delayed(const Duration(milliseconds: 800), () {
      _showHeartAnimation = false;
      notifyListeners();
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Like Provider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InstagramPostScreen(),
    );
  }
}

class InstagramPostScreen extends StatelessWidget {
  const InstagramPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Instagram Like Demo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const InstagramPostCard(),
          ],
        ),
      ),
    );
  }
}

class InstagramPostCard extends StatelessWidget {
  const InstagramPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Post Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.deepPurple,
                  child: Text(
                    'FL',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'flutter_dev',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'San Francisco, CA',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_vert),
              ],
            ),
          ),

          // 2. Post Image (Double Tap to Like)
          GestureDetector(
            onDoubleTap: () {
              context.read<PostProvider>().doubleTapLike();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Image Network or Fallback Container
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1682687220063-4742bd7fd538?auto=format&fit=crop&w=800&q=80',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback placeholder widget if network image fails
                      return Container(
                        color: Colors.deepPurple[100],
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.photo, size: 80, color: Colors.deepPurple),
                            SizedBox(height: 8),
                            Text('Instagram Photo Placeholder'),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Double Tap Heart Overlay Animation
                Consumer<PostProvider>(
                  builder: (context, provider, child) {
                    if (!provider.showHeartAnimation) {
                      return const SizedBox.shrink();
                    }
                    return AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: provider.showHeartAnimation ? 1.0 : 0.0,
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 300),
                        scale: provider.showHeartAnimation ? 1.2 : 0.5,
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 100,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // 3. Post Action Buttons (Like, Comment, Share, Bookmark)
          Row(
            children: [
              // Like Button using Consumer to rebuild only this button on state change
              Consumer<PostProvider>(
                builder: (context, provider, child) {
                  return IconButton(
                    icon: Icon(
                      provider.isLiked
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: provider.isLiked ? Colors.red : Colors.black,
                      size: 28,
                    ),
                    onPressed: () {
                      context.read<PostProvider>().toggleLike();
                    },
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.chat_bubble_outline, size: 26),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.send_outlined, size: 26),
                onPressed: () {},
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.bookmark_outline, size: 26),
                onPressed: () {},
              ),
            ],
          ),

          // 4. Like Counter Display
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Consumer<PostProvider>(
              builder: (context, provider, child) {
                return Text(
                  '${provider.likeCount} likes',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                );
              },
            ),
          ),

          // 5. Post Caption
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'flutter_dev ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'Building beautiful UI with Provider state management! Double tap the photo or press the heart button to like. ❤️ #flutter #provider',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
