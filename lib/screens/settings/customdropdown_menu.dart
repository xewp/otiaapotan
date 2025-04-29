import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  final bool isVisible;
  final Function(String) onSelect;

  const CustomDropdownMenu({
    super.key,
    required this.isVisible,
    required this.onSelect,
  });

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void didUpdateWidget(CustomDropdownMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 15,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Column(
            children: [
              _buildImageCircle('assets/images/one.png', '1'),
              const SizedBox(height: 15),
              _buildImageCircle('assets/images/two.png', '2'),
              const SizedBox(height: 15),
              _buildImageCircle('assets/images/three.png', '3'),
              const SizedBox(height: 15),
              _buildImageCircle('assets/images/four.png', '4'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCircle(String imagePath, String label) {
    return GestureDetector(
      onTap: () {
        widget.onSelect(label);
      },
      child: ClipOval(
        child: Image.asset(
          imagePath,
          width: 55,
          height: 55,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
