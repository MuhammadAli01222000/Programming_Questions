import 'package:programming_questions/model/question_model.dart';
import 'package:programming_questions/services/data_source.dart';

class DataController {
  DataController._();
  static final DataController _instance = DataController._();
  factory DataController() => _instance;

  List<QuestionModel> _items = [];
  List<QuestionModel> get items => _items;

  Future<void> initilize() async {
    final jsonList = await DataSource.convertor();
    _items = jsonList.map((item) => QuestionModel.fromJson(item)).toList();
    print("items $_items");
  }
}
