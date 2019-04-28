## [Unreleased]

## [0.7.0-beta] - 2019-04-29

### Added

* `CompositeConstraintType` - enum to signal constraints that are candidates to composition
* `CompositeConstraint` -  describe the constraints that require non default naming or aggregation with another constraint with same name and type

### Changed

* The DataColumn constructor parameters. The current version
  requires a mandatory name. The parameter metadataLevel is now named and optional. A third optional named parameter `compositeConstraints` as a list of `CompositeConstraint` was added.
* ColumnMetadata fields name to lowerCamelCase
* TableMetadata fields name to lowerCamelCase

## [0.6.0] - 2019-04-15

### Changed

* The DbAccountEntity fields. It received a new bool field named isCurrent

## [0.5.1] - 2019-04-08

### Fixed

* The pubspec description length must be between 60 and 180 characters

## [0.5.0] - 2019-04-08

### Added

* DbOpenEntity - for free DataTables with unconstrained PK
* Test for DbOpenEntity

### Changed

* The README.md was extended
* The CHANGELOG was aligned with [keepachangelog](https://keepachangelog.com/en/1.0.0/)

## [0.4.0] - 2019-04-02

### Added

* TableMetadata to enhance DataTable. Three options:

    - SoftDeletable
    - TrackCreate
    - TrackUpdate

### Changed

* All the fields in DbEntity and descendants goes public
* Removed all methods from DbEntity and descendants to keep the models as plain as possible


## [0.3.0] - 2019-03-15

### Changed

* DbEntity:
  * Adding abstract method getDbEntityFromMap(Map<String, dynamic> map);

## [0.2.0] - 2019-03-08

### Added

  * Base classes for:
    * DbEntity
    * DbAccountEntity
    * DbAccountRelatedEntity

## [0.1.0] - 2019-03-03

### Changed

  * Switching from flutter_test to test
  * Removing flutter dependencies

## [0.0.3] - 2019-03-02

### Changed

  * Shifting column options values with one bit
  * Enhancing documentation
  * Reorganizing example

## [0.0.2] - 2019-03-01

### Added
  
  * Adding some example usage

## [0.0.1] - 2019-03-01

### Added

  * Basic annotations for ORM extensions
  * ColumnMetadata options:
    - Ignore
    - PrimaryKey
    - Unique
    - NotNull
    - AutoIncrement
    - Indexed
  * DataTable with name
  * DataColumn with name and a bit mask for required ColumnMetadata's
