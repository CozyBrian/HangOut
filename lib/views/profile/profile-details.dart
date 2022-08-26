import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hangout/providers/DataProvider.dart';
import 'package:hangout/widgets/Layout/Main-Drawer.dart';
import 'package:hangout/widgets/Layout/MainNavBar.dart';
import 'package:hangout/widgets/profile/profile-avatar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  static const routeName = "/user-profile-screen";

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  final aboutController = TextEditingController();
  File? _pickedImage;

  var _isInit = true;
  final _isOffline = false;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<DataProvider>(context).getUserDetails().then((value) {
        aboutController.text =
            Provider.of<DataProvider>(context, listen: false).user.about!;
      }).then((value) => setState(() {
            _isLoading = false;
          }));
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _pickImage() async {
    final pickedImageFile =
        await _picker.pickImage(source: ImageSource.gallery);

    final File imagefile = File(pickedImageFile!.path);

    setState(() {
      _pickedImage = imagefile;
    });
  }

  void _saveDetails(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<DataProvider>(context).user;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MainNavBar(
              title: "Profile",
              isDark: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: ProfileAvatar(
                      user: user,
                      image: _pickedImage,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.username,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Divider(),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(labelText: "About"),
                          maxLines: 3,
                          minLines: 3,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if ((value as String).isEmpty) {
                              return "Please enter a value.";
                            }
                            return null;
                          },
                          controller: aboutController,
                        ),
                        Container(
                          width: 120,
                          margin: const EdgeInsets.only(top: 28),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 245, 187, 255),
                          ),
                          child: TextButton(
                            child: _isLoading
                                ? const CircularProgressIndicator()
                                : const Text(
                                    "Save",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.purple,
                                    ),
                                  ),
                            onPressed: () {
                              setState(() {
                                _isLoading = true;
                              });
                              Provider.of<DataProvider>(context, listen: false)
                                  .setUserDetails(
                                      aboutController.text.trim(), _pickedImage)
                                  .then((_) {
                                setState(() {
                                  _isLoading = false;
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  backgroundColor: Colors.purple,
                                  content: Text('Details Saved.'),
                                ));
                              }).catchError((e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('Error, Save Failed.'),
                                ));
                                print(e);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
