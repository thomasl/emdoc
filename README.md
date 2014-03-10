emdoc: erlang source to markdown
=====

Usage:

    ./bin/emdoc < foo.erl > foo.erl.md
    
Erlang comment lines are considered markdown, while other lines are
considered code blocks.

emdoc-lit: literate erlang to markdown
==========

Usage:

    ./bin/emdoc-lit.pl < foo.erl.md > foo.erl

Write your program as markdown, enclose the erlang code
in erlang blocks. The script extracts the erlang into foo.erl.

    ```erlang
    ...
    ```

(Inspired by Gordon Guthrie, 
[https://github.com/hypernumbers/literate-erlang](https://github.com/hypernumbers/literate-erlang).)

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
