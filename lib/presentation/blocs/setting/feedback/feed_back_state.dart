part of 'feed_back_bloc.dart';

@immutable
abstract class FeedBackState {}

class FeedBackInitialState extends FeedBackState {}
class FeedBackLoadingState extends FeedBackState {}
class FeedBackSuccessState extends FeedBackState {
  final String success;

  FeedBackSuccessState(this.success);

}
class FeedBackErrorState extends FeedBackState {
  final String failure;

  FeedBackErrorState(this.failure);

}
class FeedBackServiceFailureState extends FeedBackState {
  final String error;

  FeedBackServiceFailureState(this.error);

}
class FeedBackIsDoneLoadingState extends FeedBackState{}
class FeedBackIsDoneSuccessState extends FeedBackState{
 final String success;

  FeedBackIsDoneSuccessState(this.success);
}
class FeedBackIsDoneInitialState extends FeedBackState{
}