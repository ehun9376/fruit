class CouponModel {
  String? id;
  String? code;
  String? type;
  String? value;
  String? minOrder;
  String? maxDiscount;
  String? startDate;
  String? endDate;
  String? status;
  String? createdAt;
  String? updatedAt;

  CouponModel(
      {this.id,
      this.code,
      this.type,
      this.value,
      this.minOrder,
      this.maxDiscount,
      this.startDate,
      this.endDate,
      this.status,
      this.createdAt,
      this.updatedAt});

  CouponModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    type = json['type'];
    value = json['value'];
    minOrder = json['min_order'];
    maxDiscount = json['max_discount'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
