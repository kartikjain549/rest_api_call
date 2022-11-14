import 'package:equatable/equatable.dart';
import 'package:rest_api_call/user_model.dart';

abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//data loaded state
class UserLoadedState extends UserState {
  final List<UserModel> users;
  UserLoadedState(this.users);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//error loading state
class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
