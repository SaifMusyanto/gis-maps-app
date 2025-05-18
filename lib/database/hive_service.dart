import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../features/cv/data/models/analysis/analysis_model.dart';
import '../features/cv/data/models/analysis_aspect/analysis_aspect_model.dart';
import '../features/cv/data/models/cv/cv_model.dart';

class HiveService {
  static const String analysisHistoryBox = 'analysis_history_box';

  static Future<void> init() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    Hive.registerAdapter(CvModelAdapter());
    Hive.registerAdapter(CvPurposeAdapter());
    Hive.registerAdapter(AnalysisModelAdapter());
    Hive.registerAdapter(AnalysisAspectModelAdapter());

    await Hive.openBox<CvModel>(analysisHistoryBox);
  }

  Future<void> saveAnalysis(CvModel cv) async {
    final box = Hive.box<CvModel>(analysisHistoryBox);
    await box.add(cv);
  }

  List<CvModel> getAnalysisHistory() {
    final box = Hive.box<CvModel>(analysisHistoryBox);
    return box.values.toList().reversed.toList();
  }

  Future<void> deleteAnalysis(CvModel cv) async {
    final box = Hive.box<CvModel>(analysisHistoryBox);
    final index = box.values.toList().indexWhere((element) => element == cv);
    if (index != -1) {
      await box.deleteAt(index);
    }
  }
}