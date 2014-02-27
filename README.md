emdoc: erlang source to markdown
=====

Usage:

    ./bin/emdoc < foo.erl > foo.erl.md
    
Comment lines are considered markdown, while other lines are considered code blocks.

Status
=======

Tested with dillinger.io, results are reasonable.

Pull requests and extensions
==========

- Script should also accept explicit input and output file(s).
- Lines that contain only comment chars and space become blank lines.
- Possible syntax gotchas: can erlang strings look like comment lines?
- Other directive lines (like `%% -*- Erlang -*-`) should be skippable.
- Linkability inside sources and other intelligence.
- Source code coloring?
