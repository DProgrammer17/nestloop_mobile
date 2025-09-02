class MarketplaceNotification {
  final String id;
  final String title;
  final double price;
  final String currency; //GBP, NGN or USD
  final String imageUrl;
  final String status;  //Sent, Accepted, Pending
  final String deliveryMethod; //Pickup, Delivery
  final bool paid;

  MarketplaceNotification({
    required this.id,
    required this.title,
    required this.price,
    required this.currency,
    required this.imageUrl,
    required this.status,
    required this.deliveryMethod,
    this.paid = false,
  });
}