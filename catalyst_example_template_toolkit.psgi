use strict;
use warnings;

use Catalyst::Example::Template::Toolkit;

my $app = Catalyst::Example::Template::Toolkit->apply_default_middlewares(Catalyst::Example::Template::Toolkit->psgi_app);
$app;

