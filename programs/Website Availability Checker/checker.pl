use strict;
use warnings;
use LWP::UserAgent;

# Lista de sites para verificar
my @sites = ('https://www.google.com', 'https://www.perl.org', 'https://www.siteinexistente.com');

# Criando o agente de requisição
my $ua = LWP::UserAgent->new;
$ua->timeout(5); # Tempo limite de resposta

foreach my $site (@sites) {
    my $response = $ua->get($site);

    if ($response->is_success) {
        print "✅ $site está online! (Status: " . $response->code . ")\n";
    } else {
        print "❌ $site está offline ou inacessível. (Erro: " . $response->status_line . ")\n";
    }
}
