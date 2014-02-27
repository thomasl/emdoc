#!/usr/bin/perl
#
# Convert erlang source into markdown
#
# 1/ non-comment lines become quoted blocks (github)
# 2/ comment lines are treated as straight markdown
#
# Pipe-only, usage:
#   emdoc.pl < foo.erl > foo.erl.md
#
# The markdown can then be converted by other tools
# [Might be nice if we could do syntax coloring of the source.]
#
# UNFINISHED
# - accept some options to improve script usage
# - improve output, see below

use strict;
use warnings;

## Convert the lines in a straightforward fashion.
## NB: Tested by pasting into dillinger.io.
##
## When we switch text <-> code block, we insert an
## empty line. This seems to fix the formatting hijinks.
##
## UNFINISHED
## - lines that contain only comments and whitespace should
##   perhaps be special treated (they turn into blank lines now)
## - some embedded strings could perhaps be misclassified, skipping that
##   (if they continue to a new line and start with %)
## - get rid of other directives like "%% -*- Erlang -*-" etc
##   [perhaps mark lines explicitly to skip in output?]
## - add more intelligence and linkability?
##   * analyze code to detect which function is being defined

## 1 if emitting codeblock, 0 otherwise
## used to emit blank separation lines

my $code_mode = 0;

while (my $line = <>) {
    if ($line =~ m{^%}) {
	## Comment line, drop leading comment chars and an optional space
	## (the result is processed as markdown)
	##
	## Emit extra blank line if previously emitting code block
	if ($code_mode) {
	    print "\n";
	}
	$code_mode = 0;   ## (or do it in the if)
	$line =~ s{^%+\s?}{};
	print $line;
    } elsif ($line =~ m{^\s*$}) {
	## Blank lines left untreated
	print $line;
    } else {
	## Code line, put in verbatim block (= prepend 4 spaces)
	##
	## Emit extra blank line if previously emitting text
	if (!$code_mode) {
	    print "\n";
	}
	$code_mode = 1;  ## (or do it in the if)
	print "    ".$line;
    }
}






