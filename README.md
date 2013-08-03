# BookList-Amon2

## なにこれ？

This is an implementation of the BookList webapp found in the
[Catalyst::Manual::Tutorial][CMT], adapted for [Amon2][Amon2].  I've
written this primarily as a self-learning tool for me to dive into Amon2
and related tools, with the later goal of using this webapp for teaching
the same.

[CMT]: http://metacpan.org/module/Catalyst::Manual::Tutorial

[Amon2]: http://amon.64p.org

As Amon2 is a *very* lightweight Web Application Framework, there are
some parts of the original BookList app using Catalyst that can only be
approximated in Amon2 (namely, chained actions and ORM,) so I've used my
own devices here to make it as close to the Catalyst app as I can, but
obviously no closer ;)

## How do I run this?

If you have Amon2, [Teng][Teng], and [Log::Minimal][LM] installed in
your Perl system already, there's nothing to do other than `plackup`.
If you don't have Amon2 (or you feel you need to do some prerequisite
installing from the CPAN,) just do `cpanm --installdeps .` at the root
of this project.

[Teng]: http://metacpan.org/module/Teng

[LM]: http://metacpan.org/module/Log::Minimal

If you have a [Carton][Carton] setup (especially within a perlbrew lib,
when you have multiple Carton projects on,) you can switch to that setup
instead and do

    $ carton install
    $ carton exec plackup

[Carton]: http://metacpan.org/module/Carton

## What should I expect?

There should be a webapp on http://localhost:5000 that you can browse
on; pay particular attention to the top navbar, where the /book/* links
are.  Visit http://localhost:5000/books/list to find the book list (it
is probably empty unless you've entered some data, or ran the example
SQLite script below.)

For input, go to either the [url_create][url_create] or
[form_create][form_create] links; there will be others as I update this
project.

[url_create]: http://localhost:5000/books/url_create/Foo's_Book_of_Baz/5/4

[form_create]: http://localhost:5000/books/form_create

### I want sample data!

Sure, sure, you want it, I deliver:

    $ sqlite3 db/development.db < sql/sqlite-examples.sql

Furthermore, if you're running the HEAD of this app, you'd want to run
an additional SQLite script for the altered tables:

    $ sqlite3 db/development.db < sql/sqlite-alter-datetime.sql

(And yes, you should have [SQLite][SQLite] installed at any rate.)

[SQLite]: http://www.sqlite.org
