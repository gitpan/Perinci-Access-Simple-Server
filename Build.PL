
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601",
    "Perinci::Access::Simple::Client" => "0.05",
    "Perinci::Examples" => "0.10",
    "Test::More" => "0.96"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Riap::Simple server implementations",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Perinci-Access-Simple-Server",
  "dist_version" => "0.09",
  "license" => "perl",
  "module_name" => "Perinci::Access::Simple::Server",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Class::XSAccessor" => 0,
    "Data::Clean::JSON" => 0,
    "File::HomeDir" => 0,
    "IO::Handle::Record" => 0,
    "JSON" => 0,
    "Log::Any" => 0,
    "Log::Any::App" => 0,
    "Moo" => 0,
    "Perinci::Access" => 0,
    "Perinci::Gen::ForModule" => 0,
    "Perinci::Sub::Wrapper" => "0.23",
    "Perinci::Sub::property::timeout" => 0,
    "Riap" => "1.1.14",
    "SHARYANTO::Proc::Daemon::Prefork" => "0.05",
    "URI::Escape" => 0,
    "perl" => "5.010000"
  },
  "script_files" => [
    "bin/peri-sockserve",
    "bin/peri-pipe"
  ]
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
