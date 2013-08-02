package BookList::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::Lite;

any '/' => sub {
    my ($c) = @_;
    return $c->render('index.tt');
};

post '/account/logout' => sub {
    my ($c) = @_;
    $c->session->expire();
    return $c->redirect('/');
};

get '/books/list' => sub {
    my ($c) = @_;
    return $c->render( 'books/list.tt',
        { books => [ $c->db->search( 'book', {} ) ] } );
};

1;
