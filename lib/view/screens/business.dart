import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:news_app/view/widgets/conditional_builder.dart';

import '../widgets/buildArtical.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalBuild(list: [],);
  }
}
