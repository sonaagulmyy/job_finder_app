class Job {
  final String id;
  final String slug;
  final String date;
  final String company;
  final String position;
  final List<String> tags;
  final String description;
  final String location;
  final int? salaryMin;
  final int? salaryMax;
  final String applyUrl;
  final String url;
  final String companyLogo;

  Job({
    required this.id,
    required this.slug,
    required this.date,
    required this.company,
    required this.position,
    required this.tags,
    required this.description,
    required this.location,
    this.salaryMin,
    this.salaryMax,
    required this.applyUrl,
    required this.url,
    required this.companyLogo,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'] ?? '',
      slug: json['slug'] ?? '',
      date: json['date'] ?? '',
      company: json['company'] ?? '',
      position: json['position'] ?? '',
      tags: json['tags'] != null ? List<String>.from(json['tags']) : [],
      description: json['description'] ?? '',
      location: json['location'] ?? '',
      salaryMin: json['salary_min'],
      salaryMax: json['salary_max'],
      applyUrl: json['apply_url'] ?? '',
      url: json['url'] ?? '',
      companyLogo: json['company_logo'] ?? '',
    );
  }
}
