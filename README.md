# Gearkata #

[Gearkata](http://www.gearkata.com) is an open-source platform for creating equipment checklists.

It was created because the packing requirements for outdoor adventures are effectively the
same on every trip (a camping trip is a camping trip), yet I always
seemed to forget at least one important item, usually my toque.

Inspired by [this article](http://www.hsph.harvard.edu/news/magazine/fall08checklist/) about the
effacy of checklists, and North Shore Search & Rescue's
[Ten Essentials](http://www.northshorerescue.com/education/what-to-bring/) list, Gearkata was born.

My goal is to make it simple to create and share effective, re-usable
equipment checklists for any and all outdoor activities. To help make
packing for a trip easy.

This is the technical repository for the Gearkata Rails application. If
you're looking to create some lists, you want [Gearkata.com](http://www.gearkata.com).

## How do I get set up? ##

* Summary of set up
* Configuration
* Database configuration

### Dependencies ###

* Rails 4.2 is officially supported
* MRI Ruby 2.2.2 is officially supported
* PosgreSQL
* SQLite

### Testing ###

Gearkata uses [rspec](http://rspec.info) as its testing framework.

To run the unit tests, execute the following:

```
bundle exec rspec spec
```

Gearkata also supports mutation testing. To test against a single class,
run the following (in this example, we're testing against the User
class):

```
RAILS_ENV=test bundle exec mutant -r ./config/environment --use rspec User
```

## Contribution guidelines ##

Code contributions are welcome! Fork this repo, make your changes in a
new branch, ensure they're covered by specs, submit a pull request on
Github.

Gearkata is open source under the MIT license. See [LICENSE](https://opensource.org/licenses/MIT) for details.

## Who do I talk to? ##

* Repo owner or admin
