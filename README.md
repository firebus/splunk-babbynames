Babby Names app for Splunk
==========================

This app provides views and searches that explore the Social Security Administration baby names database which you can download at
http://www.ssa.gov/oact/babynames/limits.html

The database has data at the national level starting in 1880. Data for individual starts starts in 1910.
For the national, there's one file for each year.
For the states data, there's one file per state which contains all the data for that state.

## Kludges galore

* Splunk can't handle timestamps earlier than 1970, so _time has no meaning here.
* By default Splunk will use the mod time of the file as the timestamp for events in that file.
* Splunk cannot handle more than 3,125,000 events with the same timestamp.
* There are > 7,000,000 events in the dataset
* An example script is provided to help set a different mod time on each file, which is one way to work around the problem.

## How to get started

* Download the data files from the SSA using the link above
* Extract the data files somewhere Splunk can access
 * The default inputs expect to find data in /var/local/splunk/names and /var/local/splunk/namesbystate
* Make sure each file in the dataset has a different mod time
* Install the app as $SPLUNK_HOME/etc/apps/babbynames
* Restart Splunk and let it index the files
* Generate the years and totals lookups using the two 'Lookup Builders' saved searches.
* Pizza party
