import 'package:debestech_course_project/common/routes/names.dart';
import 'package:debestech_course_project/common/values/constant.dart';
import 'package:debestech_course_project/global.dart';
import 'package:debestech_course_project/pages/application/bloc/app_bloc.dart';
import 'package:debestech_course_project/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:debestech_course_project/pages/profile/settings/widgets/settings_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBloc>().add(TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SING_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  settingsButton(context, () {
                    removeUserData();
                  })
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
