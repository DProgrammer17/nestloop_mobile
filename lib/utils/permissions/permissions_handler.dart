import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class PermissionHandler{

  static Future<bool> checkPermission({required BuildContext context, required Permission permission}) async{
    var status = await permission.status;
    if (status.isDenied || status.isRestricted) {
      await permission.request();
      final newStatus = await permission.status;
      if(newStatus.isGranted){
        return true;
      }
      return false;
    }

    if (status.isPermanentlyDenied) {
      openAppSettings();
      return false;
    }

    return true;
  }
}