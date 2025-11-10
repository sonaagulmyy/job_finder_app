String createSavedJobsTable = '''
CREATE TABLE savedJobs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  position TEXT,
  location TEXT,
  company TEXT,
  salaryMin INTEGER,
  salaryMax INTEGER
);
''';
