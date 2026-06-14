import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:medical_health_title/core/theme/app_colors.dart';
import 'package:medical_health_title/core/utils/onboarding_gradient_background.dart';
import '../../../core/theme/app_icons.dart';
import '../../homepage/viewmodel/homepage_viewmodel.dart';


class ChatMessage {
  final String text;
  final bool isMe;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isMe,
    required this.timestamp,
  });
}

class FifthpageView extends StatefulWidget {
  const FifthpageView({super.key});

  @override
  State<FifthpageView> createState() => _FifthpageViewState();
}
class _FifthpageViewState extends State<FifthpageView> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();

  final Color primaryColor = AppColors.neutral;
  final Color backgroundColor = AppColors.secondary ;


  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _messages.insert(0, ChatMessage(
        text: _controller.text.trim(),
        isMe: true,
        timestamp: DateTime.now(),
      ));
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _buildAppBar(),
      body: OnboardingGradientBackground(child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) => _buildMessageBubble(_messages[index]),
            ),
          ),
          _buildInputArea(),
        ],
      ),),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    final medicalHealth = Get.find<HomepageViewmodel>();
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0.5,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
        onPressed: (){
          medicalHealth.setPage(1);
        },
      ),
      title: Row(
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(AppIcons.doctor2 ,

            ) ,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Dr. M Khoshbakht",
                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Online",
                style: TextStyle(color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(icon: const Icon(Icons.videocam_outlined, color: Colors.black), onPressed: () {
          medicalHealth.setPage(5);
        }
        ),
        IconButton(icon: const Icon(Icons.call_outlined, color: Colors.black), onPressed: () {
          medicalHealth.setPage(5);
        }),
      ],
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!message.isMe) ...[
            const CircleAvatar(radius: 14, backgroundColor:AppColors.blue1),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: message.isMe ? AppColors.secondary : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(message.isMe ? 20 : 0),
                  bottomRight: Radius.circular(message.isMe ? 0 : 20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: message.isMe ? AppColors.blue2 : Colors.black87,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          if (message.isMe) ...[
            const SizedBox(width: 8),
            Icon(Icons.check_circle, size: 14, color: primaryColor),
          ],
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -5))
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: "Type a message...",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    suffixIcon: Icon(Icons.attach_file, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: _sendMessage,
              child: CircleAvatar(
                backgroundColor: primaryColor,
                child: const Icon(Icons.send, color: AppColors.blue2, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

