use ExtUtils::MakeMaker;

WriteMakefile(
    NAME      => 'Bundle::MogileFS',
    VERSION   => '0.01',
    AUTHOR    => 'ryo kuroda <lamanotrama@gmail.com>',
    PREREQ_PM => {
        'DBD::mysql'         => undef,
        'DBD::SQLite'        => undef,
        'MogileFS::Client'   => '1.17',
        'MogileFS::Server'   => '2.73',
        'MogileFS::Utils'    => '2.30',
        'MogileFS::Network'  => '0.06',
    },
);
