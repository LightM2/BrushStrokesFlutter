import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable(explicitToJson: true)
class NotificationInformation {
  NotificationInformation(
    this.id,
    this.photographer,
    this.alt,
    this.date,
    this.isUnread,
    this.isAddToCart,
  );

  factory NotificationInformation.fromJson(Map<String, dynamic> json) =>
      _$NotificationInformationFromJson(json);

  int id;
  String photographer;
  String alt;
  String date;
  @JsonKey(name: 'is_unread')
  bool isUnread;
  @JsonKey(name: 'is_add_to_cart')
  bool isAddToCart;

  Map<String, dynamic> toJson() => _$NotificationInformationToJson(this);

  NotificationInformation readNotification() {
    return NotificationInformation(
      id,
      photographer,
      alt,
      date,
      false,
      isAddToCart,
    );
  }
}
