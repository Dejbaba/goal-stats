class Pagination {
  Pagination({
    this.page,
    this.itemsPerPage,
    this.hasNextPage,
    this.hasPrevPage,
  });

  final int page;
  final int itemsPerPage;
  final bool hasNextPage;
  final bool hasPrevPage;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    page: json["page"] == null ? null : json["page"],
    itemsPerPage: json["itemsPerPage"] == null ? null : json["itemsPerPage"],
    hasNextPage: json["hasNextPage"] == null ? null : json["hasNextPage"],
    hasPrevPage: json["hasPrevPage"] == null ? null : json["hasPrevPage"],
  );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "itemsPerPage": itemsPerPage == null ? null : itemsPerPage,
    "hasNextPage": hasNextPage == null ? null : hasNextPage,
    "hasPrevPage": hasPrevPage == null ? null : hasPrevPage,
  };
}
