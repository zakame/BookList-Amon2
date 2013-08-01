use strict;
use warnings;
use utf8;
use Test::More;

use_ok $_ for qw(
    BookList
    BookList::Web
    BookList::Web::ViewFunctions
    BookList::Web::Dispatcher
);

done_testing;
