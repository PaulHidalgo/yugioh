class Banlist {
  final String status;

  Banlist({required this.status});

  factory Banlist.fromJson(Map<String, dynamic> json) {
    return Banlist(
      status: json['banlist_info']['status'],
    );
  }
}
