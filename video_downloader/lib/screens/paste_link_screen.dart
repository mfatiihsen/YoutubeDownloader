import 'package:flutter/material.dart';
import 'package:video_downloader/services/downloader.dart';

class PastLinkScreen extends StatefulWidget {
  const PastLinkScreen({Key? key}) : super(key: key);

  @override
  State<PastLinkScreen> createState() => _PastLinkScreenState();
}

class _PastLinkScreenState extends State<PastLinkScreen> {
  TextEditingController _textController = TextEditingController();
  Download? donwload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            TextFormField(
              controller: _textController,
              style: const TextStyle(color: Colors.black, fontSize: 18),
              decoration: InputDecoration(
                  labelText: "Youtube Video Linki",
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIconColor: Colors.grey,
                  suffix: IconButton(
                    onPressed: () {
                      clearTextInput();
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                  )),
            ),
            GestureDetector(
              onTap: () {
                if (_textController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Link Girilmedi")));
                } else {
                  // donwload the video
                  print("Video indiriliyor");
                  Download().downloadVideo(_textController.text.trim(),
                      _textController.text.trim() + " indiriliyor...");
                }
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Video İndir",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text("Bu alana reklam gelecektir."),
              ),
            ),
          ],
        ),
      ),
    );
  }

  clearTextInput() {
    _textController.clear();
  }
}
