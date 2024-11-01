  import 'package:flutter/material.dart';
  import 'package:video_player/video_player.dart';
  import 'package:google_nav_bar/google_nav_bar.dart';
  import 'package:line_icons/line_icons.dart';

  void main() {
    runApp(const Homepage());
  }

  class Homepage extends StatelessWidget {
    const Homepage({super.key});

    @override
    Widget build(BuildContext context) {
      return const MaterialApp(
        home: BottomAppBarExample(),
      );
    }
  }

  class BottomAppBarExample extends StatefulWidget {
    const BottomAppBarExample({super.key});

    @override
    _BottomAppBarExampleState createState() => _BottomAppBarExampleState();
  }

  class _BottomAppBarExampleState extends State<BottomAppBarExample> {
    int _currentIndex = 0;
    bool isSidebarOpen = false;

    final List<Widget> _pages = [
      const HomePage(),
      const SearchPage(),
      const LocationPage(),
      const ProfilePage(),
    ];

    void toggleSidebar() {
      setState(() {
        isSidebarOpen = !isSidebarOpen;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black, // Set the background of the Scaffold to black
            appBar: AppBar(
            title: const Text('Discover', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.black, // Set AppBar background to black
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white), // Set icon color to white
          onPressed: toggleSidebar,
          ),
        ),
        body: Stack(
  children: [
    // Main content
    _pages[_currentIndex],

    // Sidebar with proper width control
    AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      left: isSidebarOpen ? 0 : -250, // Move sidebar off-screen when closed
      top: 0,
      bottom: 0,
      width: 250,
      child: Container(
        color: Colors.black,
        child: const Column(
          children: [
            ListTile(
              title: Text('Object 1', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.home, color: Colors.white),
            ),
            ListTile(
              title: Text('Object 2', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  ],
),

        bottomNavigationBar: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    child: GNav(
      backgroundColor: Colors.black, // Background color of the navigation bar
      rippleColor: Colors.grey[800]!, // Tab button ripple color when pressed
      hoverColor: Colors.grey[700]!, // Tab button hover color
      haptic: true, // Haptic feedback
      tabBorderRadius: 30,
      tabActiveBorder: Border.all(color: Colors.grey, width: 1), // Border color for active tab
      //tabBorder: Border.all(color: Colors.grey, width: 1), // Border color for inactive tabs
      curve: Curves.easeOutExpo, // Tab animation curves
      duration: const Duration(milliseconds: 900), // Tab animation duration
      gap: 8, // The tab button gap between icon and text
      color: Colors.white, // Unselected icon and text color
      activeColor: Colors.white, // Selected icon and text color
      iconSize: 24, // Tab button icon size
      tabBackgroundColor: Colors.grey[800]!, // Selected tab background color
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15), // Navigation bar padding
      selectedIndex: _currentIndex,
      onTabChange: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      tabs: const [
        GButton(
          icon: LineIcons.home,
          text: 'Home',
        ),
        GButton(
          icon: LineIcons.search,
          text: 'Search',
        ),
        GButton(
          icon: LineIcons.map, // Icon for Location
          text: 'Location',
        ),
        GButton(
          icon: LineIcons.user,
          text: 'Profile',
        ),
      ],
    ),
  ),

      );
    }
  }

  class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    _HomePageState createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
    late VideoPlayerController _controller;

    @override
    void initState() {
      super.initState();
      _controller = VideoPlayerController.asset('assets/background.mp4')
        ..initialize().then((_) {
          setState(() {}); // Ensure the UI is updated when the video is loaded
          _controller.setLooping(true); // Loop the video
          _controller.play(); // Play the video automatically
        });
    }

    @override
    void dispose() {
      _controller.dispose(); // Dispose of the controller when not needed
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Stack(
        children: [
          // Video background
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          // Foreground content
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Welcome', style: TextStyle(fontSize: 28, color: Colors.white)),
                SizedBox(height: 20),
                Text('Discover Your World', style: TextStyle(fontSize: 20, color: Colors.white)),
              ],
            ),
          ),
        ],
      );
    }
  }

  class SearchPage extends StatelessWidget {
    const SearchPage({super.key});

    @override
    Widget build(BuildContext context) {
      return const Center(
          child: Text('Search Page', style: TextStyle(fontSize: 24)));
    }
  }

  class LocationPage extends StatelessWidget {
    const LocationPage({super.key});

    @override
    Widget build(BuildContext context) {
      return const Center(
          child: Text('Location Page', style: TextStyle(fontSize: 24))); // Updated title
    }
  }

  class ProfilePage extends StatelessWidget {
    const ProfilePage({super.key});

    @override
    Widget build(BuildContext context) {
      return const Center(
          child: Text('Profile Page', style: TextStyle(fontSize: 24))); // Updated title
    }
  }
