base class BookingTicketEntity {
  final String url;

  BookingTicketEntity({required this.url});

  factory BookingTicketEntity.fromJson(Map<String, dynamic> json) {
    return BookingTicketEntity(url: json['url']);
  }
}
