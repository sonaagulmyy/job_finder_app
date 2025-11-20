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

String createUsersTable = '''
CREATE TABLE users(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  phone TEXT UNIQUE,
  passwordHash TEXT
);
''';

