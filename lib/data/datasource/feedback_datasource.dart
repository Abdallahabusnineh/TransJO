import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/error/exceptions.dart';
import 'package:transjo/core/network/apis.dart';
import 'package:transjo/core/network/error_message_model.dart';
import 'package:transjo/core/utils/dio_helper.dart';

abstract class FeedBackBaseDataSource{
  Future<String> feedBack(FeedBackParameter parameters) ;

}
class FeedBackDataSource extends FeedBackBaseDataSource{
  @override
  Future<String> feedBack(FeedBackParameter parameters) async {
    final result =await DioHelper.postData(url: AppURLs.feedBack, data:
    {
      "message":parameters.text
    });
    print('feed back ${result.data}');
    print('is feedback 200  ?${result.statusCode}');
    if(result.statusCode==200) {
      return result.data;
    } else {
      throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(result.data));
    }

  }

}