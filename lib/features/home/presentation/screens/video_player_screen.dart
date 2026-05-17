import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerScreen extends ConsumerStatefulWidget {
  final int animeId;
  final String animeTitle;
  final String youtubeId;

  const VideoPlayerScreen({
    super.key,
    required this.animeId,
    required this.animeTitle,
    required this.youtubeId,
  });

  @override
  ConsumerState<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends ConsumerState<VideoPlayerScreen> {
  late final YoutubePlayerController _controller;
  bool _hasError = false;
  bool _isPlayerReady = false;
  Timer? _loadingTimeoutTimer;
  StreamSubscription? _videoStateSubscription;
  bool Function(Object, StackTrace)? _originalOnError;

  @override
  void initState() {
    super.initState();
    // Configure system interface for immersive viewing
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
    ]);

    // Intercept uncaught platform errors as an extra safety measure
    _originalOnError = PlatformDispatcher.instance.onError;
    PlatformDispatcher.instance.onError = (error, stack) {
      if (error.toString().contains('TimeoutException') || 
          error.toString().contains('YouTube player failed to initialize')) {
        _handleLoadError();
        return true; // Mark as handled and swallow
      }
      if (_originalOnError != null) {
        return _originalOnError!(error, stack);
      }
      return false;
    };

    if (widget.youtubeId.isEmpty) {
      _hasError = true;
    } else {
      // Initialize controller with high performance parameters & autoplay enabled
      _controller = YoutubePlayerController(
        params: const YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
          mute: false,
          loop: false,
          enableCaption: false,
          origin: 'https://www.youtube-nocookie.com',
        ),
      );

      // Load video immediately to trigger autoplay
      _controller.loadVideoById(videoId: widget.youtubeId);

      // Listen to player stream to detect when it's ready & active
      try {
        _videoStateSubscription = _controller.videoStateStream.listen(
          (state) {
            if (mounted && !_isPlayerReady) {
              setState(() {
                _isPlayerReady = true;
              });
              _loadingTimeoutTimer?.cancel();
            }
          },
          onError: (err) {
            _handleLoadError();
          },
        );
      } catch (_) {
        _handleLoadError();
      }

      // Start a premium 7-second loading fallback timer
      _loadingTimeoutTimer = Timer(const Duration(seconds: 7), () {
        if (mounted && !_isPlayerReady) {
          _handleLoadError();
        }
      });
    }
  }

  void _handleLoadError() {
    if (mounted) {
      setState(() {
        _hasError = true;
      });
      _loadingTimeoutTimer?.cancel();
      _videoStateSubscription?.cancel();
    }
  }

  @override
  void dispose() {
    // Restore default system UI and screen orientation
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Restore original platform error handler
    PlatformDispatcher.instance.onError = _originalOnError;

    _loadingTimeoutTimer?.cancel();
    _videoStateSubscription?.cancel();

    if (widget.youtubeId.isNotEmpty) {
      _controller.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    if (_hasError) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Cinema Ambient Glow
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      scheme.primary.withOpacity(0.12),
                      Colors.black,
                    ],
                    radius: 1.2,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: scheme.error.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.error_outline_rounded,
                        color: scheme.error, size: 40),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Trailer Tidak Tersedia',
                    style: GoogleFonts.lexend(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: scheme.onErrorContainer,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Maaf, video promosi untuk anime ini belum tersedia.',
                    style: GoogleFonts.lexend(
                      fontSize: 12,
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_rounded),
                    label: const Text('Kembali'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: scheme.primary,
                      side: BorderSide(color: scheme.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return YoutubePlayerScaffold(
      controller: _controller,
      aspectRatio: 16 / 9,
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              // Cinema Ambient Glow
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        scheme.primary.withOpacity(0.12),
                        Colors.black,
                      ],
                      radius: 1.2,
                ),
              ),
            ),
          ),

          // Main video content / player
          Center(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: scheme.primary.withOpacity(0.15),
                      blurRadius: 30,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    player,
                    if (!_isPlayerReady)
                      Positioned.fill(
                        child: Container(
                          color: Colors.black,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  color: scheme.primary,
                                  strokeWidth: 3,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Menghubungkan ke YouTube...',
                                  style: GoogleFonts.lexend(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ).animate().fadeIn(duration: 500.ms).scale(begin: const Offset(0.95, 0.95)),
          ),

          // Header Overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black87,
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    IconButton.filledTonal(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white12,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.animeTitle,
                            style: GoogleFonts.lexend(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Official Promotional Video',
                            style: GoogleFonts.lexend(
                              fontSize: 11,
                              color: Colors.white54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ).animate().fadeIn(delay: 200.ms),
        ],
      ),
    );
  },
);
}
}
