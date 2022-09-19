use strict;
use Irssi;

use vars qw($VERSION %IRSSI);
$VERSION = '1.0';
%IRSSI = (
    authors     => 'launchd',
    contact     => 'me@zpld.me',
    name        => 'auto_sv_query',
    description => 'per-network configurable services commands',
    license     => 'MIT',
    url         => '',
    changed     => '08/21/2022'
);

my %NETWORKS = (
    'darenet' => {
        'chanserv' => 'C',
        'nickserv' => 'N',
        'memoserv' => 'M',
        'operserv' => 'O'
    },
    'default' => {
        'chanserv' => 'ChanServ',
        'nickserv' => 'NickServ',
        'memoserv' => 'MemoServ',
        'operserv' => 'OperServ'
    }
);


Irssi::command_bind('cs', sub {
    my ($data, $server, $win) = @_;

    my $qtarget = "";
    if (exists $NETWORKS{$server->{chatnet}}) {
        $qtarget = $NETWORKS{$server->{chatnet}}{'chanserv'};
    } else {
        $qtarget = $NETWORKS{'default'}{'chanserv'};
    }

    $server->command("QUERY ${qtarget}");
    $server->command("QUOTE CS ${data}");
});

Irssi::command_bind('ms', sub {
    my ($data, $server, $win) = @_;

    my $qtarget = "";
    if (exists $NETWORKS{$server->{chatnet}}) {
        $qtarget = $NETWORKS{$server->{chatnet}}{'memoserv'};
    } else {
        $qtarget = $NETWORKS{'default'}{'memoserv'};
    }

    $server->command("QUERY ${qtarget}");
    $server->command("QUOTE MS ${data}");
});

Irssi::command_bind('ns', sub {
    my ($data, $server, $win) = @_;

    my $qtarget = "";
    if (exists $NETWORKS{$server->{chatnet}}) {
        $qtarget = $NETWORKS{$server->{chatnet}}{'nickserv'};
    } else {
        $qtarget = $NETWORKS{'default'}{'nickserv'};
    }

    $server->command("QUERY ${qtarget}");
    $server->command("QUOTE NS ${data}");
});

Irssi::command_bind('os', sub {
    my ($data, $server, $win) = @_;

    my $qtarget = "";
    if (exists $NETWORKS{$server->{chatnet}}) {
        $qtarget = $NETWORKS{$server->{chatnet}}{'operserv'};
    } else {
        $qtarget = $NETWORKS{'default'}{'operserv'};
    }

    $server->command("QUERY ${qtarget}");
    $server->command("QUOTE OS ${data}");
});
