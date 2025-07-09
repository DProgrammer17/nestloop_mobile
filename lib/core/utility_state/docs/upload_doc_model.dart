import 'dart:io';

class UploadDocModel {
  final File? file;
  final String? fileName;

  const UploadDocModel({
    this.file,
    this.fileName,
});

  UploadDocModel copyWith({
    File? Function()? file,
    String? Function()? fileName,
}){
    return UploadDocModel(
      file: file != null ? file() : this.file,
      fileName: fileName != null ? fileName() : this.fileName,
    );
  }
}