import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appwrite_demo/utils/auth/auth_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<AuthState>(builder: (context, state, child) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: InkWell(
                onTap: () => _uploadPic(context),
                child: CircleAvatar(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('Username'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {},
              child: Text('Log Out'),
            ),
          )
        ],
      );
    }));
  }

  _uploadPic(BuildContext context) async {
    PickedFile file = await ImagePicker().getImage(source: ImageSource.gallery);
    if (file != null) {
      final upfile = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
      AuthState state = context.read<AuthState>();
      Response res = await state.storage.createFile(
          file: upfile, read: ["*"], write: ["user:${state.user.id}"]);
      if (res.statusCode == 201) {
        String id = res.data["\$id"];
        final preview = state.storage.getFilePreview(fileId: id);
        if (state.prefs.pic != null)
          state.storage.deleteFile(fileId: state.prefs.pic);
        state.updatePrefs({"pic": id, "profile_url": preview});
      }
    }
  }
}
