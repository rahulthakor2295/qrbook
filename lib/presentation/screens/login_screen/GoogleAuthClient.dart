import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as ga;
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:http/io_client.dart';
import 'package:path_provider/path_provider.dart';


class GoogleHttpClient extends IOClient {
  Map<String, String> _headers;

  GoogleHttpClient(this._headers) : super();

  @override
  Future<IOStreamedResponse> send(http.BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<http.Response> head(Uri url, {Map<String, String>? headers}) =>
      super.head(url, headers: headers?..addAll(_headers));
}

// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:http/http.dart' as http;
//
// import 'package:flutter/material.dart';
// import 'package:googleapis/drive/v3.dart' as ga;
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:googleapis_auth/auth_io.dart' as auth;
// import 'package:http/src/client.dart';
// import 'package:path/path.dart' as path;
// import 'package:file_picker/file_picker.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   GoogleSignInAccount? googleSignInAccount;
//   List<ga.File> _driveFiles = [];
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Future<void> _initGoogleSignIn() async {
//     final googleSignIn = GoogleSignIn.standard(scopes: [ga.DriveApi.driveAppdataScope]);
//     googleSignIn.onCurrentUserChanged.listen((account) {
//       setState(() {
//         googleSignInAccount = account;
//       });
//     });
//     googleSignIn.signInSilently();
//   }
//
//   Future<void> _uploadFileToGoogleDrive() async {
//     if (googleSignInAccount == null) {
//       // Google Sign-In not initialized
//       return;
//     }
//
//     var client = GoogleHttpClient(await googleSignInAccount!.authHeaders);
//     var drive = ga.DriveApi(client as Client);
//     ga.File fileToUpload = ga.File();
//     var file = await FilePicker.platform.pickFiles();
//     if (file == null) {
//       // No file selected
//       return;
//     }
//     fileToUpload.parents = ["appDataFolder"];
//     fileToUpload.name = path.basename(file.files.single.path.toString());
//     var response = await drive.files.create(
//       fileToUpload,
//       uploadMedia: ga.Media(
//         Stream.fromIterable([file.files.first.bytes ?? []]),
//         file.files.first.bytes?.length ?? 0,
//       ),
//     );
//     print(response);
//     await _listGoogleDriveFiles();
//   }
//
//   Future<void> _listGoogleDriveFiles() async {
//     var client = GoogleHttpClient(await googleSignInAccount!.authHeaders);
//     var drive = ga.DriveApi(client);
//     var files = await drive.files.list(q: "appDataFolder in parents and trashed = false");
//     setState(() {
//       _driveFiles = files.files ?? [];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Drive Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(onPressed: (){    _initGoogleSignIn();
//             }, child: Text('press')),
//             Text(
//               'Google Drive Files:',
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _driveFiles.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_driveFiles[index].name ?? ""),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _uploadFileToGoogleDrive(),
//         tooltip: 'Upload to Google Drive',
//         child: Icon(Icons.cloud_upload),
//       ),
//     );
//   }
// }
//
// class GoogleHttpClient extends http.BaseClient {
//   final Map<String, String> _headers;
//   final http.Client _client = http.Client();
//
//   GoogleHttpClient(this._headers);
//
//   @override
//   Future<http.StreamedResponse> send(http.BaseRequest request) async {
//     request.headers.addAll(_headers);
//     return _client.send(request);
//   }
// }