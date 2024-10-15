// class BrandModel {
//   String id;
//   String name;
//   String image;
//   String parentId;
//   bool isFeature;

//   BrandModel({
//     this.id = '',
//     required this.name,
//     required this.image,
//     required this.parentId,
//     required this.isFeature,
//   });

//   // Empty helper function
//   static BrandModel empty() =>
//       BrandModel(id: '', name: '', image: '', parentId: '', isFeature: false);

//   // Convert model to JSON
//   toJson() {
//     return {
//       'name': name,
//       'id': id,
//       'image': image,
//       'parentId': parentId,
//       'isFeature': isFeature,
//     };
//   }

//   // Create a model from JSON
//   factory BrandModel.fromJson(Map<String, dynamic> document) {
//     final data = document;
//     if (data.isNotEmpty) {
//       return BrandModel(
//         id: data['id'],
//         name: data['name'] ?? '',
//         image: data['image'] ?? '',
//         parentId: data['parentId'] ?? '',
//         isFeature: data['isFeature'] ?? false,
//       );
//     } else {
//       return BrandModel.empty();
//     }
//   }
// }
