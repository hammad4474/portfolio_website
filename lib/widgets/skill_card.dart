import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkillCard extends StatefulWidget {
  final String iconPath;
  final String skillName;
  final double? width;
  final double? height;

  const SkillCard({
    super.key,
    required this.iconPath,
    required this.skillName,
    this.width,
    this.height,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> with TickerProviderStateMixin {
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();

    // Glow animation controller
    _glowController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );

    // Glow animation for border highlight
    _glowAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _glowController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });

    if (isHovered) {
      _glowController.repeat(reverse: true);
    } else {
      _glowController.stop();
      _glowController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedBuilder(
        animation: _glowAnimation,
        builder: (context, child) {
          return Container(
            width: widget.width ?? 120,
            height: widget.height ?? 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                // Base shadow
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
                // Purple glow shadow when hovered - subtle
                if (_isHovered) ...[
                  BoxShadow(
                    color: Color(0xff6726f2).withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 12,
                    offset: Offset(0, 0),
                  ),
                  BoxShadow(
                    color: Color(0xff6726f2)
                        .withOpacity(0.1 + 0.15 * _glowAnimation.value),
                    spreadRadius: 3,
                    blurRadius: 20,
                    offset: Offset(0, 0),
                  ),
                ],
              ],
              border: Border.all(
                color: _isHovered
                    ? Color(0xff6726f2)
                        .withOpacity(0.3 + 0.2 * _glowAnimation.value)
                    : Colors.grey.withOpacity(0.2),
                width: _isHovered ? 2 : 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Skill Icon with enhanced hover animation
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOutBack,
                  transform: _isHovered
                      ? (Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..scale(1.1)
                        ..rotateZ(0.05))
                      : Matrix4.identity(),
                  child: widget.iconPath.endsWith('.svg')
                      ? SvgPicture.asset(
                          widget.iconPath,
                          width: 45,
                          height: 45,
                          placeholderBuilder: (context) => Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.code,
                              color: Colors.grey[600],
                              size: 28,
                            ),
                          ),
                        )
                      : Image.asset(
                          widget.iconPath,
                          width: 45,
                          height: 45,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.code,
                                color: Colors.grey[600],
                                size: 28,
                              ),
                            );
                          },
                        ),
                ),

                SizedBox(height: 14),

                // Skill Name with enhanced color animation on hover
                AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 300),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: _isHovered ? Color(0xff6726f2) : Colors.black87,
                    shadows: _isHovered
                        ? [
                            Shadow(
                              color: Color(0xff6726f2).withOpacity(0.3),
                              offset: Offset(0, 1),
                              blurRadius: 2,
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    widget.skillName,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
