abstract class CrudRepository<T>{
  Future<List<T>?> getAll();

}