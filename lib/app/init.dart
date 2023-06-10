import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';

void initializeApp() {
  WidgetsFlutterBinding.ensureInitialized();
  Client client = Client();
  client
      .setEndpoint('http://192.168.18.7:8080/v1')
      .setProject('64845404cd2bcafb4e35')
      .setSelfSigned(status: true);
}
