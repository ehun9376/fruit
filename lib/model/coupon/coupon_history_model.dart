class CouponHistoryModel {
  final String? id;
  final String? couponId;
  final String? userId;
  final String? pointChange;
  final String? createdAt;

  CouponHistoryModel({
    this.id,
    this.couponId,
    this.pointChange,
    this.userId,
    this.createdAt,
  });

  factory CouponHistoryModel.fromJson(Map<String, dynamic> json) {
    return CouponHistoryModel(
      id: json['id'],
      couponId: json['coupon_id'],
      pointChange: json['point_change'],
      userId: json['user_id'],
      createdAt: json['created_at'],
    );
  }
}
