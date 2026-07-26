/// What a project link points at, so the card can pick a matching icon.
enum WorkLinkKind { application, source, article }

class WorkLink {
  final WorkLinkKind kind;
  final String label;
  final String url;

  const WorkLink({
    required this.kind,
    required this.label,
    required this.url,
  });
}

class MyWork {
  final String title;
  final String description;
  final String? image;

  /// Technologies shown as chips on the card.
  final List<String> techStack;

  /// Every place this project can be opened. The first one is what tapping
  /// the card itself does.
  final List<WorkLink> links;

  const MyWork({
    required this.title,
    required this.description,
    this.image,
    this.techStack = const [],
    this.links = const [],
  });
}
