package BookList::DB::Row::Book;

use strict; 
use warnings;

use parent 'Teng::Row';

sub authors {
    my $self = shift;
    my $teng = $self->handle;
    my $id   = $self->id;

    return $teng->search_by_sql(
        q{
SELECT author.id, author.first_name, author.last_name
FROM book_author me JOIN author author ON author.id = me.author_id
WHERE me.book_id = ?
},
        [$id]
    )->all;
}

sub add_to_book_author {
    my ( $self, $args ) = @_;
    my $book_id = $self->id;

    return $self->handle->insert( book_author =>
            { author_id => $args->{author_id}, book_id => $book_id } );
}

1;
