requires 'perl', '5.008001';
requires 'Amon2', '3.85';
requires 'Text::Xslate', '1.6001';
requires 'Amon2::DBI'                     , '0.30';
requires 'DBD::SQLite'                    , '1.33';
requires 'HTML::FillInForm::Lite'         , '1.11';
requires 'JSON'                           , '2.50';
requires 'Module::Functions'              , '2';
requires 'Plack::Middleware::ReverseProxy', '0.09';
requires 'Plack::Middleware::Session'     , '0';
requires 'Plack::Session'                 , '0.14';
requires 'Test::WWW::Mechanize::PSGI'     , '0';
requires 'Time::Piece'                    , '1.20';

requires 'Teng', '0.19';
requires 'Log::Minimal', '0.15';
requires 'HTTP::Date', '6.02';
requires 'Router::Simple', '0.15';

on 'configure' => sub {
   requires 'Module::Build', '0.38';
};

on 'test' => sub {
   requires 'Test::More', '0.98';
};
