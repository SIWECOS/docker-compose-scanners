#!/usr/bin/perl
use strict;
use warnings;

use IO::Socket::INET;
use IO::Handle;

my $resultfile="scanresult.json";
# Open the port where we will listen (as a minimalistic webserver)
my $inport=9000;
my $insocket = new IO::Socket::INET (
    LocalHost => "0.0.0.0",
    LocalPort => $inport,
    Proto => "tcp",
    Listen => 5,
    Reuse => 1
);
die "cannot create socket (Port $inport): $!\n" unless $insocket;

# Wait for results
while (my $client = $insocket->accept()) {
  $client->autoflush(1);
  my %request = ();
  my $data;
  {
    #-------- Read Request ---------------
    local $/ = Socket::CRLF;
    while (<$client>) {
      chomp; # Main http request
      if (/\s*(\w+)\s*([^\s]+)\s*HTTP\/(\d.\d)/) {
        $request{METHOD} = uc $1;
        $request{URL} = $2;
        $request{HTTP_VERSION} = $3;
      } # Standard headers
      elsif (/:/) {
        (my $type, my $val) = m/^\s*(\S+?)\s*:\s*(.*?)\s*$/;
        $request{lc $type} = $val;
      } # POST data
      elsif (/^$/) {
        read($client, $request{CONTENT}, $request{"content-length"})
          if defined $request{"content-length"};
        last;
      }
    }
  }
  #-------- SORT OUT METHOD  ---------------
  if ($request{METHOD} eq "POST") {
    $data = $request{CONTENT};
    print $client "HTTP/1.0 200 OK", Socket::CRLF;
    open my $out, ">", "$resultfile.$$";
    print $out $request{CONTENT};
    close $out;
    rename "$resultfile.$$", $resultfile;
  } elsif ($request{METHOD} eq "GET") {
    if ($request{URL}=~ m#^/quit#) {
      print $client "HTTP/1.0 200 OK", Socket::CRLF;
      close $client;
      last;
    } elsif ($request{URL}=~ m#^/test#) {
      print $client "HTTP/1.0 200 OK", Socket::CRLF;
    } else {
      print $client "HTTP/1.0 404 NOT FOUND", Socket::CRLF;
    }
  } else {
    print $client "HTTP/1.0 404 NOT FOUND", Socket::CRLF;
  }
  print $client "Content-Length: 0",Socket::CRLF;
  close $client;
}
