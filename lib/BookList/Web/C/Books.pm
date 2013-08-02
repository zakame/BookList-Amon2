package BookList::Web::C::Books;

use strict;
use warnings;

use Carp;

sub list {
    my ( $class, $c ) = @_;
    return $c->render( 'books/list.tt',
        { books => [ $c->db->search( 'book', {} ) ] } );
}

sub url_create {
    my ( $class, $c, $args ) = @_;

    my $book = $c->db->insert(
        book => {
            title  => $args->{title},
            rating => $args->{rating},
        }
    );
    $book->add_to_book_author( { author_id => $args->{author_id} } );

    return $c->render( 'books/create_done.tt', { book => $book } );
}

sub form_create {
    my ( $class, $c ) = @_;
    return $c->render('books/form_create.tt');
}

sub form_create_do {
    my ( $class, $c ) = @_;

    my $title     = $c->req->param('title')     || 'N/A';
    my $rating    = $c->req->param('rating')    || 'N/A';
    my $author_id = $c->req->param('author_id') || '1';

    my $book
        = $c->db->insert( book => { title => $title, rating => $rating } );
    $book->add_to_book_author( { author_id => $author_id } );

    return $c->render( 'books/create_done.tt', { book => $book } );
}

1;
