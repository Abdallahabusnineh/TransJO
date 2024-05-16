part of 'feed_back_bloc.dart';

@immutable
abstract class AbstractFeedBackEvent {}
class SendFeedBackEvent extends AbstractFeedBackEvent{
  final String text;
  SendFeedBackEvent({required this.text});
}
class FeedBackIsDoneEvent extends AbstractFeedBackEvent{}