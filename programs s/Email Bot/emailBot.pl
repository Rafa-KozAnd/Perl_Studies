use strict;
use warnings;
use Email::Sender::Simple qw(sendmail);
use Email::Sender::Transport::SMTP qw();
use MIME::Lite;

# Configuração do e-mail
my $from    = 'seuemail@gmail.com';
my $to      = 'destinatario@gmail.com';
my $subject = 'Teste de E-mail via Perl';
my $body    = 'Olá! Este é um e-mail enviado automaticamente pelo bot em Perl.';

# Configuração do transporte SMTP
my $transport = Email::Sender::Transport::SMTP->new({
    host     => 'smtp.gmail.com',
    port     => 587,
    sasl_username => $from,
    sasl_password => 'SUA_SENHA_AQUI',
    ssl      => 1
});

# Criando e-mail
my $email = MIME::Lite->new(
    From    => $from,
    To      => $to,
    Subject => $subject,
    Type    => 'text/plain',
    Data    => $body
);

# Enviar e-mail
sendmail($email, { transport => $transport });

print "E-mail enviado para $to!\n";
