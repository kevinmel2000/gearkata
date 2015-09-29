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

## Installation ##

Gearkata is a [Ruby on Rails](http://rubyonrails.org) app, and is set up like any other:

* `git clone git@github.com:senorprogrammer/gearkata.git`
* `bundle install`
* `bundle exec rake db:schema:load`
* `bundle exec rake db:seed`
* `rails s`

and you should be good to go.

## Dependencies ##

* Rails 4.2 (officially supported()
* MRI Ruby 2.2.2 (officially supported)
* PosgreSQL 9.4.4.1 (officially supported)
* SQLite

## Testing ##

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

## Usage ##

Essentially Gearkata allows you to create lists of gear you need to bring along on whatever trip you're taking. This is a very simple concept, and Gearkata is equally as simple: to track your equipment you create a [GearList](https://github.com/senorprogrammer/gearkata/blob/master/app/models/gear_list.rb) and add [Items](https://github.com/senorprogrammer/gearkata/blob/master/app/models/item.rb) to it. If your trip warrants more than one list, you create an [Expedition](https://github.com/senorprogrammer/gearkata/blob/master/app/models/expedition.rb) to group your lists.

**Example:** for a three-day camping trip you might create an expedition that has the following lists:

* my backpack
* food sack
* toiletry kit
* first-aid kit
* camera bag

Add to those the things you want to bring, check them off as you pack. Go on your trip. If you're really good at this, uncheck them from the list as you unpack to ensure you didn't lose anything.


## Contribution guidelines ##

Code contributions are welcome! Fork this repo, make your changes in a
new branch, ensure they're covered by specs, submit a pull request on
Github.

Gearkata is open source under the MIT license. See [LICENSE](https://opensource.org/licenses/MIT) for details.

### Who do I talk to? ###

* Chris Cummer, [senorprogrammer](https://github.com/senorprogrammer) on Github, or [@senorprogrammer](https://twitter.com/senorprogrammer) on Twitter.
