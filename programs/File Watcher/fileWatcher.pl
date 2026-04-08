use strict;
use warnings;
use File::ChangeNotify;

# Diretório a ser monitorado
my $dir = "./monitorar";

# Criando um watcher para detectar mudanças
my $watcher = File::ChangeNotify->instantiate_watcher(
    directories => [$dir],
    filter      => qr/\.(txt|log|csv)$/   # Monitora arquivos específicos
);

print "Monitorando alterações em: $dir\n";

while (my @events = $watcher->new_events) {
    for my $event (@events) {
        print "Alteração detectada: " . $event->path . " (" . $event->type . ")\n";
    }
}
