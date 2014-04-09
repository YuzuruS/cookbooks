versions = "5.6.16-1.el6.x86_64"
default['mysql']['versions']   = versions
default['mysql']['file_name']  = "MySQL-#{versions}.rpm-bundle.tar"
default['mysql']['file_checksum']  = "a9885eaea2c8c4494976e0e7d6c3b4d6ae384ba4fb1392514a36e2f961a5d154"
default['mysql']['rpm'] = [
  {
    :rpm_file     => "MySQL-shared-compat-#{versions}.rpm",
    :package_name => "MySQL-server"
  },
  {
    :rpm_file     => "MySQL-shared-#{versions}.rpm",
    :package_name => "MySQL-shared"
  },
  {
    :rpm_file     => "MySQL-server-#{versions}.rpm",
    :package_name => "MySQL-server"
  },
  {
    :rpm_file     => "MySQL-client-#{versions}.rpm",
    :package_name => "MySQL-client"
  },
  {
    :rpm_file     => "MySQL-devel-#{versions}.rpm",
    :package_name => "MySQL-devel"
  }
]

default['mysql']['server_charset']                  = 'utf8'
default['mysql']['collation-server']                = 'utf8_general_ci'
default['mysql']['max_connections']                 = 128
default['mysql']['query_cache_size']                = 0
default['mysql']['table_cache_size']                = 1024
default['mysql']['thread_cache_size']               = 128
default['mysql']['join_buffer_size']                = '16M'
default['mysql']['sort_buffer_size']                = '2M'
default['mysql']['read_rnd_buffer_size']            = '2M'
default['mysql']['innodb_file_per_table']           = true
default['mysql']['innodb_data_file_path']           = 'ibdata1:1G:autoextend'
default['mysql']['innodb_autoextend_increment']     = 64
default['mysql']['innodb_buffer_pool_size']         = '256M'
default['mysql']['innodb_additional_mem_pool_size'] = '10M'
default['mysql']['innodb_write_io_threads']         = 4
default['mysql']['innodb_read_io_threads']          = 4
default['mysql']['innodb_log_buffer_size']          = 16
default['mysql']['innodb_log_file_size']            = '64M'
default['mysql']['innodb_flush_log_at_trx_commit']  = 1
