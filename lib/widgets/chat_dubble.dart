import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        message,
        style: GoogleFonts.lato(fontSize: 16.sp, color: Colors.white),
      ),
    );
  }
}
