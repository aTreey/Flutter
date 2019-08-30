class CategoryGoodsListModel {
  bool state;
  String errorMsg;
  List<CategoryGoodsDataModel> data;
  int page;
  var limit;

  CategoryGoodsListModel(
      {this.state, this.errorMsg, this.data, this.page, this.limit});

  CategoryGoodsListModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    errorMsg = json['errorMsg'];
    if (json['data'] != null) {
      data = new List<CategoryGoodsDataModel>();
      json['data'].forEach((v) {
        data.add(new CategoryGoodsDataModel.fromJson(v));
      });
    }
    page = json['page'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['errorMsg'] = this.errorMsg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['limit'] = this.limit;
    return data;
  }
}

class CategoryGoodsDataModel {
  String image;
  var oriPrice;
  var presentPrice;
  String goodsName;
  var goodsId;

  CategoryGoodsDataModel(
      {this.image,
      this.oriPrice,
      this.presentPrice,
      this.goodsName,
      this.goodsId});

  CategoryGoodsDataModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    oriPrice = json['oriPrice'];
    presentPrice = json['presentPrice'];
    goodsName = json['goodsName'];
    goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['goodsName'] = this.goodsName;
    data['goodsId'] = this.goodsId;
    return data;
  }
}