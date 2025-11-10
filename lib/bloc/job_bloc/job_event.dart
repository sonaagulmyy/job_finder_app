import 'package:equatable/equatable.dart';

abstract class JobEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadJobs extends JobEvent {}
