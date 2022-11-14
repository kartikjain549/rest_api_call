import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rest_api_call/repositories.dart';
import 'package:rest_api_call/user_model.dart';
import 'bloc/bloc/app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: RepositoryProvider(
        create: (context) => UserRepository(),
        child: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(RepositoryProvider.of<UserRepository>(context))
            ..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('The bloc app'),
        ),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserLoadedState) {
            final List<UserModel> userList = state.users;
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: ((_, index) {
                  return Card(
                    color: Colors.blue,
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        userList[index].firstname,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        userList[index].lastname,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: CircleAvatar(
                        backgroundImage: NetworkImage(userList[index].avatar),
                      ),
                    ),
                  );
                }));
          }
          return Container();
        }),
      ),
    );
  }
}
