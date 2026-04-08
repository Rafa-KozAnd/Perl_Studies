use strict;
use warnings;

# Gerar um número aleatório entre 1 e 6 para a bala
my $bala = int(rand(6)) + 1;

print "Bem-vindo à Roleta Russa! O tambor tem 6 espaços, apenas 1 tem uma bala.\n";
print "Digite 'puxar' para girar o tambor e atirar.\n";

while (1) {
    print "Comando: ";
    my $comando = <STDIN>;
    chomp $comando;

    if ($comando eq "puxar") {
        # Gira o tambor e sorteia uma posição
        my $disparo = int(rand(6)) + 1;
        print "Girando o tambor... Click!\n";

        if ($disparo == $bala) {
            print "💥 BANG! Você perdeu!\n";
            last;
        } else {
            print "😅 Ufa! Você sobreviveu. Tente de novo...\n";
        }
    } elsif ($comando eq "sair") {
        print "Você decidiu não arriscar. Fim de jogo.\n";
        last;
    } else {
        print "Comando inválido. Digite 'puxar' para atirar ou 'sair' para desistir.\n";
    }
}
