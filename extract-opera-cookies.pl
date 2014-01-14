#!/usr/bin/perl

use Env qw(HOME);
use HTTP::Cookies::Opera;

$path = $HOME.'/.opera/cookies4.dat';

sub cookie_print {

#  0  version
#  1  key
#  2  val
#  3  path
#  4  domain
#  5  port
#  6  path_spec
#  7  secure
#  8  expires
#  9  discard
# 10  hash

	if(!$_[6]) {
		print '.';
		$wideflag='TRUE';
	} else {
		$wideflag='FALSE';
	}
	if($_[7]) {
		$secure='TRUE';
	} else {
		$secure='FALSE';
	}
	if($_[9]) {
		$discard='TRUE';
	} else {
		$discard='FALSE';
	}
	print $_[4]."\t".$wideflag."\t".$_[3]."\t".$secure."\t".$_[8]."\t".$_[1]."\t".$_[2]."\n";
}

my $cookie_jar = HTTP::Cookies::Opera->new(file => $path);

$cookie_jar->scan( \&cookie_print );

#print $cookie_jar->as_string;
#my @cookies = split("\n", $cookie_jar->as_string);


#foreach $cookie (@cookies) {
#		print "$cookie\n";
#}

