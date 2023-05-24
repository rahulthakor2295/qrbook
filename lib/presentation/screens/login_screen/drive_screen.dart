import 'dart:async';
import 'dart:convert' show json;
import 'dart:io';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth.dart';
import 'package:googleapis_auth/auth_io.dart';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/drive.readonly',
    'https://www.googleapis.com/auth/drive.readonly',
    'https://www.googleapis.com/auth/drive.file',
  ],
);


class DrivePage extends StatefulWidget {
  @override
  State createState() => DrivePageState();
}

class AuthClient extends http.BaseClient {
  final http.Client _baseClient;
  final Map<String, String> _headers;

  AuthClient(this._baseClient, this._headers);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(_headers);
    return _baseClient.send(request);
  }
}

class DrivePageState extends State<DrivePage> {
   GoogleSignInAccount ?_currentUser;
  List<drive.File> _documents = [];
   final _credentials = ServiceAccountCredentials.fromJson(r'''
{
  "private_key_id": ...,
  "private_key": ...,
  "client_email": ...,
  "client_id": ...,
  "type": "service_account"
}
''');
   var  _scopes = [drive.DriveApi.driveReadonlyScope];
   late VideoPlayerController _controller;


   @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account!;
      });
      if (_currentUser != null) {
        _getDocuments1();
      }
    }  );
    _googleSignIn.signInSilently();
  }

  void _getDocuments() async {
    final client = http.Client();
    var header = await _currentUser?.authHeaders;
    var authClient = AuthClient(client, header!);
    var api = new drive.DriveApi(authClient);

    var calendar = CalendarApi(authClient);

    calendar.events.quickAdd("primary", "");

    var pageToken = null;
    _documents.clear();
    do {
      // TODO: Change q to search for files, like "name contains 'pdf'"
      var fileList = await api.files.list(
          q: null,
          pageSize: 20,
          pageToken: pageToken,
          supportsAllDrives: false,
          spaces: "drive",
          $fields: "nextPageToken, files(id, name, mimeType, thumbnailLink)");
      pageToken = fileList.nextPageToken;

      _documents.addAll(fileList.files as Iterable<drive.File>);
    } while (pageToken != null);


    setState(() {});
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    final _currentUser = this._currentUser;
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
          ),
          const Text("Signed in successfully."),
          Expanded(
            child: ListView.builder(

              itemCount: _documents.length,
              itemBuilder:
                  (BuildContext context, int index) {
                var file = _documents[index];
                if (file.thumbnailLink != null && file.mimeType!.contains("image")) {
                  return InkWell(
onTap: (){

},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              child: Image.network(
                                file.thumbnailLink.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(file.name.toString()),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  Widget? leadingIcon;
                  if (file.mimeType!.contains("folder")) {
                    leadingIcon = Icon(Icons.folder);
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: leadingIcon,
                        title: Text(file.name.toString()),
                        subtitle: Text(file.mimeType.toString()),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          ElevatedButton(
            child: const Text('SIGN OUT'),
            onPressed: _handleSignOut,
          ),
          ElevatedButton(
            child: const Text('REFRESH'),
            onPressed: (){_buildBody();},
          ),
          ElevatedButton(
            child: const Text('upload file'),
            onPressed: (){_uploadFile();},
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("You are not currently signed in."),
          ElevatedButton(
            child: const Text('SIGN IN'),
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }


  //ulOAD FILE
   Future<void> _uploadFile() async {
     final result = await FilePicker.platform.pickFiles();
     if (result == null) return;

     final file = File(result.files.single.path!);
     final client = http.Client();
     final header = await _currentUser?.authHeaders;
     final authClient = AuthClient(client, header!);
     final api = drive.DriveApi(authClient);

     final driveFile = drive.File();
     driveFile.name = result.files.single.name;

     final media = drive.Media(file.openRead(), file.lengthSync());
     var  fileUpload;
     try {
       fileUpload =  await api.files.create(driveFile, uploadMedia: media);

       ScaffoldMessenger.of(context)
           .showSnackBar(SnackBar(content: Text('File uploaded successfully!')));
     } catch (e){
       ScaffoldMessenger.of(context)
           .showSnackBar(SnackBar(content: Text('Not Uploaded!')));
     }
     setState(() {
       _documents.insert(0, fileUpload);
     });
   }
//download file


  /////
   void _getDocuments1() async {
     final client = http.Client();
     var header = await _currentUser?.authHeaders;
     var authClient = AuthClient(client, header!);
     var api = new drive.DriveApi(authClient);

     var pageToken = null;
     _documents.clear();
     do {
       // TODO: Change q to search for files, like "name contains 'pdf'"
       var fileList = await api.files.list(
           q: null,
           pageSize: 20,
           pageToken: pageToken,
           supportsAllDrives: false,
           spaces: "drive",
           $fields: "nextPageToken, files(id, name, mimeType, thumbnailLink)");
       pageToken = fileList.nextPageToken;

       _documents.addAll(fileList.files as Iterable<drive.File>);
     } while (pageToken != null);

     setState(() {});
   }



     @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }
}