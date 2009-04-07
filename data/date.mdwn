Display the time in a given format or set the system clock.

## Display Today's Date

* `date` - Sample output: "Tue Mar 31 16:35:32 BST 2009".
* `date --utc` - Current time and date in UTC format. Sample output: "Tue Mar
31 15:36:58 UTC 2009".
* `date -R` Current time and date in RFC 2822 format. Sample output: "Tue, 31 Mar 2009 16:38:55 +0100".
* `date +format` - Current date and time in the format of the `format` string.
The syntax of the format string is described in _Format Specifiers_. For
example, `date +%Y-%m-%d` displays "2009-03-31".

## Display a Given Date

* `date -d date` - Formats the date given by the string `date` in any of the
ways above. For example:
 * `date --date=1/12/2009` - Displays 1st January, 2009 as "Mon Jan 12
00:00:00 GMT 2009". Note: my system is set up for British use, hence the
interpretation of the date as dd/mm/yyyy.
 * `date --date=4:29 --utc` - Displays the time 4:29 in UTC format: "Tue Mar
31 04:29:00 UTC 2009"
* `date -r file` - Display the last modification date of `file`. Can be
combined with an option to configure output style. 

## Set the System Clock

* `sudo date --set=date` - Set the system time and date to the `date` string.
Must be run as root or `sudo`. 

## Format Specifiers

Format specifiers are special placeholders that stand for a certain element of
a date. They are arranged in a 'format string' in which `date` replaces each
specifier with the appropriate value corresponding to the current date (or the
one specified by one of the means above).

For example, the `%Y` specifier displays the year as 4 digits, so `date +%Y`
would display "2009" if called in the year 2009. Alternatively, `date
--date="Mon Sep 20 04:05:00 UTC 2010" +%Y` displays "2010".

The format string can contain any combination of format specifiers and
arbitrary text. For example, `date --date="Mon Sep 20 04:05:00 UTC 2010" +"In
%Y %B %d falls on a %A"` displays "In 2010 September 20 falls on a Monday".

The following table is excepted from the `date` man page written by David
MacKenzie and released under the GNU GPL v.3 or later. It details what is
substituted for each of the format specifiers recognised by `date`.


    Specifier              Produces
    ----------------------------------------------------------------------       
       %%     a literal %

       %a     locales abbreviated weekday name (e.g., Sun)

       %A     locales full weekday name (e.g., Sunday)

       %b     locales abbreviated month name (e.g., Jan)

       %B     locales full month name (e.g., January)

       %c     locales date and time (e.g., Thu Mar  3 23:05:25 2005)

       %C     century; like %Y, except omit last two digits (e.g., 21)

       %d     day of month (e.g, 01)

       %D     date; same as %m/%d/%y

       %e     day of month, space padded; same as %_d

       %F     full date; same as %Y-%m-%d

       %g     last two digits of year of ISO week number (see %G)

       %G     year of ISO week number (see %V); normally useful only with %V

       %h     same as %b

       %H     hour (00..23)

       %I     hour (01..12)

       %j     day of year (001..366)

       %k     hour ( 0..23)

       %l     hour ( 1..12)

       %m     month (01..12)

       %M     minute (00..59)

       %n     a newline

       %N     nanoseconds (000000000..999999999)

       %p     locales equivalent of either AM or PM; blank if not known

       %P     like %p, but lower case

       %r     locales 12-hour clock time (e.g., 11:11:04 PM)

       %R     24-hour hour and minute; same as %H:%M

       %s     seconds since 1970-01-01 00:00:00 UTC

       %S     second (00..60)

       %t     a tab

       %T     time; same as %H:%M:%S

       %u     day of week (1..7); 1 is Monday

       %U     week number of year, with Sunday as first day of week (00..53)

       %V     ISO week number, with Monday as first day of week (01..53)

       %w     day of week (0..6); 0 is Sunday

       %W     week number of year, with Monday as first day of week (00..53)

       %x     locales date representation (e.g., 12/31/99)

       %X     locales time representation (e.g., 23:13:48)

       %y     last two digits of year (00..99)

       %Y     year

       %z     +hhmm numeric timezone (e.g., -0400)

       %:z    +hh:mm numeric timezone (e.g., -04:00)

       %::z   +hh:mm:ss numeric time zone (e.g., -04:00:00)

       %:::z  numeric time zone with : to necessary precision (e.g., -04, +05:30)

       %Z     alphabetic time zone abbreviation (e.g., EDT)


By default, date pads numeric fields with zeroes.  The following optional flags may follow %:


       -      (hyphen) do not pad the field

       _      (underscore) pad with spaces

       0      (zero) pad with zeros

       ^      use upper case if possible

       #      use opposite case if possible

"After  any  flags comes an optional field width, as a decimal number; then an
optional modifier, which is either E, to use the locales alternate
representations if available, or O to use the locales alternate numeric
symbols  if available."
