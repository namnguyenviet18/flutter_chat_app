

class MeListItem {
  String? name;
  String? icon;
  String? explain;
  String? route;

  MeListItem({
    this.name,
    this.icon,
    this.explain,
    this.route
  });

  factory MeListItem.fromJson(Map<String, dynamic> json) {
    return MeListItem(
      name: json['name'],
      icon: json['icon'],
      explain: json['explain'],
      route: json['route']
    );
  }
}