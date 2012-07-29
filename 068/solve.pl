#!/usr/bin/perl

use strict;
use warnings;

use MIME::Base64;
use URI::Escape;

print uri_unescape(decode_base64("cXVlZW4lMjdzJTIwZ2FtYml0")) . "\n";
