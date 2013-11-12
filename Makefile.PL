
use strict;
use warnings;

use 5.010001;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Riap::Simple server implementations",
  "AUTHOR" => "Steven Haryanto <stevenharyanto\@gmail.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Perinci-Access-Simple-Server",
  "EXE_FILES" => [
    "bin/peri-pipe",
    "bin/peri-sockserve"
  ],
  "LICENSE" => "perl",
  "NAME" => "Perinci::Access::Simple::Server",
  "PREREQ_PM" => {
    "Class::XSAccessor" => 0,
    "Data::Clean::FromJSON" => "0.11",
    "Data::Clean::JSON" => "0.11",
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
    "URI::Escape" => 0
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Perinci::Access::Simple::Client" => "0.05",
    "Perinci::Examples" => "0.10",
    "Test::More" => "0.96"
  },
  "VERSION" => "0.15",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



