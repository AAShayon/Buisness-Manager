

abstract class StorageService{
  void write({required String key,required dynamic value});
  dynamic read({required String key});
  void delete({required String key});
  void update({required String key,required dynamic value});
}