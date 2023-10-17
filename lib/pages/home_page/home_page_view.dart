import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_ex/pages/home_page/home_page_bloc.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({
    super.key,
    required this.studentNames,
  });

  final List<String> studentNames;

  @override
  State<HomePageView> createState() => HomePageViewState();
}

class HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider<HomePageBloc>(
        create: (context) => HomePageBloc()
          ..add(
            HomePageOpened(
              studentNames: widget.studentNames,
            ),
          ),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      context.read<HomePageBloc>().add(ChangeName());
                    },
                    onDoubleTap: () {
                      context
                          .read<HomePageBloc>()
                          .add(SetMyName(name: 'Сергей'));
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.cyan,
                      ),
                      child: Text(
                        state.name,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
