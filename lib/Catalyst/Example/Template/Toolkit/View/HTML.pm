package Catalyst::Example::Template::Toolkit::View::HTML;
use Moose;
extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt2',
    EVAL_PERL   => 1,
    ABSOLUTE    => 1,
    INCLUDE_PATH => [
            #esta será o diretório onde vamos colocar os templates para a view Standard,
            # ->path_to pega o diretório relativo onde sua app está localizada automaticamente
            Catalyst::Example::Template::Toolkit->path_to( 'root', 'src', ),
            Catalyst::Example::Template::Toolkit->path_to( 'root', 'src', 'default' ),
        ],
    TIMER   => 0,
    WRAPPER => 'wrapper.tt2', #aqui especificamos nosso arquivo wrapper
);
1;

