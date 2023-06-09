import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_windows/image_picker_windows.dart';
import 'dart:io';
class SelectImage extends StatefulWidget {
  const SelectImage({Key? key}) : super(key: key);

  @override
  State<SelectImage> createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  // pickImage() async {
  //   await ImagePicker().pickImage(source: ImageSource.gallery);
  // }

  File? _image;

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile!.path);
      } else {
        print('No image selected.');
      }
    });
  }

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            Column(
              children: [
                MaterialButton(
                  onPressed: () {
                    getImageFromGallery();

                  },
                  child: Container(
                    height: 40,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xff92E3A9),
                    ),
                    child: const Center(
                        child: Text(
                          "Select Image",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff405565)),
                        )),
                  ),
                ),
                SizedBox(
                  width: 380,
                  height: 340,
                  child: _image == null
                      ? Image.asset("assets/select.png", fit: BoxFit.fill,
                        )
                      : Image.file(_image!),
                ),
                MaterialButton(
                  onPressed: () {

                  },
                  child: Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xff92E3A9),
                    ),
                    child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff405565)),
                        )),
                  ),
                ),
                SizedBox(height: 10,),
                MaterialButton(
                  onPressed: () {

                  },
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xff92E3A9),
                    ),
                    child: const Center(
                        child: Text(
                          "Take Attendance",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff405565)),
                        )),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
// Image.asset("assets/select.png",fit: BoxFit.fill,),