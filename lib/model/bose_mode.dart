

class BoseModel {
  final String? headPhoneName;
  final String? headPhoneImage;
  final String? headPhonePrice;

  BoseModel({this.headPhoneImage, this.headPhoneName, this.headPhonePrice});
}

class BoseModelListClass {
  static final  boseModelList = [
    BoseModel(headPhoneImage: "assets/images/headphones1.png", headPhoneName: "QuietComfort 35 wireless headphones II", headPhonePrice: "\$449.99"),
    BoseModel(headPhoneImage: "assets/images/headphones2.png", headPhoneName: "SoundLink® aroundear wireless headphones", headPhonePrice: "\$269.99"),
    BoseModel(headPhoneImage: "assets/images/headphones3.png", headPhoneName: "Bose on-ear wireless headphones", headPhonePrice: "\$209.99"),
    BoseModel(headPhoneImage: "assets/images/headphones4.png", headPhoneName: "Bose Noise Cancelling Headphones 700", headPhonePrice: "Coming Soon"),
  ];
}