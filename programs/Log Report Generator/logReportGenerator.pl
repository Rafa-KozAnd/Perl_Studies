use strict;
use warnings;

my $log_file = "server.log";

my %stats = (
    INFO  => 0,
    WARNING => 0,
    ERROR  => 0
);

open my $fh, '<', $log_file or die "Não foi possível abrir o log: $!";

while (my $line = <$fh>) {
    if ($line =~ /\b(INFO|WARNING|ERROR)\b/) {
        $stats{$1}++;
    }
}

close $fh;

open my $report, '>', "relatorio.txt" or die "Não foi possível criar o relatório: $!";

print $report "Relatório de Logs - Análise:\n";
print $report "---------------------------\n";
print $report "Informações: $stats{INFO}\n";
print $report "Avisos: $stats{WARNING}\n";
print $report "Erros: $stats{ERROR}\n";

close $report;

print "Relatório gerado em 'relatorio.txt'!\n";
