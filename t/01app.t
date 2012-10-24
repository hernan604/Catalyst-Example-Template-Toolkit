#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

use Catalyst::Test 'Catalyst::Example::Template::Toolkit';

ok( request('/index/loja1.com.br')->is_success, 'Request should succeed' );

######
##
## First, testing a very customized store... its accesible on /index/loja1.com.br
##
my $output = request('/index/loja1.com.br')->content;
ok( $output =~ m/dados do stash/g , 'stuff from stash appears into my page' );
ok( $output =~ m/FOOTER "custom, da loja1"/g , 'test for a custom footer, that exists only in loja1.com.br' );
ok( $output =~ m/11-2222-555/g , 'the custom footer calls a custom tpl' );

######
##
## Then, lets test another store, not so customized.. this store is more standard
##
my $output = request('/index/loja2.com.br')->content;
ok( $output !~ m/dados do stash/g , 'stuff from stash appears into my page ( very default store..this test should fail )' );
ok( $output !~ m/FOOTER "custom, da loja1"/g , 'test for a custom footer, that exists only in loja1.com.br  ( very default store..this test should fail )' );
ok( $output !~ m/11-2222-555/g , 'the custom footer calls a custom tpl ( very default store..this test should fail )' );
ok( $output =~ m/this index is default and will appear on every site.. unless exists/g , 'custom index' );done_testing();
