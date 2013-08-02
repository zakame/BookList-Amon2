package BookList::Web::C::Root;

use strict; 
use warnings;

use Carp;

sub index {
    my ( $class, $c ) = @_;
    return $c->render('index.tt');
}

sub logout {
    my ( $class, $c ) = @_;

    if ( $c->req->method eq 'POST' ) {
        $c->session->expire();
        return $c->redirect('/');
    }
}

1;
