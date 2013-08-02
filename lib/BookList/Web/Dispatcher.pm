package BookList::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterSimple;

connect '/'               => 'Root#index';
connect '/account/logout' => 'Root#logout';

connect '/books/list'                                 => 'Books#list';
connect '/books/url_create/:title/:rating/:author_id' => 'Books#url_create';

1;
