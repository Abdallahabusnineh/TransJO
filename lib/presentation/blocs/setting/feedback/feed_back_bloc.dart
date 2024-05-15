import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/domain/usecases/setting/feed_back_usecase.dart';

part 'feed_back_event.dart';
part 'feed_back_state.dart';

class FeedBackBloc extends Bloc<AbstractFeedBackEvent, FeedBackState> {
  FeedBackBloc(this.feedBackUseCase) : super(FeedBackInitialState()) {
    on<SendFeedBackEvent>(_onSendFeedBackEvent);
  }
  FeedBackUseCase feedBackUseCase;
  TextEditingController textController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<FutureOr<void>> _onSendFeedBackEvent(SendFeedBackEvent event, Emitter<FeedBackState> emit) async {
  emit(FeedBackLoadingState());
  try {
    final result =
        await feedBackUseCase.call(FeedBackParameter(event.text));
    result.fold((l) {
      print('send code is done ${l.message}');
      emit(FeedBackServiceFailureState(l.message));
    }, (r) {
      emit(FeedBackSuccessState(r.toString()));
    });
  } catch (e) {
    print(e.toString());
    emit(FeedBackErrorState(e.toString()));
  }
  }
}
