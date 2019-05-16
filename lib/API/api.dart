import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:http/io_client.dart';

const baseUrl = 'https://pemilu2019.kpu.go.id';

class API {
  static Future getData(){

    bool trustSelfSigned = true;
    
      HttpClient httpClient = new HttpClient()
        ..badCertificateCallback =
            ((X509Certificate cert, String host, int port) => trustSelfSigned);
      IOClient ioClient = new IOClient(httpClient);
    return ioClient.get(baseUrl+ '/static/json/hhcw/ppwp.json');
  }

  
}