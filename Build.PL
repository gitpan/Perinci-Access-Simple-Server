
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Riap::Simple server implementations",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Perinci-Access-Simple-Server",
  "dist_version" => "0.13",
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
    "Module::List" => 0,
    "Moo" => 0,
    "Perinci::Access" => 0,
    "Perinci::Access::Perl" => 0,
    "Perinci::Access::Schemeless" => 0,
    "Perinci::CmdLine" => 0,
    "Perinci::Gen::ForModule" => 0,
    "Riap" => "v1.1.14",
    "SHARYANTO::Proc::Daemon::Prefork" => "0.05",
    "URI::Escape" => 0,
    "perl" => "5.010001"
  },
  "script_files" => [
    "bin/peri-pipe",
    "bin/peri-sockserve"
  ],
  "test_requires" => {
    "Capture::Tiny" => 0,
    "Perinci::Access::Simple::Client" => "0.05",
    "Perinci::Examples" => "0.10",
    "Test::More" => "0.96",
    "Test::Script" => "1.05",
    "blib" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
