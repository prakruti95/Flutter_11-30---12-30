import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

void main()
{
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  File? cameraFile;

  @override
  void initState()
  {
    checkAndRequestCameraPermission(context);
  }
  Future<void> checkAndRequestCameraPermission(BuildContext context) async
  {
    // Check current status
    PermissionStatus status = await Permission.camera.status;

    if (status.isGranted)
    {
      // Permission is allowed, proceed to open your camera
      openCamera();
    }
    else if (status.isDenied)
    {
      // Request permission from the user
      PermissionStatus newStatus = await Permission.camera.request();
      if (newStatus.isGranted)
      {
       openCamera();
      }
    }
    else if (status.isPermanentlyDenied)
    {
      // User fully rejected; direct them to phone settings to manually enable it
      _showSettingsDialog(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Permission App")),
      body: Center(
        child: Column(
          children: [ElevatedButton(onPressed: ()
          {
            selectFromCamera();
            print(cameraFile!.path.toString());
          }, child: Text("click me")),

          TextField(decoration: InputDecoration(),)

          ],
        ),
      ),
    );
  }

  void openCamera()
  {
    print("Camera functionality initialized.");
  }

  void _showSettingsDialog(BuildContext context)
  {
    showDialog
      (
          context: context,
          builder: (BuildContext context)
          {
            return AlertDialog
              (
              title: const Text('Camera Permission Required'),
              content: const Text('Please enable camera access in your device settings.'),
              actions:
              [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: ()
                  {
                    Navigator.pop(context);
                    openAppSettings(); // Built-in function to open device configurations
                  },
                  child: const Text('Open Settings'),
                ),
              ],
              );
          }

      );
  }

  Future<void> selectFromCamera() async {
    final ImagePicker picker = ImagePicker();
    // Use the instance method pickImage from the ImagePicker instance
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null)
    {
      setState(() {
        cameraFile = File(pickedFile.path);
      });
    }
  }

 
}
