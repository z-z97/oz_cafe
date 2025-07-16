class ProfileMenuItemModel {
  final String title;
  final String icon;
  final bool hasArrow;

  ProfileMenuItemModel({
    required this.title,
    required this.icon,
    this.hasArrow = true,
  });
}
