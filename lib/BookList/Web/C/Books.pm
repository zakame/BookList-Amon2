package BookList::Web::C::Books;

use strict;
use warnings;

use Carp;

use Log::Minimal;

sub _base {
    my ( $class, $c ) = @_;
    debugf( '*** INSIDE BASE METHOD from %s ***', $c->req->path_info );
}

sub _book {
    my ( $class, $c, $book_id ) = @_;

    $class->_base($c);

    $c->{book} = $c->db->find_book($book_id);
    croak "Book $book_id not found!" if !$c->{book};

    debugf( '*** INSIDE BOOK OBJECT METHOD for obj id=%s ***', $book_id );
}

sub list {
    my ( $class, $c ) = @_;
    my $status_msg = $c->{status_msg} || $c->req->param('status_msg');

    return $c->render(
        'books/list.tt',
        {   books      => [ $c->db->find_all_books ],
            status_msg => $status_msg
        }
    );
}

sub url_create {
    my ( $class, $c, $args ) = @_;

    $class->_base($c);

    my $book = $c->db->create_book( $args->{title}, $args->{rating} );
    $book->add_to_book_author( { author_id => $args->{author_id} } );

    return $c->render( 'books/create_done.tt', { book => $book } );
}

sub form_create {
    my ( $class, $c ) = @_;

    $class->_base($c);

    return $c->render('books/form_create.tt');
}

sub form_create_do {
    my ( $class, $c ) = @_;

    $class->_base($c);

    my $title     = $c->req->param('title')     || 'N/A';
    my $rating    = $c->req->param('rating')    || 'N/A';
    my $author_id = $c->req->param('author_id') || '1';

    my $book = $c->db->create_book( $title, $rating );
    $book->add_to_book_author( { author_id => $author_id } );

    return $c->render( 'books/create_done.tt', { book => $book } );
}

sub delete {
    my ( $class, $c, $args ) = @_;

    my $book_id = $args->{book_id};

    $class->_book( $c, $book_id );

    $c->{book}->delete;
    $c->{status_msg} = 'Book deleted.';

    return $c->redirect( '/books/list', { status_msg => $c->{status_msg} } );
}

1;
