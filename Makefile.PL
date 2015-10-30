use ExtUtils::MakeMaker;

WriteMakefile(
    NAME      => 'Bundle::MogileFS',
    VERSION   => '0.01',
    AUTHOR    => 'ryo kuroda <kuroda@paperboy.co.jp>',
    PREREQ_PM => {
        'DBD::mysql'         => undef,
        'DBD::SQLite'        => undef,
        'MogileFS::Client'   => '1.16',
        'MogileFS::Server'   => '2.68',
        'MogileFS::Utils'    => '2.26',
        'MogileFS::Network'  => '0.06',
    },
);
