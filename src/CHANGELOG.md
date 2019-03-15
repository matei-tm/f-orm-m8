## [0.0.1] - 2018-03-01

* Basic annotations for ORM extensions

### ColumnMetadata options:

- Ignore
- PrimaryKey
- Unique
- NotNull
- AutoIncrement
- Indexed

### DataTable with name
### DataColumn with name and a bit mask for required ColumnMetadata's

## [0.0.2] - 2018-03-01

* Adding some example usage

## [0.0.3] - 2018-03-02

* Shifting column options values with one bit
* Enhancing documentation
* Reorganizing example 

## [0.1.0] - 2018-03-03

* Switching from flutter_test to test
* Removing flutter dependencies

## [0.2.0] - 2018-03-08

* Adding base classes for:
  * DbEntity
  * DbAccountEntity
  * DbAccountRelatedEntity

## [0.3.0] - 2018-03-15

* Changing DbEntity:
  * Adding abstract method getDbEntityFromMap(Map<String, dynamic> map);
