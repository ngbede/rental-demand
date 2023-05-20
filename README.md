# Rental demand system
A rental demand system that recommends rental properties for students in a given college to go visit, tracks which students have been assigned to given rental,
and recommends next batch of students based on a priority system (who has been looking for a property the longest).

### How To use
- Underlying sql runs on `mariadb` schema language defintions, mysql will also work.
- Connect to your server using your credentials from specified sql engines above.
- Run the 3 files spefied files in this order `init.sql`, `populate.sql` and then `views.sql` to see results of queries.
- Can run select statements on the views and tables as you like.
