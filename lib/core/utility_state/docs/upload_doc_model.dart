import 'package:nest_loop_mobile/core/utility_state/docs/doc_info_model.dart';

class UploadDocModel {
  final List<DocInfoModel> files;

  const UploadDocModel({this.files = const []});

  UploadDocModel copyWith({List<DocInfoModel>? files}) {
    return UploadDocModel(files: files ?? this.files);
  }
}
