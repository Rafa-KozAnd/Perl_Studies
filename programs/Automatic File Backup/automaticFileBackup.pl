use strict;
use warnings;
use File::Copy;
use File::Path qw(make_path);

# Diretório de origem e destino do backup
my $origem  = "./dados";
my $backup  = "./backup";

# Criar diretório de backup, se não existir
unless (-d $backup) {
    make_path($backup) or die "Erro ao criar pasta de backup: $!";
}

# Buscar arquivos na pasta de origem
opendir my $dir, $origem or die "Erro ao abrir diretório: $!";
my @arquivos = grep { -f "$origem/$_" } readdir($dir);
closedir $dir;

# Copiar arquivos
foreach my $arquivo (@arquivos) {
    copy("$origem/$arquivo", "$backup/$arquivo") or warn "Erro ao copiar $arquivo: $!";
    print "Backup de: $arquivo\n";
}

print "Backup concluído para a pasta '$backup'.\n";
