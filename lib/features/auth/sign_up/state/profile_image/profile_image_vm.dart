import 'dart:io';

class ProfileImageVM{
  final File? image;
  final String imageName;

  const ProfileImageVM({
    this.image,
    this.imageName = '',
});

  ProfileImageVM copyWith({
    File? Function()? image,
    String? imageName,
}){
    return ProfileImageVM(
      image: image != null ? image() : this.image,
      imageName: imageName ?? this.imageName,
    );
  }
}