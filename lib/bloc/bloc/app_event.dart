part of 'app_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {}

class LoadUserEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class UserLoadedEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}
