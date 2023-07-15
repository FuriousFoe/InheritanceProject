import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _image;
  var imagePicker;

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
        ),
        elevation: 10,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            MaterialButton(
              color: Colors.blue,
              onPressed: () async {
                XFile image = await imagePicker.pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 50,
                );
                setState(() {
                  _image = File(image.path);
                });
              },
              child: Text('GALLERY'),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () async {
                XFile image = await imagePicker.pickImage(
                    source: ImageSource.camera,
                    imageQuality: 50,
                    preferredCameraDevice: CameraDevice.front);
                setState(() {
                  _image = File(image.path);
                });
              },
              child: Text('CAMERA'),
            ),
            SizedBox(
              height: 20,
              width: 20,
            ),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: _image != null
                  ? Image.file(
                      _image,
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.fitHeight,
                    )
                  : Center(
                      child: Text(
                      "Pick an image from gallery or click",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              clipBehavior: Clip.hardEdge,
            ),
          ],
        ),
      ),
    );
  }
}