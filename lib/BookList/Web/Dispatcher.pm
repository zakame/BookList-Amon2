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

get '/books/url_create/:title/:rating/:author_id' => sub {
    my ( $c, $args ) = @_;

    my $book = $c->db->insert(
        book => {
            title  => $args->{title},
            rating => $args->{rating},
        }
    );
    $book->add_to_book_author( { author_id => $args->{author_id} } );

    return $c->render( 'books/create_done.tt', { book => $book } );
};

1;
