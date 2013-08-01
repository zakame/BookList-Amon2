package BookList;
use strict;
use warnings;
use utf8;
use parent qw/Amon2/;
our $VERSION='3.85';
use 5.008001;

use Teng::Schema::Loader;
use Teng;

__PACKAGE__->load_plugin(qw/DBI/);

# initialize database
use DBI;
sub setup_schema {
    my $self = shift;
    my $dbh = $self->dbh();
    my $driver_name = $dbh->{Driver}->{Name};
    my $fname = lc("sql/${driver_name}.sql");
    open my $fh, '<:encoding(UTF-8)', $fname or die "$fname: $!";
    my $source = do { local $/; <$fh> };
    for my $stmt (split /;/, $source) {
        next unless $stmt =~ /\S/;
        $dbh->do($stmt) or die $dbh->errstr();
    }
}

# set up Teng ORM
sub db {
    my $self = shift;

    unless ( defined $self->{db} ) {
        my $dbh = $self->dbh();
        $self->{db} = Teng::Schema::Loader->load(
            namespace => 'BookList::DB',
            dbh       => $dbh,
        );
    }
    return $self->{db};
}

1;
