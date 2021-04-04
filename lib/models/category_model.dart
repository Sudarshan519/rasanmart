class Category {
  String categoryName;
  String categoryImage;

  Category({this.categoryName, this.categoryImage});

  Category.fromJson(Map<String, dynamic> json) {
    //this.id = json['id'];
    this.categoryName = json['categoryName'];
    this.categoryImage = json['categoryImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryName'] = this.categoryName;
    data['categoryImage'] = this.categoryImage;

    return data;
  }
}

final List<Category> category = [
  Category(
      categoryName: 'Glocery',
      categoryImage:
          'https://firebasestorage.googleapis.com/v0/b/mechanic-finder-f3fee.appspot.com/o/Categories%2Fglocerry.PNG?alt=media&token=e8ce82a8-41c5-4478-9463-7e7bd5a9acc3'),
  Category(
      categoryName: 'BabyCare',
      categoryImage:
          'https://firebasestorage.googleapis.com/v0/b/mechanic-finder-f3fee.appspot.com/o/Categories%2FCapture.PNG?alt=media&token=8351a8b5-f9d7-4192-a271-fdd0bde07e9d'),
  Category(
      categoryName: 'Beverage',
      categoryImage:
          'https://firebasestorage.googleapis.com/v0/b/mechanic-finder-f3fee.appspot.com/o/Categories%2Fbabycare.PNG?alt=media&token=b2976670-6737-43a9-a75a-66f32bb605f3'),
  // Category(
  //     categoryName: 'Branded Products',
  //     categoryImage:
  //         'https://firebasestorage.googleapis.com/v0/b/mechanic-finder-f3fee.appspot.com/o/Categories%2Fbranded.PNG?alt=media&token=4c276ae2-a63c-4960-a7de-2fe437804cb5'),
  Category(
      categoryName: 'HouseHold',
      categoryImage:
          'https://firebasestorage.googleapis.com/v0/b/mechanic-finder-f3fee.appspot.com/o/Categories%2Fhousehold.PNG?alt=media&token=4dbccf95-a35a-4247-9f07-add97e62097d'),
  Category(
      categoryName: 'Personal Care',
      categoryImage:
          'https://firebasestorage.googleapis.com/v0/b/mechanic-finder-f3fee.appspot.com/o/Categories%2Fpersonalcare.PNG?alt=media&token=020a7c62-8f33-41a8-aeb1-a7f565e3c798'),
  Category(
      categoryName: 'Bakery items',
      categoryImage:
          'https://firebasestorage.googleapis.com/v0/b/mechanic-finder-f3fee.appspot.com/o/Categories%2Fbakery.PNG?alt=media&token=7829547a-6dde-4e6a-a5ac-cf6a6bd145ab'),
  Category(
      categoryName: 'FoodGrains',
      categoryImage:
          'https://firebasestorage.googleapis.com/v0/b/mechanic-finder-f3fee.appspot.com/o/Categories%2Ffoodgrains.PNG?alt=media&token=bd7819a2-2a7f-497a-96aa-446caa985e62'),
  Category(
      categoryName: 'Vegetable',
      categoryImage:
          'https://firebasestorage.googleapis.com/v0/b/mechanic-finder-f3fee.appspot.com/o/Categories%2Fvegetables.PNG?alt=media&token=09b71520-b2c0-4a5d-be29-df5ab3ebccf6'),
];
