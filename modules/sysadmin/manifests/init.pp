class sysadmin {

  group {'sysadmin':
    ensure => present,
  }

  user {'shivika':
    ensure => present,
    uid    => '9997',
    groups => 'sysadmin',

  }

}
