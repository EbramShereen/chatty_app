import 'package:chatty_app/helper/constants.dart';
import 'package:chatty_app/helper/strings.dart';
import 'package:chatty_app/models/chat_model.dart';
import 'package:chatty_app/views/register/login.dart';
import 'package:chatty_app/widgets/chat/chat_bubble_reciever.dart';
import 'package:chatty_app/widgets/chat/chat_bubble_sender.dart';
import 'package:chatty_app/widgets/chat/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_loading_indicator/wave_progress.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static String id = 'ChatScreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

CollectionReference messages = FirebaseFirestore.instance.collection(kMessage);
TextEditingController controller = TextEditingController();
ScrollController _controller = ScrollController();

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('date', descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List<ChatModel> messagesList = [];
          for (var doc in snapshot.data!.docs) {
            messagesList.add(
              ChatModel.fromJson(doc.data() as Map<String, dynamic>),
            );
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: const Image(
                image: AssetImage(logo),
                width: 100,
              ),
              centerTitle: true,
              actions: [
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
                  child: const Text(
                    'logout',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                )
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messagesList.length,
                    controller: _controller,
                    reverse: true,
                    itemBuilder: (context, index) =>
                        messagesList[index].id == email
                            ? ChatBubbleSender(
                                model: messagesList[index],
                              )
                            : ChatBubbleReciever(model: messagesList[index]),
                  ),
                ),
                Container(
                  color: const Color(0xFFDDDDDD),
                  child: CustomTextField(
                    hintText: 'Send Message',
                    controller: controller,
                    onSubmitted: (value) {
                      messages.add({
                        'message': value,
                        'id': email,
                        'date': DateTime.now(),
                      });
                      controller.clear();
                      _controller.animateTo(0,
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 300));
                    },
                    suffixIcon: const Icon(
                      Icons.send,
                      color: kPrimaryColor,
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Stack(
              children: [
                Positioned(
                  top: 250,
                  left: 50,
                  child: WaveProgress(
                    borderSize: 5.0,
                    size: 300,
                    borderColor: kPrimaryColor,
                    foregroundWaveColor: Colors.greenAccent,
                    backgroundWaveColor: Colors.blueAccent,
                    progress: 20, // [0-100]
                    innerPadding: 5, // padding between border and waves
                  ),
                ),
                const Positioned(
                  top: 390,
                  left: 80,
                  child: Text(
                    'Sorry, Please wait... 😢',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Column(
              children: [
                const Gap(180),
                Center(child: Image.asset(errorScreen)),
                const Gap(50),
                const Text(
                  'Page Not Found',
                  style: TextStyle(fontSize: 40),
                ),
                const Gap(20),
                const Text(
                  'Check your network connection!!!',
                  style: TextStyle(fontSize: 15),
                ),
                const Gap(8),
                const Text(
                  'Or try to login again',
                  style: TextStyle(fontSize: 15),
                ),
                const Gap(15),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
