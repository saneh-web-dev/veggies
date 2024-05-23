
class BrandModel{
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productCount,

});

  static BrandModel empty() => BrandModel(id:'',image: '',name: '');

  toJson(){
    return {
      'id':id,
      'name':name,
      'image':image,
      'isFeatured':isFeatured,
      'productCount':productCount,
    };
  }

  factory BrandModel.fromJson(Map<String,dynamic> document){
    final data  = document;
    if(data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id:data['id'] ?? '',
      name:data['name'] ?? '',
      image:data['image'] ?? '',
      isFeatured:data['isFeatured'] ,
    );
    }
}