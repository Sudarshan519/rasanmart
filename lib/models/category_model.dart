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
          'gs://mechanic-finder-f3fee.appspot.com/Categories/glocery.PNG'),
  Category(
      categoryName: 'Baby Card',
      categoryImage:
          'gs://mechanic-finder-f3fee.appspot.com/Categories/baby.PNG'),
  Category(
      categoryName: 'Beverage',
      categoryImage:
          'gs://mechanic-finder-f3fee.appspot.com/Categories/beverage.PNG'),
  Category(
      categoryName: 'Branded Products',
      categoryImage:
          'gs://mechanic-finder-f3fee.appspot.com/Categories/branded.PNG'),
  Category(
      categoryName: 'HouseHold',
      categoryImage:
          'gs://mechanic-finder-f3fee.appspot.com/Categories/household.PNG'),
  Category(
      categoryName: 'Persona Care',
      categoryImage:
          'gs://mechanic-finder-f3fee.appspot.com/Categories/personalcare.PNG'),
  Category(
      categoryName: 'Bakery items',
      categoryImage:
          'gs://mechanic-finder-f3fee.appspot.com/Categories/bakery.PNG'),
  Category(
      categoryName: 'FoodGrains',
      categoryImage:
          'gs://mechanic-finder-f3fee.appspot.com/Categories/foodgrains.PNG'),
  Category(
      categoryName: 'Vegetables',
      categoryImage:
          'gs://mechanic-finder-f3fee.appspot.com/Categories/vegetables.PNG'),
];
