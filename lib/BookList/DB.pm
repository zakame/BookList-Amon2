package BookList::DB;

use strict; 
use warnings;

use Carp;

use parent 'Teng';

sub create_book {
    my ( $self, $title, $rating ) = @_;
    return $self->insert( book => { title => $title, rating => $rating } );
}

sub find_book {
    my ( $self, $book_id ) = @_;
    return $self->single( book => { id => $book_id } );
}

sub find_all_books {
    my $self = shift;
    return $self->search( book => {} );
}

1;
