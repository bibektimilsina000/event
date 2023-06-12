import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';

void initializeApp() {
  WidgetsFlutterBinding.ensureInitialized();
  Client client = Client();
  client
      .setEndpoint('http://192.168.18.7:8080/v1')
      .setProject('648597e8a399b887f2a6')
      .setSelfSigned(status: true);
}
