class NewBookModel {
  String image;

  NewBookModel(this.image);

  static List<NewBookModel> getNewBooks() {
    return [
      NewBookModel("assets/images/img_newbook1.png"),
      NewBookModel("assets/images/img_newbook2.png"),
      NewBookModel("assets/images/img_newbook1.png"),
      NewBookModel("assets/images/img_newbook2.png"),
      NewBookModel("assets/images/img_newbook1.png"),
      NewBookModel("assets/images/img_newbook2.png"),
      NewBookModel("assets/images/img_newbook1.png"),
      NewBookModel("assets/images/img_newbook2.png"),
    ];
  }
}
