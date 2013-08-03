package BookList::Web::C::Books;

use strict;
use warnings;

use Carp;

use Class::Trigger;
use Log::Minimal;

__PACKAGE__->add_trigger(
    base => sub {
        my ( $class, $c ) = @_;
        debugf( '*** INSIDE BASE TRIGGER from %s ***', $c->req->path_info );
    }
);

__PACKAGE__->add_trigger(
    object => sub {
        my ( $class, $c, $book_id ) = @_;

        $class->call_trigger( 'base', $c );

        $c->{object} = $c->db->single( book => { id => $book_id } );
        croak "Book $book_id not found!" if !$c->{object};

        debugf( '*** INSIDE OBJECT TRIGGER for obj id=%s ***', $book_id );
    }
);

sub list {
    my ( $class, $c ) = @_;
    my $status_msg = $c->{status_msg} || $c->req->param('status_msg');

    return $c->render(
        'books/list.tt',
        {   books      => [ $c->db->search( 'book', {} ) ],
            status_msg => $status_msg
        }
    );
}

sub url_create {
    my ( $class, $c, $args ) = @_;

    $class->call_trigger( 'base', $c );

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

    $class->call_trigger( 'base', $c );

    return $c->render('books/form_create.tt');
}

sub form_create_do {
    my ( $class, $c ) = @_;

    $class->call_trigger( 'base', $c );

    my $title     = $c->req->param('title')     || 'N/A';
    my $rating    = $c->req->param('rating')    || 'N/A';
    my $author_id = $c->req->param('author_id') || '1';

    my $book
        = $c->db->insert( book => { title => $title, rating => $rating } );
    $book->add_to_book_author( { author_id => $author_id } );

    return $c->render( 'books/create_done.tt', { book => $book } );
}

sub delete {
    my ( $class, $c, $args ) = @_;

    my $book_id = $args->{book_id};

    $class->call_trigger( 'object', $c, $book_id );

    $c->{object}->delete;
    $c->{status_msg} = 'Book deleted.';

    return $c->redirect( '/books/list', { status_msg => $c->{status_msg} } );
}

1;
