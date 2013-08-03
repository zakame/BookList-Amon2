package BookList::DB;

use strict; 
use warnings;

use Carp;

use parent 'Teng';
use HTTP::Date 'time2iso';

sub create_book {
    my ( $self, $title, $rating ) = @_;
    my $time = time2iso;
    
    return $self->insert(
        book => {
            title   => $title,
            rating  => $rating,
            created => $time,
            updated => $time
        }
    );
}

sub find_book {
    my ( $self, $book_id ) = @_;
    return $self->single( book => { id => $book_id } );
}

sub find_all_books {
    my $self = shift;
    return $self->search( book => {} );
}

sub find_books_created_after {
    my ( $self, $secs ) = @_;
    my $dt = time2iso($secs);
    
    return $self->search( book => { created => { '>' => $dt } } );
}

1;
