#!/usr/bin/perl
#
# Literate emdoc
# - write your code in markdown, foo.erl.md
# - block quotes
#   ```erlang
#   -module(foo).
#   %% etc etc
#   ```
#   become erlang code, foo.erl
# - end of file counts as terminating an erlang block too
#
# Pipe-only usage:
#
#   emdoc-lit.pl < foo.erl.md > foo.erl
#

use strict;
use warnings;

## We extract the erlang simplistically:
## - look for a line starting an erlang block
##   then put all lines in the erlang block
##   until a terminating line or EOF is found
## - loop until file has been processed

my $line;

while ($line = <>) {
    if ($line =~ m!^\`\`\`erlang\s*$!) {
	## Erlang block starts, print it until end of block
	## or end of line
	while ($line = <>) {
	    if ($line =~ m!^\`\`\`\s*$!) {
		last;
	    }
	    print STDOUT $line;
	}
	## breaks to here
    }
}

## Done

