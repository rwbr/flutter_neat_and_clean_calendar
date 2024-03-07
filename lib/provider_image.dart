import 'dart:io';

import 'package:flutter/material.dart';

ImageProvider providerImage(String image) {
  return image.contains('assets/')
      ? AssetImage(image)
      : image.contains('https://')
          ? NetworkImage(image)
          : FileImage(File(image)) as ImageProvider;
}
