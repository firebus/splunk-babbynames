Babby Names app for Splunk
==========================

This app provides some searches against the Social Security Administration baby names database which you can download at
http://www.ssa.gov/oact/babynames/limits.html

The database goes back to 1880 for nation-wide data, and back to 1910 for the individual states. For the nation-wide data, there's
one file for each year. For the states data, there's one file for each state that contains all the years.

## Horribly annoying kludges required

Splunk can't handle timestamps earlier than 1970, so _time has no meaning here. Additionally Splunk cannot handle more than
3,125,000 with the same timestamp. Since there are (many) more than this many events in the dataset, you'll need to find some way
to set fake timestamps or make sure to index slowly enough that Splunk doesn't index more than it's limit per second. Some example
scripts are provided to help set a different mod time on each file, which is one way to work around the problem.

## How to get started

* Download the data files from the SSA using the link above
* Extract the data files somewhere Splunk can access
 * The default inputs expect to find data in /var/local/splunk/names and /var/local/splunk/namesbystate
 * But you're welcome to put the data elsewhere, and override default/inputs.conf with a local/inputs.conf pointing to the right 
   directory
* Implement some method to deal with Splunk's problems handling historical datasets, e.g. make sure each file has a different mod
  time.
* Install the app as $SPLUNK_HOME/etc/apps/babbynames
* Restart Splunk and wait for the data files to get indexed
* Generate the years and totals lookups using the two 'Lookup Builders' saved searches.
* Pizza party

## Roadmap

Most of these require a switch to Advanced XML

* Multi-select for states
* Make the bucketing feature dynamic instead of requiring a manual toggle
* Add regional searches (West, South, North-East, etc.)
* Find a way to show/explore names by rank
  * Could we mimic http://dish.andrewsullivan.com/2013/06/03/names/? Maybe with D3?
* Consider showing area and sex comparisons in a single form