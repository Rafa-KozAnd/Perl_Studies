use strict;
use warnings;
use WWW::Telegram::BotAPI;
use JSON;

# Substitua pelo seu Token do Bot
my $TOKEN = 'SEU_TOKEN_AQUI';

# Criando o bot
my $bot = WWW::Telegram::BotAPI->new(token => $TOKEN);

print "Bot iniciado...\n";

my $last_update_id = 0;

while (1) {
    my $updates = $bot->getUpdates({ offset => $last_update_id + 1 });

    for my $update (@{ $updates->{result} }) {
        $last_update_id = $update->{update_id};

        my $chat_id = $update->{message}{chat}{id};
        my $text    = $update->{message}{text};

        print "Mensagem recebida: $text\n";

        # Responde a mensagem do usuário
        if ($text eq "/start") {
            $bot->sendMessage({ chat_id => $chat_id, text => "Olá! Eu sou um bot Perl. Como posso ajudar?" });
        } elsif ($text eq "/help") {
            $bot->sendMessage({ chat_id => $chat_id, text => "Comandos disponíveis:\n/start - Iniciar\n/help - Ajuda" });
        } else {
            $bot->sendMessage({ chat_id => $chat_id, text => "Você disse: $text" });
        }
    }
    
    sleep 2;  # Evita sobrecarregar a API do Telegram
}
