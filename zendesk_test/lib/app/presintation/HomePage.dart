import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:zendesk_test/app/data/data_source/zendesk_data_sorce.dart';
import 'package:zendesk_test/app/presintation/alert_dialog.dart';
import 'package:zendesk_test/app/presintation/bloc/zendesk/zendesk_support_cubit.dart';
import 'package:zendesk_test/utils/enum/enum.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ZendeskSupportCubit chatZendeskCubit;

  ValueNotifier<int> selectedTabIndex = ValueNotifier<int>(-1);

  @override
  void initState() {
    super.initState();

    chatZendeskCubit =
        ZendeskSupportCubit(baseZendeskDataSource: ZendeskDataSource());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zendesk Notification Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child:
                        BlocConsumer<ZendeskSupportCubit, ZendeskSupportState>(
                      bloc: chatZendeskCubit,
                      listener: (context, state) async {
                        if (state.zendeskState == DataStatus.loaded) {
                          chatZendeskCubit.showChat();
                          return;
                        }

                        if (state.zendeskState == DataStatus.error) {
                          showTMDialog(
                            title: "fail",
                            msg: state.error,
                            icon: const Icon(
                              FeatherIcons.alertTriangle,
                              color: Colors.red,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: state.zendeskState ==
                                      DataStatus.loading
                                  ? null
                                  : () async {
                                      chatZendeskCubit.initZendeskEvent(true);
                                    },
                              child: state.zendeskState == DataStatus.loading
                                  ? const CircularProgressIndicator()
                                  : const Text("start zendesk chat"),
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
