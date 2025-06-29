import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppButton extends StatefulWidget {
  const WhatsAppButton({super.key});

  @override
  State<WhatsAppButton> createState() => _WhatsAppButtonState();
}

class _WhatsAppButtonState extends State<WhatsAppButton> {
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        onTap: () async {
          final phoneNumber = "+923125915989";
          final message =
              "Hi Hammad! I'm interested in working together on a Flutter project.";
          final whatsappUrl =
              "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";

          final url = Uri.parse(whatsappUrl);
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          }
        },
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: Duration(milliseconds: 200),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            decoration: BoxDecoration(
              color: Color(0xFF25D366), // WhatsApp green color
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF25D366).withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
                // Enhanced glow on hover
                if (_isHovered)
                  BoxShadow(
                    color: Color(0xFF25D366).withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 20,
                    offset: Offset(0, 0),
                  ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/icons/whatsapp.png',
                  width: 28,
                  height: 28,
                ),
                SizedBox(width: 12),
                Text(
                  'Let\'s Chat on WhatsApp',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
